<?php

$jsongcodemodule = json_decode(file_get_contents('gcode.object.list.json'), true);
file_put_contents('gcode.object.list.json', json_encode($jsongcodemodule));

openfile();
//$fry = openfile();


echo $fry['filename'].'<br>';
/*
$statry = gcodestats($fry);
echo "<br>";
echo "Min xry ".min($statry['xry'])."<br>";
echo "Max xry ".max($statry['xry'])."<br>";
echo "Min yry ".min($statry['yry'])."<br>";
echo "Max yry ".max($statry['yry'])."<br>";
echo "Min zry ".min($statry['zry'])."<br>";
echo "Max zry ".max($statry['zry'])."<br>";
//echo "Unique zry ".array_unique($statry['zry'])."<br>";
echo "<br>zry ";
$az = $statry['zry'];
print_r($statry['zry']);
echo "<br>";
*/



function gcodestats($fry){
 $lnry = array();
 $xry = array();
 $yry = array();
 $zry = array();
 $ery = array();
 $tracery = array();
 $fl = 0;
 for($i=0;$i<count($fry['lines']);$i++){
  $dat = array();
  if (preg_match("/^G1 /", $fry['lines'][$i])){
   $res = getgcoords($fry['lines'][$i]);
   $dat['X'] = $res['X'];
   if (preg_match("/[X|x]/",$fry['lines'][$i])){
    if(($fl == 1) and (floatval($res['X'])>0)) {
    array_push($xry, floatval($res['X']));
    }
   }
   if (preg_match("/[Y|y]/",$fry['lines'][$i])){
    $dat['Y'] = $res['Y'];
    if(($fl == 1) and (floatval($res['Y'])>0)) {
    array_push($yry, floatval($res['Y']));
    }
   }
   if (preg_match("/[Z|z]/",$fry['lines'][$i])){
    $dat['Z'] = $res['Z'];
    if(floatval($res['Z'])==0.2){
     $fl=1;
    } else if(floatval($res['z']) > 0.2){
     $fl = 0;
    }
    if($fl == 1) {
    array_push($zry, floatval($res['Z']));
    }
   }
   if (preg_match("/[E|e]/",$fry['lines'][$i])){
   $dat['E'] = $res['E'];
   array_push($ery, floatval($res['E']));
   }
  if($fl == 1) {
   array_push($tracery, $dat);
   }
  }
 array_push($lnry, $fry['lines'][$i]);
}
 $statry = array(
  "xry"=> ($xry),
  "yry"=> ($yry),
  "zry"=> ($zry),
  "ery"=> ($ery),
  "tracery"=> ($tracery),
  "lnry"=> ($lnry)
 );
return $statry;
}


function getgcoords($cmd){
 //echo $cmd."\n";
 $cmd = preg_replace("/ /", "", $cmd);
 $r = preg_split('/[a-zA-Z]/', $cmd);
 $ractry = array_slice($r, 1,5);
 //var_dump($ractry);

 $trp  = preg_replace('/[\d|\.]/','', $cmd);
 $tr = str_split($trp);
 //var_dump($tr);

 $x = '';
 $y = '';
 $z = '';
 $e = '';
 $f = '';
 //print_r($tr);
 //echo "<br>";
 //print_r($ractry);
 //echo "<br>";
 for ($i=0;$i<count($tr);$i++){
  if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
  if (preg_match('/[E|e]/', $tr[$i])){
	$e = $ractry[$i];
  }
  if (preg_match('/[F|f]/', $tr[$i])){
	$f = $ractry[$i];
  }
 }
 $gcoords = array('X'=>$x, 'Y'=>$y, 'Z'=>$z, 'F'=>$f, 'E'=>$e);
 return $gcoords;
}




function parsersetoutput_v2($result){
 //{'Y': 0.0, 'X': 0.0, 'Z': 0.0, 'E': 0.0}
 preg_match("/^.*[X|x](.*)$/",$result, $foundstr);
 $px =  $foundstr[1]."\n";
 $x = preg_replace("/ .*/", "", $px);
 preg_match("/^.*[Y|y](.*)$/",$result, $foundstr);
 $py =  $foundstr[1]."\n";
 $y = preg_replace("/ .*/", "", $py);
 preg_match("/^.*[Z|z](.*)$/",$result, $foundstr);
 $pz =  $foundstr[1]."\n";
 $z = preg_replace("/ .*/", "", $pz);
 preg_match("/^.*[E|e](.*)$/",$result, $foundstr);
 $pe =  $foundstr[1]."\n";
 $e = preg_replace("/ .*/", "", $pe);
 $e = preg_replace("/\}/", "", $pe);
 $outputarray = array('X'=>($x), 'Y'=>($y), 'Z'=>($z), 'E'=>($e));
 return $outputarray;
}


function openfile(){
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    //$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    $check = filesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        //echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 2000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "gcode" 
&& $imageFileType != "txt" 
&& $imageFileType != "jpg" 
&& $imageFileType != "GCODE" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
     echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
     //$fp = fopen("uploads/".basename( $_FILES["fileToUpload"]["name"]),"r");
     //$ff = fread($fp,$check);
     //fclose($fp);
     //$fff = preg_split("/\n/", $ff);
     //unlink("uploads/".basename( $_FILES["fileToUpload"]["name"]));
     //return array("filename"=>basename( $_FILES["fileToUpload"]["name"]),"lines"=>$fff);
    } else {
        echo "Sorry, there was an error uploading your file.";
     return array("filename"=>basename( $_FILES["fileToUpload"]["name"]),"lines"=>$array());
    }
}
}
?>
