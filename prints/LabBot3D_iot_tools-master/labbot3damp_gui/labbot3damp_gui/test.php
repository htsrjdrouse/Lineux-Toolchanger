<?php

  exec("ps aux | grep -i 'sudo python caller.labbot3d.subscriber.py' | grep -v grep", $pids);
  //exec("ps aux | grep -i 'sudo node labbot3dstream.node/index.js' | grep -v grep", $pids);
  foreach($pids as $pp){
     preg_match('/^root\s+(.*) .*\?/', $pp, $gp);
     $cor = preg_replace("/ .*/", "", $gp[1]);
     $cmd = 'sudo kill '.$cor;
     echo $cmd;
     exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
     //sleep(1);
     //header('Location: template.php');
   }

?>
