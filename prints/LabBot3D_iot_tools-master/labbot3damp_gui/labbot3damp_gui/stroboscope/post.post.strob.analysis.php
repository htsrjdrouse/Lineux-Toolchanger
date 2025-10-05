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



<?
//String columncent = "450,2,5";
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








