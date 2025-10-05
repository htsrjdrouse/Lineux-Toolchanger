<?php
include('repstrapfunctionslib.php');
$json = openjson();

$json['view'] = 'G';

$gotostrob = $_GET['gotostrob'];

closejson($json);

$url = 'runner.php?mmmove=&tcli=gotostrob';
header('Location: '.$url);

?>
