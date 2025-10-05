<? include('functionslib.php');
 if (isset($_POST['clear'])){
   $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);
   publish_message("clear", $jsonconfig['topic']."track", 'localhost', 1883, 5);    
 }
   header('Location: template.php');
?>
