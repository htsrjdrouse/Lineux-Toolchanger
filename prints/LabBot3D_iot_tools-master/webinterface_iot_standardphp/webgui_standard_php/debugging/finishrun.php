<?php
include('repstrapfunctionslib.php');
$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$logger = './loggerdataset';
$tasklogger = './tasklogger';
$jsontasklog = json_decode(file_get_contents($tasklogger), true);

$ct = 0;
for($i=0;$i<count($jsontasklog['logs']);$i++){
  //echo ($i+1).'. '.$jsontasklog['logs'][$i].'<br>';
  $line = preg_replace('/[\r|\n]/', '', $jsontasklog['logs'][$i]);
  if (preg_match('/^JOB.*/', $line)){
   if (!preg_match('/^JOB: finish.*/', $line)){
    $ct = $ct + 1;
    $msg = ($ct).'. '.$jsontasklog['logs'][$i];//.'<br>';
    logger($logger, $msg,1);
   }
  }
}
$jsontasklog['logs'] = [];

file_put_contents($tasklogger, json_encode($jsontasklog));

header('Location: gui.mod.php');
exit;

?>

