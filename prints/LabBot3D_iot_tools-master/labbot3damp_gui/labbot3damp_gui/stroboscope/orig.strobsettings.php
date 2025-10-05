<?php

//NOTE: THIS DIDN'T WORK FOR A WHILE SO I HAD TO CALL THIS STRIPT DIRECTLY IN THE BROWSER DOING SOMETHING LIKE THIS
//strobsettings.php?set=345,87,125,300&file=1422472992_V100_P90.jpg


$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);


if(isset($_POST['annotation'])){
 $key = $_POST['key'];
 $annotation = $_POST['annotation'];
 $strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
 $strobjsonprocessing['dataset'][$key]['sample'] = $annotation;
 file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));
}

if(isset($_GET['setfile'])){
 $file = $_GET['setfile'];
 $json['strobimages']['currimage'] = $file;
 $json['view'] = 'J';
 file_put_contents('./imgdataset', json_encode($json));
}



if(isset($_GET['bx'])){

//"strobimages":{"path":"strobimages","currimage":"1422472992_V100_P90.jpg"}
$file = $json['strobimages']['currimage'];
$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
$json['stroboscopedata']['bx'] = $_GET['bx'];
$json['stroboscopedata']['by'] = $_GET['by'];
file_put_contents($imgdataset, json_encode($json));
if (array_search($file, $strobjsonprocessing['key']) > -1){
   $key = array_search($file, $strobjsonprocessing['key']);
   $strobjsonprocessing['dataset'][$key]['reload'] = '1';
}
file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));
}


if(isset($_GET['boxwidth'])){
$file = $json['strobimages']['currimage'];
$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
//"stroboscopedata":{"bx":100,"by":100,"micronperpixel":5.55,"exwidth":50,"eyheight":50,"deflectxpos":476,"deflectypos":44}
$json['stroboscopedata']['mindiam'] = $_GET['mindiam'];
$json['stroboscopedata']['maxdiam'] = $_GET['maxdiam'];
$json['stroboscopedata']['maxdeflectx'] = $_GET['maxdeflectx'];
$json['stroboscopedata']['micronperpixel'] = $_GET['micronperpixel'];
$json['stroboscopedata']['deflectxpos'] = $_GET['xposition'];
$json['stroboscopedata']['deflectypos'] = $_GET['yposition'];
$json['stroboscopedata']['exwidth'] = $_GET['boxwidth'];
$json['stroboscopedata']['eyheight'] = $_GET['boxheight'];
if ($_GET['thresholdway'] == "auto"){
 $json['stroboscopedata']['autothreshold'] = "1";
}
else {
 $json['stroboscopedata']['autothreshold'] = "0";
 $json['stroboscopedata']['userthreshold'] = $_GET['thresholdvalue'];
}

file_put_contents($imgdataset, json_encode($json));
//$strobjsonprocessing['dataset'][$key]['reload'] = '1';
if (array_search($file, $strobjsonprocessing['key']) > -1){
   $key = array_search($file, $strobjsonprocessing['key']);
   $strobjsonprocessing['dataset'][$key]['reload'] = '1';
}
file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));
}


if(isset($_GET['set'])){
  $strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
  //$file = $_GET['file'];
  $file = $json['strobimages']['currimage'];
  $set = $_GET['set'];
  if (array_search($file, $strobjsonprocessing['key']) > -1){
   $key = array_search($file, $strobjsonprocessing['key']);
   if ($strobjsonprocessing['dataset'][$key]['reload'] == '1'){
    unset($strobjsonprocessing['key'][$key]);
    unset($strobjsonprocessing['dataset'][$key]);
    unset($strobjsonprocessing['dropcalc'][$key]);
    runpycaller($file,$set,$strobjsonprocessing,$json,$strobjson);
   }
  }
//this part has to be a function
else {
  $file = $json['strobimages']['currimage'];
   runpycaller($file,$set,$strobjsonprocessing,$json,$strobjson);
  }
}
header('Location: gui.mod.php');



function runpycaller($file,$set,$strobjsonprocessing,$json,$strobjson){
  	  $file = $json['strobimages']['currimage'];
  	  $dir = $json['strobimages']['path'];
	  //"stroboscopedata":{"autothreshold":"0"
	  if ($json['stroboscopedata']['autothreshold'] == "1"){
	   $cmd = "python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." 0 sample";
	  }
	  else {
	   $cmd = "python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." ".$json['stroboscopedata']['userthreshold']." sample";
	  }
	  $result =  exec($cmd, $output);
	  $totalvol = 0;
	  sleep(1);
	  $strobdataset = 'gearmanstrobdataset';
	  $strobjson = json_decode(file_get_contents($strobdataset), true);
	  //{"calcdataset": {"avgavgspeed": 4.7030399999999997, "avgdeflection": 49.679999999999993, "avgdrops": 1.0, "avgmaxspeed": 4.7030399999999997, "avgminspeed": 4.7030399999999997, "avgvolume": 678.24000000000001, "stdavgspeed": 0.0, "stddeflection": 0.0, "stddrops": 0.0, "stdmaxspeed": 0.0, "stdminspeed": 0.0, "stdvolume": 0.0}, "dataset": [{"dropcalc": {"avgdeflection": 49.679999999999993, "avgspeed": 4.7030399999999997, "drops": 1, "maxspeed": 4.7030399999999997, "minspeed": 4.7030399999999997, "totalvolume": 678.24000000000001}, "dropraw": [{"columncenter": 97, "columndiameter": 13, "deflection": 49.67999999999999, "drops": 0, "image": "strobimages/1422472908_V100_P50_LD250.jpg", "rowcenter": 111, "rowdiameter": 11, "signal": 13.790909090909091, "speed": 4.70304, "volume": 678.24000000000001}], "image": "strobimages/1422472908_V100_P50_LD250.jpg"}], "sample": "sample"}
	  for($i=0;$i<count($strobjson['dataset'][0]['dropraw']);$i++){
		if ($strobjson['dataset'][0]['dropraw'][$i]['signal'] > 0){
		$columncenter = $columncenter . ($strobjson['dataset'][0]['dropraw'][$i]['columncenter']+$json['stroboscopedata']['bx']) . ",";
		$rowcenter = $rowcenter . ($strobjson['dataset'][0]['dropraw'][$i]['rowcenter']+$json['stroboscopedata']['by']) . ",";
		$rowdiameter = $rowdiameter . $strobjson['dataset'][0]['dropraw'][$i]['rowdiameter'] . ",";
		$columndiameter = $columndiameter . $strobjson['dataset'][0]['dropraw'][$i]['columndiameter'] . ",";
		$volume = $volume . $strobjson['dataset'][0]['dropraw'][$i]['volume'] . ",";
		//$volcalc = (($strobjson['dataset'][0]['dropraw'][$i]['volume'] * $json['stroboscopedata']['micronperpixel']) / 10);
		$signal = $signal . $strobjson['dataset'][0]['dropraw'][$i]['signal'] . ",";
		$posx = ($strobjson['dataset'][0]['dropraw'][$i]['columncenter']+$json['stroboscopedata']['bx']);
		} 
	  }
	  $columncenter = preg_replace('/,$/', '', $columncenter);
	  $rowcenter = preg_replace('/,$/', '', $rowcenter);
	  $columndiameter = preg_replace('/,$/', '', $columndiameter);
	  $rowdiameter = preg_replace('/,$/', '', $rowdiameter);
	  $volume = preg_replace('/,$/', '', $volume);
	  $signal = preg_replace('/,$/', '', $signal);
	  $key = count($strobjsonprocessing['dataset']);
	  $strobjsonprocessing['dataset'][$key]['columncenter'] = $columncenter;
	  $strobjsonprocessing['dataset'][$key]['rowcenter'] = $rowcenter;
	  $strobjsonprocessing['dataset'][$key]['columndiameter'] = $columndiameter;
	  $strobjsonprocessing['dataset'][$key]['rowdiameter'] = $rowdiameter;
	  $strobjsonprocessing['dataset'][$key]['volume'] = $volume;
	  $strobjsonprocessing['dataset'][$key]['signal'] = $signal;
	  $strobjsonprocessing['dataset'][$key]['image'] = $file;
	  $strobjsonprocessing['dataset'][$key]['reload'] = '0';
	  $strobjsonprocessing['dataset'][$key]['sample'] = 'sample';
	  $strobjsonprocessing['key'][$key] = $file;
	  $strobjsonprocessing['dropcalc'][$key] = $strobjson['dataset'][0]['dropcalc'];
	  //{"calcdataset": {"avgavgspeed": 4.7030399999999997, "avgdeflection": 49.679999999999993, "avgdrops": 1.0, "avgmaxspeed": 4.7030399999999997, "avgminspeed": 4.7030399999999997, "avgvolume": 678.24000000000001, "stdavgspeed": 0.0, "stddeflection": 0.0, "stddrops": 0.0, "stdmaxspeed": 0.0, "stdminspeed": 0.0, "stdvolume": 0.0}, "dataset": [{"dropcalc": {"avgdeflection": 49.679999999999993, "avgspeed": 4.7030399999999997, "drops": 1, "maxspeed": 4.7030399999999997, "minspeed": 4.7030399999999997, "totalvolume": 678.24000000000001}, "dropraw": [{"columncenter": 97, "columndiameter": 13, "deflection": 49.67999999999999, "drops": 0, "image": "strobimages/1422472908_V100_P50_LD250.jpg", "rowcenter": 111, "rowdiameter": 11, "signal": 13.790909090909091, "speed": 4.70304, "volume": 678.24000000000001}], "image": "strobimages/1422472908_V100_P50_LD250.jpg"}], "sample": "sample"}
	  file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));
}
?>
