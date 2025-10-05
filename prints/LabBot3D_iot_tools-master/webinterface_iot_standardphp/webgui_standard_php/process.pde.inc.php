<br><br>



<script type="application/processing">
/* @pjs preload="<?php echo $imgstack[0]; ?>"; */<br>
PImage b;

int xlen = <?php echo $xlen; ?>;
int ylen = <?php echo $ylen; ?>;


void setup(){
 size(xlen+36, ylen+36);  // Size should be the first statement
 background(51);
 wells = new ArrayList();
 <?php for($i=0;$i<count($imgstack);$i++){ ?>
 	wells.add(loadImage("<?php echo $imgstack[$i]; ?>"));
 <?php } ?>

}

void draw(){
 <?php for($i=0;$i<count($imgstack);$i++){ 
	$ci = (count($imgstack)- 1) - $i;
 ?>
 image(wells.get(<?php echo $ci;?>), <?php echo $imgstackx[$ci]; ?>, <?php echo $imgstacky[$ci]; ?>);
 <?php } ?>
}
</script><canvas width="200" height="200"></canvas></p>
<br><br>

