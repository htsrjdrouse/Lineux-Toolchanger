<?php

include('repstrapfunctionslib.php');


$cmd = $argv[1];


$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);


smoothiesocketclient($cmd,$json);


//Relay and linear actuator on marlin8pi 
function smoothiesocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['marlin8pi'];
	$port = 8887;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else if ($json['stop'] == "1"){
	 echo 'System halt, you need press GO button<br>';
	}
	else
	{
	if (preg_match('/^M114/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
	  $pos = $result;
	  //ok C: X:0.000 Y:0.000 Z:0.000 E:0.000
 	  $json['smoothiemessage'] = $pos;
 	  $out = parsersetoutput($json['smoothiemessage']);
 	  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 	  $json['ramplastcommand'] = $cmd;
	}
	#set steps per mm
	if (preg_match('/^M92/', $cmd)){
	  #"M92 X100.631 Y113.75 Z1637.8"
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
 	  $json['M92'] = $result;
	  echo $json['M92'];
	}
	#get endstop status
	if (preg_match('/^M119/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
 	  $json['smoothiemessage'] = $result;
	  echo $json['smoothiemessage'];
	}
	#get smoothie version
	if (preg_match('/^version/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
 	  $json['smoothiemessage'] = $result;
	  echo $json['smoothiemessage'];
	}
	#get smoothie version
	if (preg_match('/^[M106|M107]/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
 	  $json['smoothiemessage'] = $result;
	  echo $json['smoothiemessage'];
	}
	#homing
	if (preg_match('/^G28/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
	  $pos = $result;
	  //ok C: X:0.000 Y:0.000 Z:0.000 E:0.000
 	  $json['smoothiemessage'] = $pos;
 	  $out = parsersetoutput($json['smoothiemessage']);
 	  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 	  $json['ramplastcommand'] = $cmd;
	}
	#simple move without hysterisis
	if (preg_match('/^G1/', $cmd)){
	  fputs ($fp, $cmd);
	  fputs ($fp, "M400");
	  fputs ($fp, "M114");
	  $result = fgets ($fp, 1024);
	  $pos = $result;
	  //ok C: X:0.000 Y:0.000 Z:0.000 E:0.000
 	  $json['smoothiemessage'] = $pos;
 	  $out = parsersetoutput($json['smoothiemessage']);
 	  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 	  $json['ramplastcommand'] = $cmd;
 	  $json['smoothiemessage'] = $pos;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
	fclose ($fp);
	}

	return $json;
}



//This moves instrument and factors in backlash (hysteresis)
function move($gcodecmd,$json,$logger){
  $lastg = $json['ramppenultimatecommand'];
  $peng = $json['rampprepenultimatecommand'];

  $json['rampprepenultimatecommand'] = $json['ramppenultimatecommand'];
  $json['ramppenultimatecommand'] = $json['ramplastcommand'];
  $json['ramplastcommand'] = $gcodecmd;

  $currgy = getgcoords($gcodecmd,$json);
  $prevcurrgy = $currgy;
  $lastgy = getgcoords($lastg,$json);
  $pengy = getgcoords($peng,$json);

  $fx = 0;
  $fy = 0;
  $fz = 0;
  if (($currgy['X'] < $lastgy['X']) and ($pengy['X'] < $lastgy['X'])) {$fx = 1;}
  if (($currgy['Y'] < $lastgy['Y']) and ($pengy['Y'] < $lastgy['Y'])) {$fy = 1;}
  if (($currgy['Z'] < $lastgy['Z']) and ($pengy['Z'] < $lastgy['Z'])) {$fz = 1;}
  if (($currgy['X'] > $lastgy['X']) and ($pengy['X'] > $lastgy['X'])) {$fx = 2;}
  if (($currgy['Y'] > $lastgy['Y']) and ($pengy['Y'] > $lastgy['Y'])) {$fy = 2;}
  if (($currgy['Z'] > $lastgy['Z']) and ($pengy['Z'] > $lastgy['Z'])) {$fz = 2;}

  if ($fx == 1) {  $currgy['X'] = $currgy['X'] - $json['hysteresis']['x']; } 
  if ($fx == 2) {  $currgy['X'] = $currgy['X'] + $json['hysteresis']['x']; } 
  if ($fy == 1) {  $currgy['Y'] = $currgy['Y'] - $json['hysteresis']['y']; } 
  if ($fy == 2) {  $currgy['Y'] = $currgy['Y'] + $json['hysteresis']['y']; } 
  if ($fz == 1) {  $currgy['Z'] = $currgy['Z'] - $json['hysteresis']['z']; } 
  if ($fz == 2) {  $currgy['Z'] = $currgy['Z'] + $json['hysteresis']['z']; } 

  $hysflag = array('FX'=>$fx, 'FY'=>$fy, 'FZ'=>$fz, 'X'=>$prevcurrgy['X'], 'Y'=>$prevcurrgy['Y'], 'Z'=>$prevcurrgy['Z'], 'F'=>$prevcurrgy['F']);
  $json = gcodecoordtrack($gcodecmd,$json);

  //This is the calculated modified gcode
  $modgcodecmd = "G1X".$currgy['X']."Y".$currgy['Y']."Z".$currgy['Z']."F".$currgy['F'];


  // open a client connection
  $host=$json['servers']['marlin8pi'];
  $port = 8887;

  $fp = fsockopen ($host, $port, $errno, $errstr);
  if (!$fp)
   {
	$result = "Error: could not open socket connection";
	echo $result.'<br>';
   }
   else if ($json['stop'] == "1"){
        echo 'System halt, you need press GO button<br>';
   }
   else
   {
    fputs ($fp, $modgcodecmd);
    fputs ($fp, 'M400');
    fputs ($fp, 'M114');
    $result = fgets ($fp, 1024);
    $json['smoothiemessage'] = $result;
    $out = parsersetoutput($json['smoothiemessage']);
    $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
    $json['ramplastcommand'] = $cmd;
    logger($logger, $modgcodecmd.'<br>',1);


    //hysteresis stuff
    if (($fx > 0) or ($fy > 0) or ($fz > 0)){
     $setpos = "G92X".$prevcurrgy['X']."Y".$prevcurrgy['Y']."Z".$prevcurrgy['Z'];
     fputs ($fp, $setpos);
     logger($logger, 'hysteresis compensated '.$setpos.'<br>',1);
     fputs ($fp, 'M114');
     $result = fgets ($fp, 1024);
     $json['smoothiemessage'] = $pos;
     logger($logger, $pos.'<br>',1);
    }
   $json['trackxyz']['x'] = $prevcurrgy['X'];
   $json['trackxyz']['y'] = $prevcurrgy['Y'];
   $json['trackxyz']['z'] = $prevcurrgy['Z'];
   return $json;
  }
}




























?>
