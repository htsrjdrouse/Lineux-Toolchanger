<?php
 $mode = $argv[1];
 if ($mode == 'start'){
  $cmd = 'sudo python /home/richard/tricontsyringepump/tricontent.telnet.socket.py';
  //$cmd= 'sudo python telnet.socket.py';
  $pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
  echo $pid;
 }
 else {
  $cmd = 'kill '.$mode;
  $pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
  $pid = 0;
  echo $pid;
 }
?>
