<? include('functionslib.php'); ?>
<?  
$send = "did you get this";
publish_message($send, 'test-mosquitto', '192.168.1.69', 1883, 5);    ?>
