<?php

include('repstrapfunctionslib.php');

$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

$logger = './loggerdataset';


//$json = smoothiesockethoming('G28 X0',$json);
//smoothiesocketclear($json);
$json = smoothiesocketmove('G1X100F1000',$json,$logger);



//$message = $argv[1];
//Position function
//$json = smoothiesocketreportposition('M114',$json);
//echo $json['smoothiemessage'].'\n';
//echo $json['ramplastcommand'].'\n';



//Set position function
//$cmd = 'M92 X100.631 Y113.75 Z1637.8';
//$json = smoothiesocketsetposition($cmd,$json);


//Endstop function
//$json = smoothiesocketendstopstatus($json);
//echo $json['smoothiemessage'];


//$json = smoothiesocketreportposition('M114',$json);
//echo $json['smoothiemessage'].'\n';
//echo $json['ramplastcommand'].'\n';



/*

//Version function
$json = smoothiesocketversion($json);
echo $json['smoothiemessage'];
//Position function
$json = smoothiesocketreportposition('M114',$json);
echo $json['smoothiemessage'].'\n';
echo $json['ramplastcommand'].'\n';


//for Endstop
$json = smoothiesocketendstopstatus($json);
echo $json['smoothiemessage'];
$json = smoothiesocketclear($json);
echo $json['smoothiemessage'];
$json = smoothiesocketclear($json);
echo $json['smoothiemessage'];

//Version function
$json = smoothiesocketversion($json);
echo $json['smoothiemessage'];
//Position function
$json = smoothiesocketreportposition('M114',$json);
echo $json['smoothiemessage'].'\n';
echo $json['ramplastcommand'].'\n';

$cmd = 'M92 X100.631 Y113.75 Z1637.8';
$json = smoothiesocketsetposition($cmd,$json);
$json = smoothiesocketclear($json);
echo $json['smoothiemessage'];

//Version function
$json = smoothiesocketversion($json);
echo $json['smoothiemessage'];
//Position function
$json = smoothiesocketreportposition('M114',$json);
echo $json['smoothiemessage'].'\n';
echo $json['ramplastcommand'].'\n';
*/




//Version function
//$json = smoothiesocketversion($json);
//echo $json['smoothiemessage'];

file_put_contents($imgdataset, json_encode($json));
return $json;
?>
