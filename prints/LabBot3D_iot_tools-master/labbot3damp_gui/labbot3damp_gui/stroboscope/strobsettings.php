<? session_start(); ?>
<? include('../functionslib.php');?>
<? $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);?>
<?
if(isset($_GET['strobsettings'])){
$jj = array('stroboscopedata'=>array());
$jj['stroboscopedata']['mindiam'] = $_GET['mindiam'];
$jj['stroboscopedata']['maxdiam'] = $_GET['maxdiam'];
//$jj['stroboscopedata']['path'] = $_GET['path'];
$jj['stroboscopedata']['maxdeflectx'] = $_GET['maxdeflectx'];
$jj['stroboscopedata']['micronperpixel'] = $_GET['micronperpixel'];
$jj['stroboscopedata']['deflectxpos'] = $_GET['xposition'];
$jj['stroboscopedata']['deflectypos'] = $_GET['yposition'];
$jj['stroboscopedata']['exwidth'] = $_GET['boxwidth'];
$jj['stroboscopedata']['eyheight'] = $_GET['boxheight'];
if ($_GET['thresholdway'] == "auto"){
 $jj['stroboscopedata']['autothreshold'] = "1";
}
else {
 $jj['stroboscopedata']['autothreshold'] = "0";
 $jj['stroboscopedata']['userthreshold'] = $_GET['thresholdvalue'];
}
 $jj['stroboscopedata']['currimage'] = $_SESSION['labbot3d']['strobdata']['currimage'];
 $jj['stroboscopedata']['dir'] = $_SESSION['labbot3d']['strobdata']['dir'];
 //$_SESSION['labbot']['stroboscopedata'] = $jj['stroboscopedata'];
 $jj['stroboscopedata']['bx'] = $_SESSION['labbot3d']['strobdata']['bx'];
 $jj['stroboscopedata']['by'] = $_SESSION['labbot3d']['strobdata']['by'];


 $_SESSION['labbot3d']['strobdata'] = $jj['stroboscopedata'];
 //var_dump($_SESSION['labbot3d']['strobdata']);
  header("Location: ../analyzedroplet.php?adjust=formmod");
//echo '<br>';
 //$file = $json['strobimages']['currimage'];
//runpycaller($file,$set,$strobjsonprocessing,$jj,$strobjson);
}
?>
<?
if(isset($_GET['set'])){
  //$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
  $file = $_GET['file'];
  $set = $_GET['set'];
  $aa = preg_split("/,/", $set);
  $_SESSION['labbot3d']['strobdata']['bx'] = $aa[0];
  $_SESSION['labbot3d']['strobdata']['by'] = $aa[1];
  $json = array('stroboscopedata' => $_SESSION['labbot3d']['strobdata']); 
  $cmd = 'python /var/www/html/labbot3damp_gui/dropquant.caller.py /var/www/html/labbot3damp_gui/'.$_SESSION['labbot3d']['strobdata']['currimage']." ".$set." ".$_SESSION['labbot3d']['strobdata']['mindiam']." ".$_SESSION['labbot3d']['strobdata']['maxdiam']." 0 sample ".$_SESSION['labbot3d']['strobdata']['deflectypos']." ".$_SESSION['labbot3d']['strobdata']['deflectxpos']." ".$_SESSION['labbot3d']['strobdata']['micronperpixel'];
  //publish_message('analyzedroplets '.$cmd,$jsonconfig['topic'], 'localhost', 1883, 5);
  echo $cmd.'<br>';
  $result =  exec($cmd, $output);
  $strobres = json_decode($result,true);
  $_SESSION['labbot3d']['strobdata']['res'] = $strobres;
  //var_dump($strobres);
  header("Location: ../viewdropletresults.php?adjust=formmod");
}
  //echo "sudo python dropquant.caller.py imaging/strobimages/1422473098_V110_P90_LD250.jpg 359,118,175,200 6 30 0 sample 36 400 8.04"
  //include('runpycaller.dropquant.php'); 
  //$strobresults = runpycaller($file,$set,$json);
  //$_SESSION['labbot3d']['strobdata']['strobresults'] = $strobresults;
  //header("Location: https://www.htsresources.com/simp.labbot3d/stroboscope/view.droplet.results.php");
?>
<?
function rrrunpycaller($file,$set,$json){
  	  //$file = $json['stroboscopedata']['currimage'];
  	  //$dir = $json['stroboscopedata']['path'];
	  //"stroboscopedata":{"autothreshold":"0"
	  if ($json['stroboscopedata']['autothreshold'] == "1"){
	   $cmd = "python dropquant.caller.py ".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." 0 sample";
	  }
	  else {
	   $cmd = "python dropquant.caller.py ".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." ".$json['stroboscopedata']['userthreshold']." sample";
	  }
	  $result =  exec($cmd, $output);
          $strobres = json_decode($result,true);
          return $strobres;
          /*
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
	  */
	  //{"calcdataset": {"avgavgspeed": 4.7030399999999997, "avgdeflection": 49.679999999999993, "avgdrops": 1.0, "avgmaxspeed": 4.7030399999999997, "avgminspeed": 4.7030399999999997, "avgvolume": 678.24000000000001, "stdavgspeed": 0.0, "stddeflection": 0.0, "stddrops": 0.0, "stdmaxspeed": 0.0, "stdminspeed": 0.0, "stdvolume": 0.0}, "dataset": [{"dropcalc": {"avgdeflection": 49.679999999999993, "avgspeed": 4.7030399999999997, "drops": 1, "maxspeed": 4.7030399999999997, "minspeed": 4.7030399999999997, "totalvolume": 678.24000000000001}, "dropraw": [{"columncenter": 97, "columndiameter": 13, "deflection": 49.67999999999999, "drops": 0, "image": "strobimages/1422472908_V100_P50_LD250.jpg", "rowcenter": 111, "rowdiameter": 11, "signal": 13.790909090909091, "speed": 4.70304, "volume": 678.24000000000001}], "image": "strobimages/1422472908_V100_P50_LD250.jpg"}], "sample": "sample"}
	  //file_put_contents('./strobdatasetprocessing', json_encode($strobjsonprocessing));
   
}
?>
