<?php

include('repstrapfunctionslib.php');

$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);





$pid = $_GET['pid'];
//kill gearman 
exec('sudo python '.$pid);

//Cut power
$json["stop"] ="1";
$inputcmd = $json['ramplastcommand'];
$result = powerrelaysocketclient('poweroff',$json);
$msg =  'Turning system power off<br>';
logger($logger, $msg,1);






//get the gearman pid
$gpid = $json['gearmanpid'];
//kill gearman 
exec('sudo python kill.gearman.py > /dev/null &');

sleep(2);
$cmd = 'php smoothie.gearman.worker.php';
//restart gearman and get new gpid
$gpid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
$json['gearmanpid'] = $gpid;



//register the new gearman pid
$json['gearmanpid'] = $gpid;

$imgdataset = './imgdataset';
file_put_contents($imgdataset, json_encode($json));


$tasklogger = './tasklogger';
$jsontasklog = json_decode(file_get_contents($tasklogger), true);



for($i=0;$i<count($jsontasklog['logs']);$i++){
  //echo ($i+1).'. '.$jsontasklog['logs'][$i].'<br>';
  $msg = ($i+1).'. '.$jsontasklog['logs'][$i].'<br>';
  logger($logger, $msg,1);
}

$msg = "Gearman client process killed: ".$pid."<br>";
logger($logger,$msg,1);

$msg = "Gearman worker restarted: ".$gpid."<br>";
logger($logger,$msg,1);

$jsontasklog['logs'] = [];


header('Location: gui.mod.php');

?>
