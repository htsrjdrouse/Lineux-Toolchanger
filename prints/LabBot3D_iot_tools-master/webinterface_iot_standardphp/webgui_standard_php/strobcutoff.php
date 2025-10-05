<?php

$json = json_decode(file_get_contents('./imgdataset'), true);


$maxspeedcheck = $_GET['maxspeedcheck'];
$avgspeedcheck = $_GET['avgspeedcheck'];
$volumecheck = $_GET['volumecheck'];
$deflectioncheck = $_GET['deflectioncheck'];

if ($maxspeedcheck == 'on'){ $json['strobcutoff']['maxspeedcheck'] = 'checked'; } else { $json['strobcutoff']['maxspeedcheck'] = ''; }
if ($avgspeedcheck == 'on'){ $json['strobcutoff']['avgspeedcheck'] = 'checked'; } else { $json['strobcutoff']['avgspeedcheck'] = ''; }
if ($volumecheck == 'on'){ $json['strobcutoff']['volumecheck'] = 'checked'; } else { $json['strobcutoff']['volumecheck'] = ''; }
if ($deflectioncheck == 'on'){ $json['strobcutoff']['deflectioncheck'] = 'checked'; } else { $json['strobcutoff']['deflectioncheck'] = ''; }

$json['strobcutoff']['maxspeed'] = $_GET['maxspeedval'];
$json['strobcutoff']['avgspeed'] = $_GET['avgspeedval'];
$json['strobcutoff']['volume'] = $_GET['volumeval'];
$json['strobcutoff']['deflection'] = $_GET['deflectionval'];

$json['view'] = "J";

/*
	$json['workplate']['enabletar'] = $_POST['enabletar'];
	$enry = array();
	for($i=0;$i<count($json['workplate']['enabletar']);$i++){
	 //"reference":{"1_1":"1","1_2":"2","1_3":"3","1_4":"4","1_5":"5","2_1":"6","2_2":"7","2_3":"8","2_4":"9","2_5":"10"}
 	 $enabledtarref = $json['workplate']['reference'][$json['workplate']['enabletar'][$i]];
	 //echo $json['workplate']['enabletar'][$i].'<br>';
 	 //echo 'Enabled targets: '.$json['workplate']['reference'][$json['workplate']['enabletar'][$i]].'<br>';
 	 //echo 'Enabled targets: '.($enabledtarref).'<br>';
	 $enry[$i] = ($enabledtarref);
	}
*/



file_put_contents('./imgdataset', json_encode($json));

header('Location: gui.mod.php');


?>
