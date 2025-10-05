<html>
<head>
<link rel="stylesheet" href="/style.css">
<style>
div.static {
    position: static;
    border: 3px solid #73AD21;
}
div.rightmodlist {
    position: absolute;
    top: 80px;
    right: 220;
    width: 400px;
    height: 100px;
    /*border: 3px solid #73AD21;*/
}


</style>
</head>


<body>
<br><br>
<ul><ul>
<?php
//{"M92":"250","speed":"100","extrusionvol":"100","originx":"100","originy":"100","originz":"60","retractionvol":"100"}
$file = $_GET['id'];
echo '<b>The Gcode file: '.$file.'</b><br>';
echo '<br>';
$jsonslicer = json_decode(file_get_contents('jsondata/'.$file.'.json'), true);
$jsongcodesettings = json_decode(file_get_contents('adjustgcode.json'), true);
?>
<br>
<br>
<form action=generate.gcode.php method=POST>
<input type=hidden name=filename value="<?=$file?>">
<br>
<div class="rightmodlist">
<br>
<br>

<? $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);?>


<? $jsonmodule = json_decode(file_get_contents('module.json'), true); ?>
<?
 $jsonmodule['potentialmodules']['filename'] = array();
 $jsonmodule['potentialmodules']['source'] = array();
 foreach ($jsontasker3['filename'] as $key => $value) {
  array_push($jsonmodule['potentialmodules']['filename'], $jsontasker3['filename'][$key]);
  array_push($jsonmodule['potentialmodules']['source'], 'module');
}
 file_put_contents('module.json', json_encode($jsonmodule));
?>

<? $jsonmodule = json_decode(file_get_contents('module.json'), true); ?>



<? if(count($jsonmodule['module']['filename']) > 0){ ?>

<?  $jsonerror = json_decode(file_get_contents('slicermodules/error.json'), true);
if (strlen($jsonerror['error']) > 0){
 echo "<br>".$jsonerror['error']."<br>";
}
?>
<input type=submit name=savemdd value="Save module">
<input type=text name=svmodname size=10>
<br><ul><br>
<table cellpadding=2 style="font-family:arial;font-size:12;border: 1px solid black;" border=1><tr>
<td><input type=submit name=delmdd value="Delete module"></td>
<td><b>Location</b></td>
<td><b>Filename</b></td>
</tr>
<?  
foreach ($jsonmodule['module']['filename'] as $key => $value) {
 echo '<tr><td align=center><input type=checkbox name=mdd[] value='.$key.'><td align=center>'.$jsonmodule['module']['location'][$key].'</td><td>'.$jsonmodule['module']['filename'][$key].'</td></tr>';
 } ?>
</table></ul><br>
<? } ?>

<br><br>

<?php
    $sfiles = scandir('slicermodules');
?>

<ul>
<?
$ct = 0;
for($i=2;$i<count($sfiles);$i++){
 if (!preg_match('/^.*\.json/', $sfiles[$i])){
   $ct = $ct + 1;
 }
}

if ($ct < 11) {
  $size = $ct;
}
else {
 $size = 10;
}
?>
</ul>
<input type=submit name="runslicerfile" value="Run slicer file">
<input type=submit name="deleteslicerfile" value="Delete slicer file">
<br><br>
<select name="slicerfiles" size=<?=$size?>>  <!-- Note: I've removed the 'multiple' attribute -->
    <?php
    for($i=2;$i<count($sfiles);$i++){
     if (!preg_match('/^.*\.json/', $sfiles[$i])){
      $jsondetails = json_decode(file_get_contents('slicermodules/'.$sfiles[$i].'.json'), true);
      if ($file == $jsondetails['slicerfilename']){
      echo '<option>'.$sfiles[$i].' - '.$jsondetails['slicerfilename'];
      echo ' - '.$jsondetails['layers'];
      $msg = " - ";
      for($j=0;$j<count($jsondetails['module']);$j++){
       $msg = $msg.$jsondetails['module'][$j].'('.$jsondetails['location'][$j].'),';
      }
       $msg = preg_replace('/,$/', '', $msg);
       echo $msg;
      echo '</option>';
     }
     }
    }
    ?>
</select>
</ul>
</div>


<b>Enter layers to print (i.e., 1,2,3,4,5 or 1-5): </b><input type=text name=layernum value="all" size=4><br>

<br>
<? if(($jsonmodule['addmodule'] == 0)){ 
echo '<input type="submit" name="addmodule" value="Add module">';
} ?>
<br>
<br>


<? if((strlen($jsonmodule['error']) > 0) and ($jsonmodule['addmodule'] == 0)){ ?>
 <br><?=$jsonmodule['error'] ?><br>
<? } ?>

<? if(($jsonmodule['addmodule'] > 0)){ ?>
<b>Insert module: </b><select name="printmodules">
<?
foreach ($jsonmodule['potentialmodules']['filename'] as $key => &$val) {
 echo '<option value="'.$val.'">'.$val.'</option>';
}
?>
</select>
<br><b> after lines (i.e, 1,3,5,6): </b><input type=text name="insertmodule" value="" size=4>
 <input type="submit" name="moduleadd" value="Add module">


<br>
<? } ?>
<br>
<input type=submit name=compgcode value="Generate gcode scripts">
</form>
<br>
<br>

<b>Extrusion steps per unit: <?=$jsonslicer['M92'] ?></b>
<br>
<b>Speed (%): <?=$jsonslicer['speed'] ?></b>
<b> Extrusion vol (%): <?=$jsonslicer['extrusionvol'] ?></b>
<b> Retraction vol (%): <?=$jsonslicer['retractionvol'] ?></b>
<br>
<b>Origin X: <?=$jsonslicer['originx']?>
<b> Y: <?=$jsonslicer['originy']?>
<b> Z: <?=$jsongcodesettings['originz']?>
<br>
<br>
Raw Min X: <?=$jsonslicer['minx'] ?> Max X: <?=$jsonslicer['maxx']?> 
<br>
Min Z: <?=$jsonslicer['minz'] ?> Max Z: <?=$jsonslicer['maxz'] ?>
<br>
Repositioned Min X: <?=$jsonslicer['minx'] - $jsonslicer['minx'] + $jsonslicer['originx']?> Max X: <?=$jsonslicer['maxx'] - $jsonslicer['minx'] + $jsonslicer['originx']?> 
<br>
Min Z: <?=$jsongcodesettings['originz']-$jsonslicer['minz']?> Max Z: <?=$jsongcodesettings['originz']-$jsonslicer['maxz']?>
<br>
Raw Min Y: <?=$jsonslicer['miny']?> Max Y: <?=$jsonslicer['maxy']?>
<br>
Repositioned Min Y: <?=$jsonslicer['miny'] - $jsonslicer['miny'] + $jsonslicer['originy']?> Max Y: <?=$jsonslicer['maxy']- $jsonslicer['miny'] + $jsonslicer['originy']?>
<br><br>
<br><br>
<table border=1><tr align=center>
<td><b>Line</b></td>
<td><b>Extrusion<br> microliter</b></td>
<td><b>Time</b></td>
<td><b>Min X</b></td>
<td><b>Max X</b></td>
<td><b>Min Y</b></td>
<td><b>Max Y</b></td>
<td><b>Z</b></td>
</tr>
<?php for($i=0;$i<count($jsonslicer['lineslayer']);$i++){ ?>
<tr>
<td><?=($i+1)?></td>
<td><?=round($jsonslicer['stepvolume'][$i] * ($jsonslicer['M92']/140)*3.3,2)?></td>
<td><?=$jsonslicer['time'][$i]?></td>
<td><?=($jsonslicer['minxry'][$i] - $jsonslicer['minx'] + $jsonslicer['originx'])?></td>
<td><?=$jsonslicer['maxxry'][$i] - $jsonslicer['minx'] + $jsonslicer['originx']?></td>
<td><?=$jsonslicer['minyry'][$i] - $jsonslicer['miny'] + $jsonslicer['originy']?></td>
<td><?=$jsonslicer['maxyry'][$i] - $jsonslicer['miny'] + $jsonslicer['originy']?></td>
<td><?=$jsongcodesettings['originz'] - ($jsonslicer['zry'][$i]-$jsonslicer['minz'])?></td>
</tr>
<?php } ?>
</table>
<br><br>
<br><br>
</ul></ul>
</body>
</html>


