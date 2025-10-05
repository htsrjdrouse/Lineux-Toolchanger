<?php
include('repstrapfunctionslib.php');
$json = openjson();

$act = $_GET['strobled'];

if ($act == 'STROB OFF'){
 $json['strobled'] = 0;
 gearmanstroboff();
}
if ($act == 'STROB ON'){
 $json['strobled'] = 1;
 gearmanstrobon();
}

$json['view'] = 'G';

closejson($json);

$url = 'gui.mod.php';
header('Location: '.$url);

?>
