<? include('header.inc.php');?>


<body>
<div class="header">
<h1>Drop analyzer</h1>
</div>
<div class="section group">
<div class="col span_2_of_12" style="background-color:white">
<img src=array_image.png width=140 height=80>
</div>
<div class="section group">
<div class="col span_12_of_12" style="background-color:lightblue">

<? if(!isset($_SESSION['labbot3d']['lastimg'])){
 echo "No image selected<br>";

 } else { 
  $file = $_SESSION['labbot3d']['lastimg'];
  $_SESSION['labbot3d']['strobdata']['currimage'] = $file;
?>
</div>
</div>
<div class="section group">
<div class="col span_3_of_12" style="background-color:white">
<div align=left><font size=2>
<? include('stroboscope/strob.form.inc.php');?>
</font>
</div>
</div>
<div class="col span_9_of_12" style="background-color:white">
<div align=left>
<?=preg_replace("/imaging\//", "",$file)?><br>
<? include('stroboscope/pre.strob.analysis.php')?>
</div>
</div>
</div>
</body>
<? } ?>



