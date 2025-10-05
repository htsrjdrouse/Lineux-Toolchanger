<?php

include('repstrapfunctionslib.php'); 
$json = openjson();
$json['view'] = "L";
$url = "gui.mod.php";

if (isset($_GET['headcamlinearactuatorsocketon'])){
 $json =headcam_linearactuatorsocket_start($json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['headcamlinearactuatorsocketoff'])){
 $json =headcam_linearactuatorsocket_stop($json);
 closejson($json);
 header('Location: '.$url);
}


//<input type=submit name="raspiheadcamstreamon" class="red" value="Turn on camera stream">
if (isset($_GET['raspiheadcamstreamon'])){
 $raspicamjson = openraspicamjson();
 $raspicamjson['framespersecond']=$_GET['framespersecond'];
 $raspicamjson['resolution']=$_GET['resolution'];
 $raspicamjson['saturation']=$_GET['saturation'];
 $raspicamjson['brightness']=$_GET['brightness'];
 $raspicamjson['sharpness']=$_GET['sharpness'];
 $raspicamjson['contrast']=$_GET['contrast'];
 $raspicamjson['verticalflip']=$_GET['verticalflip'];
 $raspicamjson['horizontalflip']=$_GET['horizontalflip'];
 $sendstr = 's_';
 $sendstr = $sendstr.$raspicamjson['framespersecond'].'_';
 $sendstr = $sendstr.$raspicamjson['resolution'].'_';
 $sendstr = $sendstr.$raspicamjson['saturation'].'_';
 $sendstr = $sendstr.$raspicamjson['brightness'].'_';
 $sendstr = $sendstr.$raspicamjson['sharpness'].'_';
 $sendstr = $sendstr.$raspicamjson['contrast'].'_';
 if ($raspicamjson['verticalflip'] == 'true'){
  $sendstr = $sendstr.'t_';
 }
 else{ 
  $sendstr = $sendstr.'f_';
 }
 if ($raspicamjson['horizontalflip'] == 'true'){
  $sendstr = $sendstr.'t';
 }
 else{ 
  $sendstr = $sendstr.'f';
 }
 closeraspicamjson($raspicamjson);
 $json =headcam_linearactuatorsocket($sendstr,$json);
 sleep(3);
 $json =headcam_linearactuatorsocket('raspicameraon',$json);
 header('Location: '.$url);
}

if (isset($_GET['changeraspicamsettings'])){
$framespersecond=$_GET['framespersecond'];
$resolution=$_GET['resolution'];
$saturation=$_GET['saturation'];
$brightness=$_GET['brightness'];
$sharpness=$_GET['sharpness'];
$contrast=$_GET['contrast'];
$verticalflip=$_GET['verticalflip'];
$horizontalflip=$_GET['horizontalflip'];

$sendstr = '';
$sendstr = $sendstr.$framespersecond.'_';
$sendstr = $sendstr.$resolution.'_';
$sendstr = $sendstr.$saturation.'_';
$sendstr = $sendstr.$brightness.'_';
$sendstr = $sendstr.$sharpness.'_';
$sendstr = $sendstr.$contrast.'_';
if ($verticalflip == 'true'){
$sendstr = $sendstr.'t_';
}
else{ 
$sendstr = $sendstr.'f_';
}
if ($horizontalflip == 'true'){
$sendstr = $sendstr.'t';
}
else{ 
$sendstr = $sendstr.'f';
}
 header('Location: '.$url);
}

if (isset($_GET['raspiheadcamstreamoff'])){

sleep(2);
$json =headcam_linearactuatorsocket('raspicameraoff',$json);

 header('Location: '.$url);

}

?>
