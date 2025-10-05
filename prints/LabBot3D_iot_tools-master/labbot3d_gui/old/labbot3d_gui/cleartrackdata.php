<? include('functionslib.php');
 if (isset($_POST['clear'])){
   publish_message("clear", 'labbot3d_1_control_track', 'localhost', 1883, 5);    
 }
   header('Location: template.php');
?>
