<html>
<head>
<link rel="stylesheet" href="/style.css">
</head>
<body>
<br><br>
<ul><ul>
<?php
//{"M92":"250","speed":"100","extrusionvol":"100","originx":"100","originy":"100","originz":"60","retractionvol":"100"}
$file = $_GET['id'];
echo '<b>Gcode file: '.$file.'</b><br>';
echo '<br>';
$jsonslicer = json_decode(file_get_contents('jsondata/'.$file.'.json'), true);
?>

<form action=generate.gcode.php method=POST>
<input type=hidden name=filename value="<?=$file?>">

<b>Enter layers to print (i.e., 1,2,3,4,5 or 1-5): </b><input type=text name=layernum value="all" size=4><br>
<b>Insert photo scan after lines (i.e, 1,3,5,6): </b><input type=text name="insertphotoscan" value="" size=4><br>
<b>Reload syringe after lines (i.e, 5,8): </b><input type=text name="reloadsyringe" value="" size=4><br>
<br><br>
<input type=submit name="Generate gcode scripts" value="Generate gcode scripts">
</form>


<b>Extrusion steps per unit: <?=$jsonslicer['M92'] ?></b>
<br>
<b>Speed (%): <?=$jsonslicer['speed'] ?></b>
<b> Extrusion vol (%): <?=$jsonslicer['extrusionvol'] ?></b>
<b> Retraction vol (%): <?=$jsonslicer['retractionvol'] ?></b>
<br>
<b>Origin X: <?=$jsonslicer['originx']?>
<b> Y: <?=$jsonslicer['originy']?>
<b> Z: <?=$jsonslicer['originz']?>
<br>
Raw Min X: <?=$jsonslicer['minx'] ?> Max X: <?=$jsonslicer['maxx']?> Min Z: <?=$jsonslicer['minz'] ?> Max Z: <?=$jsonslicer['maxz'] ?>
<br>
Repositioned Min X: <?=$jsonslicer['minx'] - $jsonslicer['minx'] + $jsonslicer['originx']?> Max X: <?=$jsonslicer['maxx'] - $jsonslicer['minx'] + $jsonslicer['originx']?> Min Z: <?=$jsonslicer['originz']-$jsonslicer['minz']?> Max Z: <?=$jsonslicer['originz']-$jsonslicer['maxz']?>
<br>
Raw Min Y: <?=$jsonslicer['miny']?> Max Y: <?=$jsonslicer['maxy']?>
<br>
Repositioned Min Y: <?=$jsonslicer['miny'] - $jsonslicer['miny'] + $jsonslicer['originy']?> Max Y: <?=$jsonslicer['maxy']- $jsonslicer['miny'] + $jsonslicer['originy']?>
<br><br>
<br><br>
<table border=1><tr>
<td>line</td>
<td>Extrusion microliter</td>
<td>time</td>
<td>min X</td>
<td>max X</td>
<td>min Y</td>
<td>max Y</td>
<td>Z</td>
</tr>
<?php for($i=0;$i<count($jsonslicer['lineslayer']);$i++){ ?>
<tr>
<td>line <?=($i+1)?></td>
<td><?=round($jsonslicer['stepvolume'][$i] * ($jsonslicer['M92']/140)*3.3,2)?></td>
<td><?=$jsonslicer['time'][$i]?></td>
<td><?=($jsonslicer['minxry'][$i] - $jsonslicer['minx'] + $jsonslicer['originx'])?></td>
<td><?=$jsonslicer['maxxry'][$i] - $jsonslicer['minx'] + $jsonslicer['originx']?></td>
<td><?=$jsonslicer['minyry'][$i] - $jsonslicer['miny'] + $jsonslicer['originy']?></td>
<td><?=$jsonslicer['maxyry'][$i] - $jsonslicer['miny'] + $jsonslicer['originy']?></td>
<td><?=$jsonslicer['originz'] - ($jsonslicer['zry'][$i]-$jsonslicer['minz'])?></td>
</tr>
<?php } ?>
</table>
<br><br>
<br><br>
</ul></ul>
</body>
</html>


