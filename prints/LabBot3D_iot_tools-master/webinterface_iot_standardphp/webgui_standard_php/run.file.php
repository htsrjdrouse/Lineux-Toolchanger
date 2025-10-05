<?php

$cmd = 'sudo python create.gcode.scripts.py rectangle.gcode';
exec($cmd);
sleep(2);
$dat = file('result.gcode');
var_dump($dat);


?>
