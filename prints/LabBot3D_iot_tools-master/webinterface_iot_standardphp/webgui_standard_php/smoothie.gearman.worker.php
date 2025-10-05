<?php

include('repstrapfunctionslib.php');

echo "Starting\n";

# Create our worker object.
$gmworker= new GearmanWorker();

# Add default server (localhost).
$gmworker->addServer();

# Register function "reverse" with the server. Change the worker function to
# "reverse_fn_fast" for a faster worker with no output.


# Here are the special repstrap functions
$gmworker->addFunction("runmode", "runmode");
$gmworker->addFunction("endrunmode", "endrunmode");

//Movement commands
$gmworker->addFunction("forward", "moveforward");
$gmworker->addFunction("backward", "movebackward");
$gmworker->addFunction("left", "moveleft");
$gmworker->addFunction("right", "moveright");
$gmworker->addFunction("up", "moveup");
$gmworker->addFunction("down", "movedown");
$gmworker->addFunction("finish", "finish");
$gmworker->addFunction("move", "move");
$gmworker->addFunction("position", "position");
$gmworker->addFunction("delay", "delay");

//Linear actuator movement
$gmworker->addFunction("P1move", "P1move");
$gmworker->addFunction("P1position", "P1position");
$gmworker->addFunction("P1stop", "P1stop");


$gmworker->addFunction("wash", "wash");
$gmworker->addFunction("gotowash", "gotowash");
$gmworker->addFunction("gotowaste", "gotowaste");
$gmworker->addFunction("dry", "dry");
$gmworker->addFunction("gotodry", "gotodry");
$gmworker->addFunction("headcamsnap", "headcamsnap");
$gmworker->addFunction("strobsnap", "strobsnap");
$gmworker->addFunction("analyzestrobimgs", "analyzestrobimgs");
$gmworker->addFunction("fire", "fire");
$gmworker->addFunction("setdrops", "setdrops");
$gmworker->addFunction("gotostrob", "gotostrob");
$gmworker->addFunction("strobon", "strobon");
$gmworker->addFunction("stroboff", "stroboff");
$gmworker->addFunction("gotowell", "gotowell");
$gmworker->addFunction("backtoz", "backtoz");

//Syringe stuff
//$gmworker->addFunction("aspirate", "aspirate");
//$gmworker->addFunction("dispense", "dispense");
//$gmworker->addFunction("fillsyringe", "fillsyringe");
$gmworker->addFunction("setpumpvalve", "setpumpvalve");

//HTSsyringe stuff
/*
$gmworker->addFunction("hts_s1_syringesettings", "hts_s1_syringesettings");
$gmworker->addFunction("hts_s1_setsteps", "hts_s1_setsteps");
$gmworker->addFunction("hts_s1_setsteprate", "hts_s1_setsteprate");
$gmworker->addFunction("hts_s1_retractsetsteps", "hts_s1_retractsetsteps");
$gmworker->addFunction("hts_s1_retractsetsteprate", "hts_s1_retractsetsteprate");
$gmworker->addFunction("hts_s1_aspirate", "hts_s1_aspirate");
$gmworker->addFunction("hts_s1_dispense", "hts_s1_dispense");
$gmworker->addFunction("hts_s1_homing", "hts_s1_homing");
*/
$gmworker->addFunction("hts_s1_valveinput", "hts_s1_valveinput");
$gmworker->addFunction("hts_s1_valveoutput", "hts_s1_valveoutput");
$gmworker->addFunction("hts_s1_valvebypass", "hts_s1_valvebypass");
/*
$gmworker->addFunction("hts_s1_fillsyringe", "hts_s1_fillsyringe");

$gmworker->addFunction("hts_s1_contbackgo", "hts_s1_contbackgo");
$gmworker->addFunction("hts_s1_contforgo", "hts_s1_contforgo");
$gmworker->addFunction("hts_s1_contstop", "hts_s1_contstop");

$gmworker->addFunction("hts_s1_backward", "hts_s1_backward");
$gmworker->addFunction("hts_s1_forward", "hts_s1_forward");
*/



//HTS power up
$gmworker->addFunction("powerupsmoothie", "powerupsmoothie");
$gmworker->addFunction("powerdownsmoothie", "powerdownsmoothie");

$gmworker->addFunction("smoothiesocketstart", "smoothiesocketstart");
$gmworker->addFunction("smoothiesocketstop", "smoothiesocketstop");
$gmworker->addFunction("powerpumpssocketstart", "powerpumpssocketstart");
$gmworker->addFunction("powerpumpssocketstop", "powerpumpssocketstop");
$gmworker->addFunction("syringesocketstart", "syringesocketstart");
$gmworker->addFunction("syringesocketstop", "syringesocketstop");
$gmworker->addFunction("headcam_linearactuatorsocketstart", "headcam_linearactuatorsocketstart");
$gmworker->addFunction("headcam_linearactuatorsocketstop", "headcam_linearactuatorsocketstop");


$gmworker->addFunction("socketflagon", "socketflagon");
$gmworker->addFunction("socketflagoff", "socketflagoff");




//Turning on imaging source webstream 
$gmworker->addFunction("headcamstreamon", "headcamstreamon");
$gmworker->addFunction("headcamstreamoff", "headcamstreamoff");




print "Waiting for job...\n";
while($gmworker->work())
{
  if ($gmworker->returnCode() != GEARMAN_SUCCESS)
  {
    echo "return_code: " . $gmworker->returnCode() . "\n";
    break;
  }
}

# A much simpler and less verbose version of the above function would be:
function normal_fn_fast($job)
{
  $workload = $job->workload();
  $job->sendData("normal job finished");
  return $workload;
}


# A much simpler and less verbose version of the above function would be:
function reverse_fn_fast($job)
{
  $workload = $job->workload();
  $job->sendData("reverse job finished");
  return $workload;
}


//$gmworker->addFunction("runmode", "runmode");
function runmode($job){
 $workload = $job->workload();
 $json = openjson();
 //"runmode":{"strobpass":"0","on":"0"}
 $json['runmode']['on'] = 1;
 closejson($json);
 //set up error file
 taskjoberror("",0);
 //set up trackfile file
 taskjobtrack("",0);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("endrunmode", "endrunmode");
function endrunmode($job){
 $workload = $job->workload();
 $json = openjson();
 //"runmode":{"strobpass":"0","on":"0"}
 $json['runmode']['on'] = 0;
 closejson($json);
 //set up error file
 taskjoberror("finish 0",1);
 //set up trackfile file
 taskjobtrack("finish 0",1);
 $job->sendData($msg.'<br>');
}




//$gmworker->addFunction("setpumpvalve", "setpumpvalve");
function setpumpvalve($job){
 $workload = $job->workload();
 $msg = gearmansetvalve($workload);
 $job->sendData($msg.'<br>');
}


function backtoz($job){
 $workload = $job->workload();
 $msg = gearmanbacktoz($workload);
 $job->sendData('Gone to: '.$msg.'<br>');
}

function gotowell($job){
 $workload = $job->workload();
 $msg = gearmangotowell($workload);
 $job->sendData('Gone to: '.$msg.'<br>');
}



//$gmworker->addFunction("strobsnap", "pictdelay");
function strobsnap($job){
 $workload = $job->workload();
 $rary = preg_split('/_/', $workload);
 $msg = gearmanstrobsnap($rary[0],$rary[1]);
 $timestamp =  time();
 $job->sendData($msg.' '.$timestamp.'<br>');
}

//$gmworker->addFunction("analyzestrobimgs", "sample");
function analyzestrobimgs($job){
 $json = openjson();
 $workload = $job->workload();
 $pmsg = 'Sample: '.$workload.' Images analyzed: '.$json['strobimglist'].'<br>';
 closejson($json);
 $ppmsg = gearmanquantifystrobimg($workload);
 $msg = $pmsg .$ppmsg;
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("strobon", "strobon");
function strobon($job){
 $workload = $job->workload();
 $msg = gearmanstrobon();
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("stroboff", "stroboff");
function stroboff($job){
 $workload = $job->workload();
 $msg = gearmanstroboff();
 $job->sendData($msg.'<br>');
}


function finish($job){
 $json = openjson();
 $json['runmode']['on'] = 0;
 $json['tranferslistfile'] = 0;
 closejson($json);
 $job->sendData('finish<br>');
}






function gotodry($job){
 $workload = $job->workload();
 $msg = gearmangotodry();
 $job->sendData('Going to drypad position: '.$msg.'<br>');
}

function gotostrob($job){
 $workload = $job->workload();
 $msg = gearmangotostrob();
 $job->sendData('Going to stroboscope position: '.$msg.'<br>');
}




function dry($job){
 $workload = $job->workload();
 $msg = gearmandry($workload);
 $job->sendData('Tip dried drytime: '.$workload.'<br>');
}

//$gmworker->addFunction("gotowaste", "gotowaste");
function gotowaste($job){
 $workload = $job->workload();
 $msg = gearmangotowaste();
 $job->sendData('Going to waste position: '.$msg.'<br>');
}


function gotowash($job){
 $workload = $job->workload();
 $msg = gearmangotowash();
 $job->sendData('Going to wash position: '.$msg.'<br>');
}

function wash($job){
 $workload = $job->workload();
 $msg = gearmanwash($workload);
 $job->sendData('Tip washed washtime: '.$workload.'<br>');
}


function setdrops($job){
 $workload = $job->workload();
 $msg = gearmansetdrops($workload);
 $job->sendData('Drops set: '.$msg.'<br>');
}

function fire($job){
 $json = openjson();
 if (($json['runmode']['on'] == 1) and ($json['strobpass'] == 0)) {
  $job->sendData('No dispensing strobcheck failed<br>');
  taskjoberror("fire ".$json['wavecontroller']['drops'],"1");
 }
 else {
  $workload = $job->workload();
  $msg = gearmanfire();
  taskjobtracker("fire ".$json['wavecontroller']['drops'],"1");
  $job->sendData('Piezo dispensed: '.$msg.'<br>');
 }
}

function headcamsnap($job){
 $json = openjson();
 if (($json['runmode']['on'] == 1) and ($json['strobpass'] == 0)) {
  taskjoberror("fire ".$json['wavecontroller']['drops'],"1");
  $job->sendData('No headcam picture taken strobcheck failed<br>');
 } else {
  $workload = $job->workload();
  $msg = gearmanheadcamsnap();
  taskjobtracker("fire ".$json['wavecontroller']['drops'],"1");
  $job->sendData('Headcam snapped: '.$msg.'<br>');
 }
}




function strobcamsnap($job){
 $workload = $job->workload();
 $msg = gearmanstrobcamsnap();
 $job->sendData('Strobcam snapped: '.$msg.'<br>');
}

function delay($job){
 $workload = $job->workload();
 $json = openjson();
 $logger = './loggerdataset';
 sleep($workload);
 $job->sendData('VendLab sleeping '.$workload.'<br>');
 closejson($json);
}


function P1move($job){
  $workload = $job->workload();
  $logger = './loggerdataset';
  $json = movep1lac($json,$logger,$workload);
  $job->sendData('Moving p1 actuator to: '.$json['P1position'].'<br>');
}



function P1position($job){
 $json = openjson();
 $workload = $job->workload();
 $logger = './loggerdataset';
 $json = reportp1lacposition($json,$logger);
 $job->sendData('P1 actuator position at: '.$json['P1position'].'<br>');
 closejson($json);
}

//$gmworker->addFunction("P1stop", "P1stop");
function P1stop($job){
 $json = openjson();
 $workload = $job->workload();
 $logger = './loggerdataset';
 $json =killp1lac($json,$logger);
 $job->sendData('P1 actuator stopped<br>');
 closejson($json);
}

function position($job){
 $json = openjson();
 $workload = $job->workload();
 $logger = './loggerdataset';
 $json = smoothiesocketreportposition('M114',$json);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}


function move($job){
 $json = openjson();
 if (($json['runmode']['on'] == 1) and ($json['strobpass'] == 0)) {
  //taskjoberror("fire ".$json['wavecontroller']['drops'],"1");
  $job->sendData('No moving, strobcheck failed<br>');
 } else {
  $workload = $job->workload();
  $moveval = $json['mmmove'];
  $logger = './loggerdataset';
  echo $workload."\r\n";
  $json = smoothiesocketmove($workload,$json,$logger);
  $job->sendData($json['smoothiemessage'].'<br>');
 }
 closejson($json);
}




/*
//$gmworker->addFunction("move_hts_s1_dispense", "move_hts_s1_dispense");
function move_hts_s1_dispense($job){
 $json = openjson();
 $workload = $job->workload();
 $moveval = $json['mmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketmove($workload,$json,$logger);
 sleep($workload);
 $msg = gearman_hts_s1_dispense_nowait();
 $job->sendData($json['smoothiemessage'].' '.$msg.'<br>');
 closejson($json);
}

//$gmworker->addFunction("hts_s1_contforgo", "hts_s1_contforgo");
function hts_s1_contforgo($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_contforgo($workload);
 sleep(1);
 $job->sendData($msg);
}


//$gmworker->addFunction("hts_s1_contbackgo", "hts_s1_contbackgo");
function hts_s1_contbackgo($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_contbackgo($workload);
 sleep(1);
 $job->sendData($msg);
}

//$gmworker->addFunction("hts_s1_contstop", "hts_s1_contstop");
function hts_s1_contstop($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_contstop($workload);
 sleep(1);
 $job->sendData($msg);
}


//$gmworker->addFunction("hts_s1_backwardgo", "hts_s1_backwardgo");
function hts_s1_backward($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_backward($workload);
 $job->sendData($msg);
}

//$gmworker->addFunction("hts_s1_forwardgo", "hts_s1_forwordgo");
function hts_s1_forward($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_forward($workload);
 $job->sendData($msg);
}


*/






function moveforward($job){
 $workload = $job->workload();
 $json = openjson();
 $moveval = $json['mmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'Y',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

function movebackward($job){
 $workload = $job->workload();
 $workload = ($workload* -1);
 $json = openjson();
 $moveval = $json['mmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'Y',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

function moveleft($job){
 $workload = $job->workload();
 $workload = ($workload* -1);
 $json = openjson();
 $moveval = $json['mmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'X',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

function moveright($job){
 $workload = $job->workload();
 $json = openjson();
 $moveval = $json['mmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'X',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

function moveup($job){
 $workload = $job->workload();
 $json = openjson();
 $moveval = $json['zmmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'Z',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

function movedown($job){
 $workload = $job->workload();
 $workload = ($workload* -1);
 $json = openjson();
 $moveval = $json['zmmmove'];
 $logger = './loggerdataset';
 $json = smoothiesocketrelativemove($json,$logger,'Z',$workload);
 $job->sendData($json['smoothiemessage'].'<br>');
 closejson($json);
}

/*
//Syringe stuff
//$gmworker->addFunction("fillsyringe", "fillsyringe");
function fillsyringe($job){
 $workload = $job->workload();
 $msg = gearmanfillsyringe($workload);
 $volrty = preg_split('/_/', $workload);
 $vol = $volrty[0];
 $rate = $volrty[1];
 $delay = ceil(($vol / $rate) + 3);
 //echo 'Delay (vol '.$vol.' rate '.$rate.') '.$delay.'<br>';
 sleep($delay);
 $job->sendData('Syringe pump: '.$msg.'<br>');
}

//$gmworker->addFunction("aspirate", "setaspiratevol");
function aspirate($job){
 $workload = $job->workload();
 $msg = gearmanaspirate($workload);
 $volrty = preg_split('/_/', $workload);
 $vol = $volrty[0];
 $rate = $volrty[1];
 $delay = ceil(($vol / $rate) + 3);
 //echo 'Delay (vol '.$vol.' rate '.$rate.') '.$delay.'<br>';
 sleep($delay);
 $job->sendData('Syringe pump: '.$msg.'<br>');
}

function dispense($job){
 $workload = $job->workload();
 $msg = gearmandispense($workload);
 $volrty = preg_split('/_/', $workload);
 $vol = $volrty[0];
 $rate = $volrty[1];
 $delay = ceil(($vol / $rate) + 3);
 sleep($delay);
 $job->sendData('Syringe pump: '.$msg.'<br>');
}

//$gmworker->addFunction("aspirate", "setaspiratevol");
function htsaspirate($job){
 $workload = $job->workload();
 $msg = gearmanaspirate($workload); // Here I need to create a gearmanhtsaspirate function
 $volrty = preg_split('/_/', $workload);
 $vol = $volrty[0];
 $rate = $volrty[1];
 $delay = ceil(($vol / $rate) + 3); //calculating the delay is important and this case wehave to calculate base on microsecond delay
 // round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2);
 //echo 'Delay (vol '.$vol.' rate '.$rate.') '.$delay.'<br>';
 sleep($delay);
 $job->sendData('Syringe pump: '.$msg.'<br>');
}

//$gmworker->addFunction("aspirate", "setaspiratevol");
function hts_s1_syringesettings($job){
 $workload = $job->workload();
 $msg = gearman_s1_syringesettings($workload); 
 sleep(1);
 $job->sendData('Syringe pump: '.$msg.'<br>');
}

/*
//$gmworker->addFunction("powerupsyringe", "powerupsyringe");
function powerupsyringe($job){
 $workload = $job->workload();
 $msg = gearmanpowerupsyringe($workload); 
 sleep(2);
 $job->sendData('Syringemotor pump: '.$msg.'<br>');
}

//$gmworker->addFunction("powerdownsyringe", "powerdownsyringeup");
function powerdownsyringe($job){
 $workload = $job->workload();
 $msg = gearmanpowerdownsyringe($workload); 
 sleep(2);
 $job->sendData('Syringemotor pump: '.$msg.'<br>');
}
//$gmworker->addFunction("powerupvalve", "powerupvalve");
function powerupvalve($job){
 $workload = $job->workload();
 $msg = gearmanpowerupvalve($workload); 
 sleep(2);
 $job->sendData('Syringevalve: '.$msg.'<br>');
}

//$gmworker->addFunction("powerdownvalve", "powerdownvalve");
function powerdownvalve($job){
 $workload = $job->workload();
 $msg = gearmanpowerdownvalve($workload); 
 sleep(2);
 $job->sendData('Syringevalve: '.$msg.'<br>');
}

*/

//$gmworker->addFunction("powerupheadcamlinear", "powerupheadcamlinear");
function powerupheadcamlinear($job){
 $workload = $job->workload();
 $msg = gearmanheadcam_linearactuatorsocket_start($workload); 
 sleep(2);
 $job->sendData('Headcam linear socket: '.$msg.'<br>');
}

//$gmworker->addFunction("powerdownheadcamlinear", "powerdownheadcamlinear");
function powerdownheadcamlinear($job){
 $workload = $job->workload();
 $msg = gearmanheadcam_linearactuatorsocket_stop($workload); 
 sleep(2);
 $job->sendData('Headcam linear socket: '.$msg.'<br>');
}





//$gmworker->addFunction("smoothiesocketstart", "smoothiesocketstart");
function smoothiesocketstart($job){
 $workload = $job->workload();
 $msg = gearman_smoothiesocketstart($workload);
 $job->sendData($msg.'<br>');
}
//$gmworker->addFunction("smoothiesocketstop", "smoothiesocketstop");
function smoothiesocketstop($job){
 $workload = $job->workload();
 $msg = gearman_smoothiesocketstop($workload);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("powerpumpssocketstart", "powerpumpssocketstart");
function powerpumpssocketstart($job){
 $workload = $job->workload();
 $msg = gearman_powerpumpssocketstart($workload);
 $job->sendData($msg.'<br>');
}
//$gmworker->addFunction("powerpumpssocketstop", "powerpumpssocketstop");
function powerpumpssocketstop($job){
 $workload = $job->workload();
 $msg = gearman_powerpumpssocketstop($workload);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("syringesocketstart", "syringesocketstart");
function syringesocketstart($job){
 $workload = $job->workload();
 $msg = gearman_syringesocketstart($workload);
 $job->sendData($msg.'<br>');
}
//$gmworker->addFunction("syringesocketstop", "syringesocketstop");
function syringesocketstop($job){
 $workload = $job->workload();
 $msg = gearman_syringesocketstop($workload);
 $job->sendData($msg.'<br>');
}
//$gmworker->addFunction("headcam_linearactuatorsocketstart", "headcam_linearactuatorsocketstart");
function headcam_linearactuatorsocketstart($job){
 $workload = $job->workload();
 $msg = gearman_headcam_linearactuatorsocket_start($workload);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("headcam_linearactuatorsocketstop", "headcam_linearactuatorsocketstop");
function headcam_linearactuatorsocketstop($job){
 $workload = $job->workload();
 $msg = gearman_headcam_linearactuatorsocket_stop($workload);
 $job->sendData($msg.'<br>');
}

$gmworker->addFunction("socketflagoff", "socketflagoff");

//$gmworker->addFunction("socketflagon", "socketflagon");
function socketflagon($job){
 $workload = $job->workload();
 $msg = gearman_socketflagon($workload);
 $msg = "Socket flag indicator on<br>";
 $job->sendData($msg.'<br>');
}

function socketflagoff($job){
 $workload = $job->workload();
 $msg = gearman_socketflagoff($workload);
 $msg = "Socket flag indicator off<br>";
 $job->sendData($msg.'<br>');
}








//$gmworker->addFunction("powerupsmoothie", "powerupsmoothie");
function powerupsmoothie($job){
 $workload = $job->workload();
 $msg = gearmanpowerupsmoothie($workload); 
 sleep(2);
 $job->sendData('Smoothie power: '.$msg.'<br>');
}



//$gmworker->addFunction("powerdownsmoothie", "powerdownsmoothie");
function powerdownsmoothie($job){
 $workload = $job->workload();
 $msg = gearmanpowerdownsmoothie($workload); 
 sleep(2);
 $job->sendData('Smoothie power: '.$msg.'<br>');
}


/*
//$gmworker->addFunction("hts_s1_steps", "hts_s1_steps");
function hts_s1_setsteps($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_steps($workload); 
 sleep(1);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("hts_s1_steprate", "hts_s1_steprate");
function hts_s1_setsteprate($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_steprate($workload); 
 sleep(1);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("hts_s1_steps", "hts_s1_retractsteps");
function hts_s1_retractsetsteps($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_retractsteps($workload); 
 sleep(1);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("hts_s1_steprate", "hts_s1_retractsteprate");
function hts_s1_retractsetsteprate($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_retractsteprate($workload); 
 sleep(1);
 $job->sendData($msg.'<br>');
}

//$gmworker->addFunction("hts_s1_aspirate", "hts_s1_aspirate");
function hts_s1_aspirate($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_aspirate($workload); 
 sleep(1);
 $job->sendData($msg);
}

//$gmworker->addFunction("hts_s1_dispense", "hts_s1_dispense");
function hts_s1_dispense($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_dispense($workload); 
 sleep(1);
 $job->sendData($msg);
}

//$gmworker->addFunction("hts_s1_homing", "hts_s1_homing");
function hts_s1_homing($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_homing(); 
 sleep(1);
 $job->sendData($msg);
}
*/

//$gmworker->addFunction("hts_s1_valveinput", "hts_s1_valveinput");
function hts_s1_valveinput($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_valveinput(); 
 sleep(2.5);
 $job->sendData($msg);
}


//$gmworker->addFunction("hts_s1_valveoutput", "hts_s1_valveoutput");
function hts_s1_valveoutput($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_valveoutput(); 
 sleep(2.5);
 $job->sendData($msg);
}

//$gmworker->addFunction("hts_s1_valvebypass", "hts_s1_valvebypass");
function hts_s1_valvebypass($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_valvebypass(); 
 sleep(2.5);
 $job->sendData($msg);
}

/*
//$gmworker->addFunction("hts_s1_fillsyringe", "hts_s1_fillsyringe");
function hts_s1_fillsyringe($job){
 $workload = $job->workload();
 $msg = gearman_hts_s1_fillsyringe(); 
 sleep(2.5);
 $job->sendData($msg);
}

*/


//$gmworker->addFunction("headcamstreamon", "headcamstreamon");
function headcamstreamon($job){
 $workload = $job->workload();
 $msg = gearman_headcamstreamon(); 
 sleep(2.5);
 $job->sendData($msg);
}

//$gmworker->addFunction("headcamstreamoff", "headcamstreamoff");
function headcamstreamoff($job){
 $workload = $job->workload();
 $msg = gearman_headcamstreamoff(); 
 sleep(2.5);
 $job->sendData($msg);
}


?>

