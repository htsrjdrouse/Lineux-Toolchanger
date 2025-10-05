<?php
include('repstrapfunctionslib.php'); 
$json = openjson();
$json['view'] = "H";

if (isset($_GET['fillsyringe'])){
   $url = 'runner.php?mmmove=&tcli=s1fillsyringe';
   closejson($json);
   header('Location: '.$url);
}

if (isset($_GET['aspirate'])){
   $url = 'runner.php?mmmove=&tcli=s1aspirate';
   closejson($json);
   header('Location: '.$url);
}
if (isset($_GET['dispense'])){
     closejson($json);
     $url = 'runner.php?mmmove=&tcli=s1dispense';
     header('Location: '.$url);
}



?>
