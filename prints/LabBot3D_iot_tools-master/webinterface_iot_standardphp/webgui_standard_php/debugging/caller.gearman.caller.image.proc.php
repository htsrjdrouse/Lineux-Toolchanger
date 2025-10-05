<?php
include('gearman.caller.image.proc.php');

exec('cp gearmanstroblog.back gearmanstroblog');
exec('cp strobdatasetprocessing.back strobdatasetprocessing');

/*
$cmd = "python gearman.caller.image.proc.py strobimages\/1422472904_V100_P50_LD250.jpg,strobimages\/1422472908_V100_P50_LD250.jpg,strobimages\/1422472988_V100_P90_LD250.jpg 312,75,175,300 2 testsample";
$result = exec($cmd,$output);
sleep(5);
gearmanstrobdataprocessing();

$cmd = "python gearman.caller.image.proc.py strobimages\/1422473085_V110_P90_LD250.jpg,strobimages\/1422473098_V110_P90_LD250.jpg,strobimages\/1422473101_V110_P90_LD250.jpg 312,75,175,300 2 water";
$result = exec($cmd,$output);
sleep(5);
gearmanstrobdataprocessing();
*/
?>
