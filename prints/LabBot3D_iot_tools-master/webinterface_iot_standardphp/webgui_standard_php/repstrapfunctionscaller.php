<?php
include('repstrapfunctionslib.php');

/*
$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
*/

gearman_socketflagoff();

/*
$logger = './loggerdataset';
$json = smoothiesocketmove('G1X30Y0Z0F1000',$json,$logger);
sleep(1);

$json = smoothiesocketreportposition('M114',$json);
echo $json['trackxyz']['x']."\n";
echo $json['trackxyz']['y']."\n";
echo $json['trackxyz']['z']."\n";
echo $json['trackxyz']['e']."\n";
*/

$gcodecmd ="G1X0Y0 Z0 E0 F1000";
echo $gcodecmd."\r\n";
$gcodecmd = gcodeset($gcodecmd);
echo $gcodecmd."\r\n";


//$logger = './loggerdataset';
//$json = smoothiesocketmove('G1X30Y0Z0F1000',$json,$logger);

/*
$ip = '192.168.1.89';
$cmd = 'sudo shutdown -h 0';
sshcontrolcaller($cmd,$ip,'shutdown',$json);
*/
//shutdown($json['servers']['gantryhead'],$json);

/*
shutdown($json['servers']['smoothiedriver'],$json);
shutdown($json['servers']['strobcampi'],$json);
shutdown($json['servers']['powerpumpsraspi'],$json);
*/

?>
