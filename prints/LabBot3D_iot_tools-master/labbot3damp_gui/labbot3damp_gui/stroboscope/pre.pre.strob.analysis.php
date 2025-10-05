
  <?
  $bedsizex=(451);
  $bedsizey=(310);
  $shimx = 40;
  $shimy = 30;
  ?>

<script src="/processing.js"></script>
<script type="text/processing" data-processing-target="mycanvas">

// Global variables
float radius = 50.0;
//int X, Y;
//int nX, nY;
int delay = 16;


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


void setup()
{
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
  frameRate( 15 );
  rectHighlight = color(101);
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 0;
  circleY = 0;

  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;
  int[] circleXry = {20,150};
  int[] circleYry = {20,100};
  //rectX = width/2-rectSize-10;
  //rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
  color c1 = color(102, 255, 255);
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

  //buttons
  textSize(14);
  rectX = 0;
  rectY = 80;
  color baseColor = color(102);
  currentcolor = baseColor;


}

void draw(){  
  text("Hello Web!",20,20);
  //println("Hello ErrorLog!");
}
</script>
<canvas id="mycanvas"></canvas>
