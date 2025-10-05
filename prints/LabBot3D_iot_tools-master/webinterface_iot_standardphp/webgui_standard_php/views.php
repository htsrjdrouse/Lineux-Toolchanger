<!-- Case Point -->
<div class="codeM">
<br>
<table><tr valign=top cellpadding=10><td>
<form action="upload.php" method="post" enctype="multipart/form-data">
<input type="file" name="fileToUpload" id="fileToUpload">
<input type="submit" value="Upload Slic3r file" name="submit">
</form>
<a href=howtouploadgcodefromslicer.php>info about how to upload</a><br>




</ul>
<?php include("adjustgcode.settings.php"); ?>
</td><td>



<ul>
<?php include("list.files.php"); ?>
</td></tr></table>



</div>
<!-- Case Point -->
<div class="codeL">
<ul>
<b>Raspi camera settings</b><br><br>



<table cellpadding=10><tr>
<td>
<? 
if ($json["raspiheadcamon"] == 1){
echo '<img alt="" src="http://'.$json['servers']['gantryhead'].':8080/?action=stream" />'; 
}
?>

</td>


<td>
<form action=raspicamheadcamsettings.php method=get>
<? if ($json['headcamlinearactuatorsocket'] == 0){ ?>
<input type=submit name="headcamlinearactuatorsocketon" class="red" value="Turn on headcam linear actuator socket">
<? } ?>
<? if ($json['headcamlinearactuatorsocket'] == 1){ ?>
<input type=submit name="headcamlinearactuatorsocketoff" class="red" value="Turn off headcam linear actuator socket">
<? } ?>
<br><br>
<? if ($json['raspiheadcamon'] == 1){ ?>
<input type=submit name="raspiheadcamstreamoff" class="red" value="Turn off camera stream">
<? } ?>
<? if ($json['raspiheadcamon'] == 0){ ?>
<input type=submit name="raspiheadcamstreamon" class="red" value="Turn on camera stream">
<!--<input type=submit name="changeraspicamsettings" class="red" value="Change camera settings">-->
<br>
<?php 
$raspicamjson = openraspicamjson();
?>

<table border=0 cellpadding=4>
<tr>
<td><b>Frames per second: </b><input type=text name=framespersecond value=<?=$raspicamjson['framespersecond']?>  size=5></td>
<td><b>Resolution: </b><input type=text name=resolution value=<?=$raspicamjson['resolution']?>  size=10></td>
</tr>
<tr>
<td><b>Saturation: </b><input type=text name=saturation value=<?=$raspicamjson['saturation']?>  size=5></td>
<td><b>Brightness: </b><input type=text name=brightness value=<?=$raspicamjson['brightness']?>  size=5></td>
<td><b>Sharpness: </b><input type=text name=sharpness value=<?=$raspicamjson['sharpness']?>  size=5></td>
<td><b>Contrast: </b><input type=text name=contrast value=<?=$raspicamjson['contrast']?>  size=5></td>
</tr>

<tr>
<td><b>Vertical Flip: </b><input type=text name=verticalflip value=<?=$raspicamjson['verticalflip']?>  size=5></td>
<td><b>Horizontal Flip: </b><input type=text name=horizontalflip value=<?=$raspicamjson['horizontalflip']?>  size=5></td>
</tr></table>
</form>
<? 
closeraspicamjson($raspicamjson);
} ?>
</td></tr></table>

</ul>
</div>



<!-- Case Point -->
<div class="codeK">

<table><tr><td>

<?php  
if ($json['headcamon'] == 1){
	if ($json['local'] == "1"){
		//echo '<img alt="" src="http://'.$json['servers']['gantryhead'].':1337/mjpeg_stream" width="288" height="216" />';
	?>
	<!--<IFRAME src="/test.php" align="center" width="320" height="240" scrolling="no" frameborder="no" marginheight="0px"</IFRAME>-->
	<img src=http://192.168.1.102:1337/mjpeg_stream>
	<?
	}
	else {
		echo '<img alt="" src="http://'.$json['url'].':8000/?action=stream" width="288" height="216" />';
	}
} 
?>
<?php if ($json['headcamon'] == 1){ ?>
	<!--<br><input type=submit name=caliact class="red" value="Snap">-->
<?php } ?>
</td><td valign=top>
<br>
<ul>

<?=$json['teensysettings']?>


<form action=camerasettings.php method=get>
<? if ($json['headcamlinearactuatorsocket'] == 0){ ?>
<input type=submit name="headcamlinearactuatorsocketon" class="red" value="Turn on headcam linear actuator socket">
<? } ?>
<? if ($json['headcamlinearactuatorsocket'] == 1){ ?>
<input type=submit name="headcamlinearactuatorsocketoff" class="red" value="Turn off headcam linear actuator socket">
<br>
<hr>
<br>
<b>Trigger camera settings</b><br>
<? if ($json['headcamon'] == 1){ ?>
<input type=submit name="headcamstreamoff" class="red" value="Turn off camera stream">
<? } ?>
<? if (($json['headcamon'] == 0) and ($json['headcamsnapon'] == 0) and ($json['headcamtrigon'] == 0)){ ?>
<input type=submit name="headcamstreamon" class="red" value="Turn on camera stream">
<input type=submit name="headcamsnapon" class="red" value="Turn on camera snapshot">
<input type=submit name="headcamtrigon" class="red" value="Turn on camera trigger">
<? } ?>
<? if ($json['headcamtrigon'] == 1){ ?>
<input type=submit name="headcamtrigoff" class="red" value="Turn off camera trigger">
<? } ?>
<? if ($json['headcamsnapon'] == 1){ ?>
<input type=submit name="headcamsnapoff" class="red" value="Turn off camera snapshot">
<? } ?>
<? } ?>






<hr>
<br>
<b>Synchronize settings from camera controller: </b><input type=submit name="settings" class="red" value="Camera Settings"><br><br>

<? if ($json['camerasettings']['ledon'] == 1){ ?>
<input type=submit name="ledoff" class="red" value="Turn off LED">
<? } ?>
<? if ($json['camerasettings']['ledon'] == 0){ ?>
<input type=submit name="ledon" class="red" value="Turn on LED">
<? } ?>

<hr>

<table cellpadding=4><tr><td valign=top>
<font size=2>
<b>Flash LED</b><br><br>
<? if ($json['camerasettings']['flashOn'] == 0){ ?>
<input type=submit name="flashon" class="red" value="Flash On">
<? } ?>
<? if ($json['camerasettings']['flashOn'] == 1){ ?>
<input type=submit name="flashoff" class="red" value="Flash Off">
<? } ?>


</font>
</td><td>
<font size=2>
<b>Flash power: </b><input type=text name=flashledpower value="<?= $json['camerasettings']['ledflashpower']?>" size=5> <input type=submit name="changeflashpower" class="red" value="Change Flash Power">
<br>
<b>Flash duration: </b><input type=text name=flashduration value="<?= $json['camerasettings']['ledtimeon']?>" size=5><b> &micro;s </b> <input type=submit name="changeflashduration" class="red" value="Change Flash Duration">
<br>
<b>Delay before flash: </b><input type=text name=leddelay value="<?= $json['camerasettings']['leddelay']?>" size=5><b> &micro;s </b> <input type=submit name="changeleddelay" class="red" value="Change LED Delay">
</font>
<br>
</td></tr></table>

<hr>

<table cellpadding=4><tr><td valign=top>
<font size=2>
<b>Trigger camera</b><br><br>
<? if ($json['camerasettings']['triggerPhoto'] == 0){ ?>
<input type=submit name="triggeron" class="red" value="Trigger On">
<? } ?>
<? if ($json['camerasettings']['triggerPhoto'] == 1){ ?>
<input type=submit name="triggeroff" class="red" value="Trigger Off">
<? } ?>
<br>
<? if ($json['camerasettings']['flashforPhoto'] == 0){ ?>
<input type=submit name="flashforPhoto" class="red" value="Flash On">
<? } ?>
<? if ($json['camerasettings']['flashforPhoto'] == 1){ ?>
<input type=submit name="flashforPhoto" class="red" value="Flash Off">
<? } ?>
</font>

</td><td>
<font size=2>
<b>Signals per trigger: </b><input type=text name=triggerNumber value="<?= $json['camerasettings']['triggerNumber']?>" size=5> <input type=submit name="changetriggerNumber" class="red" value="Change Trigger Number">
<br>
<b>Input pin value: <?=$json['camerasettings']['readPin'] ?></b>
<br>
<b>Delay before trigger: </b><input type=text name=triggerDelay value="<?= $json['camerasettings']['triggerDelay']?>" size=5><b> &micro;s </b> <input type=submit name="changetriggerDelay" class="red" value="Change Trigger Delay">
<br>
<b>Delay before flash: </b><input type=text name=ledflashdelay value="<?= $json['camerasettings']['ledflashdelay']?>" size=5><b> &micro;s </b> <input type=submit name="changeledflashdelay" class="red" value="Change Flash Delay">


</font>
<br>



<br>



</font>
</td></tr></table>
</form>
</ul>

</td></tr></table>









</div>


<div class="codeD">
<table><tr>
<?php 
 $pdir = $json['gcodefile']['path'];
 if (strlen($pdir) > 2){
  $pdir = $pdir.'/';
 }
 else {
  $pdir = '';
 }
 $dir  = './'.$pdir;

//echo 'loadcoords: '.$loadcoords.'<br>';
if (($loadcoords == 0) or ($loadcoordsfindfeatures==1)){
 $file = $dir.$json['positions']['file'];
}
else { 
 $file = $json['positions']['file'];
}

$file = $file.'?'.filemtime($file);
 ?>

<td valign=top>
<?php //echo $file.'<br>'; ?>
<?php $checkfile= './'.$json['imgprocessingtracker']['directory'].'/'.$json['imgprocessingtracker']['filename']; ?>
<?php echo '<br>'.$checkfile.'<br>'; ?>
<?php $file = $checkfile; ?>
<?php
$x = round($json['imageprocessing']['px'][0],3);
$y = round($json['imageprocessing']['py'][0],3);
$xrampx = $x; 
$xrampy = $y;
?>
<?php include("img.processing.mod.inc.php"); ?>

<br>

<fieldset><legend><b>Imageprocessing Data</b></legend>


<?php $tabhead = "<td><font size=1><b>"; ?>
<?php $tabtoe = "</b></font></td></tr>"; ?>
<table>
<?php //"imgprocessingtracker":{"diameter":220,"CX":"195.5","CY":"196.5","PX":[20.26832038835],"PY":[17.127436893204],"signaltonoise":"3.56101290371"} ?>

<tr><?=$tabhead ?>Fiducial file: <?=$json['imgprocessingtracker']['filename'] ?>
 -- Directory: <?=$json['imgprocessingtracker']['directory'] ?> <br>

<?php 
//96_44.5_70.jpg
$posdat = preg_split('/_/', $json['imgprocessingtracker']['filename']);
echo 'px '.round($json['imageprocessing']['px'][0],3).'<br>';
?>
<br> 
<br>
<form action=prerunner.php method=get>
<?php /*
   $url = 'runner.php?mmmove='.$_GET['subval'].'&tcli=move';
   echo $url.'<br>';
   header('Location: '.$url);
*/ ?>


<div align=right>
Current: x: <?=$rampx ?> y: <?=$rampy ?> z: <?=$json['trackxyz']['z']; ?> -- 
<input type=submit name='subval' class='blue' value='G1X<?=$rampx ?>Y<?=$rampy ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>'>
<br>
<br>
Imaging X: <?=$x ?>
 Y: <?=$y ?>
 Z: <?=preg_replace('/.jpg/', '', $posdat[2]) ?> 
<?php
if ($json['positioningmode'] == 'imaging'){
 echo '<br>Go to Imaging Position<br>';
  ?>
 <input type=submit name='subval' class='blue' value='G1X<?=$x ?>Y<?=$y ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>'>
  <?php
}
else {
 echo '<br>Go to Spotting Position ';
 ?>
 <input type=submit name='subval' class='blue' value='G1X<?=($x+$json['camera']['offsetx']) ?>Y<?=($y+$json['camera']['offsety']) ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>'>
<?php
}
?>
</div>
</form>
<?=$tabtoe ?>

<tr><?=$tabhead ?>
<form target="_blank" action="alignment.gcode.php" method="POST">
<input type=text name="firstpos" value="G1X<?=$x ?>Y<?=$y ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>">
<input type=submit name='subval' class="blue" value='Generate Gcode'>
</form>
<?=$tabtoe ?>

<tr><?=$tabhead ?>

<style type="text/css"> 
 input{ 
 text-align:right; 
 } 
</style> 

<?php
  $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
  file_put_contents('taskjob3', json_encode($jsontasker3));
?>


<table cellpadding=5><tr valign=top><td align=left>
<form target="_blank" action="caller.alignment.gcode.php" method="POST">
<input type=hidden name="firstpos" value="G1X<?=$x ?>Y<?=$y ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>">
<?php if($json['editgcode'] == 1){ ?>
<input type=submit name='subval' class="blue" value='Save File'><input type=text name="gfile" id="text"  value='<?=$jsontasker3['filename'][$jsontasker3['track']] ?>' size=10>
<br>
<?php } else { ?>
<input type=submit name='subval' class="blue" value='Edit File'><input type=text name="gfile" id="text"  value='<?=$jsontasker3['filename'][$jsontasker3['track']] ?>' size=10>
<?php } ?>

</form>
</td><td align=right>
<form target="_blank" action="runner.gcode.php" method="POST">
<input type=hidden name="firstpos" value="G1X<?=$x ?>Y<?=$y ?>Z<?=preg_replace('/.jpg/', '', $posdat[2]) ?>F<?=$json['xyfeedrate'] ?>">
<input type=submit name='subval' class="blue" value='Run File'><input type=text name="gfile" id="text"  value='<?=$jsontasker3['filename'][$jsontasker3['track']] ?>' size=10>
</form>
</td></tr></table>
<?=$a ?>
<?=$tabtoe ?>

<tr><?=$tabhead ?>
<form action=prerunner.php method=get>
<?php 
//$gcodecoords = parsergcode();
$json = parsergcode();
?>
<?php if (preg_match('/^G1.*/', $json['gfilefirstposition'])){ ?>
First position: 
<input type=submit name='subval' class='blue' value='<?=preg_replace('/<br>/', '',$json['gfilefirstposition']) ?>' >
<?php } ?>
</form>

<?=$tabtoe ?>


<tr><?=$tabhead ?>
<table cellpadding=5><tr>
<?php

$ct = 0;
foreach ($jsontasker3['filename'] as $key => &$val) {
 echo '<td><font size=1><a href=changegcodefile.php?track='.$key.'>'.$val.'</a><br></font></td>';
 $ct = $ct + 1;
 if ($ct == 4){
  echo '</tr><tr>';
 $ct = 0;
 } 
}




?>
</tr></table>

<?=$tabtoe ?>


</table>


</fieldset>




</td>
<td>
<form action=gui.mod.php method=GET>
<input type=hidden name="typ" value="point"><b>Gridding</b>
<input type=hidden name="view" value="D">
<input type=hidden name="act" value="Regrid">
<input type=hidden name="source" value="resizegrid">
<table border=0 cellpadding=10><tr><td valign=top>
<fieldset><legend><b>Imageprocessing</b></legend>
<font size=1>
<b>Grid x length: </b><input type=text class="txt" name="ex" value="<?php echo $json['grid']['ex']; ?>" size=4></b>
<b>Grid x position: </b><input type=text class="txt" name="pbx" value="<?php echo $json['grid']['pbx']; ?>" size=4></b>
<b>Grid y height: </b><input type=text class="txt" name="ey" value="<?php echo $json['grid']['ey']; ?>" size=4></b>
<b>Grid y position: </b><input type=text class="txt" name="pby" value="<?php echo $json['grid']['pby']; ?>" size=4></b>
<b>Grid X: </b><input type=text name="xnum" class="txt" value="<?php echo $json['grid']['xnum']; ?>" size=4></b>
<b>Grid Y: </b><input type=text name="ynum" class="txt" value="<?php echo $json['grid']['ynum']; ?>" size=4></b>
<br><br>
<input type=submit name='subval' class="blue" value='Adjust Grid'>

</font>
</fieldset>
<p>
<fieldset><legend><b>Location</b></legend>
<table><tr><td>
</td><td></td></tr><tr><td valign=top>

<table><tr valign=top><td>
<?php if ($json['positioningscheme'] == "theoretical"){ ?>
<font size=1><b>Theoretical</b><input type=radio name=positioningscheme value=theoretical checked>  
<b>Imaging</b><input type=radio name=positioningscheme value=imaging>
<?php } else { ?>
<font size=1><b>Theoretical</b><input type=radio name=positioningscheme value=theoretical>  
<b>Imaging</b><input type=radio name=positioningscheme value=imaging checked>
<?php } ?>
<br>
</font>
<font size=1>
<b>Begin Row: </b><input type=text class="txt" name=brow value=<?php echo $json['positioningtheory']['brow']; ?> size=3>
<b> Col: </b><input type=text class="txt" name=bcol value=<?php echo $json['positioningtheory']['bcol']; ?> size=3><br>
<b>End Row: </b><input type=text class="txt" name=erow value=<?php echo $json['positioningtheory']['erow']; ?> size=3>
<b> Col: </b><input type=text class="txt" name=ecol value=<?php echo $json['positioningtheory']['ecol']; ?> size=3><br>
</font>


<?php if ($json['positioningscheme'] == "imaging"){ ?>

<input type=submit name='subval' class="blue" value='Submit Coordinates'>

<br><br>

<input type=submit name='subval' class="blue" value='Adjust Grid'>


</td><td valign=top>
<font size=1>

<?php if ($json['positionimgprocessing']['edit'] == 1){ ?>
<br>
<font size=1><b>Reference X spacing mm</b>:<input type=text class="txt" name=refxspacingmm value=<?php echo $json['positionimgprocessing']['refxspacing']; ?> size=3></font><br>
<font size=1><b>Reference Y spacing mm</b>:<input type=text class="txt" name=refyspacingmm value=<?php echo $json['positionimgprocessing']['refyspacing']; ?> size=3></font><br>
<br>
<font size=1><b>Reference Target X</b>:<input type=text class="txt" name=reftarx value=<?php echo $json['positionimgprocessing']['reftarx']; ?> size=3></font><br>
<font size=1><b>Reference Target Y</b>:<input type=text class="txt" name=reftary value=<?php echo $json['positionimgprocessing']['reftary']; ?> size=3></font><br>

<br>
<b>Y Calibration Table</b>
<br>
<table border=1><tr align=center>
<td><font size=1><b>Position</b></font></td>
<td><font size=1><b>Row</b></font></td>
<td><font size=1><b>Column</b></font></td>
<td><font size=1><b>Ref Row</b></font></td>
<td><font size=1><b>Ref<br>Column</b></font></td>
</tr>
<tr align=center>
<td><font size=1><b>Begin</b></font></td>
<td><font size=1><input type=text class="txt" name=ybrowpos value=<?php echo $json['positionimgprocessing']['ybrowpos']; ?> size=3></font></td>
<td><font size=1><input type=text class="txt" name=ybcolpos value=<?php echo $json['positionimgprocessing']['ybcolpos']; ?> size=3></font></td>
<td><font size=1><b><input type=text class="txt" name=yrefbrow value=<?php echo $json['positionimgprocessing']['ybrow']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=yrefbcol value=<?php echo $json['positionimgprocessing']['ybcol']; ?> size=3></b></font></td>
</tr>

<tr align=center><td><font size=1><b>End</b></font></td>
<td><font size=1><b><input type=text name=yerowpos value=<?php echo $json['positionimgprocessing']['yerowpos']; ?> size=3></font></td>
<td><font size=1><b><input type=text name=yecolpos value=<?php echo $json['positionimgprocessing']['yecolpos']; ?> size=3></font></td>
<td><font size=1><b><input type=text class="txt" name=yreferow value=<?php echo $json['positionimgprocessing']['yerow']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=yrefecol value=<?php echo $json['positionimgprocessing']['yecol']; ?> size=3></b></font></td>
</tr></table>
<br>
<br>
<b>X Calibration Table</b>
<br>
<table border=1><tr align=center>
<td><font size=1><b>Position</b></font></td>
<td><font size=1><b>Row</b></font></td>
<td><font size=1><b>Column</b></td>
<td><font size=1><b>Ref Row</b></font></td>
<td><font size=1><b>Ref<br>Column</b></font></td>
</tr>

<tr align=center>
<td><font size=1><b>Begin</b></font></td>
<td><font size=1><input type=text class="txt" name=xbrowpos value=<?php echo $json['positionimgprocessing']['xbrowpos']; ?> size=3></font></td>
<td><font size=1><input type=text class="txt" name=xbcolpos value=<?php echo $json['positionimgprocessing']['xbcolpos']; ?> size=3></font></td>
<td><font size=1><b><input type=text class="txt" name=xrefbrow value=<?php echo $json['positionimgprocessing']['xbrow']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=xrefbcol value=<?php echo $json['positionimgprocessing']['xbcol']; ?> size=3></b></font></td>
</tr>

<tr align=center><td><font size=1><b>End</b></font></td>
<td><font size=1><b><input type=text class="txt" name=xerowpos value=<?php echo $json['positionimgprocessing']['xerowpos']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=xecolpos value=<?php echo $json['positionimgprocessing']['xecolpos']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=xreferow value=<?php echo $json['positionimgprocessing']['xerow']; ?> size=3></b></font></td>
<td><font size=1><b><input type=text class="txt" name=xrefecol value=<?php echo $json['positionimgprocessing']['xecol']; ?> size=3></b></font></td>
</tr></table>
<br>




<input type=submit name='subval' class="blue" value='Submit Imageprocessing Data'>
<?php } else { ?>
<br>
<font size=1><b>Reference X spacing mm: <?php echo $json['positionimgprocessing']['refxspacing']; ?> </b></font><br>
<font size=1><b>Reference Y spacing mm: <?php echo $json['positionimgprocessing']['refyspacing']; ?> </b></font><br>
<br>
<font size=1><b>Reference Target X: <?php echo $json['positionimgprocessing']['reftarx']; ?></b></font><br>
<font size=1><b>Reference Target Y: <?php echo $json['positionimgprocessing']['reftary']; ?></b></font><br>
<br>


<br>
<b>Y Calibration Table</b>
<br>
<table border=1>
<tr align=center>
<td><font size=1><b>Position</b></font></td>
<td><font size=1><b>Row</b></font></td>
<td><font size=1><b>Column</b></font></td>
<td><font size=1><b>Ref Row</b></font></td>
<td><font size=1><b>Ref<br>Column</b></font></td>
</tr>
<tr>
<td align=center><font size=1><b>Begin</b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['ybrowpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['ybcolpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['ybrow']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['ybcol']; ?></b></font></td>
</tr>
<tr align=center>
<td><font size=1><b>End</b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['yerowpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['yecolpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['yerow']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['yecol']; ?></b></font></td>
</tr></table>
<br>
<br>
<b>X Calibration Table</b>
<br>
<table border=1>
<tr align=center>
<td><font size=1><b>Position</b></font></td>
<td><font size=1><b>Row</b></td>
<td><font size=1><b>Column</b></td>
<td><font size=1><b>Ref Row</b></font</td>
<td><font size=1><b>Ref<br>Column</b></font</td>
</tr>
<tr>
<td align=center><font size=1><b>Begin</b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['xbrowpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['xbcolpos']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['xbrow']; ?></b></font></td>
<td align=center><font size=1><b><?php echo $json['positionimgprocessing']['xbcol']; ?></b></font></td>
</tr>
<tr align=center>
<td><font size=1><b>End</b></font></td>
<td><font size=1><b><?php echo $json['positionimgprocessing']['xerowpos']; ?></b></font></td>
<td><font size=1><b><?php echo $json['positionimgprocessing']['xecolpos']; ?></b></font></td>
<td><font size=1><b><?php echo $json['positionimgprocessing']['xerow']; ?></b></font></td>
<td><font size=1><b><?php echo $json['positionimgprocessing']['xecol']; ?></b></font></td>
</tr></table>
<br>

<input type=submit name='subval' class="blue" value='Edit Imageprocessing Data'>
<?php } ?>

<?php } else { ?>
</td><td>
<font size=1>
<input type=submit name='subval' class="blue" value='Submit Coordinates'>
<?php } ?>
</font>

<br><br>
<?php

//{"positionimgprocessing":{"refxspacing":"1","refyspacing":"1","adjypixpermm":"50.67567","adjxpixpermm":"50.67567","ypixpermm":"50","xpixpermm":"50","edit":"0","brow":"1","bcol":"1","erow":"24","ecol":"16","browpos":"15.52","bcolpos":"18.6","erowpos":"38.16","ecolpos":"33.4"}
$xbrefx = $json['positionimgprocessing']['xbcol'];
$xerefx = $json['positionimgprocessing']['xecol'];
$xbrefy = $json['positionimgprocessing']['xbrow'];
$xerefy = $json['positionimgprocessing']['xerow'];
$xbposx = $json['positionimgprocessing']['xbcolpos'];
$xeposx = $json['positionimgprocessing']['xecolpos'];
$xbposy = $json['positionimgprocessing']['xbrowpos'];
$xeposy = $json['positionimgprocessing']['xerowpos'];

$ybrefx = $json['positionimgprocessing']['ybcol'];
$yerefx = $json['positionimgprocessing']['yecol'];
$ybrefy = $json['positionimgprocessing']['ybrow'];
$yerefy = $json['positionimgprocessing']['yerow'];
$ybposx = $json['positionimgprocessing']['ybcolpos'];
$yeposx = $json['positionimgprocessing']['yecolpos'];
$ybposy = $json['positionimgprocessing']['ybrowpos'];
$yeposy = $json['positionimgprocessing']['yerowpos'];

$spotdiff = round((($yeposx - $ybposx)),3);
$xspotdiff = round((($xeposy - $xbposy)),3);




//$scalex = ($json['positionimgprocessing']['adjxpixpermm'] / $json['positionimgprocessing']['xpixpermm']);
//$scaley = ($json['positionimgprocessing']['adjypixpermm'] / $json['positionimgprocessing']['ypixpermm']);
//"targettype":[{"spotrow":"24","spotrowsp":"1","blockcolsp":"1","spotcolsp":"1","tartypename":"A","blockrow":"1","blockcol":"1","spotcol":"16","blockrowsp":"1","leftmargin":"2","topmargin":"3"}
$targettypeindex = 0;
$spotcolsp = $json['workplate']['targettype'][$targettypeindex]['spotcolsp'];
$spotrowsp = $json['workplate']['targettype'][$targettypeindex]['spotrowsp'];

echo '<font size=1><b>';
echo '<br>Theory: ';
echo '<br>';
echo 'Spot col difference: '.round((($xerefx - $xbrefx) * $spotcolsp),3).'<br>';
echo 'Spot row difference: '.round((($yerefy - $ybrefy) * $spotrowsp),3).'<br>';
echo '<br>Measured: ';
echo '<br>';
//$spotdiff = round((($eposx - $bposx) * $scalex),3);
echo 'Spot col difference per Y '.(($yerefy-$ybrefy) * $spotrowsp).' mm: '.($spotdiff).'<br>';
echo 'Spot col per Y 1 mm difference: '.$spotdiff / abs($yerefy-$ybrefy).'<br>';
echo 'Spot row difference per X '.(($xerefx-$xbrefx) * $spotcolsp).' mm: '.$xspotdiff.'<br>';
echo 'Spot row per X 1 mm difference: '.$xspotdiff / abs($xerefx-$xbrefx).'<br>';
echo '<br>';
$calcxspacing = ((($xeposx - $xbposx))/($xerefx - $xbrefx));
$calcyspacing = ((($yeposy - $ybposy))/($yerefy - $ybrefy));
$refxspacing = $json['positionimgprocessing']['refxspacing'];
$refyspacing = $json['positionimgprocessing']['refyspacing'];
echo 'X Spacing: '.round($calcxspacing,3).'<bR>';
echo 'Y Spacing: '.round($calcyspacing,3).'<bR>';


echo '</b></font>';
?>
</td></table>

</td>
<td valign=top>

<?php if ($json['positioningscheme'] == "imaging"){ ?>
<table border=1><tr align=center>
<td><font size=1><b>Chip number</b></b></font></td>
<td><font size=1><b>Chip type</b></font></td>
<td><font size=1><b>Row</b></font</td>
<td><font size=1><b>Column</b></td>
<td><font size=1><b>X</b></font></td>
<td><font size=1><b>Y</b></font></td>
</tr>

<?php 

for($i=0;$i<count($json['workplate']['tarxpos']);$i++){
 $reference = $json['workplate']['reference'][$i];
 if ($json['workplate']['enabledtargets'][$i] == 1){
 $arraytype = $json['workplate']['arraytype'][$i];
 $ii = $json['workplate']['arraytyperef'][$arraytype];
 
 if ($json['positioningtheory']['bcol'] < $json['workplate']['targettype'][$ii]['spotcol']) {
  $bx = $json['positioningtheory']['bcol'];
 }
 else {
  $bx = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['ecol'] < $json['workplate']['targettype'][$ii]['spotcol']) {
  $ex = $json['positioningtheory']['ecol'];
 }
 else {
  $ex = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['brow'] < $json['workplate']['targettype'][$ii]['spotrow']) {
  $by = $json['positioningtheory']['brow'];
 }
 else {
  $by = $json['workplate']['targettype'][$ii]['spotrow'];
 }

 if ($json['positioningtheory']['erow'] < $json['workplate']['targettype'][$ii]['spotrow']) {
  $ey = $json['positioningtheory']['erow'];
 }
 else {
  $ey = $json['workplate']['targettype'][$ii]['spotrow'];
 }



//$calcxspacing = ((($eposx - $bposx) * $scalex)/($erefx - $brefx));
//$calcyspacing = ((($eposy - $bposy) * $scaley)/($erefy - $brefy));

//"reference":{"1_1":"1","1_2":"2","1_3":"3","1_4":"4","1_5":"5","2_1":"6","2_2":"7","2_3":"8","2_4":"9","2_5":"10"},"arraytyperef":{"A":0,"B":1},"arraytype":["B","A","B","A","A","A","A","A","B","B"],"tarxpos":["17.4","36.9","56.4","75.9","95.4","17.4","36.9","56.4","75.9","95.4"],"tarypos":["14.36","14.36","14.36","14.36","14.36","43.86","43.86","43.86","43.86","43.86"]
//{"positionimgprocessing":{"reftarx":"1","reftary":"1","refxspacing":"1","refyspacing":"1","adjypixpermm":"50.67567","adjxpixpermm":"50.67567","ypixpermm":"50","xpixpermm":"50","edit":"0","brow":"1","bcol":"1","erow":"24","ecol":"16","browpos":"15.52","bcolpos":"18.6","erowpos":"38.16","ecolpos":"33.4","refxspacingmm":"1","refyspacingmm":"1"}


 $reftarx = $json['positionimgprocessing']['reftarx'];
 $reftary = $json['positionimgprocessing']['reftary'];
 $searchstr = $reftary."_".$reftarx;
 $tarind = ($json['workplate']['reference'][$searchstr] - 1);
 $reftarxpos = $json['workplate']['tarxpos'][$tarind];
 $reftarypos = $json['workplate']['tarypos'][$tarind];
 $shiftx = $json['workplate']['tarxpos'][$i] - $reftarxpos;
 $shifty = $json['workplate']['tarypos'][$i] - $reftarypos;




 //I CAN FIX THE TARXPOS RIGHT HERE BUT TARXPOS AND TARYPOS CAN BE A WELL INSTEAD OF THE CORNER PROBABLY HERE I WILL CREATE NEW JSON OBJECTS TARXPOSWELL AND TARYPOSWELL AND WHEN THE IMAGING OPTION IS SELECTED TARXPOSWELL IS SELECTED IN TEH WORKPLATE MODE
 //$ypos = $json['positionimgprocessing']['ybrowpos'] + $shifty + (($y - $json['positionimgprocessing']['ybrow']) * ($calcyspacing/$refyspacing)) + $xspotdiff;
 //$xpos = $json['positionimgprocessing']['ybcolpos'] + $shiftx + (($x - $json['positionimgprocessing']['ybcol']) * round(($calcxspacing/$refxspacing),3)) + $spotdiff;

  $diagspotdiff = $unitpermmxshift * (($y - 1) * $spotrowsp);
  $xdiagspotdiff = $unitpermmyshift * (($x - 1) * $spotcolsp);

  //echo '$diagspotdiff '.$diagspotdiff.'<br>';
  $yshimmy  = ($spotdiff / abs($yerefy-$ybrefy) * (($by - $json['positionimgprocessing']['ybrow']) * $spotrowsp));
  $xshimmy = ($xspotdiff / abs($xerefx-$xbrefx) * (($bx - $json['positionimgprocessing']['xbcol']) * $spotcolsp));



  /*
  echo 'by: '.$by.'<br>';
  echo 'sub well: '.$json['positionimgprocessing']['ybrow'].'<br>';
  echo 'yshimmy: '.$yshimmy.'<br>';
  echo 'xshimmy: '.$xshimmy.'<br>';
  */

  $coords = imagingcoordfind($json,$i,$bx,$by,$spotdiff,$xspotdiff,$targettypeindex);
  $bxpos = $coords[0];
  $bypos = $coords[1];
 

  $coords = imagingcoordfind($json,$i,$ex,$ey,$spotdiff,$xspotdiff,$targettypeindex);
  $expos = $coords[0];
  $eypos = $coords[1];
  //echo 'expos from '.$ex.' X coords: '.$expos.'<br>';
  //echo 'eypos from coords: '.$eypos.'<br>';

 echo "<tr align=center>";
 echo "<td align=center><font size=1><b>".($i+1)."</b></td>";
 echo "<td align=center><font size=1><b>".$json['workplate']['targettype'][$ii]['tartypename']."</font></b></td>";
 echo "<td><font size=1><b>".$by."</b></font></td>";
 echo "<td><font size=1><b>".$bx."</b></font></td>";
 echo "<td><font size=1><b>".round($bxpos,3)."</b></font></td>";
 echo "<td><font size=1><b>".round($bypos,3)."</b></font></td>";
 $daterx = (round($bxpos,3));
 echo "</tr>";
 echo "<tr align=center>";
 echo "<td align=center><font size=1><b>".($i+1)."</b></td>";
 echo "<td align=center><font size=1><b>".$json['workplate']['targettype'][$ii]['tartypename']."</font></b></td>";
 echo "<td><font size=1><b>".$ey."</b></font></td>";
 //echo "<td><font size=1><b>tesing".($ey - $json['positionimgprocessing']['xbrow'])."</b></font></td>";
 //echo "<td><font size=1><b>".($ey - $json['positionimgprocessing']['xbrow']) * ($calcyspacing/$refyspacing)."</b></font></td>";
 echo "<td><font size=1><b>".$ex."</b></font></td>";
 echo "<td><font size=1><b>".round($expos,3)."</b></font></td>";
 echo "<td><font size=1><b>".round($eypos,3)."</b></font></td>";
 //echo "<td><font size=1><b>".($ey - $json['positionimgprocessing']['xbrow']) * ($calcyspacing/$refyspacing)."</b></font></td>";
 echo "</tr>";
 }
}
?>



</table>

<?php } ?>


<?php if ($json['positioningscheme'] == "theoretical"){ ?>
<table border=1><tr align=center><td><font size=1><b>Chip number</b></b></font></td><td><font size=1><b>Chip type</b></font></td><td></td><td><font size=1><b>X</b></font></td><td><font size=1><b>Y</b></font></td></tr>
<?php 
//"arraytyperef":{"A":0,"B":1}
//"targettype":[{"spotrow":"16","spotrowsp":"1","blockcolsp":"1","spotcolsp":"1","tartypename":"A","blockrow":"1","blockcol":"1","spotcol":"24","blockrowsp":"1","leftmargin":"2","topmargin":"3"},{"tartypename":"B","spotrow":"16","spotrowsp":"1","blockcolsp":"1","spotcolsp":"1","blockrow":"1","blockcol":"1","spotcol":"24","blockrowsp":"1","leftmargin":"2","topmargin":"3"}]
//"tarxpos":["11","21","31","41","51","11","21","31","41","51"],"tarypos":["23","23","23","23","23","43","43","43","43","43"]
//"arraytype":["A","A","A","A","A","A","A","A","B","B"]
//"reference":{"1_1":"1","1_2":"2","1_3":"3","1_4":"4","1_5":"5","2_1":"6","2_2":"7","2_3":"8","2_4":"9","2_5":"10"}

for($i=0;$i<count($json['workplate']['tarxpos']);$i++){
 $reference = $json['workplate']['reference'][$i];
 if ($json['workplate']['enabledtargets'][$i] == 1){
 $arraytype = $json['workplate']['arraytype'][$i];
 $ii = $json['workplate']['arraytyperef'][$arraytype];
 
 if ($json['positioningtheory']['bcol'] < $json['workplate']['targettype'][$ii]['spotcol']) {
  $bx = $json['positioningtheory']['bcol'];
 }
 else {
  $bx = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['ecol'] < $json['workplate']['targettype'][$ii]['spotcol']) {
  $ex = $json['positioningtheory']['ecol'];
 }
 else {
  $ex = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['brow'] < $json['workplate']['targettype'][$ii]['spotrow']) {
  $by = $json['positioningtheory']['brow'];
 }
 else {
  $by = $json['workplate']['targettype'][$ii]['spotrow'];
 }

 if ($json['positioningtheory']['erow'] < $json['workplate']['targettype'][$ii]['spotrow']) {
  $ey = $json['positioningtheory']['erow'];
 }
 else {
  $ey = $json['workplate']['targettype'][$ii]['spotrow'];
 }



 //$bx = 1;
 //$ex = $json['workplate']['targettype'][$ii]['spotcol'];
 $xsp = $json['workplate']['targettype'][$ii]['spotcolsp'];
 //$by = 1;
 //$ey = $json['workplate']['targettype'][$ii]['spotrow'];
 $ysp = $json['workplate']['targettype'][$ii]['spotrowsp'];
 echo "<tr align=center><td align=center><font size=1>";
 echo "<b>".($i+1)."</b></td><td align=center><font size=1><b>".$json['workplate']['targettype'][$ii]['tartypename']. "</font></b></td><td><font size=1><b>Begin Row: ".$by." Col: ".$bx."</b>";


 //HERE TARXPOS AND TARYPOS NEEDS TO BE MODIFIED SINCE THE MARGINS ARE CALCULATED BUT I THINK WE SHOUDL TRY TO KEEP THE MARGIN FEATURE BUT HAVE AN OPTION TO POSITION BASED ON FIDUCIALS
 $bxpos = $json['workplate']['targettype'][$ii]['leftmargin'] + (($bx - 1) * $json['workplate']['targettype'][$ii]['spotcolsp']) + $json['workplate']['tarxpos'][$i];
 $expos = $json['workplate']['targettype'][$ii]['leftmargin'] + (($ex - 1) * $json['workplate']['targettype'][$ii]['spotcolsp']) + $json['workplate']['tarxpos'][$i];
 $bypos = $json['workplate']['targettype'][$ii]['topmargin'] + (($by - 1) * $json['workplate']['targettype'][$ii]['spotrowsp']) + $json['workplate']['tarypos'][$i];
 $eypos = $json['workplate']['targettype'][$ii]['topmargin'] + (($ey - 1) * $json['workplate']['targettype'][$ii]['spotrowsp']) + $json['workplate']['tarypos'][$i];

 echo "</font></td>";
 echo "<td><font size=1><b>".$bxpos."</b></font></td><td><font size=1><b>".$bypos."</b></font></td>";
 echo "</tr>";
 echo "<tr align=center><td align=center><font size=1>";
 echo "<b>".($i+1)."</b></td><td align=center><font size=1><b>".$json['workplate']['targettype'][$ii]['tartypename']. "</font></b></td><td><font size=1><b> End Row: ".$ey." Col: ".$ex."</b>";
 echo "</font></td><td><font size=1><b>".$expos."</b></font></td><td><font size=1><b>".$eypos."</b></font></td>";
 echo "</tr>";
}
}
?>
</table>
<?php } ?>
</td>
</tr>
</table>
</fieldset>
<p>
<!--
<fieldset><legend><b>Dimension</b></legend>
<font size=1>
<b>X pixel per mm: </b><input type=text class="txt" name="spacex" value="<?php //echo $json['grid']['spacex']; ?>" size=4></b>
<b>Y pixel per mm: </b><input type=text class="txt" name="spacey" value="<?php //echo $json['grid']['spacey']; ?>" size=4></b>
</font>
</fieldset><p>
-->
<fieldset><legend><b>Camera to Reference Tip Offset</b></legend>
<font size=1>
(Camera position - tip position)<br>
<b>Offset X: </b><input type=text name="offsetx" class="txt" value="<?php echo $json['camera']['offsetx']; ?>" size=4></b>
<b>Offset Y: </b><input type=text name="offsety" class="txt" value="<?php echo $json['camera']['offsety']; ?>" size=4></b>
</font>
</fieldset>
<br>
<fieldset><legend><b>Positioning mode</b></legend>

<table cellpadding=5><tr><td>
<font size=1>
<?php if ($json['positioningmode'] == 'imaging'){ ?>
<b>Imaging </b><input type=radio name=positioningmode value=imaging checked>  
<b>Spotting </b><input type=radio name=positioningmode value=spotting>
<br>
<?php } else { ?>
<b>Imaging positions </b><input type=radio name=positioningmode value=imaging><br>
<b>Spotting positions </b><input type=radio name=positioningmode value=spotting checked>
<?php } ?>
<br></font>
</td><td><font size=1>
<b>XY Feedrate: </b><input type=text name="xyfeedrate" class="txt" value="<?php echo $json['xyfeedrate']; ?>" size=4><br>
<b>Z Bed Feedrate: </b><input type=text name="zfeedrate" class="txt" value="<?php echo $json['zfeedrate']; ?>" size=4>
</font>
</td>
<td><font size=1>
<b>Z travel height: <input type=text name="ztrav" class="txt" value="<?=$json['ztrav'] ?>" size=4></b>
</font></td>
</tr></table>
</fieldset>
<br>
<!--<fieldset><legend><b>Homing</b></legend><font size=1>-->
<?php if ($json['homingxafterrow'] == 1){ ?>
<!-- <b>Homing X after row pass: </b><input type=checkbox name=homingxafterrow value=1 checked>-->
<?php } else { ?>
<!--<b>Homing X after row pass: </b><input type=checkbox name=homingxafterrow value=1> -->
<?php } ?>
<!--</font></fieldset>-->
<br>
</form>
</td>
</form>

</td></tr><tr><td>
</form>
</td>
</tr></table>
</td></tr></table>
</div>



<!-- Case Point -->
<div class="codeE">

<table cellpadding=10><tr>
<td valign=top>
<table><tr><td valign=top>






</td><td valign=top>

<form action="gui.mod.php" method="get">

<input type=hidden name="view" value="E">
<input type=hidden name="act" value="PositionDriver">
<br>
</td></tr></table><br>
<?php
$file = $json['positions']['file'];
$file = $file.'?'.filemtime($file);
$filei = $file;
//echo 'the file '.$file.'<br>';
?>
<br>
</td>
<td valign=top>
<br>
<div style="height:0px;overflow:hidden">
<input type="file" id="fileInput" name="fileInput" />
</div>

</form>

<style type=text/css>
button.red {background-color: #F8D6D6;}
button.green {background-color: #BCF5A9;}
//input.blue {background-color: #EADFF7;}
button.blue {background-color: #FFFF00;}
file.blue {background-color: #FFFF00;}
button.violet {background-color: #CED8F6;}
input.txt {text-align:center;}


#yourBtn{
   position: relative;
   top: 0px;
   font-family: arial;
   width: 100px;
   padding: 3px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   //border: 4px line #FFF; 
   border-style: solid;
   border-width: 1px;
   text-align: center;
   //background-color: #DDD;
   background-color: #FFFF00;
   cursor:pointer;
  }
</style>


<script type="text/javascript">
 function getFile(){
   document.getElementById("gcodefile").click();
 }
 function sub(obj){
    var file = obj.value;
    var fileName = file.split("\\");
    document.getElementById("yourBtn").innerHTML = fileName[fileName.length-1];
    document.myForm.submit();
    event.preventDefault();
  }
</script>





<fieldset><legend><b>Design gcode</b></legend>
<form action="gui.mod.php" method="post" enctype="multipart/form-data">

<input type=hidden name="view" value="E">

<table><tr><td>
<label for="file"><input type=submit name='ract' class="blue" value='UPLOAD GCODE FILE'></label>
</td>
<td>
<div id="yourBtn" onclick="getFile()">Select file</div>
<div style='height: 0px;width: 0px; overflow:hidden;'><input id="gcodefile" type="file" value="upload" name="gcodefile" onchange="sub(this)"/></div>
</td>
</tr></table>

<!--<input type="file"  name="gcodefile" size="40">-->
<?php if ($disp == 1){  
?>
	<br><br>
		Selected file: <font color=red><?php echo $json['gcodefile']['filename']; ?></font> - 
		<?php echo count($json['gcodefile']['gmvlines']); ?> steps 
		<!--<input type=submit name='ract' class="red" value='RUN GCODE FILE'>-->
<?php 
} ?>
</form>



<style type="text/css">
#textInput2 {
width:350px;
height:100px;
margin-left:5px;
}
</style>
<div>



<?php
echo "<font size=1>";
echo "</font>";
?>






<script language=JavaScript>
<!--
function check_length(my_form)
	{
		maxLen = 2000; // max number of characters allowed
		if (my_form.my_text.value.length >= maxLen) {
// Alert message if maximum limit is reached. 
// If required Alert can be removed. 
var msg = "You have reached your maximum limit of characters allowed";
alert(msg);
		// Reached the Maximum length so trim the textarea
			my_form.my_text.value = my_form.my_text.value.substring(0, maxLen);
		 }
		else{ // Maximum length not reached so update the value of my_text counter
			my_form.text_num.value = maxLen - my_form.my_text.value.length;}
	}
//-->
</script>


<?php 
  $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
  file_put_contents('taskjob3', json_encode($jsontasker3));
?>
<form action="gui.mod.php" method="post">
<input type=hidden name="view" value="E">
<input type=hidden name="act" value="gcodesave">
<textarea id="textInput2"  name="macroscript" onKeyPress=check_length(this.form); onKeyDown=check_length(this.form); >
<?php 
if ((isset($_POST['ract'])) and ($_POST['ract'])){
   for ($i=0;$i<count($json['gcodefile']['lines']);$i++){
	//echo $json['gcodefile']['lines'][$i].'\n';
	$cleancmd = preg_replace("/\n/", "", $json['gcodefile']['lines'][$i]);
	echo $cleancmd.'&#013;&#010;';
   }
}
else {
 //echo 'Enter commands here&#013;&#010;';
 $gcode =  $jsontasker3['data'][($jsontasker3['track'])];
 //$gcodelist = preg_split('/,/', $gcode);
 for ($i=0;$i<count($gcode);$i++){
  //$aster = preg_replace("/[^.]/","",$gcodelist[$i]);
  $aster = $gcode[$i];
  //$aster = preg_replace("/^./","",$aster);
  //$aster = preg_replace("/]/","",$aster);
  echo preg_replace("/'/","",$aster).'&#013;&#010';
 }
} 
?>
</textarea>
<br>
<input type=submit name='gcode' class="red" value='Save'>
<input type=submit name='gcode' class="red" value='Delete'>
<input type=txt name='scriptname' size="<?=strlen($jsontasker3['filename'][($jsontasker3['track'])]) ?>" value="<?=$jsontasker3['filename'][($jsontasker3['track'])] ?>">
</form>
<form action="runner.php" method="get" name="my_form" >
<input type=hidden name="view" value="E">
<input type=hidden name="rungcode" value="rungcode">
<input type=submit name='ract' class="red" value='RUN MACRO'> <?=$jsontasker3['filename'][$jsontasker3['track']] ?>
</form>
<table cellpadding=5><tr>
<?php
$ct = 0;
//for ($i=0;$i<count($jsontasker3['filename']);$i++){
foreach ($jsontasker3['filename'] as $key => &$val) {
 echo '<td><font size=1><a href=changegcodefile.php?track='.$key.'>'.$val.'</a><br></font></td>';
 $ct = $ct + 1;
 if ($ct == 4){
  echo '</tr><tr>';
 $ct = 0;
 } 
}
?>
</tr></table>
</fieldset><p>








</td>


<td>


<script type="text/javascript"> 
// output functions are configurable.  This one just appends some text
// to a pre element.
function outf(text) { 
	var mypre = document.getElementById("output"); 
	mypre.innerHTML = mypre.innerHTML + text; 
} 
function builtinRead(x) {
	if (Sk.builtinFiles === undefined || Sk.builtinFiles["files"][x] === undefined)
		throw "File not found: '" + x + "'";
	return Sk.builtinFiles["files"][x];
}

// Here's everything you need to run a python program in skulpt
// grab the code from your textarea
// get a reference to your pre element for output
// configure the output function
// call Sk.importMainWithBody()
function runit() { 
	var prog = document.getElementById("yourcode").value; 
	var mypre = document.getElementById("output"); 
	mypre.innerHTML = ''; 
	Sk.canvas = "mycanvas";
	Sk.pre = "output";
	Sk.configure({output:outf, read:builtinRead}); 
	try {
		eval(Sk.importMainWithBody("<stdin>",false,prog)); 
	}
	catch(e) {
		alert(e.toString())
	}
} 
</script> 

<?php
  $jsonpython = json_decode(file_get_contents('pythoncode'), true);
  $track = $jsonpython['track'];
  file_put_contents('pythoncode', json_encode($jsonpython));
?>


<fieldset><legend><b>Python IDE</b></legend>
<form action="gui.mod.php" method="post">
<input type=hidden name="view" value="E">
<input type=hidden name="act" value="pythonsave">
<textarea id="yourcode" name="pythoncode" cols="40" rows="10">
<?php 
 echo $jsonpython['script'][$jsonpython['track']];
?>
</textarea><br /> 
<input type=submit name='savepython' class="red" value='Save'>
<input type=submit name='savepython' class="red" value='Delete'>
<input type=txt name='scriptname' size="<?=strlen($jsonpython['filename'][$jsonpython['track']]) ?>" value="<?=$jsonpython['filename'][$jsonpython['track']] ?>">
</form> 
<table><tr>
<td>
<form action="gui.mod.php" method="get">
<input type=hidden name="view" value="E">
<input type=hidden name="act" value="pythonrun">
<input type=submit name='runpython' class="red" value='Run'>
</form>
</td>
<td>
</td>
</tr></table>
<table cellpadding=5><tr>
<?php
$ct = 0;
//for($i=0;$i<count($jsonpython['filename']);$i++){
foreach ($jsonpython['filename'] as $key => &$val) {
 if ($ct < 4){
 }
 else {
  $ct = 0;
  echo '</tr><tr>';
 }
 $ct = $ct + 1;
 echo '<td><font size=1><a href=openpythonscript.php?id='.$key.'>'.$val.'</a></font></td>';
}
?>
</tr></table>

</fieldset>
</td>
</tr>
</table>
</form>

<br>
<?php
?>
</div>


<!-- Case Point -->
<div class="codeH">

<?php 
if ($json['syringetype'] == 'cavro'){
include('cavro.syringe.interface.php'); 
}
else {
include('htsr.syringe.interface.php'); 
}

?>
</div>



<!-- Case Point -->
<div class="codeI">

<form action=gui.mod.php method=get>
<input type=hidden name="view" value="I">
<input type=hidden name="act" value="Source wells">


Number of samples: <?php echo count($json['sourcewell']['anot']); ?>
<br><br>

<ul>
<?php if ($json['sourcewell']['edit'] == 1) {  ?>
<input type=submit name=editlist class="blue" value="Edit"><br>
<table border=1 cellpadding=5>
<tr align=center><td><font size=1>Number</font></td><td><font size=1>Tube<br>Name</font></td><td><font size=1>Tube <br>Holder</font></td></tr>
<?php
for($i=0;$i<count($json['sourcewell']['anot']);$i++){
echo '<tr><td align=center><font size=1>'.($i+1).'</font></td>';
echo "<td align=center><font size=1>".$json['sourcewell']['anot'][$i]."</font></td>";
echo "<td align=center><font size=1> X: ".$json['sourcewell']['x'][$i];
echo " Y: ".$json['sourcewell']['y'][$i];
echo " Z: ".$json['sourcewell']['z'][$i];
echo " Linear actuator 1: ".$json['sourcewell']['laz'][$i]."</font></td>";
echo '</tr>';
}
?>
</table>
<?php } ?>

<?php if ($json['sourcewell']['edit'] == 0) {  ?>

<input type=submit class="blue" name=editlist value="Edit">


<input type=submit class="blue" name=editlist value="Submit"><br>
<table border=1 cellpadding=5>
<tr align=center><td>Number</td><td>Tube <br>Name</td><td>Tube <br>Holder</td></tr>
<?php
for($i=0;$i<count($json['sourcewell']['anot']);$i++){
echo '<tr><td align=center>'.($i+1).'</td>';
echo "<td align=center><input type=input name=sourcewellid".$i." value='".$json['sourcewell']['anot'][$i]."' size=".strlen($json['sourcewell']['anot'][$i])."></td>";
echo "<td align=center><font size=1> X: <input type=input name=sourcewellx".$i." value='".$json['sourcewell']['x'][$i]."' size=3>";
echo " Y: <input type=input name=sourcewelly".$i." value='".$json['sourcewell']['y'][$i]."' size=3>";
echo " Z: <input type=input name=sourcewellz".$i." value='".$json['sourcewell']['z'][$i]."' size=3>";
echo " Linear actuator 1: <input type=input name=sourcewell_laz".$i." value='".$json['sourcewell']['laz'][$i]."' size=3></font></td>";
echo '</tr>';
}
?>
</table>

<br><br>
<?php if (count($json['sourcewell']['x']) < 6) {  ?>
<input type=submit class="blue" name=editlist value="Add Tube">
<?php } ?>
<ul><table>
<?php
echo '<tr><td align=center><font size=1>'.(count($json['sourcewell']['x'])+1).'</font></td>';
echo "<td align=center><font size=1><input type=input name=sourcewellid value='Tube name' size=".strlen($json['sourcewell']['anot'][$i])."></font></td>";
echo "<td align=center><font size=1>X: <input type=input name=sourcewellx".$i." value='".$json['sourcewell']['x'][$i]."' size=3></font>";
echo "<font size=1>Y: <input type=input name=sourcewelly".$i." value='".$json['sourcewell']['y'][$i]."' size=3></font>";
echo "<font size=1>Z: <input type=input name=sourcewellz".$i." value='".$json['sourcewell']['z'][$i]."' size=3></font>";
echo "<font size=1> Linear Actuator 1: <input type=input name=sourcewell_laz".$i." value='".$json['sourcewell']['laz'][$i]."' size=3></font></td>";
echo '</tr>';
?>
</table>
<?php } ?>



</ul>
</form>
</div>


<!-- Case Point -->
<div class="codeG">

<?php 
$p1settings = $json['p1amplifier']['settings'];
$p1ar = preg_split('/:/', $p1settings);
//Volt: 50 Pulse: 50 Freq: 100 Drops: 100 Leddelay: 250 Ledtime: 5 inputpin: 0
$volt = preg_replace('/ \D.*/', '',$p1ar[1]);
$pulse = preg_replace('/ \D.*/', '',$p1ar[2]);
$freq = preg_replace('/ \D.*/', '',$p1ar[3]);
$drops = preg_replace('/ \D.*/', '',$p1ar[4]);
$leddelay = preg_replace('/ \D.*/', '',$p1ar[5]);
$ledtime = preg_replace('/ \D.*/', '',$p1ar[6]);
$inputtime = preg_replace('/ \D.*/', '',$p1ar[7]);
$trigger = preg_replace('/ \D.*/', '',$p1ar[8]);
/*
echo 'settings: '.$p1settings.'<br>';
echo 'volt: '.$volt.'<br>';
echo 'pulse: '.$pulse.'<br>';
echo 'frequency: '.$freq.'<br>';
echo 'drops: '.$drops.'<br>';
echo 'leddelay: '.$leddelay.'<br>';
echo 'inputtime: '.$inputtime.'<br>';
echo 'ledtime: '.$ledtime.'<br>';
*/
?>





Piezo pump<br>
Actuation of piezo pump and stroboscope visualization<br> 
<br><br>
<fieldset><legend><b>Piezoelectric dispensing controller</b></legend>
<table cellpadding=4><tr>
<td>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="G">
<input type=hidden name="act" value="Stroboscope">
<table><tr>
<td>

<?php
if ($json['strobcamon'] == 1){
  if ($json['local'] == "1"){
   echo '<img alt="" src="http://'.$json['servers']['strobcampi'].':8080/?action=stream" width="288" height="216" />';
  }
  else {
   echo '<img alt="" src="http://'.$json['url'].':9000/?action=stream" width="288" height="216" />';
  }
 } 
?>
</td>
<td valign=top>
<input type=submit name=caliact class="red" value="Stroboscope Camera On/Off"><br>
<?php  if ($json['strobcamon'] == 1){?><input type=submit class="red" name=caliact value="Snap">
<br>
<input type=submit class="red" name=strobconnect value="STPR On/Off">
<?php
if ($json['strobconnect'] == 1){ echo '<font color=red>ON</font>'; }
?>
<br>
<br>
<input type=text name=delaytime value=<?= $leddelay ?> size=4> <input type=submit class="blue" name=changedelaytime value="Change delaytime (&micro;s)"> 


<table cellpadding=2>
<?php if ($json['strobparameters']['edit'] == 0) { ?>
<tr><td><input type=submit class="blue" name=strobeditpos value="Edit Position"></td></tr>
<tr><td><font size=1>X position: <?php echo $json['strobparameters']['x']; ?></b></font></td>
<tr><td><font size=1>Y position: <?php echo $json['strobparameters']['y']; ?></b></font></td></tr>
<tr><td><font size=1>Z position: <?php echo $json['strobparameters']['z']; ?></b></font></td>
<?php }  ?>

<?php if ($json['strobparameters']['edit'] == 1) { ?>
<tr><td><input type=submit class="blue" name=strobpos value="Adjust Position"></td></tr>
<tr><td><font size=1>X position:<input type=text name="strobxpos" value="<?php echo $json['strobparameters']['x']; ?>" size=6></b></font></td>
<tr><td><font size=1>Y position:<input type=text name="strobypos" value="<?php echo $json['strobparameters']['y']; ?>" size=6></b></font></td></tr>
<tr><td><font size=1>Z position:<input type=text name="strobzpos" value="<?php echo $json['strobparameters']['z']; ?>" size=6></font></td>
<?php }  ?>
<td></td></tr>
</table>
<?php } ?>
</td>
</tr>
</table>
</form>

<br>
<table><tr valign=top><td>
<form action=gotostroboscope.php method=get>
<input type=submit class="red" name=gotostrob value="GO TO STROB">
</form>
</td><td>
<form action=stroboscopeonoff.php method=get>
<?php if ($json['strobconnect'] == 1) { ?>
<?php if ($json['strobled'] == 1){?><input type=submit class="red" name=strobled value="STROB OFF"><?php } ?>
<?php if ($json['strobled'] == 0){?><input type=submit class="red" name=strobled value="STROB ON"> <?php } ?>
<?php } ?>
</form>
</td></tr></table>


</td>
<td valign=top> 
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="G">
<input type=hidden name="act" value="piezocontrol">
<b>Stroboscope pump parameters</b><br><br>
<br>
<input type=submit class="blue" name=report value="Report">

<!--<a href=stroboscope.php target=_new>Stroboscope Analysis</a>-->

<br>

<input type=submit class="blue" name=setdrops value="Drops">
<font size=1>Drops: </font><input type=text name=setdropnumlev value="<?=$drops ?>" size=5> <br>
<input type=submit class="blue" name=pzcaliact value="Piezo">
<input type=submit class="blue" name=pzcaliact value="Trigger On/Off">
<?php if ($trigger == '1'){ echo "<font color=red>ON</font>"; } ?>
<br>
<input type=submit class="blue" name=pcaliact value="Query Pressure Compensation">
<br>
<font size=1>Set: <input type=text class="txt" name=setpreslev value="<?php echo $json['pressure']['set'];?>" size=5></font>  <font size=1>Level: <?php echo $json['pressure']['read']; ?></font>
<br><br>
<input type=text class="txt" name=piezovolt value=<?=$volt?> size=4> <input type=submit class="blue" name=changevolt value="Change voltage"> <font size=1>(50-150)</font>
<br>
<input type=text class="txt" name=piezopulse value=<?=$pulse ?> size=4> <input type=submit class="blue" name=changepulse value="Change pulse (&micro;s)"> <font size=1>(50-150)</font>
<br>
<input type=text class="txt" name=piezofreq value=<?=$freq ?> size=4> <input type=submit class="blue" name=changefreq value="Change frequency (Hz)"> <font size=1>(20-1000)</font>
<br>
</form>
</td>

</tr></table>
</fieldset><p>
</div>


<!-- Case Point -->
<div class="codeF">
<b>
Washing<br>
Manually wash or set wash parameters for spotting run</b><br> 
<br><br>
<fieldset><legend><b>Manually Wash and/or Dry</b></legend>
<table cellpadding=10><tr valign=top>
<td>
<form action=washing.php method=GET>
<input type=hidden name="act" value="wash">
<input type=hidden name="view" value="F">
<font size=1><b>Wash time: </b> <input type=text name="washtime" class="txt" value="<?php echo $json['washing']['washtime']; ?>" size=4></b>
<input type=submit class="red" name=washsub value="Wash">
<?php if ($json['washing']['dryafterwash'] == 0 ){ ?>
<input type=checkbox name=dry value=dry> <b>Dry after washing</b>
<?php } else { ?>
<input type=checkbox name=dry value=dry checked> <b>Dry after washing</b>
<?php } ?>
</font>
<td>
<font size=1>
<b>Dry time: </b><input type=text name="drytime" class="txt" value="<?php echo $json['washing']['touchdrytime']; ?>" size=4></b>
<input type=submit class="red" name=washsub value="TouchDry">
</form>
</font>
</td>
</tr></table>


</fieldset>
<br><br>

<fieldset><legend><b>Washing conditions</b></legend>

<form action=gui.mod.php method=GET>
<input type=hidden name="act" value="pumpon">
<input type=hidden name="view" value="F">
<!--<b>Pump on time: </b><input type=text name="pumptime" value="<?php echo $json['washing']['draintime']; ?>" size=6>-->
<br>
<font size=1><b>Pump test: </b>
<?php if ($json['washing']['drainpumpon'] == 0){ 
echo '<input type=submit class="red" name=pumpsub value="Drain ON">';
}
else if ($json['washing']['drainpumpon'] == 1){ 
echo '<input type=submit class="red" name=pumpsub value="Drain OFF">';
} 

if ($json['washing']['washpumpon'] == 0){ 
echo '<input type=submit class="red" name=pumpsub value="Wash ON">';
} 
else if ($json['washing']['washpumpon'] == 1){ 
echo '<input type=submit class="red" name=pumpsub value="Wash OFF">';
} ?>
</font>
</form>

<br>

<form action=gui.mod.php method=GET>
<font size=1><b>Washing position: </b></font>
<input type=hidden name="act" value="washedit">
<input type=hidden name="view" value="F">
<?php if ($json['washing']['edit'] == "0"){ ?>
<table border=1 cellpadding=5><tr>
<td><font size=1><b>X: </b><?php echo $json['washing']['washx']; ?></font></td>
<td><font size=1><b>Y: </b><?php echo $json['washing']['washy']; ?></font></td>
<td><font size=1><b>Z: </b><?php echo $json['washing']['washz']; ?></font></td>
<td><font size=1><b>Linear actuator 1: </b><?php echo $json['washing']['washlaz']; ?></font></td>
<td><font size=1><b>Syringe pump flow rate during wash:</b> <?php echo $json['washing']['syringepumpflorate']; ?></font></td>
<td><font size=1><?php echo " <input type=submit name=washingedit class='blue' value=Edit>"; ?></font></td>
</tr></table>
<?php } ?>
<?php if ($json['washing']['edit'] == "1"){ ?>
<table border=1 cellpadding=5><tr>
<td><font size=1><b>X: </b><input type=text name=washingeditx class="txt" value="<?php echo $json['washing']['washx']; ?>" size=4></font></td>
<td><font size=1><b>Y: </b><input type=text name=washingedity class="txt" value="<?php echo $json['washing']['washy']; ?>" size=4></font></td>
<td><font size=1><b>Z: </b><input type=text name=washingeditz class="txt" value="<?php echo $json['washing']['washz']; ?>" size=4></font></td>
<td><font size=1><b>Linear actuator 1: </b><input type=text name=washingeditlaz class="txt" value="<?php echo $json['washing']['washlaz'];?>" size=4></font></td>
<td><font size=1><b>Syringe pump flow rate during wash:</b> <input type=text name=washingeditsyringepumpflorate class="txt" value="<?php echo $json['washing']['syringepumpflorate'];?>" size=4></font></td>
<td><?php echo " <input type=submit class='blue' name=washingedit value=Submit>"; ?></td></tr></table>

<?php } ?>
</form>

<br>

<form action=gui.mod.php method=GET>
<input type=hidden name="act" value="wastesettings">
<input type=hidden name="view" value="F">
<?php if ($json['washing']['wasteedit'] == "0"){ ?>
<font size=1><b>Waste position: </b></font>
<table cellpadding=5 border=1><tr>
<tr>
<!-- wastex":"131","wastey":"56.5","wastez":"79","wastelazpos" -->
<td><font size=1> <b>Position X:</b><?php echo $json['washing']['wastex']; ?></b></font></td>
<td><font size=1><b> Y:</b><?php echo $json['washing']['wastey']; ?></b></font></td>
<td><font size=1><b> Z:</b> <?php echo $json['washing']['wastez']; ?></font></td>
<td><font size=1><b> Linear actuator 1:</b> <?php echo $json['washing']['wastelazpos']; ?></font></td>
<td><font size=1><input type=submit name=washsub class="blue" value="Edit"></font></td>
</td></tr>
</table>
<?php } if ($json['washing']['wasteedit'] == "1"){ ?>
<table cellpadding=5><tr>
<tr><td><input type=submit name=washsub class="blue" value="Waste Position Settings"></td><td></td></tr>
<tr><td><font size=1><b>X:</b><input type=text name="wastex" value="<?php echo $json['washing']['wastex']; ?>" size=6></b></font></td>
<td><font size=1><b>Y:</b><input type=text name="wastey" value="<?php echo $json['washing']['wastey']; ?>" size=6></b></font></td>
<td><font size=1><b>Z:</b> <input type=text name="wastez" value="<?php echo $json['washing']['wastez']; ?>" size=6></font></td>
<td><font size=1><b>Linear actuator 1:</b> <input type=text name="wastelazpos" value="<?php echo $json['washing']['wastelazpos']; ?>" size=6></font></td>
</tr></table>
<?php } ?>
</form>
<br><br>


<form action=gui.mod.php method=GET>
<input type=hidden name="act" value="drypadsettings">
<input type=hidden name="view" value="F">
<?php if ($json['washing']['tdryedit'] == "0"){ ?>
<font size=1><b>Dry pad position: </b></font>
<table cellpadding=5 border=1><tr>
<td><font size=1> <b>Position X:</b><?php echo $json['washing']['tdryxpos']; ?></b></font></td>
<td><font size=1><b> Y:</b><?php echo $json['washing']['tdryypos']; ?></b></font></td>
<td><font size=1><b> Z:</b> <?php echo $json['washing']['tdryzpos']; ?></font></td>
<td><font size=1><b> Linear actuator 1:</b> <?php echo $json['washing']['tdrylazpos']; ?></font></td>
<td><font size=1><input type=submit name=washsub class="blue" value="Edit"></font></td>
</td></tr>
</table>
<br>
<table><tr><td>
<table cellpadding=5 border=1><tr>
<td><font size=1><b>Dimension X:</b><?php echo $json['washing']['tdryxdim']; ?></b></font></td>
<td><font size=1><b> Y:</b><?php echo $json['washing']['tdryydim']; ?></b></font></td>
</tr></table>
</td><td>
<table cellpadding=5 border=1><tr>
<td><font size=1><b>Total touch dry positions: </b><?php echo count($json['washing']['tdrypositions']); ?></font></td>
<td><font size=1><b>Current position: </b><?php echo $json['washing']['tdrycurrpos']; ?>
 <input type=submit name=washsub class="blue" value="Reset"></font>
</td>
</tr></table>
</td></tr></table>
<?php } ?>
<?php
if ($json['washing']['tdryedit'] == "1"){
?>
<table cellpadding=5><tr>
<tr><td><input type=submit name=washsub class="blue" value="Adjust TouchDry Settings"></td><td></td></tr>
<tr><td><b>X position :</b><input type=text name="tdryxpos" value="<?php echo $json['washing']['tdryxpos']; ?>" size=6></b></td>
<td><b>X dimension:</b><input type=text name="tdryxdim" value="<?php echo $json['washing']['tdryxdim']; ?>" size=6></b></td>
</tr><tr>
<td><b>Y position:</b><input type=text name="tdryypos" value="<?php echo $json['washing']['tdryypos']; ?>" size=6></b></td>
<td><b>Y dimension:</b><input type=text name="tdryydim" value="<?php echo $json['washing']['tdryydim']; ?>" size=6></b></td>
</tr><tr>
<td><b>Z position:</b> <input type=text name="tdryzpos" value="<?php echo $json['washing']['tdryzpos']; ?>" size=6></td><td></td>
<td><b>Linear actuator 1 position:</b> <input type=text name="tdrylazpos" value="<?php echo $json['washing']['tdrylazpos']; ?>" size=6></td><td></td>
</tr><tr>
<td>Total touch dry positions: <?php echo count($json['washing']['tdrypositions']); ?></td>
<td>Current position: <?php echo $json['washing']['tdrycurrpos']; ?></td>
</tr></table>
<?php } ?>
</form>
<br>
</fieldset><p>
</div>





<!-- Case Workplate -->
<div class="codeC">
<b>Workplate</b>
<br><br>
<fieldset><legend><b>Target Layout</b></legend>
<form action=gui.mod.php method=POST>
<input type=hidden name="act" value="Workplate">
<input type=hidden name="view" value="C">
<br><br>
<table cellpadding=10><tr><td valign=top><font size=1>
<input type=submit name='worksubval' class="blue" value='Submit Workplate Variables'>
<br><br>
<fieldset><legend><b>Dimension</b></legend>
<b>X:</b> <input type=text name='tarxdim' class="txt" value="<?php echo $json['workplate']['tarxdim']; ?>" size="5">
<b>Y:</b> <input type=text name='tarydim' class="txt" value="<?php echo $json['workplate']['tarydim']; ?>" size="5">
</fieldset><br>
<fieldset><legend><b>Spacing</b></legend>
<b>Row:</b> <input type=text name='tarrowsp' class="txt" value="<?php echo $json['workplate']['rowsp']; ?>" size="3">
<b>Col:</b> <input type=text name='tarcolsp' class="txt" value="<?php echo $json['workplate']['colsp']; ?>" size="3">
</fieldset><br>
<br>
<?php if ($json['positioningmode'] == "imaging"){ ?>
<fieldset><legend><b>Imaging Z Position</b></legend>
<b>Z bed:</b> <input type=text name='imagingz' class="txt" value="<?php echo $json['workplate']['imagingz']; ?>" size="5">
<b>Z lac:</b> <input type=text name='imaginglacz' class="txt" value="<?php echo $json['workplate']['imaginglacz']; ?>" size="5">
<br><b>Z across targets:</b> <input type=text name='imagingzacrosstargets' class="txt" value="<?php echo $json['workplate']['imagingzacrosstargets']; ?>" size="5">
<br><b>Z lac across targets:</b> <input type=text name='imagingzlacacrosstargets' class="txt" value="<?php echo $json['workplate']['imagingzlacacrosstargets']; ?>" size="5">
</b>
</fieldset>
<?php } ?>
<?php if ($json['positioningmode'] == "spotting"){ ?>
<fieldset><legend><b>Spotting Z Position</b></legend>
<b>Z bed:</b> <input type=text name='spottingz' class="txt" value="<?php echo $json['workplate']['spottingz']; ?>" size="5">
<b>Z lac:</b> <input type=text name='spottinglacz' class="txt" value="<?php echo $json['workplate']['spottinglacz']; ?>" size="5">
<br><b>Z across targets:</b> <input type=text name='spottingzacrosstargets' class="txt" value="<?php echo $json['workplate']['spottingzacrosstargets']; ?>" size="5">
<br><b>Z lac across targets:</b> <input type=text name='spottingzlacacrosstargets' class="txt" value="<?php echo $json['workplate']['spottingzlacacrosstargets']; ?>" size="5">
<br><b>Z across spotting position:</b> <input type=text name='spottingzacrossspottingposition' class="txt" value="<?php echo $json['workplate']['spottingzacrossspottingposition']; ?>" size="5">
<br><b>Z lac across spotting position:</b> <input type=text name='spottingzlacacrossspottingposition' class="txt" value="<?php echo $json['workplate']['spottingzlacacrossspottingposition']; ?>" size="5">
</b>
</fieldset>
<?php } ?>





<div align=center></font>
</td><td>
<br><b> Positioning scheme: <u><?php echo $json['positioningscheme']; ?></u></b>
<ul>
<?php if ($json['positioningscheme'] == 'imaging') { ?>
<font size=2>Targeting is based on locating position of first spotting target: row 1 and column 1</font>
<?php } else { ?>
<font size=2>Targeting is based on locating the top left corner of the target</font>
<?php } ?>
</ul>
<br><br>

<table border=1><tr>
<?php 
for($i=0;$i<10;$i++){ 
if ($i < 5){ $val = "1_".($i+1); } 
else { $val = "2_".($i+1-5); } ?>
<td width=80 height=80><div align=center valign=center>
<font size=2>
<?php echo ($i+1); ?><br>
<?php if ($json['positioningscheme'] == 'imaging') { ?>
<b>X:</b><input type=text name='tarxposwell<?php echo $i; ?>' class="txt" value="<?php echo $json['workplate']['tarxposwell'][$i]; ?>" size="5"><br>
<b>Y:</b><input type=text name='taryposwell<?php echo $i; ?>' class="txt" value="<?php echo $json['workplate']['taryposwell'][$i]; ?>" size="5"><br>
<?php } else { ?>
<b>X:</b><input type=text name='tarxpos<?php echo $i; ?>' class="txt" value="<?php echo $json['workplate']['tarxpos'][$i]; ?>" size="5"><br>
<b>Y:</b><input type=text name='tarypos<?php echo $i; ?>' class="txt" value="<?php echo $json['workplate']['tarypos'][$i]; ?>" size="5"><br>
<?php } ?>
Enable
<input type=checkbox name=enabletar[] value=<?php echo $val;?> 
<?php 
if (strlen(array_search($val, $json['workplate']['enabletar'])) > 0){echo "checked"; } ?>>
<br><input type=radio name="<?php echo $val; ?>" value="A"
<?php if ('A' == $json['workplate']['arraytype'][$i]){echo "checked"; } ?>>
A<br><input type=radio name="<?php echo $val; ?>" value="B"
<?php if ('B' == $json['workplate']['arraytype'][$i]){echo "checked"; } ?>>
B</font> 
</div></td>
<?php if ($i == 4){ echo "</tr><tr>"; } ?>
<?php } ?>
</tr>
</table></div>
</td></tr>
</table>
</fieldset><p>


<?php for($i=0;$i<count($json['workplate']['targettype']);$i++){ ?>
<fieldset><legend><b>Target Type: <?php echo $json['workplate']['targettype'][$i]['tartypename']; ?></b>
<b>Left Margin:</b> <input type=text class="txt" name="leftmargin<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['leftmargin']; ?>" size=4>
<b>Top Margin:</b> <input type=text class="txt" name="topmargin<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['topmargin']; ?>" size=4>
</legend>

<table cellpadding=10 border=1>
<tr align=center>
<td></td><td>Rows</td><td>Row<br>Spacing (mm)</td><td>Column</td><td>Column<br>Spacing (mm)</td></tr>
<tr align=center>
<td>Block</td>
<td><input type=text class="txt" name="blockrow<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['blockrow']; ?>" size=4></td>
<td><input type=text class="txt" name="blockrowsp<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['blockcol']; ?>" size=4></td>
<td><input type=text class="txt" name="blockcol<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['blockrowsp']; ?>" size=4></td>
<td><input type=text class="txt" name="blockcolsp<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['blockcolsp']; ?>" size=4></td>
</tr>
<tr align=center>
<td>Spot</td>
<td><input type=text class="txt" name="spotrow<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['spotrow']; ?>" size=4></td>
<td><input type=text class="txt" name="spotrowsp<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['spotrowsp']; ?>" size=4></td>
<td><input type=text class="txt" name="spotcol<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['spotcol']; ?>" size=4></td>
<td><input type=text class="txt" name="spotcolsp<?php echo $i; ?>" value="<?php echo $json['workplate']['targettype'][$i]['spotcolsp']; ?>" size=4></td>
</tr>
</table>






</fieldset><p>
<?php } ?>



<br>
<br><br>
<br>
<br>
</form>
</div>














<!-- Case Live Image -->
<div class="codeB">
<br><br>
<div align=center>
<table><tr><td>
<?php
/*
http://99.117.118.141:9000/?action=stream
http://99.117.118.141:8000/?action=stream
http://99.117.118.141:10000/?action=stream
*/
?>



<?php  
if ($json['headcamon'] == 1){
  if ($json['local'] == "1"){
   echo '<img alt="" src="http://'.$json['servers']['webheadcampi'].':8080/?action=stream" width="'.(288*2).'" height="'.(216*2).'" />';
   echo '<img alt="" src="http://192.168.1.69:8080/?action=stream" width="'.(288*2).'" height="'.(216*2).'" />';
  }
  else {
   echo '<img alt="" src="http://'.$json['url'].':8080/?action=stream" width="'.(288*2).'" height="'.(216*2).'" />';
  }
 } 
?>



</td><td>
<?php
if ($json['strobcamon'] == 1){
  if ($json['local'] == "1"){
   echo '<img alt="" src="http://'.$json['servers']['piezostrobpi'].':8080/?action=stream" width="288" height="216" />';
  }
  else {
   echo '<img alt="" src="http://'.$json['url'].':9000/?action=stream" width="288" height="216" />';
  }
 } 
?>
</td></tr></table>
</div>
</div>


<!-- Case Point -->
<div class="codeJ">
<b>
Stroboscope Images

<?php
$pdir = $json['strobimages']['path'];
echo '<br><font size=1>Current directory: '.$pdir.'</font><br>';
echo '<font size=1>Image: '.$json['strobimages']['currimage'].'</font><br>';
if (strlen($pdir) > 2){
 $pdir = $pdir.'/';
}
else {
 $pdir = '';
}
$dir  = './'.$pdir;
?>
</b><table><tr><td>
<?php include('strob.img.inc.php'); ?>
</td><td valign=top>
<form action=gui.mod.php method=POST>
<?php echo '<br><font size=1>Current directory: '.$pdir.'</font><br><br>'; ?>
<input type=hidden name="view" value="J">
<input type=hidden name="act" value="Delstrobimages">
<input type=submit class="blue" name='subval' value='Delete Selected Images'>
<input type=submit class="blue" name='subval' value='Delete All Images'>
<br><br>
<table cellpadding=5><tr valign=top>
<?php
$files1 = scandir($dir);
$ct = 0;
for ($i=0;$i<count($files1);$i++){
  if (preg_match('/^\d.*jpg/', $files1[$i])){
   $ct = $ct + 1;
   echo '<td valign=top><font size=1><input type=checkbox name=imgary[] value="'.$files1[$i].'"><a href=strobsettings.php?setfile='.$files1[$i].'&view=J>'.$files1[$i].'</a></font></td>';
   //echo '<td valign=top><font size=1><input type=checkbox name=imgary[] value="'.$files1[$i].'"><a href=./strobimages/'.$files1[$i].'>'.$files1[$i].'</a></font></td>';
   if ($ct == 2){
 	echo '</tr><tr>';
	$ct = 0;
    }
  }
}
?>
</table>
</td></tr></table>
</form>
</td></tr></table>
</div>














<!-- Case Point -->
<div class="codeA">
Images

<table><tr>
<td valign=top>
<?php
$pdir = $json['gcodefile']['path'];
echo '<br><font size=1>Current directory: '.$pdir.'</font><br>';
if (strlen($pdir) > 2){
 $pdir = $pdir.'/';
}
else {
 $pdir = '';
}
$dir  = './'.$pdir;
if (file_exists($dir.$json['positions']['file'])){
//echo <img  src='Images/image.png?" . filemtime('Images/image.png') . "'  />";
//$file = $dir.$json['positions']['file'];
//$file = $file.'?'.filemtime($file);
//echo 'This is a test<br>';
//echo $file.'<br>';
//echo '<img src='.$file.'>';
//echo 'loadcoords: '.$loadcoords.'<br>';
if (($loadcoords == 0) or ($loadcoordsfindfeatures==1)){
 $file = $dir.$json['positions']['file'];
}
else {
 $file = $json['positions']['file'];
}

$file = $file.'?'.filemtime($file);

echo $file.'<br>';


$ex = $json['grid']['ex'];
$ey = $json['grid']['ey'];
$bx = $json['grid']['bx'];
$by = $json['grid']['by'];

?>
<br>
<?php include("img.processing.mod.inc.php"); ?></td>
<?php } ?>
<td valign=top>
<!--
<form target="_new" action="embedcoordslist.php" method="POST">
<input type=submit class="blue" name='subval' value='Quantify Target Positions'>
</form>
-->
<form action=gui.mod.php method=POST>
<input type=hidden name="view" value="A">
<input type=hidden name="act" value="Delimages">
<input type=submit class="blue" name='subval' value='Delete Selected Images'>
<input type=submit class="blue" name='subval' value='Delete All Images'>
<table cellpadding=5><tr valign=top>
<?php
$files1 = scandir($dir);
$ct = 0;
for ($i=0;$i<count($files1);$i++){
  if (preg_match('/^\d.*jpg/', $files1[$i])){
   $ct = $ct + 1;
   echo '<td valign=top><font size=1><input type=checkbox name=imgary[] value="'.$files1[$i].'"><a href=gui.mod.php?file='.$files1[$i].'&view=A>'.$files1[$i].'</a></font></td>';
   if ($ct == 5){
 	echo '</tr><tr>';
	$ct = 0;
    }
  }
}
?>
</table>
</form>
</td></tr></table>
</div>







<!-- HERE IS THE JAVASCRIPT FOR THE WINDOWS VIEW -->



<script>
// JavaScript Document
$(document).ready(function(){
<?php 
$vw = array('A', 'B', 'C', 'D', 'E', 'F','G','H','I','J','K','L','M');
for($i=0;$i<count($vw);$i++){
 if ($vw[$i] == $json['view']){
	echo '$("div.code'.$vw[$i].'").show();';
 }
 else {
	echo '$("div.code'.$vw[$i].'").hide();';
 }
?>
$("div.error").hide();
<?php } ?>

<?php
$vw = array('A', 'B', 'C', 'D', 'E', 'F','G','H','I','J','K','L','M');
for($i=0;$i<count($vw);$i++){
  echo '$("input.codeButton'.$vw[$i].'").click(function(){';
for($j=0;$j<count($vw);$j++){
 if ($vw[$i] == $vw[$j]){
        echo '$("div.code'.$vw[$j].'").toggle();';
 }
 else {
        echo '$("div.code'.$vw[$j].'").hide();';
 }
}
  echo '});';
}
?>
});
</script>


