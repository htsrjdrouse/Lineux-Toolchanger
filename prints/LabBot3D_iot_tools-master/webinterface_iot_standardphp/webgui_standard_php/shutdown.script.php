<?php

	include('repstrapfunctionslib.php');


	$imgdataset = './imgdataset';
	$json = json_decode(file_get_contents($imgdataset), true);
	$cmd = 'sudo shutdown -h 0';


 	//^restart wavepi/'
	ssh05caller($cmd,$json);


 	//^shutdown piezostrobpi/' 
	ssh02caller($cmd,$json);

	//^restart webheadcampi/'
	ssh04caller($cmd,$json);

 	//shutdown smoothie/'
	ssh06caller($cmd,$json);

 	//['servers']['marlin8pi']
	ssh01caller($cmd,$json);


?>
