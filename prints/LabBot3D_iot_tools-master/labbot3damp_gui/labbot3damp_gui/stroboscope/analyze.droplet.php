<? include('sessions.php'); ?>
<?
$strobdata = array(
                 "autothreshold"=> "1",
		 "userthreshold"=>"110",
		 "micronperpixel"=> "8.04",
		 "mindiam"=> "6",
		 "maxdiam"=> "30",
		 "exwidth"=> "175",
		 "eyheight"=>"200",
		 "deflectxpos"=> "400",
		 "bx"=> "320",
		 "by"=> "89",
 		 "dir"=>"uploads/",
		 "maxdeflectx"=>"100",
		 "deflectypos"=> "36"
		 );
 if(!isset($_SESSION['labbot3d']['strobdata'])) {
  $_SESSION['labbot3d']['strobdata'] = $strobdata;
 } else {
  $strobdata = $_SESSION['labbot3d']['strobdata'];
 } 
?>
<?
  $productinfo = array(
	"category"=>array("Systems"),
	"title"=>"LabBot3D-Pi stroboscope droplet analyzer",
	"Structural"=>$bgt.$Structural.$egt,
	"Motion"=>$bgt.$Motion.$egt,
	"Electronics"=>$bgt.$Electronics,
	"Dispensing"=>$bgt.$Dispensing.$egt,
	"Microfluidics"=>$bgt.$Microfluidics.$egt,
	"Imaging"=>$bgt.$Imaging.$egt
   );
$productinfo =array(
 'metadesc'=>'
       This is an image analysis program that quantifies droplets emitted from a piezoelectric dispenser.
	This works with LabBot3D-Pi a 3D printer designed to do liquid handling for diverse forms of laboratory automation that also includes and imaging applications. 


',
 'metaauth'=>'HTS Resources, Richard Rouse',
 'metakey'=>'Biotechnology, 3D printer, Bioprinting, 3D modeling, Arduino, Raspberry pi, python sockets, nano-plotter, piezoelectric, inkjet, microarray, non-contact spotting','flow cell', 'PDMS', 'microscope perfusion chamber', 'microscope slide','microelectrode array','perfusion chamber','hydrogel microliter valves','3d printer', 'reprap', 'bioprinter', 'ELISA plate reader', 'image processing', 'chart fitting', 'trendline', 'biostatistics','stroboscope', 'droplet analyzer', 'liquid biopsy'
);
?>
    <meta name="description" content="<?=$productinfo['metadesc']?>">
    <meta name="author" content="<?=$productinfo['metaaut']?>">
    <meta name="keywords" content="<?=$productinfo['metakey']?>">


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>
	Stroboscopic analysis using the LabBot3D-Pi vision system 
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?=$productinfo['metadesc']?>">
    <meta name="author" content="<?=$productinfo['metaaut']?>">
    <meta name="keywords" content="<?=$productinfo['metakey']?>">
        <link rel="shortcut icon" href="/images/favicon.ico">
    <!-- Le styles -->
    <link href="/assets.4.0/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="/dist.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="/carousel.css" rel="stylesheet">
    <link href="/starter-template.css" rel="stylesheet">
   <link rel="stylesheet" href="/dist/font-awesome-4.7.0/css/font-awesome.min.css">



  </head>

<body>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38652726-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>



  <?php include('bbb.nav.top.inc.php'); ?>


<div class="row">
 <div class="col-md-4">
  <ul><a href=/index.php><img src=/images/array_image.png height=100 width=200></a><br><br></ul>
 </div>

 <div class="col-md-4">   
 <ol class="breadcrumb">
  <!--<li class="breadcrumb-item"><a href=/microcontact_masters/nanoplotter_picoliter_liquid_handling_platform.php>Microcontact and UV-NIL fabrication platforms</a></li>-->
<li class="breadcrumb-item active">LabBot3D-Pi: Stroboscope image analyzer</li></ol>
 </div>

<? 
$totalcost = 0;
$items = 0;
$totalcost = 0;
for ($i=0;$i<count($_SESSION['product']);$i++){
 $items = $items + $_SESSION['product'][$i]['units'];
 $totalcost = $totalcost + ($productinfo['tax'] * $_SESSION['product'][$i]['price'])+$_SESSION['product'][$i]['price'];
}
 if (count($_SESSION['product'])){
  $uq = array_unique($_SESSION['product']);
  $uqli = array();
  $sum = 0;
  $totunits = 0;
  $items = 0;
  $totalcost = 0;
  foreach($uq as $vv){
   $units = $uq['units'];
   foreach($_SESSION['product'] as $val){ 
    $sum = $sum + $val['price'];
    if ($vv['productid'] == $val['productid']){
     $units = $units + $val['units'];
    }
   }
    $totunits = $totunits + $units;
    $aar = array(
     'units'=>$units,
     'productid'=>$val['productid'],
     'price'=>$val['price'],
     'manufacturer'=>$val['manufacturer'],
    );
    array_push($uqli,$aar);
  }
  $items = $totunits;
  $totalcost = $sum;
  //echo $totunits.'<br>';
  //echo $sum.'<br>';
 $tax = 0.0775;
 $caltax =round(($totalcost*$tax)+$totalcost,2);
 }
?>
<div class="col-md-4">
<br><? //var_dump($_SESSION['product']); ?>
<br>
<form action=/shopping.cart.php class="form-search" method=post>
 <button type="submit" class="btn btn-success" name="sendit">
 <i class="fa fa-shopping-cart" aria-hidden="true"></i>
 <?=count($_SESSION['product'])?> item(s) = $<?=round($caltax,2)?></button>
</form>
</div>

</div>
<div class="row">
<div class="col-md-2">
 <?php include('imaging.navlist.inc.php'); ?>
</div>
<div class="col-md-6">
<h2><a href=../labbot3d-pi-stroboscope.php>LabBot3D-Pi stroboscope analysis tool</a></h2>

<? if (isset($_GET['adjust'])){
   $file = $_SESSION['labbot3d']['strobdata']['dir'].$_SESSION['labbot3d']['strobdata']['currimage']; 
  if (isset($_SESSION['labbot3d']['strobdata']['currimage'])){ 
   $file = $_SESSION['labbot3d']['strobdata']['dir'].$_SESSION['labbot3d']['strobdata']['currimage']; 
   $json = array('stroboscopedata' => $_SESSION['labbot3d']['strobdata']); 
  }
} else  {
extract($_POST);
$timestamp = time();
$files1 = scandir('uploads/');
foreach($files1 as $aa){
 if (strlen($aa) > 2){
  unlink('uploads/'.$aa) or die("Couldn't delete file");
 }
}
$error=array();
$extension=array("jpeg","jpg","png","gif");
$filery = array();
if (count($_FILES["files"]["tmp_name"]) > 1){
 echo "Sorry you can only upload up to 1 images<br>Please contact HTS Resources if you want to adapt this tool<br>info@htsresources.com";
} else {
$sss = "";
foreach($_FILES["files"]["tmp_name"] as $key=>$tmp_name) {
    $file_name=$_FILES["files"]["name"][$key];
    $file_tmp=$_FILES["files"]["tmp_name"][$key];
    $ext=pathinfo($file_name,PATHINFO_EXTENSION);
    if(in_array($ext,$extension)) {
        if(!file_exists("uploads/".$txtGalleryName."/".$file_name)) {
            $filename=basename($file_name,$ext);
            $newFileName=$filename."timestamp".$timestamp.".".$ext;
            move_uploaded_file($file_tmp=$_FILES["files"]["tmp_name"][$key],"uploads/".$txtGalleryName."/".$newFileName);
          array_push($filery, $newFileName);   
          $sss = $sss.$newFileName."--htsrimgset--";
        }
    }
    else {
        array_push($error,"$file_name, ");
    }
}
$sss = preg_replace("/--htsrimgset--$/", "", $sss);
?>
<? $_SESSION['labbot3d']['strobdata']['currimage'] = $filery[0]; ?>
<? $file = $_SESSION['labbot3d']['strobdata']['dir'].$_SESSION['labbot3d']['strobdata']['currimage']; ?>
<? $json = array('stroboscopedata' => $_SESSION['labbot3d']['strobdata']); ?>
<? } ?>
<? } ?>
</div>
</div>
<div class="row">
<div class="col-md-3">
<ul>
<? include('strob.form.inc.php');?>
</ul>
</div>
<div class="col-md-9">
<? sleep(1);?>
<? //$file = 'uploads/'.$filery[0]; ?>

<? //var_dump($json['stroboscopedata']); ?>
<? include('pre.strob.analysis.php');?>
</div>
</div>


<? include('../../tail.inc.php');?>



