
<script type="application/processing">

/* @pjs preload="<?php echo $file; ?>"; */

PImage bg;
PFont f;
int a; 
boolean overRightButton = false;
boolean reGrid = false;
boolean findSpots = false;
boolean overLeftButton = false;

//added to make a box
float bx;
float by;
float bs = <?php echo ($json['grid']['ex']/2); ?>;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 
float spacing = <?php echo (1000 / $json['grid']['spacex']); ?>;



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




PFont font;


void setup() 
{


  filen = '<?php echo $file; ?>';
  pictfile = '<?php echo $file; ?>';
  rampx = <?php echo $rampx; ?>;
  rampy = <?php echo $rampy; ?>;
  size(320,240);
  //noLoop();
  frameRate(30);

  bg = loadImage('<?php echo $file; ?>');


  //for box move
  bx = width/2.0;
  by = height/2.0;
  bx = <?php echo $bx;?>;
  by = <?php echo $by;?>;
  rectMode(CENTER_RADIUS);  

  f = createFont("Arial", 16);
  textFont(f);
  textAlign(CENTER, CENTER);
  

}

void draw() 
{
  background(bg);

  size(320,240);
  // reGrid button
  if (reGrid == true) {
    fill(255);
  } else {
    fill(230);
  }
  //reGrid stuff
  noStroke();
  rect(50, 20, 60, 20);
  

  distx = bx-<?php echo($ex/2); ?>;
  disty = by-<?php echo($ey/2); ?>;
  lenx = <?php echo $ex; ?>;
  leny = <?php echo $ey; ?>;

  font = loadFont("FFScala.ttf"); 
  textFont(font); 
  fill(0, 0, 0);
  text("X: ", 10, 10, -30); 
  text(bx-<?php echo($ex/2); ?>, 28, 10, -30); 
  text(("px"), 43, 10, -30); 
  text("Y: ", 10, 20, -30); 
  text(by-<?php echo($ey/2); ?>, 28, 20, -30); 
  text(("px"), 43, 20, -30); 




  if (distx < 160){
   calcx = rampx-(((160-distx)*spacing)/1000);
  } 
  else if (distx > 160){
   calcx = (((distx-160)*spacing)/1000)+rampx;
  } 
  else {
   calcx = rampx;
  }
  if (disty < 120){
   calcy = rampy-(((120-disty)*spacing)/1000);
  } 
  else if (disty > 120){
   calcy = (((disty-120)*spacing)/1000)+rampy;
  } 
  else {
   calcy = rampy;
  }


  text(calcx, 70, 10, -30); 
  text("mm", 95, 10, -30); 
  text(calcy, 70, 20, -30); 
  text("mm", 95, 20, -30); 
 

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
  rect(bx, by, <?php echo($ex/2); ?> , <?php echo ($ey/2); ?>);


  //center circle
 stroke(153,255,153);
 noFill();
 ellipse( 640/4, 480/4, 10, 10 ); 
 ellipse( 640/4, 480/4, 1, 1 ); 
 //textFont(font); 
 f = createFont("Arial", 10);
 textFont(f);
 fill(153,255,153);
 text(rampx+","+rampy, 640/4+35, 480/4, -30); 



 <?php for($i=0;$i<$cntr;$i++){ ?>
 stroke(236,92,212);
 noFill();
 int cx = <?php echo $coordsdat[$i]['cx']; ?>;
 int cy = <?php echo $coordsdat[$i]['cy']; ?>;
 int dia = <?php echo $coordsdat[$i]['sptdia']; ?>;
 ellipse( cx, cy, dia, dia); 
 <?php } ?>



}


void mousePressed() {
  if (reGrid ==true) {
    link("gui.mod.php?coords="+distx+","+disty+","+lenx+","+leny+"&file="+filen+"&pictfile="+pictfile+"&act=Regrid&rampx="+rampx+"&rampy="+rampy+"&source=processbasic");
  }
  else { 
  if(bover == true) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 
 }
}

void mouseDragged() {
  if(bover ==true){
   if(locked) {
     bx = mouseX-bdifx; 
     by = mouseY-bdify; 
   }
  }
  else{
    checkButtons(); 
  }
}




void mouseMoved(){
  checkButtons();
}

void mouseReleased() {
  locked = false;
}

void checkButtons() {
  //if (mouseX > 100 && mouseX < 200 && mouseY > 1 && mouseY < 50) {
  //  findSpots = true;   
  //} else 
  if (mouseX > 1 && mouseX < 100 && mouseY > 1 && mouseY <50) {
    reGrid = true; 
  } else {
    findSpots = reGrid = false;
  }
}


</script><canvas width="200" height="200"></canvas></p>
<div style="height:0px;width:0px;overflow:hidden;"><img src='milan_rubbish.jpg' id='milan_rubbish.jpg'/></div>



