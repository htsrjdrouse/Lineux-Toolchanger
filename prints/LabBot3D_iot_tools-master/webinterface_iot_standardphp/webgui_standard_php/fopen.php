
<html>
<head>
<?php
$imgdataset = './loggerdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$jsonlogdata = json_decode(file_get_contents('./loggerdataset.results'), true);

if ($json['refresh']['active'] == 1) {
 echo '<meta http-equiv="refresh" content="'.$json['refresh']['time'].'">';
}
?>
</head>
<body bgcolor="#000000">
<font face=arial size=1 color=yellow>

<?php



for($i=0;$i<count($json['logs']);$i++){
 $line = $json['logs'][count($json['logs'])-1-$i];
   echo $line;
}

?>

</font>
</body>

</html>
