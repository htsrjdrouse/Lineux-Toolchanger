<div class="col span_7_of_12" style="background-color:white;text-align:left;">
<div align=center>
	<img src="pronterface_image.PNG" width="255" height="196" alt="Planets" usemap="#planetmap">
	<map name="planetmap">
    	  <area shape="rect" coords="0,0,45,40" href="move.inc.php?id=homex" alt="Sun">
    	  <area shape="rect" coords="0,155,40,196" href="move.inc.php?id=homexyz" alt="Sun">
    	  <area shape="rect" coords="152,0,186,40" href="move.inc.php?id=homey" alt="Sun">
    	  <area shape="rect" coords="152,155,186,196" href="move.inc.php?id=homez" alt="Sun">
    	  <area shape="rect" coords="220,30,245,48" href="move.inc.php?id=movezpos10" alt="Sun">
    	  <area shape="rect" coords="220,52,245,70" href="move.inc.php?id=movezpos1" alt="Sun">
    	  <area shape="rect" coords="220,74,245,92" href="move.inc.php?id=movezpos0.1" alt="Sun">
    	  <area shape="rect" coords="220,102,245,120" href="move.inc.php?id=movezneg0.1" alt="Sun">
    	  <area shape="rect" coords="220,124,245,138" href="move.inc.php?id=movezneg1" alt="Sun">
    	  <area shape="rect" coords="220,144,245,162" href="move.inc.php?id=movezneg10" alt="Sun">
    	  <area shape="rect" coords="90,66,108,76" href="move.inc.php?id=moveypos0.1" alt="Sun">
    	  <area shape="rect" coords="77,50,120,60" href="move.inc.php?id=moveypos1" alt="Sun">
    	  <area shape="rect" coords="64,35,130,45" href="move.inc.php?id=moveypos10" alt="Sun">
    	  <area shape="rect" coords="74,27,125,40" href="move.inc.php?id=moveypos10" alt="Sun">
    	  <area shape="rect" coords="65,10,133,20" href="move.inc.php?id=moveypos100" alt="Sun">
    	  <area shape="rect" coords="80,5,120,10" href="move.inc.php?id=moveypos100" alt="Sun">
    	  <area shape="rect" coords="90,103,108,123" href="move.inc.php?id=moveyneg0.1" alt="Sun">
    	  <area shape="rect" coords="77,125,120,140" href="move.inc.php?id=moveyneg1" alt="Sun">
    	  <area shape="rect" coords="64,145,130,160" href="move.inc.php?id=moveyneg10" alt="Sun">
    	  <area shape="rect" coords="74,146,125,165" href="move.inc.php?id=moveyneg10" alt="Sun">
    	  <area shape="rect" coords="65,165,133,185" href="move.inc.php?id=moveyneg100" alt="Sun">
    	  <area shape="rect" coords="80,170,120,185" href="move.inc.php?id=moveyneg100" alt="Sun">
    	  <area shape="rect" coords="65,85,80,100" href="move.inc.php?id=movexneg0.1" alt="Sun">
    	  <area shape="rect" coords="50,76,63,112" href="move.inc.php?id=movexneg1" alt="Sun">
    	  <area shape="rect" coords="33,63,43,124" href="move.inc.php?id=movexneg10" alt="Sun">
    	  <area shape="rect" coords="9,51,26,133" href="move.inc.php?id=movexneg100" alt="Sun">
    	  <area shape="rect" coords="111,85,126,100" href="move.inc.php?id=movexpos0.1" alt="Sun">
    	  <area shape="rect" coords="133,76,148,112" href="move.inc.php?id=movexpos1" alt="Sun">
    	  <area shape="rect" coords="153,63,168,124" href="move.inc.php?id=movexpos10" alt="Sun">
    	  <area shape="rect" coords="167,51,185,133" href="move.inc.php?id=movexpos100" alt="Sun">
	</map>
</div>

<br>
<div style="position:relative;left:40px;">

<form action=move.inc.php method=post>
<input type=submit name=getgcodepos value="Report position">
<p><input style="font-size:10px;" type=text name=sendgcode value="<?=$jsonimg['smoothielastcommand']?>" size=25 style="text-align:right;">
<input type=submit name=sendgcodecmd value="Send gcode">
</p>
<p><input type=text name=xyfeed value="<?=$jsonimg['speed']['xyjogfeed']?>" size=15 style="text-align:right;"><input type=submit name=sendxyfeed value="Adjust XY speed "></p>
<p><input type=text name=zfeed value="<?=$jsonimg['speed']['zjogfeed']?>" size=15 style="text-align:right;"><input type=submit name=sendzfeed value="Adjust Z speed "></p>
</form>
</div>
</div>
<div class="col span_3_of_12" style="background-color:white;text-align:left;">
<form action=wash.inc.php method=post>
<table><tr>
<td></td>

</form>  
</div>

