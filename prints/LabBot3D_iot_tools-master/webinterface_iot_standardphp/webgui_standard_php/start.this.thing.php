<?php

 echo 'this part is running';
 $cmd = 'sudo php control_powerrelay_arduinosocket.php start';
 $pid = sshcontrolcaller('sudo php control_powerpumpssocket.php start','192.168.1.76','start');
 //$pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
 echo $pid;
 sleep(2);
 $cmd = 'sudo kill '.$pid;
 echo $cmd;
 sshcontrolcaller($cmd,'192.168.1.76',$pid);
 echo "0";


function sshcontrolcaller($cmd,$ip,$mode)
{
 $ssh = ssh2_connect($ip, 22);

 if ($ip == '192.168.1.72'|'relay'){
  include('relay.php');
 }
 if ($ip == '192.168.1.76'|'relay'){
  include('powerpumpssocket.inc.php');
 }
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
 return $data;
}



?>

