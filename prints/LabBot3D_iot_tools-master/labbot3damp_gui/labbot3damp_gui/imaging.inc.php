<style>
.rotateimg180 {
  -webkit-transform:rotate(180deg);
  -moz-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  -o-transform: rotate(180deg);
  transform: rotate(180deg);
}
</style>
<? $jsonimaging = json_decode(file_get_contents('imaging.json'), true);?>
<div class="col span_7_of_12" style="background-color:white;text-align:left;">
<? if ($jsonimaging['imagestreamon'] == 1)
{
echo "<font size=1>IP: ".$jsonimaging['imaging']." Port: ".$jsonimaging['imagingport']."</font><br>";
?>
<img src=http://<?=$jsonimaging['imaging']?>:<?=$jsonimaging['imagingport']?>/stream.mjpg <?if ($jsonimaging['rotate'] == "yes") { ?>class="rotateimg180<?}?>" width=<?=$jsonimaging['imagingwidth']?> height=<?=$jsonimaging['imagingheight']?>>
<? } ?>
<br>
<font size=1><?=$jsonimaging['lastimg']?></font><br>
<img src=<?=$jsonimaging['lastimg']?>>
</div>

<div class="col span_4_of_12"  style="background-color:white;text-align:left;">
<? 
	
if (isset($_POST['selectimg'])){
 $jsonimaging['lastimg'] = 'imaging/'.$jsonimaging['selectedfolder'].'/'.$_POST['imgfl'];
 $_SESSION['labbot3d']['lastimg'] = $jsonimaging['lastimg'];
 closejson($jsonimaging,'imaging.json');
 $jsonimaging = json_decode(file_get_contents('imaging.json'), true);
}

if (isset($_POST['imagestreamon'])){
 $jsonimaging['imagestreamon'] = 1;
 publish_message('webstream start', 'labbot3dcam', $jsonimaging['imaging'], 1883, 5);
 closejson($jsonimaging,'imaging.json');
 echo "<meta http-equiv='refresh' content='0'>";
}
if (isset($_POST['imagestreamoff'])){
 $jsonimaging['imagestreamon'] = 0;
 $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);
 publish_message('webstream stop', 'labbot3dcam', $jsonimaging['imaging'], 1883, 5);
 closejson($jsonimaging,'imaging.json');
 echo "<meta http-equiv='refresh' content='0'>";
}
if (isset($_POST['savecurrentimg'])){
 //publish_message('grabframe', 'labbot3d_1_control', 'localhost', 1883, 5);
 $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);
 publish_message('grabframe', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
 //$cmd = "sudo wget http://".$jsonimaging['imaging'].":".$jsonimaging['port']. -O "image.jpg";
}
if (isset($_POST['saveimgprefix'])){
 $jsonimaging['imgprefix'] = $_POST['imgprefix'];
 closejson($jsonimaging,'imaging.json');
 echo "<meta http-equiv='refresh' content='0'>";
}

if (isset($_POST['imagesettings'])){
 if (isset($_POST['rotateimg'])){
  $jsonimaging['rotate'] = $_POST['rotateimg'];
 } else {
  $jsonimaging['rotate'] = "no";
 }
 $jsonimaging['imaging'] = $_POST['imgip'];
 $jsonimaging['imagingport'] = $_POST['imgipport'];
 $jsonimaging['imagingwidth'] = $_POST['imgwidth'];
 $jsonimaging['imagingheight'] = $_POST['imgheight'];
 closejson($jsonimaging,'imaging.json');
 echo "<meta http-equiv='refresh' content='0'>";
}
if (isset($_POST['createnewfolder'])){
 if(strlen($_POST['newfolder'])>0){
  echo "here is the new folder: ".$_POST['newfolder']." <br>";
  $dir =scandir("imaging"); 
  $ct = 0;
  foreach($dir as $dd){
   if ($_POST['newfolder'] == $dd){
     $ct = 1;
   }
  }
  if($ct == 1){
     echo "<b><font color=red>There is already a folder with this name</font></b><br>";
  } else {
   mkdir('imaging/'.$_POST['newfolder'], 0777, true);
  } 
 }
}
if (isset($_GET['delete'])){
 //rename("imaging/".$_POST['imgdir'], "imagingtrash/".$_POST['imgdir']);
 //rmdir('imaging/'.$_GET['delete']);
 system('rm -rf /var/www/html/labbot3damp_gui/imaging/'.$_GET['delete']);
 $dir =scandir("imaging");
 array_shift($dir);
 array_shift($dir);
 //echo count($dir).'<br>'; 
 if (count($dir)>0){
  $jsonimaging['selectimgfolder'] = $dir[0];
 }
 echo $dir[0].'<br>';
 closejson($jsonimaging,'imaging.json');
}
if (isset($_POST['selectimgfolder'])){
 $jsonimaging['selectedfolder'] = $_POST['imgdir'];
 closejson($jsonimaging,'imaging.json');
 echo "<meta http-equiv='refresh' content='0'>";
}
if (isset($_POST['deleteimgfolder'])){
 //rename("imaging/".$_POST['imgdir'], "imagingtrash/".$_POST['imgdir']);
 ?>
 <u>Are you sure you want to delete this folder?</u><br>
 <font color=red><?=$_POST['imgdir']?> <a href=<?=$_SERVER['PHP_SELF']?>?delete=<?=$_POST['imgdir']?>>Yes</a></font> 
 or <font color=green><a href=<?=$_SERVER['PHP_SELF']?>>No</a>
 <?
}
?>

<form action=<?=$_SERVER['PHP_SELF']?> method=post><font size=2>
IP: <input type=text name=imgip value='<?=$jsonimaging['imaging']?>' size=10><br>
Port: <input type=text name=imgipport value='<?=$jsonimaging['imagingport']?>' size=4><br>
Rotate: 
<input type=checkbox name=rotateimg value="yes" <? if($jsonimaging['rotate'] == "yes"){?>checked<?}?>> Yes<br>
Width: <input type=text name=imgwidth value='<?=$jsonimaging['imagingwidth']?>' size=4><br>
Height: <input type=text name=imgheight value='<?=$jsonimaging['imagingheight']?>' size=4><br>
<?
if($jsonimaging['deletedfolder'] == "no"){
$dir =scandir("imaging"); } else { 
$dir =scandir("imagingtrash");
}
array_shift($dir);
array_shift($dir);
$ss = count($dir);
if ($ss > 6){ $size = 6; } else { $size = $ss; }
?>
<input type=submit name=imagesettings value="Change image settings"><br>
<? if($jsonimaging['imagestreamon']==0) {?>
<input type=submit name=imagestreamon value="Turn on stream">
<?} else {?>
<input type=submit name=imagestreamoff value="Turn off stream">
<?}?>
<br>
<input type=submit name="savecurrentimg" value="Grab webstream frame">
<br>
<br>
<input type=text name=imgprefix value="<?=$jsonimaging['imgprefix']?>" size=6><input type=submit name=saveimgprefix value="Image name prefix"><br>
<br>

<input type=text name=newfolder value="" size=6><input type=submit name=createnewfolder value="Create new folder"><br>
<input type=submit name=selectimgfolder value="Select folder">
<input type=submit name=deleteimgfolder value="Delete folder">
<br>
<br>
View <a href="imaging/<?=$jsonimaging['selectedfolder']?>" target="_new"><?=$jsonimaging['selectedfolder']?></a>
<br>
<select name="imgdir" size=<?=$size?>>
<?
foreach ($dir as $key => &$val) {
 if ($jsonimaging['selectedfolder'] == $val){
  echo '<option value='.$val.' selected>'.$val.'</option>';
 } else {
  echo '<option value='.$val.'>'.$val.'</option>';
 }
}
?>
</select>
<br>
<br>
<input type=submit name=selectimg value="Select Image">
 <a href=analyzedroplet.php target=new>Analyze droplet</a>
<br>
<?
$imgdir =scandir("imaging/".$jsonimaging['selectedfolder']);
array_shift($imgdir);
array_shift($imgdir);
$ss = count($imgdir);
if ($ss > 6){ $size = 6; } else { $size = $ss; }
?>
<? $aa = (preg_split("/\//", $jsonimaging['lastimg'])); 
 $imgg = $aa[count($aa)-1]; 
?><br>
<select name="imgfl" size=<?=$size?>>
<?
foreach ($imgdir as $key => &$val) {
 if ($imgg == $val){
  echo '<option value='.$val.' selected>'.$val.'</option>';
 } else {
  echo '<option value='.$val.'>'.$val.'</option>';
 }
}
?>
</select>

</font>
</form>
</div>
