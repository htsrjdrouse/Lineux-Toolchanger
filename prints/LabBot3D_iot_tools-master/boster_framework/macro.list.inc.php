<?php 
  $jsontasker3 = openjson('taskjob3');
 if (isset($_POST['selectmacro'])){ 
  $jsontasker3['track'] = $_POST['macrofile'];
} ?>
<? if (count($jsontasker3['filename']) < 11){
 $size = 10; } else {
 $size = count($jsontasker3['filename']);
 }
?>

<form action=<?=$_SERVER['PHP_SELF']?> method=post>
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
<?  closejson($jsontasker3,'taskjob3');?>

