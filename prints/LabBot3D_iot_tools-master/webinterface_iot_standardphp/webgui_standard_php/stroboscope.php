<html>
<head>
<script src="/processing.js"></script>
<script type=text/javascript src="/jquery.js"></script>
<script type=text/javascript src="/jquery.tabs.js"></script>
<script type=text/javascript src="/jquery.min.js"></script>
<script type=text/javascript src="/jquery.validate.js"></script>
<script type=text/javascript src="/custom.js"></script>
<link rel="stylesheet" href="/style.css">
</head>

<?php

$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$rampx = 40;
$rampy = 40;
$micronperpixel = 5.55;

$columncenter = "";
$rowcenter = "";
$columndiameter = "";
$rowdiameter = "";
$volume = "";
$signal = "";

if(isset($_GET['bx'])){
$json['stroboscopedata']['bx'] = $_GET['bx'];
$json['stroboscopedata']['by'] = $_GET['by'];
}

if(isset($_GET['boxwidth'])){
//"stroboscopedata":{"bx":100,"by":100,"micronperpixel":5.55,"exwidth":50,"eyheight":50,"deflectxpos":476,"deflectypos":44}

$json['stroboscopedata']['mindiam'] = $_GET['mindiam'];
$json['stroboscopedata']['maxdeflectx'] = $_GET['maxdeflectx'];
$json['stroboscopedata']['micronperpixel'] = $_GET['micronperpixel'];
$json['stroboscopedata']['deflectxpos'] = $_GET['xposition'];
$json['stroboscopedata']['deflectypos'] = $_GET['yposition'];
$json['stroboscopedata']['exwidth'] = $_GET['boxwidth'];
$json['stroboscopedata']['eyheight'] = $_GET['boxheight'];
}

if(isset($_GET['set'])){
  $file = $_GET['file'];
  $set = $_GET['set'];

/*
img = Image.open(sys.argv[1]).convert('LA')
img = img.split()[0]

aax = sys.argv[2]
aay = sys.argv[3]
wdim = sys.argv[4]
ldim = sys.argv[5]
*/

  echo "<br><br><ul>";
  $cmd = "python caller.image.proc.py ".$file." ".$set." ".$json['stroboscopedata']['mindiam'];
  echo $cmd.'<br><br>';
  $result = exec($cmd, $output);
  $strobdataset = 'strobdataset';
  $strobjson = json_decode(file_get_contents($strobdataset), true);


  $ct = 0;
  $totalvol = 0;
  for($i=0;$i<count($strobjson);$i++){
	//echo $strobjson[$i]['signal'].' <br>';
	if ($strobjson[$i]['signal'] > 0){
  	$columncenter = $columncenter . ($strobjson[$i]['columncenter']+$json['stroboscopedata']['bx']) . ",";
  	$rowcenter = $rowcenter . ($strobjson[$i]['rowcenter']+$json['stroboscopedata']['by']) . ",";
	$rowdiameter = $rowdiameter . $strobjson[$i]['rowdiameter'] . ",";
	$columndiameter = $columndiameter . $strobjson[$i]['columndiameter'] . ",";
	$volcalc = (($strobjson[$i]['volume'] / $json['stroboscopedata']['micronperpixel']) / 10);
	$volume = $volume . $volcalc. ",";
	$signal = $signal . $strobjson[$i]['signal'] . ",";
	$posx = ($strobjson[$i]['columncenter']+$json['stroboscopedata']['bx']);
	$ct = $ct + 1;
        echo "Drop ".($ct).": ";
	echo ' Diameter: ';
	echo round($strobjson[$i]['rowdiameter']/$json['stroboscopedata']['micronperpixel']).',';
	echo round($strobjson[$i]['columndiameter']/$json['stroboscopedata']['micronperpixel']).'um Volume: ';
	echo round($volcalc).'pl ';
	//Signal: ';
	//echo round($strobjson[$i]['signal']);
	echo ' Deflection: '.round(($posx - $json['stroboscopedata']['deflectxpos'])/$json['stroboscopedata']['micronperpixel']).'um<br>';
	$totalvol = $totalvol + $volcalc;
	} 
  }
  echo '<br><b>Total volume:</b> '.round($totalvol).'pl<br></ul>';  



  $columncenter = preg_replace('/,$/', '', $columncenter);
  $rowcenter = preg_replace('/,$/', '', $rowcenter);
  $columndiameter = preg_replace('/,$/', '', $columndiameter);
  $rowdiameter = preg_replace('/,$/', '', $rowdiameter);
  $volume = preg_replace('/,$/', '', $volume);
  $signal = preg_replace('/,$/', '', $signal);

}


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
<table cellpadding=10><tr><td>
<form action=stroboscope.php method=GET>
<b>Scale</b><br>
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
<b>Threshold tolerances<b><br>
<table>
<tr><td>Minimum diameter: </td><td><input type=text class="txt" name=mindiam value=<?php echo $json['stroboscopedata']['mindiam']; ?> size=5></td></tr>
<tr><td>Maximum deflection: </td><td><input type=text class="txt" name=maxdeflectx value=<?php echo $json['stroboscopedata']['maxdeflectx']; ?> size=5></td></tr>
</table>
<br><br>
<input type=submit class="blue">
<br><br>
</form>

</td>
<td>


<?php 
//$file = '50_100_16.jpg'; 
$file = 'line398_AT63_202923Assay_63Tip_1_Drop_1_Chk_1.nomask.png'; 
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

//String columncent = "450,2,5";
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




//<?php echo array(1,2,3); ?>;
PFont font;



void setup() {
  filen = '<?php echo $file; ?>';
  pictfile = '<?php echo $filei; ?>';

  
  size(768,576);
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
  for(i=0;i < <?php echo count($strobjson); ?>;i=i+1){ 
    if (signal[i] > 0){
      ellipse(columncenter[i], rowcenter[i], columndiameter[i],rowdiameter[i]);
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
    link("stroboscope.php?set="+bx+","+by+","+<?php echo $json['stroboscopedata']['exwidth']; ?>+","+<?php echo $json['stroboscopedata']['eyheight']; ?>+"&file="+filen);
  }
 //setSearcharea
  if (rectOver) {
    //currentColor = rectColor;
    link("stroboscope.php?bx="+bx+"&by="+by);
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
</body>
</html>


