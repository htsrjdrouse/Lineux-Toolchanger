<?php

$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$jsonpython = json_decode(file_get_contents('pythoncode'), true);
echo "Files: <ul>";
for ($i=0;$i<count($jsontasker['filename']);$i++){
 echo '<a href=changegcodefile.php?filename='.$jsontasker['filename'][$i].'>'.$jsontasker['filename'][$i].'</a><br>';
}
echo "</ul>";

$newgfile = $_GET['id'];
$jsonpython['track'] = $_GET['id'];
$json['oldgfile'] = $json['gfile'];
$json['editgcode'] = "0";

$json['gfile'] = $newgfile;
$json['view'] = "E";
file_put_contents($imgdataset, json_encode($json));
file_put_contents('pythoncode', json_encode($jsonpython));
header('Location: gui.mod.php');


?>
