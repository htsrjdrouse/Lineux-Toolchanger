
<html>
<body>

<font face=arial>
<?php

exec('sudo python dataorganizer.py &');
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

?>
<ul>



<table border=1 cellpadding=4><tr>
<td align=center>ROW</td>
<td align=center>COL</td>
<td align=center>RAMP POS</td>
<td align=center>Identified Positions</td>
</tr>

<form target="_blank" action="imageprocessed.alignment.gcode.php" method="POST">
<input type=submit name='gcodesub' value='Generate Gcode'>
<br>
<?php
for($i=0;$i<count($json['imageprocessing']['data']);$i++){
	echo '<tr>';
	echo '<td align=center>'.$json['imageprocessing']['data'][$i]['row'].'</td>';
	echo '<td align=center>'.$json['imageprocessing']['data'][$i]['col'].'</td>';
	$rampx = $json['imageprocessing']['data'][$i]['x'];
	$rampy = $json['imageprocessing']['data'][$i]['y'];
	echo '<td align=center>X:'.$rampx.'<br>Y:'.$rampy.'<br>';
	echo '<a href=/gui.mod/gui.mod.php?file='.$json['imageprocessing']['data'][$i]['file'].'&view=A>'.$json['imageprocessing']['data'][$i]['file'].'</a></td>';
	echo '<td><table>';
	$ct = 0;
	for ($r=0;$r<($json['grid']['ynum']);$r++){
	for ($c=0;$c<($json['grid']['xnum']);$c++){
		$cx = $json['imageprocessing']['data'][$i]['keyimgdata']['cx'][$ct];
		$cy = $json['imageprocessing']['data'][$i]['keyimgdata']['cy'][$ct];
		$imgfile = $json['imageprocessing']['data'][$i]['keyimgdata']['file'][$ct];
 		$pos = poscalc($cx,$cy,$rampx,$rampy);
		echo '<tr><td>'.($ct+1).': X: <input type=text name='.$i.'k'.$r.'r'.$c.'cx value='.$pos[0].' size=5>';
		echo ' Y: <input type=text name='.$i.'k'.$r.'r'.$c.'cy value='.$pos[1].' size=5></td>';
		echo '<td><img src='.$imgfile.'></td></tr>';
		$ct = $ct + 1;
	}
	}
	echo '</table></td>';
	echo '</tr>';
}
?>

</form>
</table>
</ul>
</font>
</body>
</html>

<?php


 function poscalc($cx,$cy,$rampx,$rampy){

 $position = array();
 if ($cx < 160){
   $calcx = $rampx-(((160-$cx)*20)/1000);
  }
  else if ($cx > 160){
   $calcx = ((($cx-160)*20)/1000)+$rampx;
  }
  else {
   $calcx = $rampx;
  }
  if ($cy < 120){
   $calcy = $rampy-(((120-$cy)*20)/1000);
  }
  else if ($cy > 120){
   $calcy = ((($cy-120)*20)/1000)+$rampy;
  }
  else {
   $calcy = $rampy;
  }
 $position[0] = $calcx;
 $position[1] = $calcy;
 return $position;
}














?>

