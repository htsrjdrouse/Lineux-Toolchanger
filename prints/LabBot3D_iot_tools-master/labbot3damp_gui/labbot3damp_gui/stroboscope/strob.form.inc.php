<?

/*
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$strobjsonprocessing = json_decode(file_get_contents('strobdatasetprocessing'), true);
$strobdataset = 'strobdataset';
$strobjson = json_decode(file_get_contents($strobdataset), true);
*/
?>

<? 
//var_dump($json['stroboscopedata']);
//echo "<br>";
/*
$strobdata = array(
                 "autothreshold"=> "1",
		 "userthreshold"=>"110",
		 "micronperpixel"=> "8.04",
		 "mindiam"=> "6",
		 "maxdiam"=> "30",
		 "exwidth"=> "175",
		 "eyheight"=>"200",
		 "deflectxpos"=> "400",
		 "bx"=> "320",
		 "by"=> "89",
		 "maxdeflectx"=>"100",
		 "deflectypos"=> "36"
		 );
*/
$strobdata = $_SESSION['labbot3d']['strobdata'];
?>
<form action=stroboscope/strobsettings.php method=GET>
<b>Scale (width is 1.15mm)</b><br>
Micron per pixel: <input type=text name=micronperpixel class="txt" value=<?=$strobdata['micronperpixel']; ?> size=5>
<br><br>
<b>Search box area</b><br>
<table>
<tr><td>Width: </td><td><input type=text name=boxwidth class="txt" value=<?=$strobdata['exwidth']; ?> size=5></td></tr>
<tr><td>Height: </td><td><input type=text name=boxheight class="txt" value=<?=$strobdata['eyheight']; ?> size=5></td></tr>
</table>
<br><br>
<b>Deflection reference line</b><br>
<table>
<tr><td>X: </td><td><input type=text name=xposition class="txt" value=<?=$strobdata['deflectxpos']; ?> size=5></td></tr>
<tr><td>Y: </td><td><input type=text name=yposition class="txt" value=<?=$strobdata['deflectypos']; ?> size=5></td></tr>
</table>
<br><br>
<b>Tolerances<br>(Pixels)</b><br>
<table>
<tr><td>Minimum diameter: </td><td><input type=text class="txt" name=mindiam value=<?=$strobdata['mindiam']; ?> size=5></td></tr>
<tr><td>Maximum diameter: </td><td><input type=text class="txt" name=maxdiam value=<?=$strobdata['maxdiam']; ?> size=5></td></tr>
<tr><td>Maximum deflection: </td><td><input type=text class="txt" name=maxdeflectx value=<?=$strobdata['maxdeflectx']; ?> size=5></td></tr>
</table>
<!--
<br><br>
<b>Pixels Thresholding</b><br>
<font size=1>
<?php if ($strobdata['autothreshold'] == "1"){ ?>
<input type=radio name=thresholdway value=auto checked>Auto<br>
<input type=radio name=thresholdway value=defined>Defined
<?php } else { ?>
<input type=radio name=thresholdway value=auto>Auto<br>
<input type=radio name=thresholdway value=defined checked>Defined<b2>
<input type=text name=thresholdvalue value=<?=$strobdata['userthreshold'] ?> size=4>
<?php } ?>
-->
</font>
<br>
<input type=submit class="blue" name="strobsettings">
<br><br>
</form>



