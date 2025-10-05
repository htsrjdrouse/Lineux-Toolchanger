
<?php

$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

$file = $json['strobimages']['currimage'];

$strobjsonprocessing = json_decode(file_get_contents('./strobdatasetprocessing'), true);
$strobdataset = 'strobdataset';
$strobjson = json_decode(file_get_contents($strobdataset), true);

  $file = $json['strobimages']['currimage'];
  $dir = $json['strobimages']['path'];
  $set = $_GET['set'];
  $bx = $json['stroboscopedata']['bx'];
  $by = $json['stroboscopedata']['by'];
  $set=$bx.",".$by.",".$json['stroboscopedata']['exwidth'].",".$json['stroboscopedata']['eyheight'];
  if ($json['stroboscopedata']['autothreshold'] == "1"){ 
   $cmd = "sudo python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." 0 testsample";
  }
  else {
   $cmd = "sudo python gearman.caller.image.proc.py ".$dir."/".$file." ".$set." ".$json['stroboscopedata']['mindiam']." ".$json['stroboscopedata']['maxdiam']." ".$json['stroboscopedata']['userthreshold']." testsample";
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


<b>Scale (width is 1.15mm)</b><br>
Micron per pixel: <input type=text name=micronperpixel class="txt" value=<?php echo $json['stroboscopedata']['micronperpixel']; ?> size=5>
<br><br>
<b>Search box area</b><br>
<table>
<tr><td>Width: </td><td><input type=text name=boxwidth class="txt" value=<?php echo $json['stroboscopedata']['exwidth']; ?> size=5></td></tr>
<tr><td>Height: </td><td><input type=text name=boxheight class="txt" value=<?php echo $json['stroboscopedata']['eyheight']; ?> size=5></td></tr>
</table>
<br><br>
<b>Deflection reference line</b><br>
<table>
<tr><td>X: </td><td><input type=text name=xposition class="txt" value=<?php echo $json['stroboscopedata']['deflectxpos']; ?> size=5></td></tr>
<tr><td>Y: </td><td><input type=text name=yposition class="txt" value=<?php echo $json['stroboscopedata']['deflectypos']; ?> size=5></td></tr>
</table>
<br><br>
<b>Tolerances<br>(Pixels)<b><br>
<table>
<tr><td>Minimum diameter: </td><td><input type=text class="txt" name=mindiam value=<?php echo $json['stroboscopedata']['mindiam']; ?> size=5></td></tr>
<tr><td>Maximum diameter: </td><td><input type=text class="txt" name=maxdiam value=<?php echo $json['stroboscopedata']['maxdiam']; ?> size=5></td></tr>
<tr><td>Maximum deflection: </td><td><input type=text class="txt" name=maxdeflectx value=<?php echo $json['stroboscopedata']['maxdeflectx']; ?> size=5></td></tr>
</table>
<br><br>
<b>Pixels Thresholding<b><br>
<font size=1>
<?php if ($json['stroboscopedata']['autothreshold'] == "1"){ ?>
<input type=radio name=thresholdway value=auto checked>Auto<br>
<input type=radio name=thresholdway value=defined>Defined
<?php } else { ?>
<input type=radio name=thresholdway value=auto>Auto<br>
<input type=radio name=thresholdway value=defined checked>Defined<b2>
<input type=text name=thresholdvalue value=<?=$json['stroboscopedata']['userthreshold'] ?> size=4>
<?php } ?>
</font>
<br>
<input type=submit class="blue">
<br><br>
</form>

</td>
<td align=center>
<div align=left><b>% CV Cutoff (For doing multiple strobchecks)</b></div>
<form action=strobcutoff.php method=get>
<table cellpadding=4 border=1><tr align=center>
<td><font size=1><b><input type=checkbox name=maxspeedcheck <?=$json['strobcutoff']['maxspeedcheck'] ?>> Max Speed <br><input type=text class="txt" name=maxspeedval value=<?=$json['strobcutoff']['maxspeed'] ?> size=4></b></font></td>
<td><font size=1><b><input type=checkbox name=avgspeedcheck <?=$json['strobcutoff']['avgspeedcheck'] ?>> Avg Speed <br><input type=text class="txt" name=avgspeedval value=<?=$json['strobcutoff']['avgspeed'] ?> size=4></b></font></td>
<td><font size=1><b><input type=checkbox name=volumecheck <?=$json['strobcutoff']['volumecheck'] ?>> Volume <br><input type=text class="txt" name=volumeval value=<?= $json['strobcutoff']['volume'] ?> size=4></b></font></td>
<td><font size=1><b><input type=checkbox name=deflectioncheck <?=$json['strobcutoff']['deflectioncheck'] ?>> Deflection <br><input type=text class="txt" name=deflectionval value=<?= $json['strobcutoff']['deflection'] ?> size=4></b></font></td>
<td><input type=submit name=strobcutoff class="blue">
<br>
<?php
/*
$columncenter = $strobjsonprocessing['dataset'][$key]['columncenter']; 
$rowcenter = $strobjsonprocessing['dataset'][$key]['rowcenter'];
$columndiameter = $strobjsonprocessing['dataset'][$key]['columndiameter'];
$rowdiameter = $strobjsonprocessing['dataset'][$key]['rowdiameter'];
echo 'columncenter: '.$columncenter.'<br>';
echo 'rowcenter: '.$rowcenter.'<br>';
echo 'columndiameter: '.$columndiameter.'<br>';
echo 'rowdiameter: '.$rowdiameter.'<br>';
*/
?>

</td>
</tr></table>
</form>
<?php 
//$file = '50_100_16.jpg'; 
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
//$file = '1422384993_V100_P50.png';
//$file = '1422473101_V110_P90.jpg';
//$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
$file = $json['strobimages']['path'].'/'.$json['strobimages']['currimage'];
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

?>

<script type="application/processing">

/* @pjs preload="<?php echo $file; ?>"; */

PImage bg;

PFont f;
int a; 
boolean overRightButton = false;
boolean reGrid = false;
boolean setSearcharea = false;
boolean overLeftButton = false;

//added to make a box
float bx = <?php echo $json['stroboscopedata']['bx']; ?>;
float by = <?php echo $json['stroboscopedata']['by']; ?>;
float bs = <?php echo ($json['stroboscopedata']['exwidth']); ?>;
//float bs = (50/2);
//float bs = <?php echo ($json['grid']['ex']/2); ?>;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 



String filen; 
String pictfile; 
float rampx;
float rampy;
float calcx;
float calcy;

int distx;
int disty;
int lenx;
int leny;


int[] cx = new int[9];
int[] cy = new int[9];
int[] dia = new int[9];



int px,py,rowdiam,columndiam;
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 60;     // Diameter of rect
int circleSize = 60;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

String litester = "450,2,5";
int[] tester = split(litester, ',');
int dropcalc = <?php echo $dropcalc; ?>;

//String columncent = "450,2,5";


<?php
   if ($dropcalc > 0){
	$columncenter = $strobjsonprocessing['dataset'][$key]['columncenter'];
	$rowcenter = $strobjsonprocessing['dataset'][$key]['rowcenter'];
	$columndiameter = $strobjsonprocessing['dataset'][$key]['columndiameter'];
	$rowdiameter = $strobjsonprocessing['dataset'][$key]['rowdiameter'];
	$volume = $strobjsonprocessing['dataset'][$key]['volume'];
	$signal = $strobjsonprocessing['dataset'][$key]['signal'];
   }
   else {
	$columncenter = '';
	$rowcenter = '';
	$columndiameter = '';
	$rowdiameter = '';
	$volume = '';
	$signal = '';
   }
?>



String columncent = "<?php echo $columncenter; ?>";
String rowcent = "<?php echo $rowcenter; ?>";
String rowdiam = "<?php echo $rowdiameter; ?>";
String columndiam = "<?php echo $columndiameter; ?>";
String vol = "<?php echo $volume; ?>";
String sig = "<?php echo $signal; ?>";


int[] columncenter = split(columncent, ',');
int[] rowcenter = split(rowcent, ',');
int[] rowdiameter = split(rowdiam, ',');
int[] columndiameter = split(columndiam, ',');
int[] volume = split(vol, ',');
int[] signal = split(sig, ',');

int diameter;


//<?php echo array(1,2,3); ?>;
PFont font;



void setup() {
  filen = '<?php echo $file; ?>';
  pictfile = '<?php echo $filei; ?>';

  
  //size(768,576);
  //640x480
  size(640,480);
  frameRate(30);

  bg = loadImage('<?php echo $file; ?>');
  
  rectColor = color(0);
  rectHighlight = color(101);
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 0;
  circleY = 100;
  //rectX = width/2-rectSize-10;
  //rectY = height/2-rectSize/2;
  rectX = 0;
  rectY = 40;
  ellipseMode(CENTER);

  bx = <?php echo $json['stroboscopedata']['bx'];?>;
  by = <?php echo $json['stroboscopedata']['by'];?>;

}

void draw() {
  update(mouseX, mouseY);

  background(currentColor);
  background(bg);



  //Draw deflection line
  stroke(40, 247, 244);
  line(<?php echo $json['stroboscopedata']['deflectxpos']; ?>, <?php echo $json['stroboscopedata']['deflectypos']; ?>,<?php echo $json['stroboscopedata']['deflectxpos']; ?>, <?php echo $json['stroboscopedata']['deflectypos']; ?>+1000);


   font = loadFont("FFScala.ttf"); 
   textFont(font); 
   fill(255, 255, 255);
   text("X: ", 15, 20, -30); 
   text(bx, 28, 20, -30); 
   text("Y: ", 55, 20, -30); 
   text(by, 68, 20, -30); 
   //float pixval =  get(bx, by);
   text("Pix val (RGB): ", 15, 35, -30); 
   //text(get(bx,by), 58, 35, -30); 
   text(parseInt((hex(get(bx,by),6)).substring(0,2),16), 95, 35, -30); 
   text(parseInt((hex(get(bx,by),6)).substring(2,4),16), 120, 35, -30); 
   text(parseInt((hex(get(bx,by),6)).substring(4,6),16), 145, 35, -30); 
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  //stroke(255);
  noStroke();
  rect(rectX, rectY, rectSize+35, rectSize);
  textFont(font); 
  fill(255, 255, 255);
  text("Set search area", 5, rectY+30, -30); 
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  rect(circleX, circleY, circleSize+35, circleSize);
  textFont(font); 
  fill(0, 0, 0);
  text("Analyze drops", 5, circleY+30, -30); 



  //for box move
  // Test if the cursor is over the box 
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    bover = false;
  }
  // Draw the box
  stroke(226, 204, 0);
  noFill();
  rect(bx, by, <?php echo($json['stroboscopedata']['exwidth']); ?> , <?php echo ($json['stroboscopedata']['eyheight']); ?>);
  
  stroke(244, 51, 255);

 
  //show drops
  for(i=0;i<dropcalc;i=i+1){
    if (signal[i] > 0){
      if (rowdiameter[i] > columndiameter[i]){
	diameter = rowdiameter[i];	 
      }
      else {
 	diameter = columndiameter[i];
      }
      ellipse(columncenter[i], rowcenter[i], diameter, diameter);
    }
  }

}

void update(int x, int y) {
  //Analyze droplets
  if ( overCircle(circleX, circleY+20, circleSize+10,circleSize) ) {
    circleOver = true;
    rectOver = false;
  } 
  //Set Searcharea
  else if ( overRect(rectX, rectY, rectSize+50, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
 //Analyze droplets
  if (circleOver) {
    //currentColor = circleColor;
    link("strobsettings.php?set="+bx+","+by+","+<?php echo $json['stroboscopedata']['exwidth']; ?>+","+<?php echo $json['stroboscopedata']['eyheight']; ?>+"&file="+filen);
  }
 //setSearcharea
  if (rectOver) {
    //currentColor = rectColor;
    link("strobsettings.php?bx="+bx+"&by="+by);
  }

  if(bover == true) {
    locked = true;
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-bx;
  bdify = mouseY-by;



}

void mouseDragged() {
  if(bover ==true){
   if(locked) {
     bx = mouseX-bdifx; 
     by = mouseY-bdify; 

   }
  }
}



boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}









</script><canvas width="200" height="200"></canvas></p>
<div style="height:0px;width:0px;overflow:hidden;"><img src='milan_rubbish.jpg' id='milan_rubbish.jpg'/></div>

</td></tr></table>

<?php
 file_put_contents($imgdataset, json_encode($json));
?>
</ul>





