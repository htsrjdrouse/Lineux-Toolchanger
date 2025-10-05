<? include('functionslib.php');?>

<?
$jsonimaging = openjson('imaging.json');
 closejson($jsonimaging,'imaging.json'); 
        $ssh = ssh2_connect($jsonimaging['imaging'], 22);
        ssh2_auth_password($ssh, 'pi', '9hockey');
        $cmd = "sudo python cam.subscriber.py > /dev/null 2>&1 & echo $!";
        $stream = ssh2_exec($ssh, $cmd);
  	stream_set_blocking($stream, true);
  	fclose($stream);
?>
