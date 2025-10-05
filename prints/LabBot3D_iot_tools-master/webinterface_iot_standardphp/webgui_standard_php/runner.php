<html>

<?php header("Cache-Control: no-cache, must-revalidate"); ?>


<?php include('repstrapfunctionslib.php'); ?>

<title>HTSRepstrap Logger</title>
<script src="/jquery.js" type="text/javascript"></script>
<script src="my_script.js?version=10" type="text/javascript"></script>
<body>
<style>
.imgStop { 
font-size: 1em;
color: transparent;
background:url(stop.png) no-repeat;
background-size:80%;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 100px;
height: 100px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

</style>

<?php
//mmmove=20&tcli=Right
//http://192.168.1.72/gui.mod13/runner.php?view=E&rungcode=rungcode&ract=RUN+MACRO
$tcli = $_GET['tcli'];
$mmmove = $_GET['mmmove'];
$zmmmove = $_GET['zmmmove'];
$viewer = $_GET['viewer'];

$json = openjson();

if (isset($_GET['viewer'])){
 $json['view'] = "B";
}

//<input type="submit" name="tmove" value="Move (mm)" class="blue">
if (isset($_GET['tmove'])){
  $moveval = $_GET['tmove'];
  $json['mmmove'] = $mmmove;
  closejson($json);
  header('Location: gui.mod.php');
}

else if (isset($_GET['tzmove'])){
  $moveval = $_GET['tzmove'];
  $json['zmmmove'] = $zmmmove;
  closejson($json);
  header('Location: gui.mod.php');
}


//Here is where the uploaded transferlist is run

else if (isset($_GET['rungcode'])){
  $json['view'] = $_GET['view'];
 if ($json['gearmanpid'] > 0){
   if ($json["stop"] == "1"){
	echo 'System HALT, You need to press the "GO" button.<br>';
   }
  else {
   if ($json['tranferslistfile'] == 0){
 	$jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
 	file_put_contents('taskjob3', json_encode($jsontasker3));
 	$json = readgcodefile($jsontasker3['data'][$jsontasker3['track']],$json);
   }
  } 
 //echo $_GET['rungcode'];
?>
<font face=arial>
<form action=stoprun.php method=get>
<h1><font color=red>ALERT! SYSTEM IS RUNNING</font></H1>
<div class="stop">
 <input type=submit name=cli class="imgStop" value="STOP RUN">
</div>

<table><tr valign=top>

<td>
<br>-----------<b>System Tracking</b>-------------<br>
<?php
  echo '<input type=hidden name=pid value='.$pid.'>';
  echo '<div id="success"></div>';
  $cmd = 'sudo php smoothie.gearman.client.list.php';
  $pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
?>
</form>
<?php
 }
  closejson($json);
}

//Here is where call the command from the form 
else if (isset($_GET['tcli'])){
?>



<font face=arial>
<br>

<?
 if ($_GET['tcli'] == "headcamstreamon") {
  echo "Turning on head camera web stream<br>";
}
 else if ($_GET['tcli'] == "headcamstreamoff") {
  echo "Turning off head camera web stream<br>";
}
 else {
?>
<h1>

<font color=red>ALERT! SYSTEM IS RUNNING</font></H1>
<form action=stoprun.php method=get>
<div class="stop">
 <input type=submit name=cli class="imgStop" value="STOP RUN">
</div>
<br>-----------<b>System Tracking</b>-------------<br>


<?
}


//Below is a list of individual commands

echo '<br>';
if ($json['gearmanpid'] > 0){
//"zmmmove":"10","mmmove":"20"
//$cmd = $cmd .' '.$json['zmmmove'];

//echo $tcli.'<br>';
//echo $mmmove.'<br>';

if (($_GET['tcli'] == "move")){
  $scmd = 'move';
  $scmd = $scmd .' '.$mmmove;
  //echo $scmd.'<br>';
  taskjob($scmd,0);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "reports1settings")){
  $scmd = 'hts_s1_syringesettings go';
  taskjob("",0);
  taskjob($scmd,1);
  taskjob('finish 0',1);
}


else if (($_GET['tcli'] == "gotodry")){
  taskjob("",0);
  $scmd = 'gotodry go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "gotostrob")){
  taskjob("",0);
  $scmd = 'gotostrob go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "backtoz")){
  taskjob("",0);
  $scmd = 'move G1Z'.$json['ztrav'].'F'.$json['zfeedrate'];
  taskjob($scmd,1);
  $scmd = 'P1move 0500';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}


//$url = 'runner.php?mmmove='.($well-1).'&tcli=gotostrob';

else if (($_GET['tcli'] == "gotowell")){
  taskjob("",0);
  $well = $_GET['mmmove'];
  $scmd = 'gotowell 1';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "dry")){
  taskjob("",0);
  $scmd = 'gotodry go';
  taskjob($scmd,1);
  $scmd = 'dry '.$json['washing']['touchdrytime'];
  taskjob($scmd,1);
  $scmd = 'move G1Z'.$json['ztrav'].'F'.$json['zfeedrate'];
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "gotowash")){
  taskjob("",0);
  $scmd = 'gotowash go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "gotowaste")){
  taskjob("",0);
  $scmd = 'gotowaste go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "wash")){
  taskjob("",0);
  if ($json['syringepump']['trackaspvol'] > 0 ){
   $scmd = 'gotowaste go';
   taskjob($scmd,1);
   $vol = $json['syringepump']['trackaspvol'];
   $rate = 20; 
   $volrt = $vol.'_'.$rate;
   $delay = ceil(($vol / $rate) + 1);
   $scmd = 'dispense '.$volrt;
   taskjob($scmd,1);
   $scmd = 'delay '.$delay;
   taskjob($scmd,1);
  }
  $scmd = 'gotowash go';
  taskjob($scmd,1);
  $scmd = 'wash '.$json['washing']['washtime'];
  taskjob($scmd,1);
  $scmd = 'move G1Z'.$json['ztrav'].'F'.$json['zfeedrate'];
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "washdry")){
  taskjob("",0);
  //here I need to go to waste if the trackvolume is greater the 0
  if ($json['syringepump']['trackaspvol'] > 0 ){
   $scmd = 'gotowaste go';
   taskjob($scmd,1);
   $vol = $json['syringepump']['trackaspvol'];
   $rate = 20; 
   $volrt = $vol.'_'.$rate;
   $delay = ceil(($vol / $rate) + 1);
   $scmd = 'dispense '.$volrt;
   taskjob($scmd,1);
   $scmd = 'delay '.$delay;
   taskjob($scmd,1);
  }
  $scmd = 'gotowash go';
  taskjob($scmd,1);
  $scmd = 'wash '.$json['washing']['washtime'];
  taskjob($scmd,1);
  $scmd = 'gotodry go';
  taskjob($scmd,1);
  $scmd = 'dry '.$json['washing']['touchdrytime'];
  taskjob($scmd,1);
  $scmd = 'move G1Z'.$json['ztrav'].'F'.$json['zfeedrate'];
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "fillsyringe")){
  $volrt = $_GET['mmmove'];
  $volrty = preg_split('/_/', $volrt);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $delay = ceil(($vol / $rate) + 3);
  taskjob("",0);
  $scmd = 'fillsyringe '.$volrt;
  taskjob($scmd,1);
  //$scmd = 'delay '.$delay;
  //taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "aspirate")){
  $volrt = $_GET['mmmove'];
  $volrty = preg_split('/_/', $volrt);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $delay = ceil(($vol / $rate) + 3);
  taskjob("",0);
  $scmd = 'aspirate '.$volrt;
  taskjob($scmd,1);
  //$scmd = 'delay '.$delay;
  //taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "strobsnap")){
  $pictdelay = $_GET['mmmove'];
  taskjob("",0);
  $scmd = 'strobsnap '.$pictdelay;
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "analyzestrobimg")){
  $sample = $_GET['mmmove'];
  taskjob("",0);
  $scmd = 'analyzestrobimg '.$sample;
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "poweron")){
  taskjob("",0);
  taskjob('powerupsmoothie go',1);
  taskjob('powerupsyringe go',1);
  taskjob('powerupvalve go',1);
  taskjob('powerupheadcamlinear go',1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "poweroff")){
  taskjob("",0);
  taskjob('powerdownsmoothie go',1);
  taskjob('powerdownsyringe go',1);
  taskjob('powerdownvalve go',1);
  taskjob('powerdownheadcamlinear go',1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "startsockets")){
  taskjob("",0);
  taskjob('smoothiesocketstart go',1);
  taskjob('powerpumpssocketstart go',1);
  taskjob('syringesocketstart go',1);
  taskjob('headcam_linearactuatorsocketstart go',1);
  taskjob('socketflagon go',1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "stopsockets")){
  taskjob("",0);
  taskjob('smoothiesocketstop go',1);
  taskjob('powerpumpssocketstop go',1);
  taskjob('syringesocketstop go',1);
  taskjob('headcam_linearactuatorsocketstop go',1);
  taskjob('socketflagoff go',1);
  taskjob('finish 0',1);
}


else if (($_GET['tcli'] == "dispense")){
  $volrt = $_GET['mmmove'];
  $volrty = preg_split('/_/', $volrt);
  $vol = $volrty[0];
  $rate = $volrty[1];
  $delay = ceil(($vol / $rate) + 3);
  taskjob("",0);
  $scmd = 'dispense '.$volrt;
  taskjob($scmd,1);
  //$scmd = 'delay '.$delay;
  //taskjob($scmd,1);
  taskjob('finish 0',1);
}





else if (($_GET['tcli'] == "Front")){
  $scmd = 'forward';
  $scmd = $scmd .' '.$json['mmmove'];
  taskjob($scmd,0);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "Back")){
 $scmd = 'backward';
 $scmd = $scmd .' '.$json['mmmove'];
 taskjob($scmd,0);
 taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "Right")){
 $scmd = 'right';
 $scmd = $scmd .' '.$json['mmmove'];
 taskjob($scmd,0);
 taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "Left")){
 $scmd = 'left';
 $scmd = $scmd .' '.$json['mmmove'];
 taskjob($scmd,0);
 taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "Z up")){
 $scmd = 'up';
 $scmd = $scmd .' '.$json['zmmmove'];
 taskjob($scmd,0);
 taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "Z down")){
 $scmd = 'down';
 $scmd = $scmd .' '.$json['zmmmove'];
 taskjob($scmd,0);
 taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "s1setsteps")){
  $steps = $_GET['mmmove'];
  taskjob("",0);
  $scmd = 'hts_s1_steps '.$steps;
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "s1setsteprate")){
  $steprate = $_GET['mmmove'];
  taskjob("",0);
  $scmd = 'hts_s1_steprate '.$steprate;
  taskjob($scmd,1);
  taskjob('finish 0',1);
}


else if (($_GET['tcli'] == "move_hts_s1_dispense")){
  $delay = $_GET['mmmove'];
  taskjob("",0);
  $scmd = 'move_hts_s1_dispense '.$delay;
  taskjob($scmd,1);
  taskjob('finish 0',1);
}



else if (($_GET['tcli'] == "s1aspirate")){
  taskjob("",0);
  $scmd = 'hts_s1_aspirate go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "s1dispense")){
  taskjob("",0);
  $scmd = 'hts_s1_dispense go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}
else if (($_GET['tcli'] == "s1homing")){
  taskjob("",0);
  $scmd = 'hts_s1_homing go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "headcamstreamon")){
  taskjob("",0);
  $scmd = 'headcamstreamon go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}

else if (($_GET['tcli'] == "headcamstreamoff")){
  taskjob("",0);
  $scmd = 'headcamstreamoff go';
  taskjob($scmd,1);
  taskjob('finish 0',1);
}









echo '<div id="success"></div>';
$cmd = 'sudo php smoothie.gearman.client.list.php';
//echo $cmd.'<br>';
//This turns the boolean flag transferlistfile off 
 $json['tranferslistfile'] = 0;
/*
$tcli = $_GET['tcli'];
$mmmove = $_GET['mmmove'];
*/
 closejson($json);
 $pid = exec(sprintf("%s > /dev/null 2>&1 & echo $!", $cmd));
 //echo '<B>Move: '.$tcli.' Extent (mm): '.$mmmove.' Process id (pid): '.$pid.'</b><br>';
 echo '<input type=hidden name=pid value='.$pid.'>';
 echo '</form>';

} //end json['gearmanpid'] condition
} //end tcli condition


else {
 echo '</form>';
}
?>

</td>

</tr></table>
<br>

<h2></h2>

</font>
</body>
</html>


