<?
$subscriber = $_POST['subscriber'];
?>
<?=$subscriber?> called <br>
<? if ($subscriber == "Connect"){
	$cmd = "sudo python labbot3d.subscriber.py";
	exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
	//header('Refresh: 10; URL=http://yoursite.com/page.php');
	sleep(4);
        header('Location: template.php'); 
?>
<? } else if ($subscriber == "Disconnect"){
  exec("ps aux | grep -i 'sudo python labbot3d.subscriber.py' | grep -v grep", $pids);
  var_dump($pids);
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

