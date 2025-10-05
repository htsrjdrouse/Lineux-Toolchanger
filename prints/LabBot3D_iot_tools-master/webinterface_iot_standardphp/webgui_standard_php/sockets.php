<?php

function powerpumpssocket_start($json){

	if ($json['powerrelaypid'] > 0) {
	  $msg = 'Problem the power relay socket is on ';
	  logger($logger, $msg.': pid - '.$json['powerrelaypid'].' Type "powerpumpssocket stop"<br>',1);
	}
	else {
 	 $msg =  'Power relays socket ('.$json['servers']['powerpumpsraspi'].') connected ';
	 $cmd = 'sudo php control_powerpumpssocket.php start';
	 $json['powerrelaypid'] = sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'start');
	 sleep(1);
	 if ($json['powerrelaypid'] > 0){
	  $json['powerrelaysocket']['on'] = 1;
	  $msg =  'Power relay socket ('.$json['servers']['powerpumpsraspi'].') connected ';
 	  logger($logger, $msg.': pid - '.$json['powerrelaypid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem socket power relay socket not connected<br>',1);
	 }
	}
  return $json;
}

function powerpumpssocket_stop($json){
	$msg =  'Power relay socket ('.$json['servers']['powerpumpsraspi'].') disconnected<br>';
	$cmd= 'sudo kill '.$json['powerrelaypid'];
  	$json['powerrelaysocket']['on'] = 0;
	sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],$json['powerrelaypid']);
	sleep(1);
	logger($logger, $msg.' pid - '.$json['powerrelaypid'].' is killed<br>',1);
	$json['powerrelaypid'] = 0;
}

function syringeandpiezosocketserver_start($json){
	if ($json['syringeandpiezosocketserver'] > 0) {
	  $msg = 'Problem the syringe pump and piezo socket server is already on ';
	  logger($logger, $msg.': pid - '.$json['syringeandpiezosocketserverpid'].' Type "syringeandpiezosocketserver stop"<br>',1);
	}
	else {
 	 $msg =  'Syringe pump and piezo socket server ('.$json['servers']['powerpumpsraspi'].') connected ';
	 $cmd = 'sudo php control_syringe_and_piezo_server.php start';
	 $json['syringeandpiezosocketserverpid'] = sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'start');
	 sleep(1);
	 if ($json['syringeandpiezosocketserverpid'] > 0){
	  $json['syringeandpiezosocketserver'] = 1;
	  $msg =  'Syringe pump and piezo socket server ('.$json['servers']['powerpumpsraspi'].') connected ';
 	  logger($logger, $msg.': pid - '.$json['syringeandpiezosocketserverpid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem syringe pump and piezo socket server not connected<br>',1);
	 }
	}
	return $json;
}

function syringeandpiezosocketserver_stop($json){
	$msg =  'Syringe pump and piezo socket server ('.$json['servers']['powerpumpsraspi'].') disconnected<br>';
	$cmd= 'sudo kill '.$json['syringeandpiezosocketserverpid'];
  	$json['syringeandpiezosocketserver'] = 0;
	sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],$json['syringeandpiezosocketserverpid']);
	sleep(1);
	logger($logger, $msg.' pid - '.$json['syringeandpiezosocketserverpid'].' is killed<br>',1);
	$json['syringeandpiezosocketserverpid'] = 0;

 	return $json;
}


?>
