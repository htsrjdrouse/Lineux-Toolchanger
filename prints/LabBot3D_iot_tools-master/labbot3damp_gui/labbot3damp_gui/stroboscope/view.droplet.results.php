<? include('sessions.php'); ?>
<?
  $productinfo = array(
	"category"=>array("Systems"),
	"title"=>"LabBot3D-Pi stroboscope droplet analyzer results",
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
<li class="breadcrumb-item active">LabBot3D-Pi: Stroboscope image analyzer results viewer</li></ol>
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
<h2><a href=../labbot3d-pi-stroboscope.php>LabBot3D-Pi stroboscope analysis results viewer tool</a></h2>
</div>
</div>
<div class="row">

<? if (!isset($_SESSION['labbot3d']['strobdata']['strobresults'])){  ?>
<div class="col-md-3">

</div>
<div class="col-md-9">
<br>
<h4>Sorry you need to upload an image to calculate data, please go to: <a href=../labbot3d-stroboscope.php>LabBot3D-Pi stroboscope analysis tool</a></h4>

</div>
<? } else { ?>
<div class="col-md-3">
<ul>

<? $strobdata = $_SESSION['labbot3d']['strobdata']; ?>
<br>
<? //var_dump($strobdata);?>
<br>
<br>
&micro;m per pixel <?=$_SESSION['labbot3d']['strobdata']['micronperpixel']?><br>
Box width:  <?=$_SESSION['labbot3d']['strobdata']['exwidth']?> height: <?=$_SESSION['labbot3d']['strobdata']['eyheight']?><br>
Deflection line x: <?=$_SESSION['labbot3d']['strobdata']['deflectxpos']?> y: <?=$_SESSION['labbot3d']['strobdata']['deflectypos']?><br>
Tolerances min diameter: <?=$strobdata['mindiam'];?> max: <?=$strobdata['maxdiam'];?> <br>
Tolerances deflectx: <?= $strobdata['maxdeflectx'];?> <br>
Pixel thresholding: <? if ($strobdata['autothreshold'] == "1"){ ?> Auto  <?} else { ?> <?=$strobdata['userthreshold']?> <? } ?>


<br><br>
<? include('strob.form.inc.php');?>
</ul>
</div>
<div class="col-md-9">
<? sleep(1);?>
<? //$file = 'uploads/'.$filery[0]; ?>
<? $file = $_SESSION['labbot3d']['strobdata']['dir'].$_SESSION['labbot3d']['strobdata']['currimage']; ?>

 <? //echo 'file '.$file.'<br>';?>
<? $json = array('stroboscopedata' => $_SESSION['labbot3d']['strobdata']); ?>

<? //var_dump($json['stroboscopedata']); ?>
 </font>
<?// var_dump($_SESSION['labbot3d']['strobdata']['strobresults']); ?>
 <br>

  <?//$dropcalc = $_SESSION['labbot3d']['strobdata']['strobresults']['dataset'][0]['dropcalc']['drops'];?>
  <table cellpadding=5><tr align=center>
   <th>Drop</th>
   <th>Signal</th>
   <th>Speed</th>
   <th>Volume</th>
   <th>Deflection</th>
   </tr> 
  <? foreach($_SESSION['labbot3d']['strobdata']['strobresults']['dataset'][0]['dropraw'] as $ss) { ?>
     <tr align=center>
     <td><?=$ss['drops']?></td>
     <td><?=round($ss['signal'],2)?></td>
     <td><?=round($ss['speed'],2)?></td>
     <td><?=round($ss['volume'],2)?></td>
     <td><?=round($ss['deflection'],2)?></td>
     </tr>
  <? } ?>
   </table><br>
<? include('post.strob.analysis.php');?>
</div>
<? } ?>


</div>


<? include('../../tail.inc.php');?>



