
  <?
  //$bedsizex=(451);
  //$bedsizey=(310);
  //$file = 'stroboscope/uploads/1422472992_V100_P90_LD250.timestamp1560695912.jpg'; 
  //$file = 'stroboscope/1422472992_V100_P90_LD250.timestamp1560718002.jpg'; 
  $bedsizex = getimagesize($file)[0];
  $bedsizey = getimagesize($file)[1];
  $shimx = 40;
  $shimy = 30;
//$file = $json['strobimages']['currimage'];

/*
$imgdataset = 'stroboscope/imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$strobjsonprocessing = json_decode(file_get_contents('stroboscope/strobdatasetprocessing'), true);
$strobdataset = 'stroboscope/strobdataset';
$strobjson = json_decode(file_get_contents($strobdataset), true);
*/
/*
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
$strobjsonprocessing = json_decode(file_get_contents('strobdatasetprocessing'), true);
$strobdataset = 'strobdataset';
$strobjson = json_decode(file_get_contents($strobdataset), true);
*/



  ?>

<script src="/processing.js"></script>
<script type="text/processing" data-processing-target="mycanvas">

// Global variables
float radius = 50.0;
//int X, Y;
//int nX, nY;
int delay = 16;


/* @pjs preload="<?php echo $file; ?>"; */
PImage bg;
PFont f;
int a;
boolean overRightButton = false;
boolean reGrid = false;
boolean setSearcharea = false;
boolean overLeftButton = false;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0;
float bdify = 0.0;
int px,py,rowdiam,columndiam;
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 60;     // Diameter of rect
int circleSize = 60;   // Diameter of circle
int nX, nY;
int X, Y;
String filen; 
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean clrectOver = false;
boolean circleOver = false;
PFont font;
String spots;
String st;
ArrayList spotlist;
int flag = 0;
color currentcolor;
spotlistch = new ArrayList();
String[] sa1;
String[] xpos;
String[] ypos;
String[] shapex;
String[] shapey;
String[] shape;
String[] wellrowsp;
String[] wellcolumnsp;

float bx = <?php echo $json['stroboscopedata']['bx']; ?>;
float by = <?php echo $json['stroboscopedata']['by']; ?>;
float bs = <?php echo ($json['stroboscopedata']['exwidth']); ?>;

void setup()
{
  filen = '<?php echo $file; ?>';
  sal = { }; 
  ypos = { }; 
  xpos = { }; 
  shape = { }; 
  shapex = { }; 
  shapey = { }; 
  wellrowsp = { }; 
  wellcolumnsp = { }; 
  size(<?=($bedsizex+80)?>,<?=($bedsizey+60)?>);
  rectColor = color(0);
  frameRate( 20 );
  rectHighlight = color(101);
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 0;
  circleY = 100;

  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;
  int[] circleXry = {20,150};
  int[] circleYry = {20,100};
  //rectX = width/2-rectSize-10;
  //rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
  //color c1 = color(102, 255, 255);
  color c1 = color(100, 100, 100);
  background(100);
  fill(c1);
  noStroke();
  //rect(0,0,360,360);
  rect(0,0,<?=($bedsizex+80)?>,<?=($bedsizey+60)?>);
  //size(<?=($bedsizex+40)?>,<?=$bedsizey?>);
  fill(255,255,255);
  //stroke(0,0,0);
  rect(<?=$shimx?>,<?=$shimy?>,<?=$bedsizex?>,<?=$bedsizey?>);
  noStroke();
  fill(0,0,0);
  font = loadFont("FFScala.ttf");
  textFont(font);
  textSize(10);
  text("<?=0?>, <?=0?>",<?=(40-10)?>,<?=($bedsizey+30+10)?>);
  text("<?=$bedsizex?>, <?=$bedsizey?>",<?=$bedsizex+14?>,<?=30-5?>);

  bg = loadImage('<?php echo $file; ?>');
  image(bg, 40, 30);

  //buttons
  textSize(14);
  rectX = 0;
  rectY = 40;
  color baseColor = color(102);
  currentcolor = baseColor;
  //set search area
  noStroke();
  fill(0, 0, 0);
  rect(rectX, rectY, rectSize+35, rectSize);
  fill(255, 255, 255);
  textFont(font); 
  text("Set search area", 5, rectY+30, -30); 
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  //stroke(0);
  noStroke();
  fill(255, 255, 255);
  rect(circleX, circleY, circleSize+35, circleSize);
  fill(0, 0, 0);
  textFont(font); 
  text("Analyze drops", 5, circleY+30, -30); 
  bx = <?php echo $json['stroboscopedata']['bx'];?>;
  by = <?php echo $json['stroboscopedata']['by'];?>;

}

void draw(){  
  update(mouseX, mouseY);

  background(100);
  bg = loadImage('<?php echo $file; ?>');
  image(bg, 40, 30);


  //Draw deflection line
  //Draw deflection line
  stroke(40, 247, 244);
  line(<?=($json['stroboscopedata']['deflectxpos']+40) ?>, <?=($json['stroboscopedata']['deflectypos']+30) ?>,<?=($json['stroboscopedata']['deflectxpos']+40) ?>, <?=($json['stroboscopedata']['deflectypos']+30) ?>+1000);

   font = loadFont("FFScala.ttf"); 
   textFont(font); 
   fill(255, 255, 255);
   //fill(0, 0, 0);
   text("X: ", 15, 10, -30); 
   text((bx+40), 28, 10, -30); 
   text("Y: ", 55, 10, -30); 
   text((by+30), 68, 10, -30); 
   //float pixval =  get(bx, by);
   /*
   */

   text("Pix val (RGB): ", 15, 25, -30); 
   //text(get(bx,by), 58, 35, -30); 

   text(parseInt((hex(get((bx),by),6)).substring(0,2),16), 95, 25, -30); 
   text(parseInt((hex(get(bx,by),6)).substring(2,4),16), 120, 25, -30); 
   text(parseInt((hex(get(bx,by),6)).substring(4,6),16), 145, 25, -30); 
  
   //println("testing");
   //println(bx);

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
  //rect(bx, by,200, 300);
  rect(bx, by, <?php echo($json['stroboscopedata']['exwidth']); ?> , <?php echo ($json['stroboscopedata']['eyheight']); ?>);
  stroke(244, 51, 255);

  //stroke(255);
  /*
  noStroke();
  fill(0, 0, 0);
  rect(rectX, rectY, rectSize+35, rectSize);
  textFont(font); 
  fill(255, 255, 255);
  text("Set search area", 5, rectY+30, -30); 
  */
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  noStroke();
  //fill(255, 255, 255);
  rect(circleX, circleY, circleSize+35, circleSize);
  textFont(font); 
  fill(0, 0, 0);
  text("Analyze drops", 5, circleY+30, -30); 


      noFill();
      stroke(244, 51, 255);
   <? $ddr = $_SESSION['labbot3d']['strobdata']['strobresults']['dataset'][0]['dropraw'];?> 
  <? for($i=0;$i<count($ddr); $i++){ ?>
      ellipse(<?=($ddr[$i]['columncenter']+$_SESSION['labbot3d']['strobdata']['bx']+40)?>, <?=($ddr[$i]['rowcenter']+$_SESSION['labbot3d']['strobdata']['by']+30)?>, <?=$ddr[$i]['columndiameter']?>,<?=$ddr[$i]['rowdiameter']?>);
  <? } ?>

}


void mousePressed() {
 //Analyze droplets
  if (circleOver) {
    currentColor = circleColor;
    link("strobsettings.php?set="+bx+","+by+","+<?php echo $json['stroboscopedata']['exwidth']; ?>+","+<?php echo $json['stroboscopedata']['eyheight']; ?>+"&file="+filen);
  }
 //setSearcharea
  /*
  if (rectOver) {
    //currentColor = rectColor;
    link("strobsettings.php?bx="+bx+"&by="+by);
  }
  */

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




void update(int x, int y) {
  //Analyze droplets
  if ( overCircle(circleX, circleY+20, circleSize+10,circleSize) ) {
    circleOver = true;
    //rectOver = false;
  //} 
  //Set Searcharea
  /*
  else if ( overRect(rectX, rectY, rectSize+50, rectSize) ) {
    rectOver = true;
    circleOver = false;
  */
  } else {
    circleOver = rectOver = false;
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


</script>
<canvas id="mycanvas"></canvas>
