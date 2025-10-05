<?
include('functionslib.php'); 
$jsontasker3 = openjson('taskjob3');
$gcode =  $jsontasker3['data'][($jsontasker3['track'])];
if(isset($_POST['deletemacro'])){
  $trackfile = $_POST['trackfile'];
  echo $jsontasker3['filename'][$_POST['trackfile']].' deleted<br>';
  unset($jsontasker3['filename'][$_POST['trackfile']]);
  unset($jsontasker3['data'][$_POST['trackfile']]);
  reset($jsontasker3['filename']);
  $jsontasker3['track']= key($jsontasker3['filename']);
}
if(isset($_POST['savemacrofile'])){
 $filename = $_POST['macrofilename'];
 $ffl = 0;
 foreach ($jsontasker3['filename'] as $key => &$val) {
  if ($filename == $val){
   $jsontasker3['filename'][$key] = $filename;
   $jsontasker3['trackfile'] = $key;
   $par = array();
   $tpar = preg_split("/\r\n/", $_POST['macrofiledata']);
   foreach($tpar as $pp){
    array_push($par, preg_replace("/\r$/", "",$pp));
   }
   $jsontasker3['data'][$key] = $par; 
   $ffl = 1;
  }
 }
 if ($ffl == 0){
   array_push($jsontasker3['filename'],$filename);
   $tpar = preg_split("/\r\n/", $_POST['macrofiledata']);
   $par = array();
   foreach($tpar as $pp){
    array_push($par, preg_replace("/\r$/", "",$pp));
   }
   array_push($jsontasker3['data'],$par);
   $jsontasker3['track'] = array_search($filename,$jsontasker3['filename']);
 }
}
if (isset($_POST['selectmacro'])){ 
  $jsontasker3['track'] = $_POST['macrofile'];
} 
if (isset($_POST['runmacrofile'])){ 
 $cmd = "run ".$jsontasker3['filename'][$_POST['trackfile']];
 //$cmd = "Hello world!";
 echo 'running this see if sent twice '.$cmd.'<br>';
 publish_message($cmd, 'labbot3d_1_control', 'localhost', 1883, 5);    
} 


closejson($jsontasker3,'taskjob3');
header('Location: template.php');
?>
