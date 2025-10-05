<?php

 //$cmd = 'sudo php control_powerrelay_arduinosocket.php start';
 $cmd = 'sudo php control_smoothiesocket.php start';
 //$pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
 //echo $pid;
 $ip = '192.168.1.87';
 $mode = 'start';
 $pid = sshcontrolcaller($cmd,$ip,$mode);
 echo $pid.'\n';

function sshcontrolcaller($cmd,$ip,$mode){
 //$ssh = ssh2_connect($json['servers']['marlin8pi'], 22);
 //$ssh = ssh2_connect('192.168.1.72', 22);
 $ssh = ssh2_connect($ip, 22);
 include('relay.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';

 if ($mode == 'start'){
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 }
 // close the stream
 fclose($stream);
 // print the response
 return $data;
}



?>

