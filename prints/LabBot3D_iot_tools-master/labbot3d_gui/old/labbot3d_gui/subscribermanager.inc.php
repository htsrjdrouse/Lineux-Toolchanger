<? include('functionslib.php');?>
<?
$jsonimaging = openjson('imaging.json');
 closejson($jsonimaging,'imaging.json'); 
$subscriber = $_POST['subscriber'];
?>
<?=$subscriber?> called <br>
<? if ($subscriber == "Connect"){
	$cmd = "sudo node labbot3dstream.node/index.js";
	exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
	sleep(4);
	$cmd = "sudo python caller.labbot3d.subscriber.py";
	exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
	//header('Refresh: 10; URL=http://yoursite.com/page.php');
	sleep(3);
	$cmd = "php cam.starter.php";
	exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
	sleep(2);
        header('Location: template.php'); 

?>
<? } else if ($subscriber == "Disconnect"){
  $cmd = "sudo php cam.stopper.php";
  exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
  sleep(2);
  exec("ps aux | grep -i 'sudo python caller.labbot3d.subscriber.py' | grep -v grep", $pids);
  //var_dump($pids);
  foreach($pids as $pp){
   preg_match('/^root\s+(.*) .*\?/', $pp, $gp);
   $cor = preg_replace("/ .*/", "", $gp[1]);
   $cmd = 'sudo kill '.$cor;
   exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
   sleep(1);
   header('Location: template.php');
  }
  exec("ps aux | grep -i 'sudo node labbot3dstream.node/index.js' | grep -v grep", $pids);
  //var_dump($pids);
  foreach($pids as $pp){
   preg_match('/^root\s+(.*) .*\?/', $pp, $gp);
   $cor = preg_replace("/ .*/", "", $gp[1]);
   $cmd = 'sudo kill '.$cor;
   exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
   sleep(1);
   header('Location: template.php');
  }

?>
<? } ?>

