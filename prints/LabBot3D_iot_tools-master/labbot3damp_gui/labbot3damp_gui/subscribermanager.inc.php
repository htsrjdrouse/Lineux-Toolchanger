<? include('functionslib.php');?>
<?
$jsonimaging = openjson('imaging.json');
 closejson($jsonimaging,'imaging.json'); 
$subscriber = $_POST['subscriber'];
?>
<? if ($subscriber == "Connect"){
       passthru('sudo /home/pi/start.scripts > /dev/null &'); 
       sleep(4);
       $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);
       publish_message('turnon5v', $jsonconfig['topic'], 'localhost', 1883, 5);
       
        header('Location: template.php'); 
?>
<? } else if ($subscriber == "Disconnect"){
  //echo "26 disconnect called<br>";
   $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);
   publish_message('turnoff5v', $jsonconfig['topic'], 'localhost', 1883, 5);
   passthru('sudo /home/pi/stop.scripts > /dev/null &'); 
   sleep(4);
   header('Location: template.php'); 
?>
<? } ?>
