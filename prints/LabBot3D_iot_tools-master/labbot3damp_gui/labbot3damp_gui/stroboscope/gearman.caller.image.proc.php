<?php


function gearmanstrobdataprocessing(){
$gearmanstrobdataset = json_decode(file_get_contents('./gearmanstrobdataset'), true);
$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
$gearmanstroblog = json_decode(file_get_contents('./gearmanstroblog'), true);
$json = json_decode(file_get_contents('./imgdataset'), true);

//first read the raw gearmanstrobdataset

$ppath = $gearmanstrobdataset['dataset'][0]['image'];
$path = preg_replace('/\/.*/', '',$ppath);
array_push($gearmanstroblog['sample'], $gearmanstrobdataset['sample']);
$time = time();
array_push($gearmanstroblog['time'], $time);
array_push($gearmanstroblog['path'], $path);

$images = array();
for($i=0;$i<count($gearmanstrobdataset['dataset']);$i++){
 $pimg = $gearmanstrobdataset['dataset'][$i]['image'];
 $img = preg_replace('/^.*\//', '',$pimg);
 array_push($images, $img);
 array_push($gearmanstroblog['images'], $img);
}

for($i=0;$i<count($gearmanstrobdataset['dataset']);$i++){
 $pimg = $gearmanstrobdataset['dataset'][$i]['dropraw'];  
 $rawdata = array();
 $calcdata = array();
 $columncenter = '';
 $rowcenter = '';
 $rowdiameter = '';
 $columndiameter = '';
 $volume = '';
 $signal = '';
 for($j=0;$j<count($pimg);$j++){
	$columncenter = $columncenter . ($pimg[$j]['columncenter']+$json['stroboscopedata']['bx']) . ",";
	$rowcenter = $rowcenter . ($pimg[$j]['rowcenter']+$json['stroboscopedata']['by']) . ",";
	$rowdiameter = $rowdiameter . $pimg[$j]['rowdiameter'] . ",";
	$columndiameter = $columndiameter . $pimg[$j]['columndiameter'] . ",";
	$volcalc = (($pimg[$j]['volume'] * $json['stroboscopedata']['micronperpixel']) / 10);
	$volume = $volume . $volcalc. ",";
	$signal = $signal . $pimg[$j]['signal'] . ",";
 }
 array_push($rawdata, $pimg);
 $columncenter = preg_replace('/,$/', '', $columncenter);
 $rowcenter = preg_replace('/,$/', '', $rowcenter);
 $columndiameter = preg_replace('/,$/', '', $columndiameter);
 $rowdiameter = preg_replace('/,$/', '', $rowdiameter);
 $volume = preg_replace('/,$/', '', $volume);
 $signal = preg_replace('/,$/', '', $signal);
 $key = count($strobjsonprocessing['key']);
 echo "$key\n";
 $strobjsonprocessing['dataset'][$key]['columncenter'] = $columncenter;
 $strobjsonprocessing['dataset'][$key]['rowcenter'] = $rowcenter;
 $strobjsonprocessing['dataset'][$key]['columndiameter'] = $columndiameter;
 $strobjsonprocessing['dataset'][$key]['rowdiameter'] = $rowdiameter;
 $strobjsonprocessing['dataset'][$key]['volume'] = $volume;
 $strobjsonprocessing['dataset'][$key]['signal'] = $signal;
 $strobjsonprocessing['dataset'][$key]['reload'] = '0';
 $strobjsonprocessing['dropcalc'][$key] = $gearmanstrobdataset['dataset'][$i]['dropcalc'];
 //array_push($strobjsonprocessing['dropcalc'],$gearmanstrobdataset['dataset'][$i]['dropcalc']);
 $file = $images[$i];
 $strobjsonprocessing['key'][$key] = $file;
 $strobjsonprocessing['dataset'][$key]['sample'] = $gearmanstrobdataset['sample'];
 $strobjsonprocessing['dataset'][$key]['image'] = $file;
 array_push($gearmanstroblog['rawdataset'], $rawdata);
}
file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));

$stroblogkey = count($gearmanstroblog['images'])-1;
array_push($gearmanstroblog['calcdataset'],$gearmanstrobdataset['calcdataset']);


file_put_contents('./gearmanstroblog', json_encode($gearmanstroblog));

}
?>
