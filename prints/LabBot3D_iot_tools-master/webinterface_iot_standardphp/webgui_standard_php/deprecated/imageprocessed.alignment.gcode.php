<?php
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

$pppa = 0;
$pa = "$pppa";
$a = $pa.'x';

/*
echo 'M92X99.8Y112.75<br>';
echo 'G28X0Y0<br>';
*/

$ct = 0;
for ($r=0;$r<($json['grid']['ynum']);$r++){
for($i=0;$i<count($json['imageprocessing']['data']);$i++){
  $k = "$i"."k";
  for ($c=0;$c<($json['grid']['xnum']);$c++){
  	$ix = $k."$r"."r"."$c"."cx";
  	$iy = $k."$r"."r"."$c"."cy";
  	$x =  $_POST[$ix];
  	$y = $_POST[$iy];
  	$cmd = 'G1X'.$x.'Y'.$y.'F3000';
  	echo $cmd.'<br>';
  }
}

//echo 'G28X0<br>';
}

?>

