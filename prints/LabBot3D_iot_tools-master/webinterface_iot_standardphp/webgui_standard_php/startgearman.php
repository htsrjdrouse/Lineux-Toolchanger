
<?php
			 $cmd= 'sudo php smoothie.gearman.worker.php';
			 //$json['gearmanpid'] = sshcontrolcaller($cmd,$json['servers']['marlin8pi'],'start');
			 //start gearman and get new gpid
			 $gpid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
?>
