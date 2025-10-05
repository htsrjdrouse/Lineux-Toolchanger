<?php 

include('repstrapfunctionslib.php'); 
$json = openjson();
$json['view'] = "M";
closejson($json);


$dir    = 'uploads';
$files1 = scandir($dir);

if (isset($_POST['checkboxvar'])) {
 if ((isset($_POST['Run'])) and count($_POST['checkboxvar'])> 1){
  echo "Sorry but you can only run one gcode file<br>";
}
 else {
    for($i=0;$i<count($_POST['checkboxvar']);$i++){
     $key = preg_replace('/^cbox/', '', $_POST['checkboxvar'][$i]);
    if(isset($_POST['Run'])){
     echo "<br>".$files1[$key]." running<br>";
    }
    if(isset($_POST['Delete'])){
     echo '<br>'.$files1[$key].' is deleted<br>';
     //unlink('uploads/'.$files1[$key]);
     exec('sudo php shell.deletegcode.php '.$files1[$key]);
     //unlink('jsondata/'.$files1[$key].'.json');
    }
    }
 }
}
 else if((isset($_POST['Delete'])) or (isset($_POST['Run']))){
  echo "Sorry you need to select a gcode file<br>";
 }

header('Location: gui.mod.php');

?>


