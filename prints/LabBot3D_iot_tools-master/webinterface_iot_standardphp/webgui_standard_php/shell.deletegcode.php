<?php 
$filename = $argv[1];
$b = "uploads/".$filename;
unlink($b);
$c = "jsondata/".$filename.".json";
unlink($c);
?>
