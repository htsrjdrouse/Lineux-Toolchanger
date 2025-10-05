<html>
<head>
<script src="/processing.js"></script>
<script type=text/javascript src="/jquery.js"></script>
<script type=text/javascript src="/jquery.tabs.js"></script>
<script type=text/javascript src="/jquery.min.js"></script>
<script type=text/javascript src="/jquery.validate.js"></script>
<script type=text/javascript src="/custom.js"></script>
<link rel="stylesheet" href="/style.css">
</head>

<?php

$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$rampx = 40;
$rampy = 40;
$micronperpixel = 5.55;

$columncenter = "";
$rowcenter = "";
$columndiameter = "";
$rowdiameter = "";
$volume = "";
$signal = "";

if(isset($_GET['bx'])){
$json['stroboscopedata']['bx'] = $_GET['bx'];
$json['stroboscopedata']['by'] = $_GET['by'];
}

if(isset($_GET['boxwidth'])){
//"stroboscopedata":{"bx":100,"by":100,"micronperpixel":5.55,"exwidth":50,"eyheight":50,"deflectxpos":476,"deflectypos":44}

$json['stroboscopedata']['mindiam'] = $_GET['mindiam'];
$json['stroboscopedata']['maxdeflectx'] = $_GET['maxdeflectx'];
$json['stroboscopedata']['micronperpixel'] = $_GET['micronperpixel'];
$json['stroboscopedata']['deflectxpos'] = $_GET['xposition'];
$json['stroboscopedata']['deflectypos'] = $_GET['yposition'];
$json['stroboscopedata']['exwidth'] = $_GET['boxwidth'];
$json['stroboscopedata']['eyheight'] = $_GET['boxheight'];
}

if(isset($_GET['set'])){
  $file = $_GET['file'];
  $set = $_GET['set'];

/*
img = Image.open(sys.argv[1]).convert('LA')
img = img.split()[0]

aax = sys.argv[2]
aay = sys.argv[3]
wdim = sys.argv[4]
ldim = sys.argv[5]
*/

  echo "<br><br><ul>";
  $cmd = "python caller.image.proc.py ".$file." ".$set." ".$json['stroboscopedata']['mindiam'];
  echo $cmd.'<br><br>';
  $result = exec($cmd, $output);
  $strobdataset = 'strobdataset';
  $strobjson = json_decode(file_get_contents($strobdataset), true);


  $ct = 0;
  $totalvol = 0;
  for($i=0;$i<count($strobjson);$i++){
	//echo $strobjson[$i]['signal'].' <br>';
	if ($strobjson[$i]['signal'] > 0){
  	$columncenter = $columncenter . ($strobjson[$i]['columncenter']+$json['stroboscopedata']['bx']) . ",";
  	$rowcenter = $rowcenter . ($strobjson[$i]['rowcenter']+$json['stroboscopedata']['by']) . ",";
	$rowdiameter = $rowdiameter . $strobjson[$i]['rowdiameter'] . ",";
	$columndiameter = $columndiameter . $strobjson[$i]['columndiameter'] . ",";
	$volcalc = (($strobjson[$i]['volume'] / $json['stroboscopedata']['micronperpixel']) / 10);
	$volume = $volume . $volcalc. ",";
	$signal = $signal . $strobjson[$i]['signal'] . ",";
	$posx = ($strobjson[$i]['columncenter']+$json['stroboscopedata']['bx']);
	$ct = $ct + 1;
        echo "Drop ".($ct).": ";
	echo ' Diameter: ';
	echo round($strobjson[$i]['rowdiameter']/$json['stroboscopedata']['micronperpixel']).',';
	echo round($strobjson[$i]['columndiameter']/$json['stroboscopedata']['micronperpixel']).'um Volume: ';
	echo round($volcalc).'pl ';
	//Signal: ';
	//echo round($strobjson[$i]['signal']);
	echo ' Deflection: '.round(($posx - $json['stroboscopedata']['deflectxpos'])/$json['stroboscopedata']['micronperpixel']).'um<br>';
	$totalvol = $totalvol + $volcalc;
	} 
  }
  echo '<br><b>Total volume:</b> '.round($totalvol).'pl<br></ul>';  



  $columncenter = preg_replace('/,$/', '', $columncenter);
  $rowcenter = preg_replace('/,$/', '', $rowcenter);
  $columndiameter = preg_replace('/,$/', '', $columndiameter);
  $rowdiameter = preg_replace('/,$/', '', $rowdiameter);
  $volume = preg_replace('/,$/', '', $volume);
  $signal = preg_replace('/,$/', '', $signal);

}


?>



<body>

<style type=text/css>
button.red {background-color: #F8D6D6;}
button.green {background-color: #BCF5A9;}
//input.blue {background-color: #EADFF7;}
input.blue {background-color: #FFFF00;}
button.violet {background-color: #CED8F6;}
input.txt {text-align:center;}
}
</style>



<font face=arial>


<ul>
<table cellpadding=10><tr><td>
<form action=stroboscope.php method=GET>
<b>Scale</b><br>
Micron per pixel: <input type=text name=micronperpixel class="txt" value=<?php echo $json['stroboscopedata']['micronperpixel']; ?> size=5>
<br><br>
<b>Search box area</b><br>
<table>
<tr><td>Width: </td><td><input type=text name=boxwidth class="txt" value=<?php echo $json['stroboscopedata']['exwidth']; ?> size=5></td></tr>
<tr><td>Height: </td><td><input type=text name=boxheight class="txt" value=<?php echo $json['stroboscopedata']['eyheight']; ?> size=5></td></tr>
</table>
<br><br>
<b>Deflection reference line</b><br>
<table>
<tr><td>X: </td><td><input type=text name=xposition class="txt" value=<?php echo $json['stroboscopedata']['deflectxpos']; ?> size=5></td></tr>
<tr><td>Y: </td><td><input type=text name=yposition class="txt" value=<?php echo $json['stroboscopedata']['deflectypos']; ?> size=5></td></tr>
</table>
<br><br>
<b>Threshold tolerances<b><br>
<table>
<tr><td>Minimum diameter: </td><td><input type=text class="txt" name=mindiam value=<?php echo $json['stroboscopedata']['mindiam']; ?> size=5></td></tr>
<tr><td>Maximum deflection: </td><td><input type=text class="txt" name=maxdeflectx value=<?php echo $json['stroboscopedata']['maxdeflectx']; ?> size=5></td></tr>
</table>
<br><br>
<input type=submit class="blue">
<br><br>
</form>

</td>
<td>


<?php 
//$file = '50_100_16.jpg'; 
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
$file = '1422384993_V100_P50.jpg';
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
$filei = $file;
?>

<?php include('strob.img.inc.php'); ?>


</body>
</html>


