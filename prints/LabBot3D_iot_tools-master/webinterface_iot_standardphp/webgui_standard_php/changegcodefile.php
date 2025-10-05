<?php

$track = $_GET['track'];



$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$json['oldgfile'] = $json['gfile'];
$json['editgcode'] = "0";
$json['gfile'] = $track;
//$json['view'] = "D";
file_put_contents($imgdataset, json_encode($json));

$jsonlogger3 = json_decode(file_get_contents('taskjob3'), true);
$jsonlogger3['track'] = $json['gfile'];
file_put_contents('taskjob3', json_encode($jsonlogger3));


header('Location: gui.mod.php');


?>
