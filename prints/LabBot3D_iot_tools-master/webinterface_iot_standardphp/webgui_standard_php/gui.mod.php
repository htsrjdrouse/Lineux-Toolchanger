<ul>
<?php include("page.header.inc.php"); ?>
<br><br><?php $xlen = 320; ?><?php $ylen = 240; ?><?php $bimgstack = array(); ?>
<?php $bimgstackx = array(); ?>
<?php $bimgstacky = array(); ?>
<?php $bimgstack[0] = "t.png" ?>
<?php array_push($bimgstackx,'0'); ?>
<?php array_push($bimgstacky,'0'); ?>
<br>
<?php include("imageviewer.process.inc.php"); ?><br>

</html>


