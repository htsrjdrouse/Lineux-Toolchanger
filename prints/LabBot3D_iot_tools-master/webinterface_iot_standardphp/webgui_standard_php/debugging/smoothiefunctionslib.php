<?php
require("repstrapfunctionslib.php");

$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

//$json = endstopstatus($json);
//$json  = smoothiesetsteps('X100.631',$json);
//echo $json['M92'];

/*
$json  = fan('M106',$json);
echo $json['smoothiemessage'];
*/
$json  = reportpos($json);
echo $json['smoothiemessage'];
/*
for($i=0;$i<30;$i++){
 $json  = reportpos($json);
 echo $json['smoothiemessage'];
}
*/

file_put_contents($imgdataset, json_encode($json));

/*
function ssh06caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 echo $data;
}

//this gets the version
function endstopstatus($json){
 $cmd = 'sudo python smoothiedriverlib.py M119';
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['smoothiemessage'] = $data;
 fclose($stream);
 return $json;
}

function smoothiesetsteps($pcmd,$json){
 //X:100.631 Y:113.75 Z:1637.8 F:60 E:140
 $cmd = 'sudo python smoothiedriverlib.py "M92 '.$pcmd.'"';
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['M92'] = $data;
 fclose($stream);
 return $json;
}


//report the position
function reportpos($json){
 $cmd = 'sudo python smoothiedriverlib.py M114';
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }

 $json['smoothiemessage'] = $data;
 fclose($stream);
 $out = parsersetoutput($json['smoothiemessage']);
 $pout =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 $json['ramplastcommand'] = $pout;
 return $json;
}



//this gets the version
function pingsmoothie($json){
 $cmd = 'sudo python smoothiedriverlib.py version';
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['smoothiemessage'] = $data;
 fclose($stream);
 return $json;
}

function fan($dir,$json){
 $cmd = 'sudo python smoothiedriverlib.py '.$dir;
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 $json['smoothiemessage'] = $data;
 return $json;
}

//homing function
function homephp($dir,$json){
 $cmd = 'sudo python smoothiedriverlib.py '.$dir;
 $ssh = ssh2_connect($json['servers']['smoothiepi'], 22);
 include('smoothiepi.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 $json['smoothiemessage'] = $data;
 $out = parsersetoutput($json['smoothiemessage']);
 $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 $json['ramplastcommand'] = $cmd;
 return $json;
}



*/









/*










//fan controller




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


  $serial = connect();
  $serial->sendMessage("\r\n");
  $serial->sendMessage($modgcodecmd."\r\n");
  $serial->sendMessage("M400\r\n");
  $serial->sendMessage("M114\r\n");
  $i = 2;
  $data = $serial->readPort();
  while($i > 1){
    sleep(0.5);
    $data = $serial->readPort();
    if (preg_match('/X/', $data)){
	  break;
    }
    $i++;
  }
  $dray = preg_split('/\n/', $data);
  $pos = $dray[count($dray)-2];
  $json['smoothiemessage'] = $pos;
  $out = parsersetoutput($json['smoothiemessage']);
  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
  $json['ramplastcommand'] = $cmd;
  logger($logger, $modgcodecmd.'<br>',1);
  if (($fx > 0) or ($fy > 0) or ($fz > 0)){
   sleep(0.1);
   $setpos = "G92X".$prevcurrgy['X']."Y".$prevcurrgy['Y']."Z".$prevcurrgy['Z'];
   //echo "reset positions: ".$setpos."<br>";
   $serial->sendMessage($setpos."\r\n");
   logger($logger, 'hysteresis compensated '.$setpos.'<br>',1);
   $serial->sendMessage("M114\r\n");
   $data = $serial->readPort();
   $dray = preg_split('/\n/', $data);
   $pos = $dray[count($dray)-2];
   $json['smoothiemessage'] = $pos;
   logger($logger, $pos.'<br>',1);
  }

  $json['trackxyz']['x'] = $prevcurrgy['X'];
  $json['trackxyz']['y'] = $prevcurrgy['Y'];
  $json['trackxyz']['z'] = $prevcurrgy['Z'];
  $serial->deviceClose();

  return $json;
}


//connects to the smoothieware Azteeg board 
function connect(){
 error_reporting(E_ALL);
 ini_set('display_errors', '1');
 $serial = new phpSerial;
 $serial->deviceSet("/dev/ttyACM1");
 $serial->confBaudRate(115200);
 $serial->confParity("none");
 $serial->confCharacterLength(8);
 $serial->confStopBits(1);
 $serial->deviceOpen();
 return($serial);
}






//Simple move without compensating for hysteresis (backlash)
function movecheck($pos,$serial){
 $serial->sendMessage("\r\n");
 $serial->sendMessage($pos);
 $serial->sendMessage("M400\r\n");
 $serial->sendMessage("M114\r\n");
 $i = 1;
 while($i > 0){
  sleep(0.5);
  $data = $serial->readPort();
  if (strlen($data) > 5){
   break;
  }
  $i++;
 }
 return $data;
}

*/

?>

