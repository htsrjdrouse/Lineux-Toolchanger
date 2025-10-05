<div class="col span_7_of_12" style="background-color:white;text-align:left;">
<?
 $jsontasker3 = openjson('taskjob3');
 $gcode =  $jsontasker3['data'][($jsontasker3['track'])];
?>
<? 
/*
 if(isset($_POST['deletemacro'])){
 $trackfile = $_POST['trackfile'];
 echo $jsontasker3['filename'][$_POST['trackfile']].' deleted<br>';
 unset($jsontasker3['filename'][$_POST['trackfile']]);
 unset($jsontasker3['data'][$_POST['trackfile']]);
}
*/
?>
<? 
/*
if(isset($_POST['savemacrofile'])){
 $filename = $_POST['macrofile'];
 $ffl = 0;
 foreach ($jsontasker3['filename'] as $key => &$val) {
  if ($filename == $val){
   $jsontasker3['filename'][$key] = $filename;
   $par = array();
   $tpar = preg_split("/\r\n/", $_POST['macrofiledata']);
   foreach($tpar as $pp){
    array_push($par, preg_replace("/\r$/", "",$pp));
   }
   $jsontasker3['data'][$key] = $par; 
   $ffl = 1;
  }
 }
 if ($ffl == 0){
   array_push($jsontasker3['filename'],$filename);
   $tpar = preg_split("/\r\n/", $_POST['macrofiledata']);
   $par = array();
   foreach($tpar as $pp){
    array_push($par, preg_replace("/\r$/", "",$pp));
   }
   array_push($jsontasker3['data'],$par);
 }
}
*/
?>
<form action=macro.edit.inc.php method=post>
<textarea name="macrofiledata" rows="8" cols="40"><?
 foreach($gcode as $gg){
  $gg = preg_replace("/\r|\n/", "", $gg);
  $gg= preg_replace("/^\s+/","",$gg);
  $gg= preg_replace("/^ /","",$gg);
  echo preg_replace("/'/","",$gg).'&#013;&#010';
 }
?></textarea>
<br>
<?php 
 if (isset($_POST['selectmacro'])){ 
  $jsontasker3['track'] = $_POST['macrofile'];
} ?>
<? if (count($jsontasker3['filename']) > 10){
 $size = 10; } else {
 $size = count($jsontasker3['filename']);
 }
?>

<p><input type=text name=macrofilename value="<?=$jsontasker3['filename'][$jsontasker3['track']]?>" size=14 style="text-align:right;">
<input type=hidden name=trackfile value=<?=$jsontasker3['track']?>>
<input type=submit name=savemacrofile value="Save macro">
<input type=submit name=deletemacro value="Delete macro">
</p>
<input type=submit name=runmacrofile value="Run macro">
</div>
<div class="col span_3_of_12"  style="background-color:white;text-align:left;">
<input type=submit name=selectmacro value="Select macro"><br><br>
<select name="macrofile" size=<?=$size?>>
<?
foreach ($jsontasker3['filename'] as $key => &$val) {
 if($jsontasker3['track'] == $key){
 echo '<option value='.$key.' selected>'.$val.'</option>';
 } else {
 echo '<option value='.$key.'>'.$val.'</option>';
 }
}
?>
</select>
</form>
</div>

