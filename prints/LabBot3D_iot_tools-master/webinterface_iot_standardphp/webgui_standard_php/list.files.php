<br>
<form action=deletegcode.php method=POST>
<!--<input type="submit" name="Run" value="Run">-->
<input type="submit" name="Delete" value="Delete">
<ul><br>
<table>
<?php
$dir    = 'uploads';
$files1 = scandir($dir);
$ct = 0;
for($i=2;$i<count($files1);$i++){
if($ct < 6){
$jsonslicer = json_decode(file_get_contents('jsondata/'.$files1[$i].'.json'), true);
$stpvol = 0;
$tm = 0;
for($j=0;$j<count($jsonslicer['lineslayer']);$j++){
 $stpvol = $stpvol + $jsonslicer['stepvolume'][$j];
 $tm = $tm + $jsonslicer['time'][$j];
}

echo '<label><input type="checkbox" name=checkboxvar[] id="cbox'.$i.'" value="cbox'.$i.'"><a href=details.php?id='.$files1[$i].' target="_blank">'.$files1[$i].'</a></label> -- <b>Layers: '.count($jsonslicer['lineslayer']).'</b>&nbsp; ';


//Step constant @ 140 steps per mm its 3.3 ul per step


echo ' <b>'.round(($stpvol)*($jsonslicer['M92']/140)*3.3*1/1000,2).'ml '.round(($tm/60),2).'minutes</b><br>';
}
else {
$ct = 0;
echo "</td><td>";
}
$ct = $ct + 1;
}
?>
</td>
</table>
</ul>
</form>
