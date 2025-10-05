	<form action=move.inc.php method=post>
 	<b>Linear actuator</b><br>
	<input type=submit name=homelinact value="Home">
	<input type=submit name=reportpos value="Report position">
	</form>
	<br>
	<font size=1><b>Position: <?=$jsonimg['linact']['position']?></b></font><br>
	<script>
	function updateTextInput(val) {
          document.getElementById('textInput').value=val; 
        }
	function updateTTextInput(val) {
          document.getElementById('ttextInput').value=val; 
        }
	</script>
	<form action=move.inc.php method=post>


	<font size=1><b>Speed: </b></font>
	<? $val = $jsonimg['linact']['steprate']; ?>
	<? $steps = $jsonimg['linact']['steps']; ?>
        <input type="text" name="linactspeed" id="textInput" value="<?=$val?>" size="5" style="text-align:right;">
	<input type="range" name="rangeInput" min="200" max="2000" onchange="updateTextInput(this.value);">
	<br>
	<font size=1><b>Steps: </b></font>
        <input type="text" name="linactsteps" id="ttextInput" value="<?=$steps?>" size="5" style="text-align:right;">
	<input type="range" name="rangeInput" min="1" max="5000" onchange="updateTTextInput(this.value);">
	<input type="submit" name="linactsettings" value="Submit settings">


	</form>







