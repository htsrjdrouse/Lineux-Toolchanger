<?php
$file = fopen('./gobjects/testng', 'w');
echo fwrite($file,"Hello World. Testing!");
fclose($file);
?>
