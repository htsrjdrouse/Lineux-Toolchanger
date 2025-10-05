
<?php

$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$file = $json['strobimages']['currimage'];
$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
$strobdataset = 'strobdataset';
$strobjson = json_decode(file_get_contents($strobdataset), true);
$file = $json['strobimages']['currimage'];


$dir = $json['strobimages']['path'];
  //$set = $_GET['set'];
  $bx = $json['stroboscopedata']['bx'];
  $by = $json['stroboscopedata']['by'];
  $set=$bx.",".$by.",".$json['stroboscopedata']['exwidth'].",".$json['stroboscopedata']['eyheight'];
  if ($json['stroboscopedata']['autothreshold'] == "1"){ 
   $cmd = "python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." 0 testsample";
  }
  else {
   $cmd = "python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." ".$json['stroboscopedata']['userthreshold']." testsample";
  }
  
  //echo $cmd.'<br>';
?>


<body>
<style type=text/css>
button.red {background-color: #F8D6D6;}
button.green {background-color: #BCF5A9;}
//input.blue {background-color: #EADFF7;}
input.blue {background-color: #FFFF00;}
button.violet {background-color: #CED8F6;}
input.txt {text-align:center;}
}
</style>



<font face=arial>



<ul>
<table cellpadding=10 border=1><tr valign=top><td>
<form action=strobsettings.php method=POST>
  <?php
  if (array_search($file, $strobjsonprocessing['key']) > -1){
   $key = array_search($file, $strobjsonprocessing['key']);
   echo '<input type=hidden name=key value='.$key.'>';
   echo '<textarea id="yourcode" name="annotation" cols="20" rows="3">';
   echo $strobjsonprocessing['dataset'][$key]['sample'];
   echo '</textarea>';
  }
  ?>
  <input type=submit class="blue">
</form>
<form action=strobsettings.php method=GET>
<?php
$dropcalc = 0;
if (array_search($file, $strobjsonprocessing['key']) > -1){
   $key = array_search($file, $strobjsonprocessing['key']);
   //echo "84key ".$key."<br>";
   $dropcalc =  ($strobjsonprocessing['dropcalc'][$key]['drops']);
   $volume = $strobjsonprocessing['dataset'][$key]['volume'];
   $volry = preg_split('/,/', $volume);
   $rowry = preg_split('/,/', $strobjsonprocessing['dataset'][$key]['rowcenter']);
   $colry = preg_split('/,/', $strobjsonprocessing['dataset'][$key]['columncenter']);
   $volcalc = 0;
   //1422472908_V100_P50_LD250.jpg
   //if (preg_match('/setpulse (.*)/', $htscmd, $mv)){
   // $json['wavecontroller']['pulse'] = $mv[1];
   preg_match('/^.*LD(.*).jpg/', $file, $mv);
   //rowcenter
   //$json['stroboscopedata']['deflectxpos'];
   $speed = 0;
   $deflect = 0;
   //{"key":["1422473101_V110_P90_LD250.jpg"],"dataset":[{"columncenter":"406,407","rowcenter":"120,248","columndiameter":"8,13","rowdiameter":"8,10","volume":"200.96,392.5","signal":"9.6734693877551,13.355263157895","image":"1422473101_V110_P90_LD250.jpg","reload":"0","sample":"sample"}],"dropcalc":[{"avgdeflection":28.98,"avgspeed":4.6368,"drops":2,"maxspeed":6.75648,"minspeed":2.51712,"totalvolume":593.46}]}
   echo '<font size=1><b>Drops Count: '.$strobjsonprocessing['dropcalc'][$key]['drops'].'<br>';
   echo 'Total Volume '.round($strobjsonprocessing['dropcalc'][$key]['totalvolume'],2).'pl<br>';
   echo '------------------------------<br>';
   $columndiameter = $strobjsonprocessing['dataset'][$key]['columndiameter']; 
   $coldiam = preg_split('/,/', $columndiameter);
   $dataset = $strobjsonprocessing['dataset'][$key];
   $rowdiam = preg_split('/,/', $dataset['rowdiameter']);
   $vol = preg_split('/,/', $dataset['volume']);
   $sig = preg_split('/,/', $dataset['signal']);
   for ($i=0;$i<$strobjsonprocessing['dropcalc'][$key]['drops'];$i++){
	echo '&nbsp;Drop '.($i+1).': Coldiam '.round($coldiam[$i],2).' Rowdiam '.round($rowdiam[$i],2).'<br>';
	echo '&nbsp;&nbsp;Volume: '.round($vol[$i],2).': Signal '.round($sig[$i],2).' <br>';
   }
   echo '------------------------------<br>';
   echo 'Average Speed '.round($strobjsonprocessing['dropcalc'][$key]['avgspeed'],2).'m/s<br>';
   echo 'Maximum Speed '.round($strobjsonprocessing['dropcalc'][$key]['maxspeed'],2).'m/s<br>';
   echo 'Minimum Speed '.round($strobjsonprocessing['dropcalc'][$key]['minspeed'],2).'m/s<br>';
   echo 'Average Deflection '.round($strobjsonprocessing['dropcalc'][$key]['avgdeflection'],2).'&micro;m<br>';
   echo '</font></b><br><br>';
}
?>
<? include('strob.form.inc.php'); ?>
</td>


<?php 
//$file = '50_100_16.jpg'; 
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
//$file = '1422384993_V100_P50.png';
//$file = '1422473101_V110_P90.jpg';
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
$file = $json['strobimages']['path'].'/'.$json['strobimages']['currimage'];
//echo "now this file ".$file."<br>";
$filei = $file;
?>
<?php 
/*
#sudo python wellmap.py 198 85 50 50 57.22_89.98_0.jpg 30 2 2 50 50


bx = int(sys.argv[1])
by = int(sys.argv[2])
ex = int(sys.argv[3])
ey = int(sys.argv[4])
file = sys.argv[5]
#dim = 30
dim = int(sys.argv[6])
xnum = int(sys.argv[7])
ynum = int(sys.argv[8])
spacex = int(sys.argv[9])
spacey = int(sys.argv[10])
*/
/*
  echo '<br>strob image file '.$file.'<br>';
  echo '<br>strob image filei '.$filei.'<br>';
  echo '<br>strob image dir '.$dir.'<br>';
*/
?>
<td>


<? include('post.strob.analysis.php');?>





</td></tr></table>

<?php
 file_put_contents($imgdataset, json_encode($json));
?>
</ul>





