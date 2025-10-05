<? include('functionslib.php');?>

<?
        $ssh = ssh2_connect('172.24.1.115', 22);
        ssh2_auth_password($ssh, 'pi', '9hockey');
        $cmd = "sudo python valve.sub.py > /dev/null 2>&1 & echo $!";
        $stream = ssh2_exec($ssh, $cmd);
  	stream_set_blocking($stream, true);
  	fclose($stream);
?>
