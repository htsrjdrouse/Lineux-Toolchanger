<?php





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































//Relay and linear actuator on marlin8pi 
function relaylinearactuatorsocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['marlin8pi'];
	$port = 8888;

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
	if (preg_match('/^reportposition.*/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
	  echo 'the result: '.$result.'<br>';
	  $json['relaylinearactuator']['position'] = $result;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
	fclose ($fp);
	}

	return $json;
}








//Waveform generator socket
function waveformsocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['piezostrobpi'];
	$port = 8888;

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
	if (preg_match('/^.*PORT/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
	  preg_match('/^RefVolts (.*) Pulse (.*) Freq (.*) Drop (.*) Trigger (.*) leddelay (.*) inputpin (.*)/', $result, $gp);
	  $refvolts = $gp[1];
	  $pulse = $gp[2];
	  $freq = $gp[3];
	  $drop = $gp[4];
	  $trigger = $gp[5];
	  $leddelay = $gp[6];
	  $inputpin = $gp[7];
	  $json['wavecontroller']['refvolts']= $refvolts;
	  $json['wavecontroller']['drops']= $drop;
	  $json['wavecontroller']['pulse']= $pulse;
	  $json['wavecontroller']['freq']= $freq;
	  $json['wavecontroller']['trigger']= $trigger;
	  $json['wavecontroller']['leddelay']= $leddelay;
	  $json['wavecontroller']['inputpin']= $inputpin;
	  $json['wavecontroller']['report']= $result;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
	fclose ($fp);
	}

	return $json;
}







//Pressure compensation level reading and power relays
function pressuresocketclient($cmd,$json){

	// where is the socket server?
	//$host="192.168.1.5";
	$host=$json['servers']['wavepi'];
	$port = 8888;
	 
	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	 
	if (!$fp)
	{
	$result = "Error: could not open socket connection";
	}
	
	else
	{
	$message = $cmd;
	fputs ($fp, $message);

	 if (preg_match('/^PRESSURE.*/', $cmd)){	 
	  // get the result
	  $result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  $result = trim($result);
	  //Set: 2500 Measured: 2377.85
	  preg_match('/^Set: (.*) Measured: (.*)$/', $result, $gp);
	  $json['pressure']['set'] = $gp[1];
	  $json['pressure']['read'] = $gp[2];
	  }
	fclose ($fp);
	}
	return $json;	
}	



//logger for cli interface
function logger($logger, $msg,$func){
	$logger = './loggerdataset';
	$jsonlog = json_decode(file_get_contents($logger), true);
	if ($func == 0){
	 $jsonlog['logs'] = array();
	}
	array_push($jsonlog['logs'],$msg);
	file_put_contents($logger, json_encode($jsonlog));
}






//Parse the M114 command output for positioning
function parsersetoutput($result){
 //ok C: X:150.000 Y:0.000 Z:0.000 E:0.000
 $count = preg_replace('/^ok C: /', '', $result);
 $count = preg_replace('/:/', '', $count);
 $count = preg_replace('/ /', '', $count);
 $r = preg_split('/[a-zA-Z]/', $count);
 $ractry = array_slice($r, 1,5);
 $trp  = preg_replace('/[\d|\.]/','', $count);
 $tr = str_split($trp);
 $x = '';
 $y = '';
 $z = '';
 for ($i=0;$i<count($tr);$i++){
  if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
 }
 $outputarray = array('X'=>floatval($x), 'Y'=>floatval($y), 'Z'=>floatval($z));
 return $outputarray;
}



function getgcoords($cmd,$json){
 $r = preg_split('/[a-zA-Z]/', $cmd);
 $ractry = array_slice($r, 1,5);
 //var_dump($ractry);

 $trp  = preg_replace('/[\d|\.]/','', $cmd);
 $tr = str_split($trp);
 //var_dump($tr);

 if (preg_match('/X|x/', $cmd)){  $x = '';} else {$x = $json['trackxyz']['x'];}
 if (preg_match('/Y|y/', $cmd)){  $y = '';} else {$y = $json['trackxyz']['y'];}
 if (preg_match('/Z|z/', $cmd)){  $z = '';} else {$z = $json['trackxyz']['z'];}

 $f = '';

 for ($i=0;$i<count($tr);$i++){
  if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
  if (preg_match('/[F|f]/', $tr[$i])){
	$f = $ractry[$i];
  }
 }
 $gcoords = array('X'=>$x, 'Y'=>$y, 'Z'=>$z, 'F'=>$f);
 return $gcoords;
}


function gcodecoordtrack($cmd,$json){

 $r = preg_split('/[a-zA-Z]/', $cmd);
 $ractry = array_slice($r, 1,5);
 //var_dump($ractry);

 $trp  = preg_replace('/[\d|\.]/','', $cmd);
 $tr = str_split($trp);
 //var_dump($tr);

 $x = '';
 $y = '';
 $z = '';
 $f = '';

 for ($i=0;$i<count($tr);$i++){
   if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
  if (preg_match('/[F|f]/', $tr[$i])){
	$f = $ractry[$i];
  }
 }
 $gcoords = array('X'=>$x, 'Y'=>$y, 'Z'=>$z, 'F'=>$f);
 $json['trackxyz']['x'] = $gcoords["X"]; 
 $json['trackxyz']['y'] = $gcoords["Y"];
 $json['trackxyz']['z'] = $gcoords["Z"];
 $json['trackxyz']['f'] = $gcoords["F"];
 return $json;
}






function ssh01caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['marlin8pi'], 22);
 include('relay.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}






function ssh02caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['piezostrobpi'], 22);
 include('pressure.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}





function ssh04caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['webheadcampi'], 22);
 include('headcam.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}






function ssh05caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['wavepi'], 22);
 include('pressure.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}


?>
