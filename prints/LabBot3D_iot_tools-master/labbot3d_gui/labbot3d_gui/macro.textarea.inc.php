<?
 $jsontasker3 = openjson('taskjob3');
 $gcode =  $jsontasker3['data'][($jsontasker3['track'])];
?>
<? if(isset($_POST['deletemacro'])){
 $trackfile = $_POST['trackfile'];
 //echo 'trackfile '.$trackfile.'<br>';
 echo $jsontasker3['filename'][$_POST['trackfile']].' deleted<br>';
 unset($jsontasker3['filename'][$_POST['trackfile']]);
 unset($jsontasker3['data'][$_POST['trackfile']]);
}
?>
<? if(isset($_POST['savemacrofile'])){
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
?>
<form action=<?=$_SERVER['PHP_SELF']?> method=post>
<?
 echo "<br>";
?>

<textarea name="macrofiledata" rows="8" cols="40">
 <?
 foreach($gcode as $gg){
  $gg = preg_replace("/\r|\n/", "", $gg);
  $gg= preg_replace("/^\s+/","",$gg);
  echo preg_replace("/'/","",$gg).'&#013;&#010';
 }
 ?>
</textarea>

<br>
<p><input type=text name=macrofile value="<?=$jsontasker3['filename'][$jsontasker3['track']]?>" size=14 style="text-align:right;">
<input type=hidden name=trackfile value=<?=$jsontasker3['track']?>>
<input type=submit name=savemacrofile value="Save macro">
<input type=submit name=deletemacro value="Delete macro">
</p>
<input type=submit name=runmacrofile value="Run macro">
</form>






<?  closejson($jsontasker3,'taskjob3'); ?>

