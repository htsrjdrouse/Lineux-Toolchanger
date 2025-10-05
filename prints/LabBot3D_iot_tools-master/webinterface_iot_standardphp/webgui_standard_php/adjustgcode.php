<?php
include('repstrapfunctionslib.php'); 
$json = openjson();
$json['view'] = "M";
closejson($json);

$jsongcodesettings = json_decode(file_get_contents('adjustgcode.json'), true);

$jsongcodesettings['M92'] = $_GET['m92'];
$jsongcodesettings['speed'] = $_GET['speed'];
$jsongcodesettings['extrusionvol'] = $_GET['extrusionvol'];
$jsongcodesettings['retractionvol'] = $_GET['retractionvol'];
$jsongcodesettings['originx'] = $_GET['originx'];
$jsongcodesettings['originy'] = $_GET['originy'];
$jsongcodesettings['originz'] = $_GET['originz'];

file_put_contents('adjustgcode.json', json_encode($jsongcodesettings));
header('Location: gui.mod.php');

?>
