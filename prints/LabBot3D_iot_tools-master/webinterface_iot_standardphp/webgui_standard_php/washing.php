<?php
include('repstrapfunctionslib.php');
$json = openjson();

$washtime = $_GET['washtime'];
$drytime = $_GET['drytime'];
$dry = $_GET['dry'];
$washsub = $_GET['washsub'];


$json['washing']['washtime'] = $washtime;
$json['washing']['touchdrytime'] = $drytime;

if ($washsub == 'Wash'){
 if ($dry == 'dry'){
  $json['washing']['dryafterwash'] = 1;
  $url = 'runner.php?mmmove=&tcli=washdry';
 }
 else {
  $json['washing']['dryafterwash'] = 0;
  $url = 'runner.php?mmmove=&tcli=wash';
 }
}
if ($washsub == 'TouchDry'){
 $url = 'runner.php?mmmove=&tcli=dry';
}


closejson($json);

header('Location: '.$url);
?>
