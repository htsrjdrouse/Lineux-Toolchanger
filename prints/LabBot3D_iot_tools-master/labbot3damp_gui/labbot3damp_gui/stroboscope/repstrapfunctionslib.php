<?php

 require("php_serial.class.php");
 include("gearman.caller.image.proc.php");



function gearman_socketflagon(){
//Gearman socket 
  $json = openjson();
  $json['sockets'] = 1;
  closejson($json);
  return "socket on";
}

function gearman_socketflagoff(){
  $json = openjson();
  $json['sockets'] = 0;
  closejson($json);
  return "socket off";
}

function startsockets(){
//Gearman socket 
  /*
  if ($json['gearmanpid'] > 0) {
     $msg = 'The gearman socket is already on ';
     logger($logger, $msg.': pid - '.$json['gearmanpid'].' Type "gearman stop"<br>',1);
  }
  else {
   $msg =  'Gearman socket ('.$json['servers']['chubox'].') connected ';
   $cmd= 'sudo php smoothie.gearman.worker.php';
   $gpid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
   $json['gearmanpid'] = $gpid;
   sleep(1);
   if ($json['gearmanpid'] > 0){
     $json['gearmansocket'] = 1;
     logger($logger, $msg.': pid - '.$json['gearmanpid'].'<br>',1);
    }
   else {
     logger($logger, 'Problem: could not start gearmansocket<br>',1);
    }
  }
  */ 
  //start sockets flag
  header("Location: runner.php?tcli=startsockets");
}


function stopsockets(){
  $json['sockets'] = 0;
  header("Location: runner.php?tcli=stopsockets");
}


function gearman_headcam_linearactuatorsocket_start(){
  $json = openjson();
  $json=headcam_linearactuatorsocket_start($json);	
  closejson($json);
  $msg = "Headcam linearactuator and temperature controller start pid ".  $json['headcamlinearactuatorpid'];
  return $msg;
}
function gearman_headcam_linearactuatorsocket_stop(){

  $json = openjson();
  $json=headcam_linearactuatorsocket_stop($json);	
  closejson($json);
  $msg = "Headcam linearactuator and temperature controller pid ".  $json['headcamlinearactuatorpid']. " killed";
  return $msg;
}




function gearman_powerpumpssocketstart(){
  $json = openjson();
  $json = powerpumpssocket_start($json);
  closejson($json);
  $msg = "Powerpumpssocket start ".$json['powerrelaypid'];
  return $msg;
}
function gearman_powerpumpssocketstop(){
  $json = openjson();
  $json = powerpumpssocket_stop($json);
  closejson($json);
  $msg = "Powerpumpssocket pid ".$json['powerrelaypid']." killed";
  return $msg;
}

function gearman_syringesocketstart(){
  $json = openjson();
  $json =syringesocket_start($json);
  closejson($json);
  $msg = 'Syringesocket start pid'.$json['syringesocketpid'];
  return $msg;
}
function gearman_syringesocketstop(){
  $json = openjson();
  $json =syringesocket_stop($json);
  closejson($json);
  $msg = "Powerpumpssocket pid ".$json['syringesocketpid']." killed";
  return $msg;
}











function gearman_smoothiesocketstart(){
  $json = openjson();
  $json = smoothiesocket_start($json); 
  closejson($json);
  $msg =  "Smoothiesocket started pid ".$json['smoothiesocketpid'];
  $msg = $msg." Smoothie gearman socket started pid ".$json['smoothiegearmansocketpid'];
  return $msg;
}

function gearman_smoothiesocketstop(){
  $json = openjson();
  $json = smoothiesocket_stop($json); 
  closejson($json);
  $msg =  "Smoothiesocket started pid killed ".$json['smoothiesocketpid'];
  $msg = $msg." Smoothie gearman socket pid ".$json['smoothiegearmansocketpid']." killed. The gearman socket is still on so that has to turn off too"; 
  return $msg;
}



function openerrorjson(){
  $imgdataset = './taskjoberror';
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}

function closeerrorjson($json){
  $imgdataset = './taskjoberror'; 
  file_put_contents($imgdataset, json_encode($json));
}

function taskerrorjob($msg,$func){
        $logger = './taskjoberror';
        $jsonjob = json_decode(file_get_contents($logger), true);
        if ($func == 0){ 
         $jsonjob['transferlist'] = array();
        }
        array_push($jsonjob['transferlist'],$msg);
        file_put_contents($logger, json_encode($jsonjob));
}

function opentrackjson(){
  $imgdataset = './taskjobtracker';
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}

function openraspicamjson(){
  $imgdataset = './raspicam.json';
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}


function closeraspicamjson($json){
  $imgdataset = './raspicam.json'; 
  file_put_contents($imgdataset, json_encode($json));
}



function closetrackjson($json){
  $imgdataset = './taskjobtracker'; 
  file_put_contents($imgdataset, json_encode($json));
}

function tasktrackjob($msg,$func){
        $logger = './taskjobtracker';
        $jsonjob = json_decode(file_get_contents($logger), true);
        if ($func == 0){ 
         $jsonjob['transferlist'] = array();
        }
        array_push($jsonjob['transferlist'],$msg);
        file_put_contents($logger, json_encode($jsonjob));
}



function parsergcode(){
 $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
 file_put_contents('taskjob3', json_encode($jsontasker3));
 $json = openjson();
 $file = $jsontasker3['filename'][$jsontasker3['track']]; 
 $filei = array_search($file,$jsontasker3['filename']);
 echo 'gfile: '.$file.'<br>';
 $strdat = $jsontasker3['data'][$jsontasker3['track']];
 /*
 $strdat = preg_replace('/"\[/','', $strdat);
 $strdat = preg_replace('/"\]/','', $strdat);
 $strdat = preg_replace('/\]/','', $strdat);
 $strdat = preg_replace('/\[/','', $strdat);
 $strdat = preg_replace("/'/","", $strdat);
 $strary = preg_split('/,/', $strdat);
 */
 echo 'length of filecontent-filei: '.count($strdat).'<br>';
 $tmpcoords = array();
 for ($ti=0;$ti<count($strdat);$ti++){
  $lnr =  stripslashes($strdat[$ti]);
  if (preg_match('/^.*G1X.*/', $lnr)){
   array_push($tmpcoords,$lnr);
  }
 }
 echo '<br>';
 $json['gfilefirstposition']=$tmpcoords[0];
 closejson($json);
 return $json;
}

function imagingcoordfindshim($json,$i,$x,$y,$spotdiff,$xspotdiff,$targettypeindex,$modgcode){
  	$pos = getgcoords($modgcode,$json);
	$coords = array();
 	$spotcolsp = $json['workplate']['targettype'][$targettypeindex]['spotcolsp'];
 	$spotrowsp = $json['workplate']['targettype'][$targettypeindex]['spotrowsp'];
 	$xbrefx = $json['positionimgprocessing']['xbcol'];
	$xerefx = $json['positionimgprocessing']['xecol'];
 	$xbrefy = $json['positionimgprocessing']['xbrow'];
 	$xerefy = $json['positionimgprocessing']['xerow'];
 	$xeposx = $json['positionimgprocessing']['xecolpos'];
 	$xbposy = $json['positionimgprocessing']['xbrowpos'];
 	$xeposy = $json['positionimgprocessing']['xerowpos'];

 	$ybrefx = $json['positionimgprocessing']['ybcol'];
 	$yerefx = $json['positionimgprocessing']['yecol'];
 	$ybrefy = $json['positionimgprocessing']['ybrow'];
 	$yerefy = $json['positionimgprocessing']['yerow'];
 	$ybposx = $json['positionimgprocessing']['ybcolpos'];
 	$yeposx = $json['positionimgprocessing']['yecolpos'];
 	$ybposy = $json['positionimgprocessing']['ybrowpos'];
 	$yeposy = $json['positionimgprocessing']['yerowpos'];
 	$calcxspacing = ((($xeposx - $xbposx))/($xerefx - $xbrefx));
 	$calcyspacing = ((($yeposy - $ybposy))/($yerefy - $ybrefy));
 	$refxspacing = $json['positionimgprocessing']['refxspacing'];
 	$refyspacing = $json['positionimgprocessing']['refyspacing'];

  	$yshimmy  = ($spotdiff / abs($yerefy-$ybrefy) * (($y - $json['positionimgprocessing']['ybrow']) * $spotrowsp));
  	$xshimmy = ($xspotdiff / abs($xerefx-$xbrefx) * (($x - $json['positionimgprocessing']['xbcol']) * $spotcolsp));

	$diffx = $json['workplate']['tarxposwell'][$i] - $json['workplate']['tarxposwell'][0];
	$diffy = $json['workplate']['taryposwell'][$i] - $json['workplate']['taryposwell'][0];
	//echo 'diffx: '.$diffx.'<br>'; 
	//echo 'diffy: '.$diffy.'<br>'; 



  	//$posg = "G1X".$pos['X']."Y".$pos['Y']."Z".$pos['Z']."F".$json['trackxyz']['f'];
	$xpos = ($pos['X'] + (($x - $json['positionimgprocessing']['ybcol']) * ($calcxspacing/$refxspacing) + ($yshimmy)));
	$ypos = ($pos['Y'] + (($y - $json['positionimgprocessing']['xbrow']) * ($calcyspacing/$refyspacing) + ($xshimmy)));

	//$xpos = ($json['imageprocessing']['px'][0] + (($x - $json['positionimgprocessing']['ybcol']) * ($calcxspacing/$refxspacing) + ($yshimmy)));
	//$ypos = ($json['imageprocessing']['py'][0] + (($y - $json['positionimgprocessing']['xbrow']) * ($calcyspacing/$refyspacing) + ($xshimmy)));
	$xpos = round($xpos,3);
	$ypos = round($ypos,3);
	$coords[0] = $xpos + $diffx;
	$coords[1] = $ypos + $diffy;
	return $coords;
}






function imagingcoordfind($json,$i,$x,$y,$spotdiff,$xspotdiff,$targettypeindex){

	$coords = array();
 	$spotcolsp = $json['workplate']['targettype'][$targettypeindex]['spotcolsp'];
 	$spotrowsp = $json['workplate']['targettype'][$targettypeindex]['spotrowsp'];

 	$xbrefx = $json['positionimgprocessing']['xbcol'];
	$xerefx = $json['positionimgprocessing']['xecol'];
 	$xbrefy = $json['positionimgprocessing']['xbrow'];
 	$xerefy = $json['positionimgprocessing']['xerow'];
 	$xbposx = $json['positionimgprocessing']['xbcolpos'];
 	$xeposx = $json['positionimgprocessing']['xecolpos'];
 	$xbposy = $json['positionimgprocessing']['xbrowpos'];
 	$xeposy = $json['positionimgprocessing']['xerowpos'];

 	$ybrefx = $json['positionimgprocessing']['ybcol'];
 	$yerefx = $json['positionimgprocessing']['yecol'];
 	$ybrefy = $json['positionimgprocessing']['ybrow'];
 	$yerefy = $json['positionimgprocessing']['yerow'];
 	$ybposx = $json['positionimgprocessing']['ybcolpos'];
 	$yeposx = $json['positionimgprocessing']['yecolpos'];
 	$ybposy = $json['positionimgprocessing']['ybrowpos'];
 	$yeposy = $json['positionimgprocessing']['yerowpos'];
 	$calcxspacing = ((($xeposx - $xbposx))/($xerefx - $xbrefx));
 	$calcyspacing = ((($yeposy - $ybposy))/($yerefy - $ybrefy));
 	$refxspacing = $json['positionimgprocessing']['refxspacing'];
 	$refyspacing = $json['positionimgprocessing']['refyspacing'];

  	$yshimmy  = ($spotdiff / abs($yerefy-$ybrefy) * (($y - $json['positionimgprocessing']['ybrow']) * $spotrowsp));
  	$xshimmy = ($xspotdiff / abs($xerefx-$xbrefx) * (($x - $json['positionimgprocessing']['xbcol']) * $spotcolsp));

	$diffx = $json['workplate']['tarxposwell'][$i] - $json['workplate']['tarxposwell'][0];
	$diffy = $json['workplate']['taryposwell'][$i] - $json['workplate']['taryposwell'][0];
	//echo 'diffx: '.$diffx.'<br>'; 
	//echo 'diffy: '.$diffy.'<br>'; 
	$xpos = ($json['imageprocessing']['px'][0] + (($x - $json['positionimgprocessing']['ybcol']) * ($calcxspacing/$refxspacing) + ($yshimmy)));
	$ypos = ($json['imageprocessing']['py'][0] + (($y - $json['positionimgprocessing']['xbrow']) * ($calcyspacing/$refyspacing) + ($xshimmy)));
	//$xpos = round($xpos,3);
	//$ypos = round($ypos,3);
	$coords[0] = $xpos + $diffx;
	$coords[1] = $ypos + $diffy;
	return $coords;
}



function laccheck($postvar){
	if ((intval($postvar) < 1000) and strlen($postvar) == 3){
	 $lacvar = "0".$postvar;
	}	
	else if ($postvar > 3000){
	 $lacvar = "3000";
	}
	else {
	 $lacvar = $postvar;
	}
	return $lacvar;
}



function openjson(){
  $imgdataset = './imgdataset';
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}

function closejson($json){
  $imgdataset = './imgdataset';
  file_put_contents($imgdataset, json_encode($json));
}

function setgearmanaspirate($pvolrty){
 $volrty = preg_split('/_/', $pvolrty);
 $vol = $volrty[0];
 $rt = $volrty[1];
 $msg = gearmanaspirate($vol,$rt);
 return $msg;
}

function setgearmandispense($pvolrty){
 $volrty = preg_split('/_/', $pvolrty);
 $vol = $volrty[0];
 $rt = $volrty[1];
 $msg = gearmandispense($vol,$rt);
 return $msg;
}


function gearman_s1_syringesettings(){
  $json = openjson();
  $logger = './loggerdataset';
  $json = syringesocketclient('s1 settings',$json);
  sleep(1);
  logger($logger, 'htsr syringe 1 settings: '.$json['htsrsyringe']['settings'].'<br>',1);
  closejson($json);
  $msg = $json['htsrsyringe']['settings'];
  return $msg;
}


function gearmanpowerupsmoothie(){
  $logger = './loggerdataset';
  $json = openjson();
  $json["stop"] ="0";
  $json = powerrelaysocketclient('poweron',$json);
  $msg =  'Turning smoothie board power on<br>';
  logger($logger, $msg,1);
  closejson($json);
  return "Power applied to smoothie board<br>";
}

function gearmanpowerdownsmoothie(){
  $logger = './loggerdataset';
  $json = openjson();
  $json["stop"] ="1";
  $json = powerrelaysocketclient('poweroff',$json);
  $msg =  'Turning smoothie board power off<br>';
  logger($logger, $msg,1);
  closejson($json);
  return "Power disconnected to smoothie board<br>";
}
/*
function gearman_hts_s1_steps($steps){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 steps '.$steps,$json);
  sleep(1);
  //logger($logger, 'htsr syringe 1: set syringe steps '.$steps.'<br>',1);
  closejson($json);
  return 'htsr syringe 1: set syringe steps '.$steps.'<br>';
}

function gearman_hts_s1_retractsteps($steps){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 retractsteps '.$steps,$json);
  sleep(1);
  //logger($logger, 'htsr syringe 1: set syringe retract steps '.$steps.'<br>',1);
  closejson($json);
  return 'htsr syringe 1: set syringe retract steps '.$steps.'<br>';
}


function gearman_hts_s1_steprate($steprate){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 steprate '.$steprate,$json);
  //logger($logger, 'htsr syringe 1: set syringe steprate '.$steprate.'<br>',1);
  sleep(1);
  closejson($json);
  return 'htsr syringe 1: set syringe steprate '.$steprate.'<br>';
}

function gearman_hts_s1_retractsteprate($steprate){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 retractsteprate '.$steprate,$json);
  //logger($logger, 'htsr syringe 1: set syringe retract steprate '.$steprate.'<br>',1);
  sleep(1);
  closejson($json);
  return 'htsr syringe 1: set syringe retract steprate '.$steprate.'<br>';
}








function gearman_hts_s1_aspirate(){
  $logger = './loggerdataset';
  $json = openjson();
  $aspvol = round(($json['htsrsyringe']['steps'] / $json['htsrsyringestepsperml'])*1000,2);  
  $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
  $json['syringepump']['trackaspvol'] = $json['syringepump']['trackaspvol'] + $aspvol;
  if ($json['syringepump']['trackaspvol'] <=  ($json['htsrsyringevol']*1000)){
   //$json = syringesocketclient('s1 valveinput',$json);
   //sleep(1);
   //logger($logger, 'htsr syringe 1: valve input<br>',1);
   $json = syringesocketclient('s1 backward',$json);
   logger($logger, 'htsr syringe 1: syringe backward<br>',1);
   sleep(1);
   $time = round(($json['htsrsyringe']['steps'] / ($flowrate*8)),0); 
   sleep($time); 
   closejson($json);
   return 'Aspirate<br>';
  }
  else {
   closejson($json);
   return 'Error total aspiration volume greater then syringe volume<br>';
  }
}

function gearman_hts_s1_dispense(){
  $logger = './loggerdataset';
  $json = openjson();
  $dispvol = round(($json['htsrsyringe']['steps'] / $json['htsrsyringestepsperml'])*1000,2);  
  $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
  $json['syringepump']['trackaspvol'] = $json['syringepump']['trackaspvol'] - $dispvol;
  if ($json['syringepump']['trackaspvol'] > 0){
   $json = syringesocketclient('s1 valveoutput',$json);
   sleep(1);
   logger($logger, 'htsr syringe 1: valve output<br>',1);
   $json = syringesocketclient('s1 forward',$json);
   logger($logger, 'htsr syringe 1: syringe forward<br>',1);
   sleep(1);
   $time = round(($json['htsrsyringe']['steps'] / ($flowrate*8)),0); 
   sleep($time); 
   closejson($json);
   return 'Dispense<br>';
  }
  else {
   closejson($json);
   return 'Error dispense volume exceeds volume in syringe<br>';
  }
}


function gearman_hts_s1_dispense_nowait(){
  $logger = './loggerdataset';
  $json = openjson();
  $dispvol = round(($json['htsrsyringe']['steps'] / $json['htsrsyringestepsperml'])*1000,2);
  $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
  $json['syringepump']['trackaspvol'] = $json['syringepump']['trackaspvol'] - $dispvol;
  if ($json['syringepump']['trackaspvol'] > 0){
   $json = syringesocketclient('s1 forward',$json);
   logger($logger, 'htsr syringe 1: syringe forward<br>',1);
   sleep(1);
   closejson($json);
   return 'Dispense<br>';
  }
  else {
   closejson($json);
   return 'Error dispense volume exceeds volume in syringe<br>';
  }
}



function gearman_hts_s1_contbackgo(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('contbackgo',$json);
  sleep(1);
  closejson($json);
  return 'Pump aspirating<br>';
}

function gearman_hts_s1_contforgo(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('contforgo',$json);
  sleep(1);
  closejson($json);
  return 'Pump dispensing<br>';
}

function gearman_hts_s1_contstop(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('contstop',$json);
  sleep(1);
  closejson($json);
  return 'Pump stopped<br>';
}


function gearman_hts_s1_backward(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 backward',$json);
  closejson($json);
  return 'Pump aspirating<br>';
}

function gearman_hts_s1_forward(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 forward',$json);
  closejson($json);
  return 'Pump dispensing<br>';
}






function gearman_hts_s1_homing(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 homing',$json);
  $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
  $time = round(($json['syringepump']['trackaspvol'] / $flowrate),0);
  sleep($time);
  $json['syringepump']['trackaspvol'] = 0;
  closejson($json);
  return 'S1 syringe pump homed<br>';
}
*/

function gearman_hts_s1_valveinput(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valveinput',$json);
  logger($logger, 'htsr syringe 1: valveinput<br>',1);
  closejson($json);
  return 'S1 valve input<br>';
}

function gearman_hts_s1_valveoutput(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valveoutput',$json);
  logger($logger, 'htsr syringe 1: valveoutput<br>',1);
  closejson($json);
  return 'S1 valve output<br>';
}

function gearman_hts_s1_valvebypass(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valvebypass',$json);
  logger($logger, 'htsr syringe 1: valvebypass<br>',1);
  closejson($json);
  return 'S1 valve bypass<br>';
}

/*
function gearman_hts_s1_fillsyringe(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valveinput',$json);
  sleep(2);
  logger($logger, 'htsr syringe 1: valveinput<br>',1);
  $json = syringesocketclient('s1 homing',$json);
  $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
  $time = round(($json['syringepump']['trackaspvol'] / $flowrate),0);
  sleep($time);
  $json['syringepump']['trackaspvol'] = 0;
  for ($i=0;$i<$json['syringepump']['filltubingcycles'];$i++){
   $json = syringesocketclient('s1 valveoutput',$json);
   sleep(1);
   logger($logger, 'htsr syringe 1: valve output<br>',1);
   $json = syringesocketclient('s1 backward',$json);
   logger($logger, 'htsr syringe 1: syringe backward<br>',1);
   sleep(1);
   $time = round(($json['htsrsyringe']['steps'] / ($flowrate*8)),0); 
   sleep($time); 
   $json = syringesocketclient('s1 valveinput',$json);
   sleep(1);
   logger($logger, 'htsr syringe 1: valve input<br>',1);
   $json = syringesocketclient('s1 forward',$json);
   logger($logger, 'htsr syringe 1: syringe backward<br>',1);
   sleep(1);
   sleep($time); 
  }
  closejson($json);
  return 'S1 syringe pump homed<br>';
}
*/

/*
function gearman_hts_s1_valveinput(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valveinput',$json);
  logger($logger, 'htsr syringe 1: valveinput<br>',1);
  closejson($json);
  return 'S1 valve input<br>';
}

function gearman_hts_s1_valveoutput(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valveoutput',$json);
  logger($logger, 'htsr syringe 1: valveoutput<br>',1);
  closejson($json);
  return 'S1 valve output<br>';
}

function gearman_hts_s1_valvebypass(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = syringesocketclient('s1 valvebypass',$json);
  logger($logger, 'htsr syringe 1: valvebypass<br>',1);
  closejson($json);
  return 'S1 valve bypass<br>';
}
*/

/*
function gearmanpowerupsyringe(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = powerrelaysocketclient('syringemotoron',$json);
  logger($logger, '12V power applied to syringe pump motor<br>',1);
  closejson($json);
  return "Syringe motors powered up<br>";
}

function gearmanpowerdownsyringe(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = powerrelaysocketclient('syringemotoroff',$json);
  logger($logger, '12V power disconnected to syringe pump motor<br>',1);
  closejson($json);
  return "Syringe motors powered down<br>";
}


function gearmanpowerupvalve(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = powerrelaysocketclient('syringevalveon',$json);
  logger($logger, '5V power applied to syringe pump valve and logic<br>',1);
  closejson($json);
  return "Syringe valve and logic powered up<br>";
}

function gearmanpowerdownvalve(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = powerrelaysocketclient('syringevalveoff',$json);
  logger($logger, '5V power disconnected to syringe pump valve and logic<br>',1);
  closejson($json);
  return "Syringe valve and logic powered down<br>";
}
*/

function gearmanheadcam_linearactuatorsocket_start(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = headcam_linearactuatorsocket_start($json);
  logger($logger, 'Headcam and linear actuator has started<br>',1);
  closejson($json);
  return "Headcam and linear actuator socket fired up<br>";
}

function gearmanheadcam_linearactuatorsocket_stop(){
  $logger = './loggerdataset';
  $json = openjson();
  $json = headcam_linearactuatorsocket_stop($json);
  logger($logger, 'Headcam and linear actuator has disconnected<br>',1);
  closejson($json);
  return "Headcam and linear actuator socket is down<br>";
}





function gearmanbacktoz($well){
  $logger = './loggerdataset';
  $json = openjson();
  $json = movep1lac($json,$logger,'0500');
  $posz = 'G1Z'.$json['ztrav'].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  closejson($json);
}


function gearmangotowell($well){
  $logger = './loggerdataset';
  $i = $well-1;
  $json = openjson();
  //"washx":"118","washy":"56","washz":"77"
  $posxy = 'G1X'.$json['sourcewell']['x'][$i].'Y'.$json['sourcewell']['y'][$i].'F'.$json['xyfeedrate'];
  $json = smoothiesocketmove($posxy,$json,$logger);
  $posz = 'G1Z'.$json['sourcewell']['z'][$i].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  $json = movep1lac($json,$logger,'3000');
  closejson($json);
  $msg = 'Well '.$well.': posxy '.$posxy.' poz '.$posz.' lac 3000<br>';
  //$msg = 'Tip at wash position<br>';
  return $msg;
}

function gearmanfire($drops){
  $json = openjson();
  $logger = './loggerdataset';
  if ($json['strobconnect'] == 1){
    $json = waveformsocketclient('FIRE',$json);
    logger($logger, 'Dispensed: '.$json['wavecontroller']['drops'].'<br>',1);
   }
   else {
     logger($logger, 'Wave Generator socket not connected<br>',1);
   }
  $msg = 'Drops '.$json['wavecontroller']['drops'].'<br>';
  closejson($json);
  return $msg;
}



function gearmanstrobon(){
  $logger = './loggerdataset';
  $json = openjson();
  $json['view'] = 'G';
  $json['strobled'] = 1;
  if ($json['strobconnect'] == 1){
    $json = waveformsocketclient('STROBOSCOPE',$json);
    logger($logger, 'Stroboscope on<br>',1);
   }
   else {
     logger($logger, 'Wave Generator socket not connected<br>',1);
   }
  $msg = 'Stroboscope on<br>';
  closejson($json);
  return $msg;
}


function gearmanstroboff(){
  $logger = './loggerdataset';
  $json = openjson();
  $json['view'] = 'E';
  $json['strobled'] = 0;
  if ($json['strobconnect'] == 1){
    $result = powerrelaysocketclient('trigger on',$json);
    sleep(1);
    $result = powerrelaysocketclient('trigger off',$json);
    logger($logger, 'Stroboscope off<br>',1);
   }
   else {
     logger($logger, 'Smoothiesocket socket not connected<br>',1);
   }
  $msg = 'Stroboscope off<br>';
  closejson($json);
  return $msg;
}


function gearmansetdrops($mv){
  $logger = './loggerdataset';
  $json = openjson();
  if ($json['strobconnect'] == 1){
    $json['wavecontroller']['drops'] = $mv;
    $json = waveformsocketclient('D'.$json['wavecontroller']['drops'],$json);
    //$json = waveformsocketclient('REPORT',$json);
    logger($logger, 'Wave Generator: SetVolts '.$json['wavecontroller']['volts'].' '.$json['wavecontroller']['report'].'<br>',1);
   }
   else {
    logger($logger, 'Wave Generator socket not connected<br>',1);
  }
  closejson($json);
  $json = openjson();
  return $msg;
}

function gearmandispense($pvolrty){
  $volrty = preg_split('/_/', $pvolrty);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $logger = './loggerdataset';
  $json = openjson();
  if ($json['syringepump']['connect'] == 1){
   $preaspvol =  $json['syringepump']['trackaspvol'];
   $dispensevol = $vol;
   $dispenseflo = $rate;
  $json['syringepump']['dispensevol'] = $dispensevol;
  $json['syringepump']['dispenseflo'] = $dispenseflo;
   if ($dispensevol > $preaspvol){
	echo '<font color=red>Error: Dispense volume is more then what was aspirated</font><br>';
	echo '<font color=red>There is <?php echo $preaspvol; ?> left</font><br>';
	$msg = 'Cannot dispense all of this because there is only <?php echo $preaspvol; ?> left<br>';
  	logger($logger, $msg,1);
    }
  $preaspvol = $preaspvol - $dispensevol;
  $json['syringepump']['trackaspvol'] = $preaspvol;
  $conv = (3000 / 250);
  $volsteps = ceil($dispensevol * $conv);
  $svel = 900;
  $tvel = 1400;
  $ramprate =($svel/$tvel);
  $volstepsrt = ceil($json['syringepump']['dispenseflo'] * $conv);
  $json['syringepump']['aspirateflo'] = $rate;
  $conv = (3000 / 250);
  $volsteps = ceil($json['syringepump']['dispensevol'] * $conv);
  $svel = 900;
  $tvel = 1400;
  $ramprate =($svel/$tvel);
  $volstepsrt = ceil($json['syringepump']['aspirateflo'] * $conv);
  $cmd = 'v'.ceil($ramprate*$volstepsrt).'V'.ceil($volstepsrt).'D'.$volsteps;
  //syringesocketclient($cmd,$json);
  $cmd = 'Ov'.(string)ceil($ramprate*$volstepsrt).'V'.(string)ceil($volstepsrt).'D'.(string)$volsteps.'B';
  $sshcmd = 'python socket.client.py '.$cmd.' > /dev/null &';
  ssh04caller($sshcmd,$json);
  //$msg = 'Dispensed '.$vol.' ul at '.$rate.' ul/s<br>';
  $msg = 'Dispensed '.$vol.' ul at '.$rate.' ul/s: '.$cmd.'<br>';
  logger($logger, $msg,1);
  }
  else {
   $msg = 'Syringe socket is not connected (To start: SYsocket start)<br>';
   logger($logger, 'Syringe socket is not connected (To start: SYsocket start)<br>',1);
  }
  closejson($json);
  return $msg;
}

function gearmansetvalve($pos){
  $logger = './loggerdataset';
  $json = openjson();
  if ($json['syringepump']['connect'] == 1){
    syringesocketclient($pos,$json);
    $msg = 'Valve set: '.$pos.'<br>';
    logger($logger, $msg,1);
  }
  else {
   logger($logger, 'Syringe socket is not connected (To start: SYsocket start)<br>',1);
  }
  closejson($json);
  return $msg;
}

function gearmanfillsyringe($pvolrty){
  $json = openjson();
  $volrty = preg_split('/_/', $pvolrty);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $logger = './loggerdataset';
	if ($json['syringepump']['connect'] == 1){
   	  $preaspvol =  $json['syringepump']['trackaspvol'];
   	  $json['syringepump']['fillvol'] = $vol;
   	  $trackaspvol = $preaspvol + $json['syringepump']['fillvol'];
   	  $json['syringepump']['trackaspvol'] = $trackaspvol; 
   	  $json['syringepump']['fillflo'] = $rate;
   	  $conv = (3000 / 250);
   	  $volsteps = ceil($json['syringepump']['fillvol'] * $conv);
   	  $svel = 900;
   	  $tvel = 1400;
   	  $ramprate =($svel/$tvel);
   	  $volstepsrt = ceil($json['syringepump']['fillflo'] * $conv);
   	  $cmd = 'v'.(string)ceil($ramprate*$volstepsrt).'V'.(string)ceil($volstepsrt).'IP'.(string)$volsteps.'B';
	  $sshcmd = 'python socket.client.py '.$cmd.' > /dev/null &';
	  echo $sshcmd.'<br>';
	  ssh04caller($sshcmd,$json);
	  $msg = 'Syringe filled '.$vol.' ul at '.$rate.' ul/s: '.$cmd.'<br>';
	  logger($logger, $msg,1);
	}
	else {
         $msg = 'Syringe socket is not connected (To start: SYsocket start)<br>';
	 logger($logger, 'Syringe socket is not connected (To start: SYsocket start)<br>',1);
	}
  closejson($json);
  return $msg;
}

function gearmanaspirate($pvolrty){
  $volrty = preg_split('/_/', $pvolrty);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $logger = './loggerdataset';
  $json = openjson();
	if ($json['syringepump']['connect'] == 1){
   	  $preaspvol =  $json['syringepump']['trackaspvol'];
   	  //$json['syringepump']['aspiratevol'] = $_GET['aspiratevol'];
   	  $json['syringepump']['aspiratevol'] = $vol;
   	  $trackaspvol = $preaspvol + $json['syringepump']['aspiratevol'];
   	  $json['syringepump']['trackaspvol'] = $trackaspvol; 
   	  //$json['syringepump']['aspirateflo'] = $_GET['aspirateflo'];
   	  $json['syringepump']['aspirateflo'] = $rate;
   	  $conv = (3000 / 250);
   	  $volsteps = ceil($json['syringepump']['aspiratevol'] * $conv);
   	  $svel = 900;
   	  $tvel = 1400;
   	  $ramprate =($svel/$tvel);
   	  $volstepsrt = ceil($json['syringepump']['aspirateflo'] * $conv);
	  //$volstepsrt = ceil($json['syringepump']['aspirateflo'] * (3000/250));
   	  //syringesocketclient($cmd,$json);
   	  $cmd = 'Ov'.(string)ceil($ramprate*$volstepsrt).'V'.(string)ceil($volstepsrt).'P'.(string)$volsteps.'B';
	  $sshcmd = 'python socket.client.py '.$cmd.' > /dev/null &';
	  ssh04caller($sshcmd,$json);
	  $msg = 'Aspirated '.$vol.' ul at '.$rate.' ul/s: '.$cmd.'<br>';
	  logger($logger, $msg,1);
	}
	else {
         $msg = 'Syringe socket is not connected (To start: SYsocket start)<br>';
	 logger($logger, 'Syringe socket is not connected (To start: SYsocket start)<br>',1);
	}
  closejson($json);
  return $msg;
}


function gearmanquantifystrobimg($sample){
  $logger = './loggerdataset';
  $json = openjson();
  $dir = $json['strobimages']['path'];
  $bx = $json['stroboscopedata']['bx'];
  $by = $json['stroboscopedata']['by'];
  $set=$bx.",".$by.",".$json['stroboscopedata']['exwidth'].",".$json['stroboscopedata']['eyheight'];
  $cmd = "sudo python gearman.caller.image.proc.py ".$json['strobimglist']." ".$set." ".$json['stroboscopedata']['mindiam']." ".$sample;
  if ($json['stroboscopedata']['autothreshold'] == "1"){
   $cmd = "sudo python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." 0 ".$sample;
  }
  else {
   $cmd = "sudo python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." ".$json['stroboscopedata']['userthreshold']." ".$sample;
  }


  $result =  exec($cmd, $output);
  $delaycalc = count(preg_split('/,/', $json['strobimglist']));
  sleep(2+(($delaycalc*1.5)));
  gearmanstrobdataprocessing();  
  $strobjson = json_decode(file_get_contents('./gearmanstrobdataset'), true);
  $json['strobimgsetdata']['avgdrops'] = $strobjson['calcdataset']['avgdrops'];
  $json['strobimgsetdata']['cvdrops'] = round(($strobjson['calcdataset']['stddrops'] / $strobjson['calcdataset']['avgdrops']) * 100,2);
  $json['strobimgsetdata']['avgmaxspeed'] = round($strobjson['calcdataset']['avgmaxspeed'],2);
  $json['strobimgsetdata']['cvmaxspeed'] = round(($strobjson['calcdataset']['stdmaxspeed'] / $strobjson['calcdataset']['avgmaxspeed']) * 100,2);
  $json['strobimgsetdata']['avgminspeed'] = round($strobjson['calcdataset']['avgminspeed'],2);
  $json['strobimgsetdata']['cvminspeed'] = round(($strobjson['calcdataset']['stdminspeed'] / $strobjson['calcdataset']['avgminspeed']) * 100,2);
  $json['strobimgsetdata']['avgavgspeed'] = round($strobjson['calcdataset']['avgavgspeed'],2);
  $json['strobimgsetdata']['cvavgspeed'] = round(($strobjson['calcdataset']['stdavgspeed'] / $strobjson['calcdataset']['avgavgspeed']) * 100,2);
  $json['strobimgsetdata']['avgdeflection'] = round($strobjson['calcdataset']['avgdeflection'],2);
  $json['strobimgsetdata']['cvdeflection'] = round(($strobjson['calcdataset']['stddeflection'] / $strobjson['calcdataset']['avgdeflection']) * 100,2);
  $json['strobimgsetdata']['avgtotalvolume'] = round($strobjson['calcdataset']['avgvolume'],2);
  $json['strobimgsetdata']['cvtotalvolume'] = round(($strobjson['calcdataset']['stdvolume'] / $strobjson['calcdataset']['avgvolume']) * 100,2);
  $json['strobimgsetdata']['avgsignal'] = round($strobjson['calcdataset']['avgvolume'],2);
  $json['strobimgsetdata']['cvsignal'] = round(($strobjson['calcdataset']['stdvolume'] / $strobjson['calcdataset']['avgvolume']) * 100,2);
  $json['strobimgsetdata']['sample'] = $sample;
  $msg = 'Drops: '.$json['strobimgsetdata']['avgdrops'].' %CV '.$json['strobimgsetdata']['cvdrops'];
  $msg = $msg . ' MaxSpeed: '.$json['strobimgsetdata']['avgmaxspeed'] . 'm/s %CV '.$json['strobimgsetdata']['cvmaxspeed'];
  $msg = $msg . ' MinSpeed: '.$json['strobimgsetdata']['avgminspeed'] . 'm/s %CV '.$json['strobimgsetdata']['cvminspeed'];
  $msg = $msg . ' Deflection: '.$json['strobimgsetdata']['avgdeflection'] . '&micro;m %CV '.$json['strobimgsetdata']['cvdeflection'];
  $msg = $msg . ' Signal: '.$json['strobimgsetdata']['avgsignal'] . ' %CV '.$json['strobimgsetdata']['cvsignal'];
  $msg = $msg . ' TotalVolume: '.$json['strobimgsetdata']['avgtotalvolume'] . 'pl %CV '.$json['strobimgsetdata']['cvtotalvolume'].'<br>';
  logger($logger, $msg,1);
  $pmsg = 'Sample: '.$sample.' Images analyzed: '.$json['strobimglist'].'<br>';
  logger($logger, $pmsg,1);

  //"strobcutoff":{"maxspeedcheck":"checked","avgspeedcheck":"","volumecheck":"","deflectioncheck":"checked","maxspeed":"20","avgspeed":"10","volume":"30","deflection":"10"}
  //"strobimgsetdata":{"sample":"sample1","avgdeflection":46.92,"avgspeed":"","avgdrops":1,"cvdrops":0,"avgmaxspeed":4.84,"cvmaxspeed":3.4,"avgminspeed":4.84,"cvminspeed":3.4,"avgavgspeed":4.84,"cvavgspeed":3.4,"cvdeflection":8.32,"avgtotalvolume":678.24,"cvtotalvolume":0,"avgsignal":678.24,"cvsignal":0}
  //"runmode":{"strobpass":"0","on":"0"}
  if ($json['strobimgsetdata']['avgdrops'] > 0){
    if ($json['strobimgsetdata']['cvdrops'] > 0){ $json['runmode']['strobpass'] = 0; } 
    else {
      if (($json['strobcutoff']['maxspeedcheck'] == "checked") and ($json['strobimgsetdata']['cvmaxspeed'] > $json['strobcutoff']['maxspeed'])){ $json['runmode']['strobpass'] = 0; }
      else if (($json['strobcutoff']['avgspeedcheck'] == "checked") and ($json['strobimgsetdata']['cvavgspeed'] < $json['strobcutoff']['avgspeed'])){ $json['runmode']['strobpass'] = 0; }
      else if (($json['strobcutoff']['volume'] == "checked") and ($json['strobimgsetdata']['cvtotalvolume'] < $json['strobcutoff']['volume'])){ $json['runmode']['strobpass'] = 0; }
      else if (($json['strobcutoff']['deflection'] == "checked") and ($json['strobimgsetdata']['cvdeflection'] < $json['strobcutoff']['deflection'])){ $json['runmode']['strobpass'] = 0; }
      else if (($json['strobimgsetdata']['avgdeflection'] < $json['stroboscopedata']['maxdeflectx'])){ $json['runmode']['strobpass'] = 0; }
      else {  $json['runmode']['strobpass'] = 1; }
    }
  } else { $json['runmode']['strobpass'] = 0; }

  if ($json['runmode']['strobpass'] == 0){ logger($logger, 'Sample '.$sample.' FAILS strobcheck<br>',1); }
  else { logger($logger, 'Sample '.$sample.' PASSES strobcheck<br>',1); }

  closejson($json);
  return $msg;
}



function gearmanstrobsnap($pictnumber,$delay){
  $logger = './loggerdataset';
  $json = openjson();
  if ($json['strobcamon'] == 1){
    if (strlen($json['strobimages']['path']) < 1) {
     $prepath = "";
    }
    else {
     $prepath = $json['strobimages']['path']."/";
    }
    $msg = 'Images taken: ';
    $pictlist = '';
    $timestamp =  time();
    for($i=0;$i<$pictnumber;$i++){
     if($i>0){
      sleep($delay);
     }
     //1422473085_V110_P90_LD250.jpg
     if ($json['local'] == 0){
      $cmd = "sudo wget http://".$json['url'].":10000/?action=snapshot -O ".$prepath.$timestamp.$i."_V".$json['wavecontroller']['volts']."_P".$json['wavecontroller']['pulse']."_LD".$json['wavecontroller']['leddelay'].".jpg";
     }
     else {
      $cmd = "sudo wget http://".$json['servers']['strobcampi'].":8080/?action=snapshot -O ".$prepath.$timestamp.$i."_V".$json['wavecontroller']['volts']."_P".$json['wavecontroller']['pulse']."_LD".$json['wavecontroller']['leddelay'].".jpg";
     }
      if($i==0){
       $pictlist = $prepath.$timestamp.$i."_V".$json['wavecontroller']['volts']."_P".$json['wavecontroller']['pulse']."_LD".$json['wavecontroller']['leddelay'].".jpg";
      }
      else {
       $pictlist = $pictlist.",".$prepath.$timestamp.$i."_V".$json['wavecontroller']['volts']."_P".$json['wavecontroller']['pulse']."_LD".$json['wavecontroller']['leddelay'].".jpg";
      } 
      exec($cmd);
      $msg = $msg . $prepath.$timestamp.$i."_V".$json['wavecontroller']['volts']."_P".$json['wavecontroller']['pulse']."_LD".$json['wavecontroller']['leddelay'].".jpg<br>";
     }
    $json['strobimglist'] = $pictlist;
    $json['strobimgsetdata']['avgdrops'] = -1;
    $json['strobimgsetdata']['cvdrops'] = -1;
    $json['strobimgsetdata']['avgmaxspeed'] = -1;
    $json['strobimgsetdata']['cvmaxspeed'] = -1;
    $json['strobimgsetdata']['avgminspeed'] = -1;
    $json['strobimgsetdata']['cvminspeed'] = -1;
    $json['strobimgsetdata']['avgavgspeed'] = -1;
    $json['strobimgsetdata']['cvavgspeed'] = -1;
    $json['strobimgsetdata']['avgdeflection'] = -1;
    $json['strobimgsetdata']['cvdeflection'] = -1;
    $json['strobimgsetdata']['avgtotalvolume'] = -1;
    $json['strobimgsetdata']['cvtotalvolume'] = -1;
    $json['strobimgsetdata']['avgsignal'] = -1;
    $json['strobimgsetdata']['cvsignal'] = -1;
    $json['strobimgsetdata']['sample'] = '';
    sleep(1);
    logger($logger, $msg,1);
   }
   else {
     $msg = "Strobcam is off turn on: strobcam start<br>";
     logger($logger, $msg,1);
   }
  closejson($json);
  return $msg;
}


function gearmanheadcamsnap(){
  $logger = './loggerdataset';
  $json = openjson();
  $msg =  'HEAD CAMERA ('.$json['servers']['gantryhead'].') on<br>';
  if ($json['headcamon'] == 1){

 	if (strlen($json['gcodefile']['path']) < 1) {
	  $prepath = "";
	}
	else {
	  $prepath = $json['gcodefile']['path']."/";
	}
  	 $rampx = $json['trackxyz']['x'];
  	 $rampy = $json['trackxyz']['y'];
  	 $rampz = $json['trackxyz']['z'];
  	 $rampe = $json['trackxyz']['e'];
   	 $timestamp =  $_SERVER['REQUEST_TIME'];
  	 $json['positions']['file'] = $rampx."_".$rampy."_".$rampz."_".$rampe.".jpg"; //where you save the image file
  	 $json['positions']['rampx'] = $rampx;
  	 $json['positions']['rampy'] = $rampy;
  	 //echo 'snapped '.$json['positions']['file'].'<br>';
 	 if ($json['local'] == "0"){
   	  $cmd = "sudo wget http://".$json['url'].":8080/?action=snapshot -O ".$prepath.$json['positions']['file'];
   	  //echo $cmd;
   	  exec($cmd);
   	  $msg = "Headcam photo saved: ".$json['positions']['file']."<br>";
   	  logger($logger, $msg,1);
  	}
  	else {
   	 $cmd = "sudo wget http://".$json['servers']['gantryhead'].":8080/?action=snapshot -O ".$prepath.$rampx."_".$rampy."_".$rampz."_".$rampe.".jpg";
   	 //echo $cmd;
   	 exec($cmd);
   	 $msg = "Headcam photo saved: ".$json['positions']['file']."<br>";
   	 logger($logger, $msg,1);
  	}
	}
      else {
   	 $msg = "Headcam off ... to turn on enter: headcam start<br>";
   	 logger($logger, $msg,1);
	}
  closejson($json);
  return $msg;
}


function gearmangotodry(){
  $json = openjson();
  $logger = './loggerdataset';
  $counter = $json['washing']['tdrycurrpos'];
  if ($counter == count($json['washing']['tdrypositions'])){
   $msg = 'DRY PAD FULL ... resetting to first position<br>';
   $json['washing']['tdrycurrpos'] == 0;
  }
  else {
   $msg = 'Tip at dry position<br>';
  }
  $posx = $json['washing']['tdrypositions'][$counter]['x'];
  $posy = $json['washing']['tdrypositions'][$counter]['y'];
  $posxy = 'G1X'.$posx.'Y'.$posy.'F'.$json['xyfeedrate'];
  $json = smoothiesocketmove($posxy,$json,$logger);
  $posz = 'G1Z'.$json['washing']['tdryzpos'].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  $json['washing']['tdrycurrpos'] = $json['washing']['tdrycurrpos'] + 1;
  closejson($json);
  return $msg;
}

function gearmangotostrob(){
  $json = openjson();
  $logger = './loggerdataset';
  $posx = $json['strobparameters']['x'];
  $posy = $json['strobparameters']['y'];
  $posxy = 'G1X'.$posx.'Y'.$posy.'F'.$json['xyfeedrate'];
  $json = smoothiesocketmove($posxy,$json,$logger);
  $posz = 'G1Z'.$json['strobparameters']['z'].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  closejson($json);
  return $msg;
}


function gearmandry($time){
  $json = openjson();
  $logger = './loggerdataset';
  $lacz = $json['washing']['tdrylazpos'];
  $json = movep1lac($json,$logger,$lacz);
  sleep($time);
  $lacz = '0500';
  $json = movep1lac($json,$logger,$lacz);
  closejson($json);
  $msg ='Dry finished<br>';
  return $msg;
}

function gearmangotowash(){
  $json = openjson();
  $logger = './loggerdataset';
  //"washx":"118","washy":"56","washz":"77"
  $posxy = 'G1X'.$json['washing']['washx'].'Y'.$json['washing']['washy'].'F'.$json['xyfeedrate'];
  $json = smoothiesocketmove($posxy,$json,$logger);
  $posz = 'G1Z'.$json['washing']['washz'].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  closejson($json);
  $msg = 'posxy '.$posxy.' poz '.$posz.'<br>';
  //$msg = 'Tip at wash position<br>';
  return $msg;
}


function gearmangotowaste(){
  $json = openjson();
  $logger = './loggerdataset';
  $posxy = 'G1X'.$json['washing']['wastex'].'Y'.$json['washing']['wastey'].'F'.$json['xyfeedrate'];
  $json = smoothiesocketmove($posxy,$json,$logger);
  $posz = 'G1Z'.$json['washing']['wastez'].'F'.$json['zfeedrate'];
  $json = smoothiesocketmove($posz,$json,$logger);
  closejson($json);
  $msg = 'posxy '.$posxy.' poz '.$posz.'<br>';
  //$msg = 'Tip at wash position<br>';
  return $msg;
}



function gearmanwash($time){
  $logger = './loggerdataset';
  $json = openjson();
  $time = ($json['washing']['washtime']);
  $flowrate = $json['washing']['syringepumpflorate'];
  $json = movep1lac($json,$logger,'3000');
  gearmanpressuresocketclient('WASHON',$json);
  sleep(2);
  gearmanpressuresocketclient('DRYON',$json);
  //$voltry = $json['syringepump']['trackaspvol'].'_20';
  //gearmandispense($volrty);
  $delay = ($json['syringepump']['trackaspvol'] / 10)+2;
  $dispensevol = $json['syringepump']['trackaspvol'];
  $cmd = 'W'.($time).'_'.$flowrate.'_'.$dispensevol;
  //$cmd = 'W'.($time-6).'_'.$flowrate;
  syringesocketclient($cmd,$json);
  sleep($time+$delay);
  gearmanpressuresocketclient('WASHOFF',$json);
  sleep(2);
  gearmanpressuresocketclient('DRYOFF',$json);
  $json = movep1lac($json,$logger,'0500');
  $json['syringepump']['trackaspvol'] = 0;
  closejson($json);
  $msg = 'Washing '.$time.' finished<br>';
  return $msg;
}


//Taskjob is the code that is run by gearman system
function taskjob($msg,$func){
        $logger = './taskjob';
        $jsonjob = json_decode(file_get_contents($logger), true);
        if ($func == 0){ 
	 $jsonjob['transferlist'] = array();
        }
        array_push($jsonjob['transferlist'],$msg);
        file_put_contents($logger, json_encode($jsonjob));
}



//readgcode is cool because then you can annotate your gcode
function readgcodefile($gcodefiledat,$json) {
   $json['tranferslistfile'] = 1;
   $mcode = array();
   $gmvcode = array();
   $cmdset = array();
   $ct = 0;
   taskjob("",0);
   foreach ($gcodefiledat as $line_num => $line) {
    $line = preg_replace('/\n/', '', $line);
   /*
    if (preg_match('/^CD/', $line)){
     preg_match('/^CD(.*)$/', $line,$matches);
     $json['gcodefile']['path'] = $matches[0];
     array_push($cmdset, $line);
    }
   //This is basically deprecated
    if (preg_match('/^M/', $line)){
        array_push($mcode, $line);
        array_push($cmdset, $line);
   }
   //This is basically deprecated
    if (preg_match('/^D/', $line)){
        array_push($cmdset, $line);
   }
   //This is basically deprecated
    if (preg_match('/^IH/', $line)){
        array_push($cmdset, $line);
   }
   */
   //$gmworker->addFunction("move", "move");
    if (preg_match('/^G/', $line)){
        array_push($gmvcode, $line);
        array_push($cmdset, $line);
	//so this goes to the gearman through taskjob
        taskjob('move '.$line,1);
   }
   //$gmworker->addFunction("P1move", "P1move");
    if (preg_match('/^P1move/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("P1position", "P1position");
    if (preg_match('/^P1position/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("P1stop", "P1stop");
    if (preg_match('/^P1stop/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }




   //$gmworker->addFunction("wash", "wash");
    if (preg_match('/^wash/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("dry", "dry");
    if (preg_match('/^dry/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("delay", "delay");
    if (preg_match('/^delay/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("headcamsnap", "headcamsnap");
    if (preg_match('/^headcamsnap/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("strobsnap", "pictdelay");
    if (preg_match('/^strobsnap/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("analyzestrobimgs", "analyzestrobimg");
    if (preg_match('/^analyzestrobimgs/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }

   //$gmworker->addFunction("fire", "fire");
    if (preg_match('/^fire/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("setdrops", "setdrops");
    if (preg_match('/^setdrops/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("aspirate", "aspirate");
    if (preg_match('/^aspirate/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("dispense", "dispense");
    if (preg_match('/^dispense/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("setpumpflowrate", "setpumpflowrate");
    if (preg_match('/^setpumpflowrate/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("setpumpvalve", "setpumpvalve");
    if (preg_match('/^setpumpvalve/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("gotodry", "gotodry");
   if (preg_match('/^gotodry/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("gotowash", "gotowash");
   if (preg_match('/^gotowash/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("gotowaste", "gotowaste");
   if (preg_match('/^gotowaste/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   //$gmworker->addFunction("gotostrob", "gotostrob");
   if (preg_match('/^gotostrob/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
//$gmworker->addFunction("strobon", "strobon");
   if (preg_match('/^strobon/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
//$gmworker->addFunction("stroboff", "stroboff");
   if (preg_match('/^stroboff/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
//$gmworker->addFunction("gotowell", "gotowell");
   if (preg_match('/^gotowell/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
//$gmworker->addFunction("backtoz", "backtoz");
   if (preg_match('/^backtoz/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
//$gmworker->addFunction("runmode", "runmode");
   if (preg_match('/^runmode/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }


/*
//Syringe pump stuff
//$gmworker->addFunction("hts_s1_syringesettings", "hts_s1_syringesettings");
   if (preg_match('/^hts_s1_syringesettings/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }


//$gmworker->addFunction("hts_s1_steps", "hts_s1_steps");
   if (preg_match('/^hts_s1_setsteps/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }

//$gmworker->addFunction("hts_s1_steprate", "hts_s1_steprate");
   if (preg_match('/^hts_s1_setsteprate/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }

//$gmworker->addFunction("hts_s1_retractsetsteps", "hts_s1_retractsetsteps");
   if (preg_match('/^hts_s1_retractsetsteps/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }


//$gmworker->addFunction("hts_s1_retractsetsteprate", "hts_s1_retractsetsteprate");
   if (preg_match('/^hts_s1_retractsetsteprate/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }

//$gmworker->addFunction("hts_s1_aspirate", "hts_s1_aspirate");
   if (preg_match('/^hts_s1_aspirate/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }

//$gmworker->addFunction("hts_s1_dispense", "hts_s1_dispense");
   if (preg_match('/^hts_s1_dispense/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_homing", "hts_s1_homing");
   if (preg_match('/^hts_s1_homing/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}
*/
//$gmworker->addFunction("hts_s1_valveinput", "hts_s1_valveinput");
   if (preg_match('/^hts_s1_valveinput/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_valveoutput", "hts_s1_valveoutput");
   if (preg_match('/^hts_s1_valveoutput/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_valvebypass", "hts_s1_valvebypass");
   if (preg_match('/^hts_s1_valvebypass/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}
/*
//$gmworker->addFunction("hts_s1_contbackgo", "hts_s1_contbackgo");
   if (preg_match('/^hts_s1_contbackgo/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_contforgo", "hts_s1_contforgo");
   if (preg_match('/^hts_s1_contforgo/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_contstop", "hts_s1_contstop");
   if (preg_match('/^hts_s1_contstop/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("hts_s1_forward", "hts_s1_forwordgo");
   if (preg_match('/^hts_s1_forward/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}


//$gmworker->addFunction("hts_s1_backward", "hts_s1_backwardgo");
   if (preg_match('/^hts_s1_backward/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

*/





//$gmworker->addFunction("headcamstreamon", "headcamstreamon");
   if (preg_match('/^headcamstreamon/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

//$gmworker->addFunction("headcamstreamoff", "headcamstreamoff");
   if (preg_match('/^headcamstreamoff/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}

/*
//$gmworker->addFunction("move_hts_s1_dispense", "move_hts_s1_dispense");
   if (preg_match('/^move_hts_s1_dispense/', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
}
*/




   // like code 2 forward slashes indicates commenting out
   if (preg_match('/^\/\//', $line)){
        array_push($cmdset, $line);
        taskjob($line,1);
   }
   $ct = $ct + 1;
  }
  $json['gcodefile']['mlines'] = $mcode;
  $json['gcodefile']['gmvlines'] = $gmvcode;
  $json['gcodefile']['lines'] = $cmdset;
  fclose($fh);
  taskjob('finish 0',1);
  $imgdataset = './imgdataset';
  file_put_contents($imgdataset, json_encode($json));
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}



function reportp1lacposition($json,$logger){
      if ($json['headcamlinearactuatorsocket'] == 1){
	$json = headcam_linearactuatorsocketclient('P1position',$json);
	$msg =  'P1 axis position is: '.$json['P1position'].'<br>';
	logger($logger, $msg,1);
      }
	else {
 	 logger($logger, 'Headcam and linear actuator socket is down to run: headcam_linearactuatorsocket start<br>',1);
	}
	return $json;
}



//from the gearmanworker
// $json = movep1lac($json,$logger,$workload);

function movep1lac($json,$logger,$position){
        if ($json['headcamlinearactuatorsocket'] == 1){
   	  $json = headcam_linearactuatorsocketclient('P1move '.$position,$json);
 	  $json['P1position'] = $position;
	  $msg =  'P1 axis position to: '.$position.'<br>';
	  logger($logger, $msg,1);
        }
 	else {
  	 logger($logger, 'Headcam and linearactuator socket is down to run: headcam_linearactuatorsocket start<br>',1);
 	}
	return $json;
}

function killp1lac($json,$logger){
      if ($json['headcamlinearactuatorsocket'] == 1){
	$json = headcam_linearactuatorsocketclient('P1off',$json);
	$msg =  'Turning P1 motor off<br>';
	logger($logger, $msg,1);
      }
	else {
 	 logger($logger, 'Headcam and linearactuator socket is down to run: headcam_linearactuatorsocket start<br>',1);
	}
	return $json;
}



//report the position
function reportpos($json){
 $serial = connect();
 //$serial->sendMessage("\r\n");
 sleep(0.5);
 $serial->sendMessage("M114\r\n");
 $data = $serial->readPort();
 $serial->deviceClose();
 $dray = preg_split('/\n/', $data);
 var_dump($day);
 //$pos = $dray[count($dray)-2];
 //$json['smoothiemessage'] = $pos;
 //$out = parsersetoutput($json['smoothiemessage']);
 //$cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 //$json['ramplastcommand'] = $cmd;
 return $json;
}

//connects to the smoothieware Azteeg board 
function connect(){
 error_reporting(E_ALL);
 ini_set('display_errors', '1');
 $serial = new phpSerial;
 $serial->deviceSet("/dev/ttyACM1");
 $serial->confBaudRate(115200);
 $serial->confParity("none");
 $serial->confCharacterLength(8);
 $serial->confStopBits(1);
 $serial->deviceOpen();
 return($serial);
}


function smoothiesocketreportposition($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else
	{
	if (preg_match('/^M114/', $cmd)){
	  fputs ($fp, 'M114');
          $result = fread($fp, 1024);
 	  $json['smoothiemessage'] = $result;
 	  $out = parsersetoutput_v2($result);
	  if ($json['trackxyz']['f'] == ''){
	   $json['trackxyz']['f'] = "1000";
	  }
 	  $cmd =  'G1 X'.$out["X"].' Y'.$out["Y"].' Z'.$out["Z"].' E'.$json['trackxyz']['e'].' F'.$json['trackxyz']['f'];
	  $json['trackxyz']['x'] = $out["X"];
	  $json['trackxyz']['y'] = $out["Y"];
	  $json['trackxyz']['z'] = $out["Z"];
	  $json['trackxyz']['e'] = $out["E"];
 	  $json['ramplastcommand'] = $cmd;
	}
	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}


function smoothiesocketsetposition($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	echo 'this is called<br>';
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	#set steps per mm
	if (preg_match('/^M92/', $cmd)){
	  #"M92 X100.631 Y113.75 Z1637.8"
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
 	  $json['M92'] = $result;
	  echo $json['M92'];
	}

	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}





function smoothiesocketendstopstatus($json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	#get endstop status
	fputs ($fp,'M119');
	$result = fread ($fp, 1024);
 	$json['smoothiemessage'] = $result;
	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}




function smoothiesocketversion($json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	#get endstop status
	fputs ($fp,'version');
	$result = fgets ($fp, 1024);
	preg_match("/^.*(Build version.*)<htsrepstrap>.*$/",$result, $foundstr); //, $result);
 	$json['smoothiemessage'] = $foundstr[1];
	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}




function smoothiesocketfan($cmd, $json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	#trigger using fan pin on smoothie
	fputs ($fp, $cmd);
	$result = fgets ($fp, 1024);
 	$json['smoothiemessage'] = $result;
	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}





function smoothiesocketclear($json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	#get endstop status
	fputs ($fp,'clear');
	$result = fgets ($fp, 1024);
 	$json['smoothiemessage'] = $result;
	fclose ($fp);
	}
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}



function smoothiesockethoming($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	*/
	else
	{
	fputs ($fp,$cmd);
	//$result = fread ($fp, 1024);
	fclose ($fp);
	}
	#Homing Y axis X:0.000 Y:0.000 Z:0.000 E:0.00
   	/*
	preg_match('Homing .*(X.*)',$result,$pos);
	$pos = preg_replace(":", "", $pos);
	$pos = preg_replace(" ", "", $pos);
	$pos = 'G1'.$pos;
	*/

	if (preg_match('/*.X/', $cmd)){
         $json['trackxyz']['x'] = 0;
	}
	if (preg_match('/*.Y/', $cmd)){
         $json['trackxyz']['y'] = 0;
	}
	if (preg_match('/*.Z/', $cmd)){
         $json['trackxyz']['z'] = 0;
	}
         $cmd = 'G1X'.$json['trackxyz']['y'].'Y'.$json['trackxyz']['y'].'Z'.$json['trackxyz']['z'].'F'.$json['trackxyz']['f'];
 	$json['smoothiemessage'] = $cmd;
 	$json['ramplastcommand'] = $cmd;
  	$imgdataset = './imgdataset';
  	file_put_contents($imgdataset, json_encode($json));
  	$json = json_decode(file_get_contents($imgdataset), true);
	return $json;
}



function smoothiesocketopen(){
  $host=$json['servers']['smoothiedriver'];
  $port = 8888;
  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
   return $fp;
}


function smoothiesocketreset($resetcmd,$json,$logger){

  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
  fputs ($fp,$resetcmd);
  $result = fgets ($fp, 1024);
  fclose ($fp);
  //logger($logger, 'Reset: '.$resetcmd.' '.$result.'<br>',1);

  $imgdataset = './imgdataset';
  file_put_contents($imgdataset, json_encode($json));
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}


function smoothiesocketcpureset($json,$logger){
  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
  $resetcmd = 'reset smoothie';
  fputs ($fp,$resetcmd);
  $result = fgets ($fp, 1024);
  fclose ($fp);
  logger($logger, 'Reset: '.$resetcmd.' '.$result.'<br>',1);
  $imgdataset = './imgdataset';
  file_put_contents($imgdataset, json_encode($json));
  $json = json_decode(file_get_contents($imgdataset), true);
  return $json;
}






function addsubhys($var,$smallvar,$before,$current,$future,$hysfuture,$json){ 
  $flag = 0;
  if (($before[$var] > $current[$var]) and ($current[$var] < $future[$var])){
	$flag = 1;
	//echo 'adding '.$json['hysteresis'][$smallvar];
	$hysfuture[$var] = $future[$var] + $json['hysteresis'][$smallvar];
  }
  else if (($before[$var] < $current[$var]) and ($current[$var] >$future[$var])){
	$flag = 1;
	//echo 'subtracting '.$json['hysteresis'][$smallvar];
	$hysfuture[$var] = $future[$var] - $json['hysteresis'][$smallvar];
  }
 if (($hysfuture['flag'] == 0) and ($flag == 1)){
 	$hysfuture['flag'] = $flag;
 }
 return $hysfuture;
}





function checksmoothiesocketmove($gcodecmd,$json,$logger){

  //logger($logger, '<br>----->Moving to: '.$gcodecmd,1);
  $json = smoothiesocketreportposition('M114',$json);
  
  //echo 'Before last position: \n';
  $before = getgcoords($json['ramppenultimatecommand'],$json);
  $current = getgcoords($json['ramplastcommand'],$json);
  $future = getgcoords($gcodecmd,$json);

  //now checking direction
  $hysfuture = $future;
  $hysfuture['flag'] = 0;
  $hysfuture = addsubhys('X','x',$before,$current,$future,$hysfuture,$json);
  $hysfuture = addsubhys('Y','y',$before,$current,$future,$hysfuture,$json);
  $hysfuture = addsubhys('Z','z',$before,$current,$future,$hysfuture,$json);
  
  echo '<br>Flag: '.$hysfuture['flag'].'<br>';
  echo 'Before: '.$before['X'].'<br>';
  echo 'Current: '.$current['X'].'<br>';
  echo 'Want: '.$future['X'].'<br>';
  echo 'Really got to go: '.$hysfuture['X'].'<br>';
  echo '<br>';
  $futureg = "G1X".$future['X']."Y".$future['Y']."Z".$future['Z']."F".$json['trackxyz']['f'];
  $currentg = "G1X".$current['X']."Y".$current['Y']."Z".$current['Z']."F".$json['trackxyz']['f'];
  echo $futureg.'<br>'; 
  echo $currentg.'<br>'; 
  return $json;
} 





function smoothiesocketrelativemove($json,$logger,$dir,$moveval){
  //logger($logger, '<br>----->Moving to: '.$gcodecmd,1);
  //$json = smoothiesocketreportposition('M114',$json);
  //echo $json['ramplastcommand']."\r\n";
  echo $dir."\r\n";
  $modgcode = 'G1 '.$json['trackxyz']['x'].' Y'.$json['trackxyz']['y'].' Z'.$json['trackxyz']['z'].' F'.$json['trackxyz']['z'];
  echo "before: ".$modgcode."\r\n";
  if ($dir == 'X'){
   $json['trackxyz']['x'] = ($json['trackxyz']['x'] + $moveval);
  }
  if ($dir == 'Y'){
   $json['trackxyz']['y'] = ($json['trackxyz']['y'] + $moveval);
  }
  if ($dir == 'Z'){
   $json['trackxyz']['z'] = ($json['trackxyz']['z'] + $moveval);
  }
  $modgcode = 'G1 X'.$json['trackxyz']['x'].' Y'.$json['trackxyz']['y'].' Z'.$json['trackxyz']['z'].' F'.$json['trackxyz']['f'];

  echo $modgcode."\r\n";
  //Now start the moving
  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
  fputs($fp,$modgcode);
  fread($fp, 1024);
  fclose ($fp);
  //Reset the direction tracker
  /*
  $futureg = "G1 X".$future['X']." Y".$future['Y']." Z".$future['Z']." E".$future['E']." F".$feedrate;
  $currentg = "G1 X".$current['X']." Y".$current['Y']." Z".$current['Z']." E".$future['E']." F".$feedrate;
  $json['ramppenultimatecommand'] = $currentg;
  $json['ramplastcommand'] = $futureg;

  */
  //First part of display
  //$msg = '<br><br>Present '.$currentg.'---> Moving to '.$modgcodecmd.' ---> After move at: '.$futureg.'';
  // logger($logger, $msg,1);
   $imgdataset = './imgdataset';
   file_put_contents($imgdataset, json_encode($json));
   $json = json_decode(file_get_contents($imgdataset), true);
   return $json;
}



function smoothiesocketmove_deprecated($gcodecmd,$json,$logger){
  $before = getgcoords($json['ramppenultimatecommand'],$json);
  $current = getgcoords($json['ramplastcommand'],$json);
  $future = getgcoords($gcodecmd,$json);
  if ($future['F'] > 0){
   //echo 'use this feedrate '.$future['F'].'<br>';
   $feedrate = $future['F'];
  }
  else {
   //echo 'use trackxyx feedrate '.$json['trackxyz']['f'].'<br>';
   $feedrate = $json['trackxyz']['f'];
  }
  //now checking direction
  $hysfuture = $future;
  $hysfuture['flag'] = 0;
  $hysfuture = addsubhys('X','x',$before,$current,$future,$hysfuture,$json);
  $hysfuture = addsubhys('Y','y',$before,$current,$future,$hysfuture,$json);
  $hysfuture = addsubhys('Z','z',$before,$current,$future,$hysfuture,$json);
  //Is there a feed rate with this gcodecmd?
  //This is the calculated modified gcode
  $modgcodecmd = "G1X".$future['X']."Y".$future['Y']."Z".$future['Z']."E".$future['E']."F".$feedrate;
  //$json = gcodecoordtrack($modgcodecmd,$json);
  $json = gcodecoordtrack($modgcodecmd,$json);
  //echo $modgcodecmd."\n";
  //Delay before move maybe not needed
  //sleep(0.5);

  /*
  //Now start the moving
  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
  fputs ($fp,$modgcodecmd);
  $result = fread($fp, 1024);
  fclose ($fp);
  */
  //Reset the direction tracker
  $futureg = "G1X".$future['X']."Y".$future['Y']."Z".$future['Z']."E".$future['E']."F".$feedrate;
  $currentg = "G1X".$current['X']."Y".$current['Y']."Z".$current['Z']."E".$future['E']."F".$feedrate;
  $hysfutureg = "G1X".$hysfuture['X']."Y".$hysfuture['Y']."Z".$hysfuture['Z']."E".$future['E']."F".$feedrate;
  $json['ramppenultimatecommand'] = $currentg;
  $json['ramplastcommand'] = $futureg;
  //$json['ramplastcommand'] = $gcodecmd;

  //First part of display
  $msg = '<br><br>Present '.$currentg.'---> Moving to '.$modgcodecmd.' ---> After move at: '.$futureg.'';

  $json['smoothiemessage'] = $result;
  $json['ramplastcommand'] = $result;
  $json['reset']['on'] = 0;

   $imgdataset = './imgdataset';
   file_put_contents($imgdataset, json_encode($json));
   $json = json_decode(file_get_contents($imgdataset), true);
   return $json;

}


function smoothiesocketmove($gcodecmd,$json,$logger){
  //echo "the gcode testing ".$gcodecmd."\n";
  $gcodecmd = gcodeset($gcodecmd);
  echo "the gcode ".$gcodecmd."\n";
  //Now start the moving
  $fp = fsockopen ($json['servers']['smoothiedriver'], 8888, $errno, $errstr);
  if (!$fp)   	{	echo "Error: could not open socket connection<br>";   }
  fputs ($fp,$gcodecmd);
  fclose ($fp);
  $json['ramplastcommand'] = $gcodecmd;
  $imgdataset = './imgdataset';
  //$json = json_decode(file_get_contents($imgdataset), true);
  closejson($json);
  return $json;
}

function gcodeset($a){
 $json = openjson();
 $a = preg_replace("/ /", "", $a);
 $c = preg_split('//', $a, -1, PREG_SPLIT_NO_EMPTY);
 $b = preg_split('/[G|g|X|x|Y|y|Z|z|E|e|F|f]/', $a, -1, PREG_SPLIT_OFFSET_CAPTURE);

 $ct = 0;
 $d = array();
 $msg = "";
 foreach ($b as $key => $value){
  if ($ct > 0){ 
   $symbol = $c[$value[1]-1];
   $details = $value[0];
   $msg = $msg.$symbol.$details." ";
  }
  $ct = $ct + 1;
 }
 $msg = preg_replace("/ $/", "", $msg);
 $coords = preg_split("/ /", $msg);
 $x = '';
 $y = '';
 $z = '';
 $e = '';
 $f = '';
 foreach ($coords as $key => $value){
  if (preg_match("/^X|x.*/", $value)){
   $x = preg_replace("/X|x/", "", $value);
  }
  else if (preg_match("/^Y|y.*/", $value)){
   $y = preg_replace("/Y|y/", "", $value);
  }
  else if (preg_match("/^Z|z.*/", $value)){
   $z = preg_replace("/Z|z/", "", $value);
  }
  else if (preg_match("/^E|e.*/", $value)){
   $e = preg_replace("/E|e/", "", $value);
  }
  else if (preg_match("/^F|f.*/", $value)){
   $f = preg_replace("/F|f/", "", $value);
  }
 }
  $dry = array("X"=>$x, "Y"=>$y, "Z"=>$z, "F"=>$f, "E"=>$e);
  if (strlen($dry['X']) > 0){$json['trackxyz']['x'] = $x;}
  if (strlen($dry['Y']) > 0){$json['trackxyz']['y'] = $y;}
  if (strlen($dry['Z']) > 0){$json['trackxyz']['z'] = $z;}
  if (strlen($dry['E']) > 0){$json['trackxyz']['e'] = $e;}
  if (strlen($dry['F']) > 0){$json['trackxyz']['f'] = $f;}

  closejson($json);
  return $msg;
 }













































/*


function smoothiesocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['smoothiedriver'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else if ($json['smoothiesocket'] == "0"){
	 echo 'Socket closed<br>';
	}
	else
	{

	#homing
	if (preg_match('/^G28/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fgets ($fp, 1024);
	  $pos = $result;
	  //ok C: X:0.000 Y:0.000 Z:0.000 E:0.000
 	  $json['smoothiemessage'] = $pos;
 	  $out = parsersetoutput($json['smoothiemessage']);
 	  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 	  $json['ramplastcommand'] = $cmd;
	}
	#simple move without hysterisis
	if (preg_match('/^G1/', $cmd)){
	  fputs ($fp, $cmd);
	  fputs ($fp, "M400");
	  fputs ($fp, "M114");
	  $result = fgets ($fp, 1024);
	  $pos = $result;
	  //ok C: X:0.000 Y:0.000 Z:0.000 E:0.000
 	  $json['smoothiemessage'] = $pos;
 	  $out = parsersetoutput($json['smoothiemessage']);
 	  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 	  $json['ramplastcommand'] = $cmd;
 	  $json['smoothiemessage'] = $pos;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
}

*/






function poscalc($cx,$cy,$rampx,$rampy,$json){
 //$json['grid']['spacex'];
 //$json['grid']['spacey'];
 $scale = (1000 / $json['grid']['spacex']);
 //echo 'scale: '.$scale.'<br>';
 //echo 'rampx: '.$rampx.'<br>';
 //echo 'rampy: '.$rampy.'<br>';
 //when first developing this I set it at 20um per pixel but not the variable will be passed
 $position = array();
 if ($cx < 160){
   $calcx = $rampx-(((160-$cx)*$scale)/1000);
  }
  else if ($cx > 160){
   $calcx = ((($cx-160)*$scale)/1000)+$rampx;
  }
  else {
   $calcx = $rampx;
  }
  if ($cy < 120){
   $calcy = $rampy-(((120-$cy)*$scale)/1000);
  }
  else if ($cy > 120){
   $calcy = ((($cy-120)*$scale)/1000)+$rampy;
  }
  else {
   $calcy = $rampy;
  }
 $position[0] = $calcx;
 $position[1] = $calcy;
 return $position;
}




function coordfunction($coord){

  preg_match('/<cx>(.*)<\/cx>/', $coord, $cx);
  preg_match('/<cy>(.*)<\/cy>/', $coord, $cy);
  preg_match('/<sptmean>(.*)<\/sptmean>/', $coord, $sptmean);
  preg_match('/<sptdia>(.*)<\/sptdia>/', $coord, $sptdia);
  preg_match('/<bckmean>(.*)<\/bckmean>/', $coord, $bckmean);
  preg_match('/<sn>(.*)<\/sn>/', $coord, $sn);
  preg_match('/<sr>(.*)<\/sr>/', $coord, $sr);
  preg_match('/<sc>(.*)<\/sc>/', $coord, $sc);
  $coord = array("cx"=>$cx[1], "cy"=>$cy[1], "sptmean"=>$sptmean[1], "sptdia"=>$sptdia[1], "bckmean"=>$bckmean[1], "sn"=>$sn[1], "sr"=>$sr[1], "sc"=>$sc[1]);
  return $coord;
}


//smoothie board
//this gets the version
function endstopstatus($json){
 $cmd = 'sudo python smoothiedriverlib.py M119';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['smoothiemessage'] = $data;
 fclose($stream);
 return $json;
}

function smoothiesetsteps($pcmd,$json){
 //X:100.631 Y:113.75 Z:1637.8 F:60 E:140
 $cmd = 'sudo python smoothiedriverlib.py "'.$pcmd.'"';
 echo $cmd.'<br>';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['M92'] = $data;
 fclose($stream);
 return $json;
}


//report the position
function areportpos($json){
 $cmd = 'sudo python smoothiedriverlib.py M114';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['smoothiemessage'] = $data;
 fclose($stream);
 $out = parsersetoutput($json['smoothiemessage']);
 $pout =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 $json['ramplastcommand'] = $pout;
 return $json;
}



//this gets the version
function pingsmoothie($json){
 $cmd = 'sudo python smoothiedriverlib.py version';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 $json['smoothiemessage'] = $data;
 fclose($stream);
 return $json;
}

function trigger($dir,$json){
 $cmd = 'sudo python smoothiedriverlib.py '.$dir;
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 $json['smoothiemessage'] = $data;
 return $json;
}

function disablesteppers($dir,$json){
 $cmd = 'sudo python smoothiedriverlib.py M18';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 $json['smoothiemessage'] = $data;
 return $json;
}






//homing function
//function homephp($dir,$json){
function homephp($dir,$json){
 $cmd = 'sudo python smoothiedriverlib.py "'.$dir.'"';
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 $stream = ssh2_exec($ssh, $cmd);
 stream_set_blocking($stream, true);
 $data = '';
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 fclose($stream);
 $json['smoothiemessage'] = $data;
 $out = parsersetoutput($json['smoothiemessage']);
 $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
 $json['ramplastcommand'] = $cmd;
 return $json;
}



//This moves factors is backlash (hysteresis)
//  $json = determinehysteresis($gcodecmd,$json['ramppenultimatecommand'], $json['rampprepenultimatecommand'],$json,$imgdataset, $logger);
function pymove($gcodecmd,$json,$imgdataset,$logger){
  $lastg = $json['ramppenultimatecommand'];
  $peng = $json['rampprepenultimatecommand'];
  $json['rampprepenultimatecommand'] = $json['ramppenultimatecommand'];
  $json['ramppenultimatecommand'] = $json['ramplastcommand'];
  $json['ramplastcommand'] = $gcodecmd;

  echo '1: '.$gcodecmd.'<br>'; 
  //This is the calculated modified gcode
  $currgy = getgcoords($gcodecmd,$json);

  $modgcodecmd = "G1X".$currgy['X']."Y".$currgy['Y']."Z".$currgy['Z']."F".$currgy['F'];
  echo '2: '.$modgcodecmd.'<br>';


  if (($currgy['X'] == '') or ($currgy['Y'] == '') or ($currgy['Z'] == '')){
    $json = reportpos($json);
  }

  $prevcurrgy = $currgy;
  $lastgy = getgcoords($lastg,$json);
  $pengy = getgcoords($peng,$json);

  $fx = 0;
  $fy = 0;
  $fz = 0;
  if (($currgy['X'] < $lastgy['X']) and ($pengy['X'] < $lastgy['X'])) {$fx = 1;}
  if (($currgy['Y'] < $lastgy['Y']) and ($pengy['Y'] < $lastgy['Y'])) {$fy = 1;}
  if (($currgy['Z'] < $lastgy['Z']) and ($pengy['Z'] < $lastgy['Z'])) {$fz = 1;}
  if (($currgy['X'] > $lastgy['X']) and ($pengy['X'] > $lastgy['X'])) {$fx = 2;}
  if (($currgy['Y'] > $lastgy['Y']) and ($pengy['Y'] > $lastgy['Y'])) {$fy = 2;}
  if (($currgy['Z'] > $lastgy['Z']) and ($pengy['Z'] > $lastgy['Z'])) {$fz = 2;}

  if ($fx == 1) {  $currgy['X'] = $currgy['X'] - $json['hysteresis']['x']; } 
  if ($fx == 2) {  $currgy['X'] = $currgy['X'] + $json['hysteresis']['x']; } 
  if ($fy == 1) {  $currgy['Y'] = $currgy['Y'] - $json['hysteresis']['y']; } 
  if ($fy == 2) {  $currgy['Y'] = $currgy['Y'] + $json['hysteresis']['y']; } 
  if ($fz == 1) {  $currgy['Z'] = $currgy['Z'] - $json['hysteresis']['z']; } 
  if ($fz == 2) {  $currgy['Z'] = $currgy['Z'] + $json['hysteresis']['z']; } 





  $hysflag = array('FX'=>$fx, 'FY'=>$fy, 'FZ'=>$fz, 'X'=>$prevcurrgy['X'], 'Y'=>$prevcurrgy['Y'], 'Z'=>$prevcurrgy['Z'], 'F'=>$prevcurrgy['F']);
  $json = gcodecoordtrack($gcodecmd,$json);

  //This is the calculated modified gcode
  $modgcodecmd = "G1X".$currgy['X']."Y".$currgy['Y']."Z".$currgy['Z']."F".$currgy['F'];
  echo $modgcodecmd.'<br>';


  /*
  file_put_contents($imgdataset, json_encode($json));

  */
  
  $cmd = 'sudo python smoothiedriverlib.py "'.$modgcodecmd.'"';
  echo $cmd.'<br>';
  $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
  include('smoothiedriver.php');
  //$stream = ssh2_exec($ssh, $cmd);
  //stream_set_blocking($stream, true);
  //fclose($stream);
  $json = reportpos($json);
  $out = parsersetoutput($json['smoothiemessage']);
  $cmd =  'G1X'.$out["X"].'Y'.$out["Y"].'Z'.$out["Z"].'F'.$json['trackxyz']['f'];
  $json['ramplastcommand'] = $cmd;
  

  $imgdataset = './imgdataset';
  $json = json_decode(file_get_contents($imgdataset), true);

  logger($logger, $modgcodecmd.'<br>',1);

  /*
 

  if (($fx > 0) or ($fy > 0) or ($fz > 0)){
   sleep(0.1);
   $setpos = "G92X".$prevcurrgy['X']."Y".$prevcurrgy['Y']."Z".$prevcurrgy['Z'];
   //echo "reset positions: ".$setpos."<br>";
   $cmd = 'python move.smoothie.move.py '.$setpos.' 2';
   exec($cmd);
   $cmd = 'sudo python smoothiedriverlib.py "'.$setpos.'"';
   $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
   include('smoothiedriver.php');
   $stream = ssh2_exec($ssh, $cmd);
   stream_set_blocking($stream, true);
   fclose($stream);
   logger($logger, 'hysteresis compensated '.$setpos.'<br>',1);
  }

  $json['trackxyz']['x'] = $prevcurrgy['X'];
  $json['trackxyz']['y'] = $prevcurrgy['Y'];
  $json['trackxyz']['z'] = $prevcurrgy['Z'];

  */

  return $json;
}



//Relays
//Relay and linear actuator on marlin8pi 
function powerrelaysocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['powerpumpsraspi'];
	$port = 8888;
	//echo $cmd;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	/*
	else if ($json['stop'] == "1"){
	 echo 'System halt, you need press GO button<br>';
	}
	*/
	else
	{
	if (preg_match('/^liquidlevel/', $cmd)){
	  fputs ($fp, $cmd);
	  $result = fread ($fp, 1024);
	  //echo 'the result: '.$result.'<br>';
	  $json['pressure']['read'] = $result;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
	fclose ($fp);
	}
	return $json;
}



//syringesocketserver
function syringesocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['powerpumpsraspi'];
	$port = 8887;
	//echo $cmd;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else	{
	if (preg_match('/s1 settings/', $cmd)){
	 fputs ($fp, 's1 settings');
	 $result = fread($fp, 1024);
	 //echo '<br>Piezo amplifier1 settings: '.$result.'<br>';
	 while (strlen($result)<10){
	  sleep(2);
	  fputs ($fp, 's1 settings');
	  $result = fread($fp, 1024);
	 }
	 $json['htsrsyringe']['settings'] = $result;
	 $ar = preg_split('/,/', $json['htsrsyringe']['settings']);
	 $json['htsrsyringe']['steps'] = $ar[0];
	 $json['htsrsyringe']['steprate'] = $ar[1];
 	 closejson($json);	
	 fclose ($fp);
	}
	else if (preg_match('/s1 check/', $cmd)){
	 fputs ($fp, 's1 check');
	 $result = fread($fp, 1024);
	 //echo '<br>Piezo amplifier1 settings: '.$result.'<br>';
	 echo $result.'<br>';
 	 closejson($json);	
	 fclose ($fp);
	}
        else {
	 $message = $cmd;
	 fputs ($fp, $message);
 	 closejson($json);	
	 fclose ($fp);
	}
	}
	return $json;
}


function headcam_linearactuatorsocket($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
 	$logger = './loggerdataset';
	$host=$json['servers']['gantryhead'];
	$port = 8888;
	//echo $cmd;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else	{
	if (preg_match('/raspicameraon/', $cmd)){
	 fputs ($fp, 'raspicameraon');
	 $json['raspiheadcamon'] = 1;
 	 closejson($json);	
	 fclose ($fp);
    	 logger($logger, 'Raspicam stream on<br>',1);
	}
	else if (preg_match('/raspicameraoff/', $cmd)){
	 fputs ($fp, 'raspicameraoff');
	 $json['raspiheadcamon'] = 0;
 	 closejson($json);	
	 fclose ($fp);
    	 logger($logger, 'Raspicam stream off<br>',1);
	}
	else if (preg_match('/e1tempread/', $cmd)){
	 fputs ($fp, 'e1tempread');
	 sleep(1);
	 $result = fread($fp, 1024);
	 $json['e1tempread'] = $result;
 	 closejson($json);	
	 fclose ($fp);
    	 logger($logger, $result.'<br>',1);
	}
        else {
	 $message = $cmd;
	 fputs ($fp, $message);
 	 closejson($json);	
	 fclose ($fp);
	}
	}
	return $json;
}


























//piezosocketserver
function piezosocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['chubox'];
	$port = 8887;
	//echo $cmd;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else	{
	if (preg_match('/p1 settings/', $cmd)){
	 fputs ($fp, 'S');
	 $result = fread($fp, 1024);
	 //echo '<br>Piezo amplifier1 settings: '.$result.'<br>';
	 $json['htsrsyringe']['settings'] = $result;
 	 closejson($json);	
	 fclose ($fp);
	}
	else if (preg_match('/s1 check/', $cmd)){
	 fputs ($fp, 's1 check');
	 $result = fread($fp, 1024);
	 //echo '<br>Piezo amplifier1 settings: '.$result.'<br>';
	 echo $result.'<br>';
 	 closejson($json);	
	 fclose ($fp);
	}
        else {
	 $message = $cmd;
	 fputs ($fp, $message);
 	 closejson($json);	
	 fclose ($fp);
	}
	}
	return $json;
}




























//Waveform generator socket
function waveformsocketclient($cmd,$json){
	//Stop button - here I need to check the stop button thing ...
	// where is the socket server?
	$host=$json['servers']['strobcampi'];
	$port = 8888;

	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp)
	{
		$result = "Error: could not open socket connection";
		echo $result.'<br>';
	}
	else if ($json['stop'] == "1"){
	 echo 'System halt, you need press GO button<br>';
	}
	else
	{
	if (preg_match('/^.*PORT/', $cmd)){
	  fputs ($fp, $cmd);
	  sleep(1);
	  $result = fgets ($fp, 1024);
	  echo $result.'<br>';
	  preg_match('/^RefVolts (.*) Pulse (.*) Freq (.*) Drop (.*) Trigger (.*) leddelay (.*) ledtime (.*) inputpin (.*)/', $result, $gp);
	  $refvolts = $gp[1];
 	  $logger = './loggerdataset';
    	  logger($logger, 'refvolts: '.$gp[1].'<br>',1);

	  $pulse = $gp[2];
	  $freq = ($gp[3]) * 10;
	  $drop = $gp[4];
	  $trigger = $gp[5];
	  $leddelay = $gp[6];
	  $ledtime = $gp[7];
	  $inputpin = $gp[8];
	  $json['wavecontroller']['refvolts']= $refvolts;
	  $json['wavecontroller']['drops']= $drop;
	  $json['wavecontroller']['pulse']= $pulse;
	  $json['wavecontroller']['freq']= $freq;
	  $json['wavecontroller']['trigger']= $trigger;
	  $json['wavecontroller']['leddelay']= $leddelay;
	  $json['wavecontroller']['ledtime']= $ledtime;
	  $json['wavecontroller']['inputpin']= $inputpin;
	  $json['wavecontroller']['report']= $result;
	}
	else {
	 $message = $cmd;
	 fputs ($fp, $message);
	}
	fclose ($fp);
	}
 	closejson($json);	
	return $json;
}





//Pressure compensation level reading and power relays
function gearmanpressuresocketclient($cmd,$json){

	// where is the socket server?
	//$host="192.168.1.5";
	$host=$json['servers']['wavepi'];
	$port = 8888;
	 
	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	 
	if (!$fp)
	{
	$result = "Error: could not open socket connection";
	}
	
	else
	{
	$message = $cmd;
	fputs ($fp, $message);

	 if (preg_match('/^PRESSURE.*/', $cmd)){	 
	  // get the result
	  $result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  $result = trim($result);
	  //Set: 2500 Measured: 2377.85
	  preg_match('/^Set: (.*) Measured: (.*)$/', $result, $gp);
	  $json['pressure']['set'] = $gp[1];
	  $json['pressure']['read'] = $gp[2];
	  }
	 if (preg_match('/^reportposition.*/', $cmd)){	 
	  // get the result
	  $result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  //$result = trim($result);
	  //echo 'the result: '.$result.'<br>';
	  $json['relaylinearactuator']['position'] = $result;
	 }
	fclose ($fp);
	}
	//return $json;	
}	


//chatbox client
function chatbotsocketclient($query){
        //Stop button - here I need to check the stop button thing ...
        // where is the socket server?
        $host="localhost";
        $port = 8888;
	//open trackjson
        // open a client connection
        $fp = fsockopen ($host, $port, $errno, $errstr);
        if (!$fp)
        {
                $result = "Chatbot is sleeping to wake: chatbotsocket start";
                //echo $result.'<br>';
        }
        else
        {
        #get endstop status
        fputs ($fp,$query);
	stream_set_timeout($fp, 2);
        $result = fread ($fp, 1024);
        }
	return $result;
}







//Pressure compensation level reading and power relays
function pressuresocketclient($cmd,$json){

	// where is the socket server?
	//$host="192.168.1.5";
	$host=$json['servers']['wavepi'];
	$port = 8888;
	 
	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	 
	if (!$fp)
	{
	$result = "Error: could not open socket connection";
	}
	
	else
	{
	$message = $cmd;
	fputs ($fp, $message);
	 if (preg_match('/^setliquidlevel.*/', $cmd)){	 
	  // get the result
	  //$result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  //$result = trim($result);
	  //Set: 2500 Measured: 2377.85
	  //Level set to 3000
	  preg_match('/^Level set to (.*)$/', $cmd, $gp);
	  //$json['pressure']['set'] = $gp[1];
	  }
	 if (preg_match('/^reportliquidlevel.*/', $cmd)){	 
	  // get the result
	  $result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  //$result = trim($result);
	  //echo 'the result: '.$result.'<br>';
	  $json['pressure']['read'] = $result;
	 }
	 if (preg_match('/^reportposition.*/', $cmd)){	 
	  // get the result
	  $result = fgets ($fp, 1024);
	  // trim the result and remove the starting ?
	  //$result = trim($result);
	  //echo 'the result: '.$result.'<br>';
	  $json['relaylinearactuator']['position'] = $result;
	 }
	fclose ($fp);
	}
	return $json;	
}	









//logger for cli interface
function logger($logger, $msg,$func){
	$logger = './loggerdataset';
	$jsonlog = json_decode(file_get_contents($logger), true);
	if ($func == 0){
	 $jsonlog['logs'] = array();
	}
	array_push($jsonlog['logs'],$msg);
	file_put_contents($logger, json_encode($jsonlog));
}






//Parse the M114 command output for positioning
function parsersetoutput($result){
 //ok C: X:150.000 Y:0.000 Z:0.000 E:0.000
 $count = preg_replace('/^ok C: /', '', $result);
 $count = preg_replace('/:/', '', $count);
 $count = preg_replace('/ /', '', $count);
 $r = preg_split('/[a-zA-Z]/', $count);
 $ractry = array_slice($r, 1,5);
 $trp  = preg_replace('/[\d|\.]/','', $count);
 $tr = str_split($trp);
 $x = '';
 $y = '';
 $z = '';
 for ($i=0;$i<count($tr);$i++){
  if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
 }
 $outputarray = array('X'=>floatval($x), 'Y'=>floatval($y), 'Z'=>floatval($z));
 return $outputarray;
}


function parsersetoutput_v2($result){
 //{'Y': 0.0, 'X': 0.0, 'Z': 0.0, 'E': 0.0}
 preg_match("/^.*X': (.*)$/",$result, $foundstr);
 $px =  $foundstr[1]."\n";
 $x = preg_replace("/, .*/", "", $px);
 preg_match("/^.*Y': (.*)$/",$result, $foundstr);
 $py =  $foundstr[1]."\n";
 $y = preg_replace("/, .*/", "", $py);
 preg_match("/^.*Z': (.*)$/",$result, $foundstr);
 $pz =  $foundstr[1]."\n";
 $z = preg_replace("/, .*/", "", $pz);
 preg_match("/^.*E': (.*)$/",$result, $foundstr);
 $pe =  $foundstr[1]."\n";
 $e = preg_replace("/, .*/", "", $pe);
 $e = preg_replace("/\}/", "", $pe);
 $outputarray = array('X'=>floatval($x), 'Y'=>floatval($y), 'Z'=>floatval($z), 'E'=>floatval($e));
 return $outputarray;
}





function getgcoords($cmd,$json){
 echo $cmd."\n";
 $r = preg_split('/[a-zA-Z]/', $cmd);
 $ractry = array_slice($r, 1,5);
 //var_dump($ractry);

 $trp  = preg_replace('/[\d|\.]/','', $cmd);
 $tr = str_split($trp);
 //var_dump($tr);

 if (preg_match('/X|x/', $cmd)){  $x = '';} else {$x = $json['trackxyz']['x'];}
 if (preg_match('/Y|y/', $cmd)){  $y = '';} else {$y = $json['trackxyz']['y'];}
 if (preg_match('/Z|z/', $cmd)){  $z = '';} else {$z = $json['trackxyz']['z'];}
 if (preg_match('/E|e/', $cmd)){  $e = '';} else {$e = $json['trackxyz']['e'];}

 $f = '';
 for ($i=0;$i<count($tr);$i++){
  if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
  if (preg_match('/[E|e]/', $tr[$i])){
	$e = $ractry[$i];
  }
  else {
	$e = 0;
  }
  if (preg_match('/[F|f]/', $tr[$i])){
	$f = $ractry[$i];
  }
 }
 $gcoords = array('X'=>$x, 'Y'=>$y, 'Z'=>$z, 'F'=>$f, 'E'=>$e);
 return $gcoords;
}









function gcodecoordtrack($cmd,$json){
 echo $cmd."\n";
 $r = preg_split('/[a-zA-Z]/', $cmd);
 $ractry = array_slice($r, 1,5);
 //var_dump($ractry);

 $trp  = preg_replace('/[\d|\.]/','', $cmd);
 $tr = str_split($trp);
 //var_dump($tr);

 $x = '';
 $y = '';
 $z = '';
 $f = '';

 for ($i=0;$i<count($tr);$i++){
   if (preg_match('/[X|x]/', $tr[$i])){
	$x = $ractry[$i];
  }
  if (preg_match('/[Y|y]/', $tr[$i])){
	$y = $ractry[$i];
  }
  if (preg_match('/[Z|z]/', $tr[$i])){
	$z = $ractry[$i];
  }
  if (preg_match('/[E|e]/', $tr[$i])){
	$e = $ractry[$i];
  }
  if (preg_match('/[F|f]/', $tr[$i])){
	$f = $ractry[$i];
  }
 }
 $gcoords = array('X'=>$x, 'Y'=>$y, 'Z'=>$z, 'E'=>$e, 'F'=>$f);
 $json['trackxyz']['x'] = $gcoords["X"]; 
 $json['trackxyz']['y'] = $gcoords["Y"];
 $json['trackxyz']['z'] = $gcoords["Z"];
 $json['trackxyz']['f'] = $gcoords["F"];

  $imgdataset = './imgdataset';
  file_put_contents($imgdataset, json_encode($json));
  $json = json_decode(file_get_contents($imgdataset), true);

 return $json;
}

function ssh01caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['marlin8pi'], 22);
 include('relay.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}



function ssh02caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['strobcampi'], 22);
 include('pressure.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}





function ssh04caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['gantryhead'], 22);
 include('headcam.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}



function ssh05caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['wavepi'], 22);
 include('pressure.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 /*
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 */
 // close the stream
 fclose($stream);
 // print the response
 //echo $data;
}




function ssh06caller($cmd,$json){
 $ssh = ssh2_connect($json['servers']['smoothiedriver'], 22);
 include('smoothiedriver.php');
 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 // close the stream
 fclose($stream);
}


function sshcontrolcaller($cmd,$ip,$mode,$json)
{
 $ssh = ssh2_connect($ip, 22);

//these establish the ssh connections
 /*
 if ($ip == $json['servers']['strobcampi']){
  include('strobcampi.inc.php');
 }
 if ($ip == $json['servers']['powerpumpsraspi']){
  include('powerpumpssocket.inc.php');
 }
 if ($ip == $json['servers']['smoothiedriver']){
  include('smoothiedriver.inc.php');
 }
 if ($ip == $json['servers']['gantryhead']){
  include('gantryhead.inc.php');
  echo "its called\r\n";
 }
 */
 ssh2_auth_password($ssh, 'pi', '9hockey');

 // exec a command and return a stream
 $stream = ssh2_exec($ssh, $cmd);
 // force PHP to wait for the output
 stream_set_blocking($stream, true);
 // read the output into a variable
 $data = '';
 if ($mode == 'start'){
 while($buffer = fread($stream, 4096)) {
    $data .= $buffer;
 }
 }
 // close the stream
 fclose($stream);
 return $data;
}


function shutdown($ip,$json){
   $logger = './loggerdataset';
   $msg =  'Shutting down now '.$ip.' ... safely<br>';
   $cmd = 'sudo shutdown -h 0';
   logger($logger, $msg,1);
   sshcontrolcaller($cmd,$ip,'shutdown',$json);
}

function reboot($ip,$json){
   $logger = './loggerdataset';
   $msg =  'Shutting down now '.$ip.' ... safely<br>';
   $cmd = 'sudo reboot';
   logger($logger, $msg,1);
   sshcontrolcaller($cmd,$ip,'reboot',$json);
}







function powerpumpssocket_killzombies($json){
  $logger = './loggerdataset';
  $cmd = 'sudo python kill.powerpumpssocket.py';
  $json['powerrelaypid'] =  0;
  $json['powerrelaysocket']['on'] = 0;
  sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'kill',$json);
  sleep(1);
  logger($logger, 'Socket power relay sockets are killed<br>',1);
  return $json;
}


function powerpumpssocket_start($json){
        $logger = './loggerdataset';
	if ($json['powerrelaypid'] > 0) {
	  $msg = 'Problem the power relay socket is on ';
	  logger($logger, $msg.': pid - '.$json['powerrelaypid'].' Type "powerpumpssocket stop"<br>',1);
	}
	else {
 	 $msg =  'Power relays socket ('.$json['servers']['powerpumpsraspi'].') connected ';
	 $cmd = 'sudo php control_powerpumpssocket.php start';
	 $json['powerrelaypid'] = sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'start',$json);
	 sleep(1);
	 if ($json['powerrelaypid'] > 0){
	  $json['powerrelaysocket']['on'] = 1;
	  $msg =  'Power relay socket ('.$json['servers']['powerpumpsraspi'].') connected ';
 	  logger($logger, $msg.': pid - '.$json['powerrelaypid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem socket power relay socket ('.$json['servers']['powerpumpsraspi'].') not connected<br>',1);
	 }
	}
  return $json;
}




function powerpumpssocket_stop($json){
        $logger = './loggerdataset';
	if ($json['powerrelaysocket']['on'] > 0){
	 $msg =  'Power relay socket ('.$json['servers']['powerpumpsraspi'].') disconnected<br>';
	 $cmd= 'sudo kill '.$json['powerrelaypid'];
  	 $json['powerrelaysocket']['on'] = 0;
	 sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],$json['powerrelaypid'],$json);
	 sleep(1);
	 logger($logger, $msg.' pid - '.$json['powerrelaypid'].' is killed<br>',1);
	 $json['powerrelaypid'] = 0;
	}
	else {
	 logger($logger, 'Powerpumpssocket is off already<br>',1);
	}
	return $json;
}




function syringesocket_start($json){
        $logger = './loggerdataset';
	if ($json['syringesocket'] > 0) {
	  $msg = 'Problem the syringe pump socket server is already on ';
	  logger($logger, $msg.': pid - '.$json['syringesocketserverpid'].' Type "syringesocketserver stop"<br>',1);
	}
	else {
 	 $msg =  'Syringe pump socket server ('.$json['servers']['powerpumpsraspi'].') connected ';
	 $cmd = 'sudo php control_syringe_server.php start';
  	 //echo $cmd.'<br>';
	 $json['syringesocketpid'] = sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'start',$json);
	 sleep(1);
	 if ($json['syringesocketpid'] > 0){
	  $json['syringesocket'] = 1;
	  $msg =  'Syringe pump ('.$json['servers']['powerpumpsraspi'].') connected ';
 	  logger($logger, $msg.': pid - '.$json['syringesocketpid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem syringe pump socket server not connected<br>',1);
	 }
	}
	return $json;
}

function syringesocket_stop($json){
        $logger = './loggerdataset';
	if ($json['syringesocket'] > 0){
	 $msg =  'Syringe pump socket server ('.$json['servers']['powerpumpsraspi'].') disconnected<br>';
	 $cmd= 'sudo kill '.$json['syringesocketpid'];
  	 $json['syringesocket'] = 0;
	 sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],$json['syringesocketpid'],$json);
	 sleep(1);
	 logger($logger, $msg.' pid - '.$json['syringesocketpid'].' is killed<br>',1);
	 $json['syringesocketpid'] = 0;
	}
	else {
	 logger($logger, 'Syringesocket is off already<br>',1);
	}
 	return $json;
}

function syringesocket_killzombies($json){
  $logger = './loggerdataset';
  $json['syringesocketpid'] = 0;
  $json['syringesocket'] = 0;
  $cmd= 'sudo python kill.syringe_server.py';
  sshcontrolcaller($cmd,$json['servers']['powerpumpsraspi'],'kill',$json);
  sleep(1);
  logger($logger, 'Syringe_server sockets are killed<br>',1);
  return $json;
}









function piezosocket_start($json){
        $logger = './loggerdataset';
	if ($json['piezosocket'] > 0) {
	  $msg = 'Problem the piezo socket server is already on ';
	  logger($logger, $msg.': pid - '.$json['piezosocketpid'].' Type "piezosocketserver stop"<br>',1);
	}
	else {
 	 $msg =  'Piezo socket server ('.$json['servers']['chubox'].') connected ';
	 $cmd = 'sudo php control_piezo_server.php start';
	 //echo $cmd.'<br>';
	 //$json['piezosocketpid'] = sshcontrolcaller($cmd,$json['servers']['chubox'],'start',$json);
	 $gpid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
         $json['piezosocketpid'] = $gpid; 
	 sleep(1);
	 if ($json['piezosocketpid'] > 0){
	  $json['piezosocket'] = 1;
	  $msg =  'Piezo socket server ('.$json['servers']['chubox'].') connected ';
 	  logger($logger, $msg.': pid - '.$json['piezosocketpid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem syringe pump and piezo socket server not connected<br>',1);
	 }
	}
	return $json;
}

function piezosocket_stop($json){
        $logger = './loggerdataset';
	if ($json['piezosocketpid'] > 0){
	 $msg =  'Piezo socket server ('.$json['servers']['chubox'].') disconnected<br>';
	 $cmd= 'sudo kill '.$json['piezosocketpid'];
  	 $json['piezosocket'] = 0;
         $cmd = "sudo php control_piezo_server.php ".$json['piezosocketpid']." & > /dev/null &";
	 exec($cmd);
	 logger($logger, $msg.' pid - '.$json['piezosocketpid'].' is killed<br>',1);
	 $json['piezosocketpid'] = 0;
	}
	 else {
 	  logger($logger, 'Piezosocket is disconnected<br>',1);
	 }
 	return $json;
}








function chatbotsocket_start($json){
        $logger = './loggerdataset';
	if ($json['chatbotsocketpid'] > 0) {
	  $msg = 'Chatbot is awake ';
	  logger($logger, $msg.': pid - '.$json['chatbotsocketpid'].' Type "chatbot stop"<br>',1);
	}
	else {
	 $msg =  'Chatbot socket ('.$json['servers']['chubox'].') connected, chatbot is waking up ';
	 $cmd= 'sudo python chatbox.server.py';
	 $gpid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
	 $json['chatbotsocketpid'] = $gpid;
	 sleep(1);
	  if ($json['chatbotsocketpid'] > 0){
	   $json['chatbotsocket'] = 1;
	   logger($logger, $msg.': pid - '.$json['chatbotsocketpid'].'<br>',1);
	  }
	  else {
 	   logger($logger, 'Problem: could not start chatbotsocket<br>',1);
	  }
	}
	return($json);
}
function chatbotsocket_stop($json){
        $logger = './loggerdataset';
	$msg =  'Chatbot socket ('.$json['servers']['chubox'].') disconnected, chatbot is going to sleep<br>';
	$json['chatbotsocket'] = 0;
        $cmd = "sudo php control_chatbox.server.php ".$json['chatbotsocketpid']." & > /dev/null &";
	exec($cmd);
	sleep(1);
	logger($logger, $msg.' pid - '.$json['chatbotsocketpid'].' is killed<br>',1);
	$json['chatbotsocketpid'] = 0;
	return $json;
}


function smoothiesocket_killzombies($json){
        $logger = './loggerdataset';
	$cmd= 'sudo python kill.smoothie.socket.py';
	$json['smoothiesocketpid'] = 0; 
	$json['smoothiesocket'] = 0;
	sshcontrolcaller($cmd,$json['servers']['smoothiedriver'],'kill',$json);
	sleep(1);
  	logger($logger, 'Smoothie sockets are killed<br>',1);
	return $json;
}






function smoothiesocket_start($json){
        $logger = './loggerdataset';
	if ($json['smoothiesocketpid'] > 0) {
	  $msg = 'Problem the smoothiesocket is on ';
	  logger($logger, $msg.': pid - '.$json['smoothiesocketpid'].' Type "smoothiesocket stop"<br>',1);
	}
	else {
	 $msg =  'Smoothiesocket ('.$json['servers']['smoothiedriver'].') connected ';
	 $cmd= 'sudo python control_smoothiesocket.py start';
	 $json['smoothiesocketpid'] = sshcontrolcaller($cmd,$json['servers']['smoothiedriver'],'start',$json);
	 sleep(1);
	 $cmd= 'sudo python control_gearmansocket.py start';
	 $json['smoothiegearmansocketpid'] = sshcontrolcaller($cmd,$json['servers']['smoothiedriver'],'start',$json);
	 if ($json['smoothiesocketpid'] > 0){
	   $json['smoothiesocket'] = 1;
 	   logger($logger, $msg.': pid - '.$json['smoothiesocketpid'].'<br>',1);
	 }
	 else {
 	   logger($logger, 'Problem: could not start smoothiesocket<br>',1);
	 }
	}
	return $json;
}


function smoothiesocket_stop($json){
        $logger = './loggerdataset';
	if ($json['smoothiesocketpid'] > 0){
	 $msg =  'Smoothiesocket ('.$json['servers']['smoothiedriver'].') disconnected<br>';
	 $cmd= 'sudo python control_gearmansocket.py stop';
	 sshcontrolcaller($cmd,$json['servers']['smoothiedriver'],$json['smoothiesocketpid'],$json);
	 $json['smoothiegearmansocket'] = 0;
	 sleep(1);
	 $cmd= 'sudo python control_smoothiesocket.py stop';
	 sshcontrolcaller($cmd,$json['servers']['smoothiedriver'],$json['smoothiesocketpid'],$json);
	 $json['smoothiesocket'] = 0;
	 sleep(1);
	 logger($logger, $msg.' pid - '.$json['smoothiesocketpid'].' is killed<br>',1);
	 $json['smoothiesocketpid'] = 0;
	}
	else {
	 logger($logger, 'Smoothiesocket is already disconnected<br>',1);
	}
	return $json;
}

function headcam_linearactuatorsocket_start($json){
        $logger = './loggerdataset';
	if ($json['headcamlinearactuatorpid'] > 0) {
	  $msg = 'Problem the headcam and linearactuatorsocket is on ';
	  logger($logger, $msg.': pid - '.$json['headcamlinearactuatorpid'].' Type "headcamlinearactuatorsocket stop"<br>',1);
	}
	else {
	 $msg =  'Headcam and linearactuatorsocket ('.$json['servers']['gantryhead'].') connected ';
	 $cmd= 'sudo python control_headcam_jrkcontroller.py start';
	 $json['headcamlinearactuatorpid'] = sshcontrolcaller($cmd,$json['servers']['gantryhead'],'start',$json);
	 sleep(1);
	 if ($json['headcamlinearactuatorpid'] > 0){
	   $json['headcamlinearactuatorsocket'] = 1;
 	   logger($logger, $msg.': pid - '.$json['headcamlinearactuatorpid'].'<br>',1);
	 }
	 else {
 	   logger($logger, 'Problem: could not start headcamlinearactuatorsocket<br>',1);
	 }
	}
        closejson($json);
	return $json;
}



function headcam_linearactuatorsocket_stop($json){
        $logger = './loggerdataset';
	$msg =  'Headcam and linearactuatorsocket ('.$json['servers']['gantryhead'].') disconnected<br>';
	$json['headcamlinearactuatorsocket'] = 0;
	$cmd= 'sudo python control_headcam_jrkcontroller.py stop';
	sshcontrolcaller($cmd,$json['servers']['gantryhead'],$json['headcamlinearactuatorpid'],$json);
	sleep(1);
	logger($logger, $msg.' pid - '.$json['headcamlinearactuatorpid'].' is killed<br>',1);
	$json['headcamlinearactuatorpid'] = 0;
        closejson($json);
	return $json;
}

function headcam_linearactuatorsocket_killzombies($json){
        $logger = './loggerdataset';
	$msg =  'Headcam and linearactuatorsocket ('.$json['servers']['gantryhead'].') disconnected<br>';
	$json['headcamlinearactuatorpid'] = 0;
	$json['headcamlinearactuatorsocket'] = 0;
	$cmd= 'sudo python kill.camera.teensy.jrk.headcam.socket.server.py';
	sshcontrolcaller($cmd,$json['servers']['gantryhead'],'kill',$json);
	sleep(1);
	logger($logger, 'camera.teensy.jrk.headcam.sockets are killed<br>',1);
	return $json;
}









//gearman heacamstreamon
function gearman_headcamstreamon(){
  	$logger = './loggerdataset';
        $json = openjson();
  	$json['headcamon'] = 1;
  	logger($logger, 'Headcam stream on<br>',1);
	closejson($json);
	headcam_linearactuatorsocketclient('cameraon',$json);
	sleep(3);
  	return "Headcam streams starts<br>";
}

//gearman heacamstreamoff
function gearman_headcamstreamoff(){
  	$logger = './loggerdataset';
        $json = openjson();
  	$json['headcamon'] = 0;
  	logger($logger, 'Headcam stream off<br>',1);
	closejson($json);
	headcam_linearactuatorsocketclient('cameraoff',$json);
	sleep(3);
  	return "Headcam stream stops<br>";
}





//Pressure compensation level reading and power relays
function headcam_linearactuatorsocketclient($cmd,$json){
	// where is the socket server?
	//$host="192.168.1.5";
	$host=$json['servers']['gantryhead'];
	$port = 8888;
	// open a client connection
	$fp = fsockopen ($host, $port, $errno, $errstr);
	if (!$fp){
	$result = "Error: could not open socket connection";
	}
	else{
	if (preg_match('/^P1move (.*)$/', $cmd, $gp)){
	  fputs ($fp, 'P1move '.$gp[1]);
	  fclose ($fp);
	}
	else if (preg_match('/^P1position/', $cmd)){	 
	  fputs ($fp, $cmd);
	  $result = fread ($fp, 1024);
	  $json['P1position'] = $result;
	  fclose ($fp);
	}
	else if (preg_match('/^P1off/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}
	else if (preg_match('/^headcam_linearactuatorsocketclient kill/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^cameraon/', $cmd)){	 
  	  $json['headcamon'] = 1;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}
	else if (preg_match('/^cameraoff/', $cmd)){	 
  	  $json['headcamon'] = 0;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^camerasnapon/', $cmd)){	 
  	  $json['headcamsnapon'] = 1;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}
	else if (preg_match('/^camerasnapoff/', $cmd)){	 
  	  $json['headcamsnapon'] = 0;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^cameratriggeron/', $cmd)){	 
  	  $json['headcamtrigon'] = 1;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}
	else if (preg_match('/^cameratriggeroff/', $cmd)){	 
  	  $json['headcamtrigon'] = 0;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^ledon$/', $cmd)){	 
 	  $json['camerasettings']['ledon'] = 1;
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  sleep(1);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}
	else if (preg_match('/^ledoff/', $cmd)){	 
 	  $json['camerasettings']['ledon'] = 0;
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  sleep(1);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}
	else if (preg_match('/^settings/', $cmd)){	 
	  sleep(1);
	  fputs ($fp, $cmd);
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}

	else if (preg_match('/^ledpower (.*)/', $cmd, $sck)){	 
 	  $json['camerasettings']['ledflashpower'] = $sck[1];
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}

	else if (preg_match('/^ledtimeon (.*)/', $cmd, $sck)){	 
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(2);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}
	else if (preg_match('/^leddelay (.*)/', $cmd, $sck)){	 
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(2);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}



	else if (preg_match('/^ledflashdelay (.*)/', $cmd, $sck)){	 
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}





	else if (preg_match('/^flashon/', $cmd)){	 
 	  $flcmd = "flashpower ".$json['camerasettings']['ledflashpower'];
	  fputs ($fp, $flcmd);
	  fclose ($fp);
	  $json['camerasettings']['flashOn'] = 1;
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}	
	else if (preg_match('/^flashoff/', $cmd)){	 
	  $json['camerasettings']['flashOn'] = 0;
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}


	else if (preg_match('/^triggeron/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}	
	else if (preg_match('/^triggeroff/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^flashforphotoon/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}	
	else if (preg_match('/^flashforphotooff/', $cmd)){	 
	  fputs ($fp, $cmd);
	  fclose ($fp);
	}

	else if (preg_match('/^triggernumber (.*)/', $cmd, $sck)){	 
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}

	else if (preg_match('/^triggerdelay (.*)/', $cmd, $sck)){	 
	  fputs ($fp, $cmd);
	  sleep(1);
	  fclose ($fp);
	  $fp = fsockopen ($host, $port, $errno, $errstr);
	  fputs ($fp, "settings");
	  sleep(1);
	  $result = fread ($fp, 1024);
	  $json['camerasettings']['settings'] = $result;
	  $json = parsecamerasettings($result, $json);
	  fclose ($fp);
	}

	}
	return $json;	
}

function parsecamerasettings($result, $json){
	$b = preg_split('/:/', $result);
     	$ledpower =  preg_replace('/ ledon/', '', $b[1]);
        $json['camerasettings']['ledpower'] =  preg_replace('/ /', '', $ledpower);
	$ledon =  preg_replace('/ leddelay/', '', $b[2]);
        $json['camerasettings']['ledon'] =  preg_replace('/ /', '', $ledon);
	$leddelay =  preg_replace('/ ledtimeon/', '', $b[3]);
	$json['camerasettings']['leddelay'] =  preg_replace('/ /', '', $leddelay);
	$ledontime =  preg_replace('/ ledflashdelay/', '', $b[4]);
        $json['camerasettings']['ledtimeon'] =  preg_replace('/ /', '', $ledontime);
	$ledflashdelay =  preg_replace('/ flashOn/', '', $b[5]);
        $json['camerasettings']['ledflashdelay'] =  preg_replace('/ /', '', $ledflashdelay);
	$flashOn =  preg_replace('/ flashforPhoto/', '', $b[6]);
        $json['camerasettings']['flashOn'] =  preg_replace('/ /', '', $flashOn);
	$flashforPhoto =  preg_replace('/ triggerPhoto/', '', $b[7]);
        $json['camerasettings']['flashforPhoto'] =  preg_replace('/ /', '', $flashforPhoto);
	$triggerPhoto =  preg_replace('/ triggerDelay/', '', $b[8]);
        $json['camerasettings']['triggerPhoto'] =  preg_replace('/ /', '', $triggerPhoto);
	$triggerDelay =  preg_replace('/ triggerNumber/', '', $b[9]);
        $json['camerasettings']['triggerDelay'] =  preg_replace('/ /', '', $triggerDelay);
	$triggerNumber =  preg_replace('/ readPin/', '', $b[10]);
        $json['camerasettings']['triggerNumber'] =  preg_replace('/ /', '', $triggerNumber);
        $json['camerasettings']['readPin'] =  preg_replace('/ /', '', $b[11]);
	return $json;
}





function headcam_start($json){
        $logger = './loggerdataset';
	if ($json['headcampid'] > 0) {
	  $msg = 'Problem the head camera stream is already on ';
	  logger($logger, $msg.': pid - '.$json['headcampid'].' Type "headcam stop"<br>',1);
	}
	else {
 	 $msg =  'Head camera server ('.$json['servers']['gantryhead'].') connected ';
	 $cmd = 'sudo python headcam.stream.py';
  	 //echo $cmd.'<br>';
	 $respo = sshcontrolcaller($cmd,$json['servers']['gantryhead'],'start',$json);
	 //wgsi_3199_3200_3202_dmk gstream_3211_3212_3214_
	 $dd = preg_split('/_/', $respo);
	 $json['headcampid'] = $dd[1];
	 $json['headcamwgsipid'] = $dd[5];
	 sleep(1);
	 if ($json['headcampid'] > 0){
	  $json['headcamon'] = 1;
	  $msg =  'Headcam streamer ('.$json['servers']['gantryhead'].') connected ';
 	  logger($logger, $msg.': headcam pid - '.$json['headcampid'].'<br>',1);
 	  logger($logger, $msg.': headcam webserver pid - '.$json['headcamwgsipid'].'<br>',1);
	 } 
	 else {
 	  logger($logger, 'Problem headcamera is not connected<br>',1);
	 }
	}
	return $json;
}

function headcam_stop($json){
        $logger = './loggerdataset';
	$msg =  'Head camera streamer ('.$json['servers']['gantryhead'].') disconnected<br>';
	$cmd= 'sudo kill '.$json['headcampid'];
  	$json['headcamon'] = 0;
	sshcontrolcaller($cmd,$json['servers']['gantryhead'],$json['headcampid'],$json);
	sleep(1);
	logger($logger, $msg.' pid - '.$json['headcampid'].' is killed<br>',1);
	$cmd= 'sudo kill '.$json['headcamwgsipid'];
	$json['headcampid'] = 0;
	sleep(1);
	sshcontrolcaller($cmd,$json['servers']['gantryhead'],$json['headcampid'],$json);
	logger($logger, $msg.' pid - '.$json['headcamwgsipid'].' is killed<br>',1);
	$json['headcamwgsipid'] = 0;
 	return $json;
}


//PHP Fatal error:  Cannot redeclare syringesocketclient() (previously declared in /var/www/html/gui.mod15/repstrapfunctionslib.php:1985) in /var/www/html/gui.mod15/repstrapfunctionslib.php on line 2089


?>
