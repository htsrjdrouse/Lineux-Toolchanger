<style>
.rotateimg180 {
  -webkit-transform:rotate(180deg);
  -moz-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  -o-transform: rotate(180deg);
  transform: rotate(180deg);
}
</style>
<? $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);?>
<? $jsonconfig = json_decode(file_get_contents('/home/pi/config.json'), true);?>


<? if(isset($_POST['gosyringepos'])) { 
 $stepspermm = 2267.72;
 $_SESSION['labbot3d']['syringefeed'] = $_POST['syringefeed'];
 $steprate = ((1/$stepspermm * 1/$_SESSION['labbot3d']['syringefeed'])*100000000);
  echo "line 15 this is called";
  $prevcount = $_SESSION['labbot3d']['syringecount'];
  $_SESSION['labbot3d']['syringecount'] = $_POST['syringepos']; 
 if ($prevcount < $_SESSION['labbot3d']['syringecount']){ 
  $_SESSION['labbot3d']['syringesteps'] =  ($_SESSION['labbot3d']['syringecount'] - $prevcount);	
  publish_message('syringemove '.$_SESSION['labbot3d']['syringesteps'].' '.$steprate.' 1',$jsonconfig['topic'], 'localhost', 1883, 5);
 } else if ($prevcount > $_SESSION['labbot3d']['syringecount']){ 
  $_SESSION['labbot3d']['syringesteps'] = ($prevcount - $_SESSION['labbot3d']['syringecount']);	
  publish_message('syringemove '.$_SESSION['labbot3d']['syringesteps'].' '.$steprate.' 0',$jsonconfig['topic'], 'localhost', 1883, 5);
 }
 echo "<meta http-equiv='refresh' content='0'>";
 }
?>





<? if(isset($_POST['editvalvepos'])){ 
 $_SESSION['labbot3d']['editvalvepos'] = 1; 
 $_SESSION['labbot3d']['valve'] = $_POST['selvalve']; 
}?>
<? if(isset($_POST['heaton'])){ 
 $_SESSION['labbot3d']['heaton'] = 1;
 $jsonmicrofl['heaton'] = 1;



 publish_message('heaton',$jsonconfig['topic'], 'localhost', 1883, 5);
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['heatoff'])){ 
 $_SESSION['labbot3d']['heaton'] = 0;
 $jsonmicrofl['heaton'] = 0;
 publish_message('heatoff',$jsonconfig['topic'], 'localhost', 1883, 5);
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['pcvon'])){ 
 $_SESSION['labbot3d']['pcvon'] = 1;
 publish_message('pcvon',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['pcvoff'])){ 
 $_SESSION['labbot3d']['pcvon'] = 0;
 publish_message('pcvoff',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['washon'])){ 
 $_SESSION['labbot3d']['washon'] = 1;
 publish_message('washon',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['washpcvon'])){ 
 publish_message('washpcvon '.$_POST['washpcvtime'],$jsonconfig['topic'], 'localhost', 1883, 5);
 $jsonmicrofl['washpcvtime']  =  $_POST['washpcvtime'];
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 echo "<meta http-equiv='refresh' content='0'>";
}?>





<? if(isset($_POST['washoff'])){ 
 $_SESSION['labbot3d']['washon'] = 0;
 publish_message('washoff',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>

<? if(isset($_POST['dryon'])){ 
 $_SESSION['labbot3d']['dryon'] = 1;
 publish_message('wasteon',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['dryoff'])){ 
 $_SESSION['labbot3d']['dryon'] = 0;
 publish_message('wasteoff',$jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>



<? if(isset($_POST['savevalvepos'])){ 
 $_SESSION['labbot3d']['editvalvepos'] = 0; 
 $_SESSION['labbot3d']['valve'] = $_POST['selvalve']; 
 $jsonmicrofl['valve'][$_POST['selvalve']]['output'] = $_POST['outputpos'];  
 $jsonmicrofl['valve'][$_POST['selvalve']]['input'] = $_POST['inputpos'];  
 $jsonmicrofl['valve'][$_POST['selvalve']]['bypass'] = $_POST['bypasspos'];  
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['valvesub'])){ 
 $tiplist = array();
 $tiplistst = "";
 for($i=0;$i<8;$i++){ 
  if(isset($_POST['valve'.$i])){
   array_push($tiplist, 1); 
   $tiplistst = $tiplistst."1.";
  } else { 
   $tiplistst = $tiplistst."0.";
   array_push($tiplist, 0); 
  }
 }
 $tiplistst = preg_replace("/.$/", "", $tiplistst);
 //echo "tiplist ".$tiplistst."<br>";
 $jsonmicrofl['tiplist'] = $tiplist;
 $_SESSION['labbot3d']['editvalvepos'] = 0; 
 $_SESSION['labbot3d']['valvepos'] = $_POST['valvepos'];
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 //echo 'valve-'.$tiplistst.'-'.$_POST['valvepos'];
 //publish_message('valve-'.$tiplistst.'-'.$_POST['valvepos'], $jsonconfig['topic'], 'localhost', 1883, 5);
 publish_message('valve-1-'.$_POST['valvepos'], $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['turnon5V'])){ 
 $_SESSION['labbot3d']['valveon'] = 1;
 publish_message('turnon5v', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['turnoff5V'])){ 
 $_SESSION['labbot3d']['valveon'] = 0;
 publish_message('turnoff5v', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['editwashdry'])){ 
 $_SESSION['labbot3d']['editwashdry'] = 1;
 publish_message('readheatsensor', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
 }?>
<? if(isset($_POST['readheatsensor'])){ 
 publish_message('readheatsensor', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
 }
?>
<? if(isset($_POST['savewashdry'])){ 
 $_SESSION['labbot3d']['editwashdry'] = 0;
 publish_message('setwashval '.$_POST['washval'].'-setdryval '.$_POST['wasteval'], $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['savepcv'])){ 
  $jsonmicrofl['pcv']['pcvval'] = $_POST['pcvval'];
  $jsonmicrofl['sensorvalue'] = $_POST['sensorvalue'];
  //publish_message('setheatval '.$_POST['sensorval'], $jsonconfig['topic'], 'localhost', 1883, 5);
  sleep(1);
  publish_message('setpcvval '.$_POST['pcvval'], $jsonconfig['topic'], 'localhost', 1883, 5);
  sleep(1);
  $_SESSION['labbot3d']['editpcv'] = 0;
  closejson($jsonmicrofl,'microfluidics.json');
  $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
  publish_message('setheatval '.$_POST['sensorvalue'], $jsonconfig['topic'], 'localhost', 1883, 5);
  echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['editpcv'])){ 
 $_SESSION['labbot3d']['editpcv'] = 1;
 echo "<meta http-equiv='refresh' content='0'>";
}?>

<? if(isset($_POST['manpcv'])){ 
 $_SESSION['labbot3d']['editpcv'] = 1;
 $_SESSION['labbot3d']['manpcv'] = 1;
 $jsonmicrofl['manpcv'] = 1; 
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 publish_message('manpcv', $jsonconfig['topic'], 'localhost', 1883, 5);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<? if(isset($_POST['feedbackpcv'])){ 
 publish_message('feedbackpcv', $jsonconfig['topic'], 'localhost', 1883, 5);
 $_SESSION['labbot3d']['editpcv'] = 1;
 $_SESSION['labbot3d']['manpcv'] = 0;
 $jsonmicrofl['manpcv'] = 0; 
 closejson($jsonmicrofl,'microfluidics.json');
 $jsonmicrofl = json_decode(file_get_contents('microfluidics.json'), true);
 echo "<meta http-equiv='refresh' content='0'>";
}?>
<div class="col span_6_of_12" style="background-color:white;text-align:left;">
<? //print_r($jsonmicrofl['valve']); ?>
<br>
<form action=<?=$_SERVER['PHP_SELF']?> method=post><font size=2>



<br><br>
</form>
<form action=<?=$_SERVER['PHP_SELF']?> method=post><font size=2>

Valves: <table><tr>
<? for($i=0;$i<1;$i++){ ?>
<td align=center><?=$i?><br><input type=checkbox name="valve<?=$i?>" <? if ($jsonmicrofl['tiplist'][$i] == 1){ echo "checked"; }?>></td>
<? } ?>
</tr></table>

<br>
<? if(!isset($_SESSION['labbot3d']['valvepos'])){$_SESSION['labbot3d']['valvepos'] = "input"; } ?>
<? if(!isset($_SESSION['labbot3d']['editvalvepos'])){$_SESSION['labbot3d']['editvalvepos'] = 0; } ?>
<input type=radio name=valvepos value=input id=input <? if($_SESSION['labbot3d']['valvepos'] == "input"){?> checked <? } ?>>
<label for="input">Input 
<? if($_SESSION['labbot3d']['editvalvepos'] == 1) { ?> <input type=text name=inputpos value=<?=$jsonmicrofl['valve'][$_SESSION['labbot3d']['valve']]['input'] ?> size=3> <? } ?>
</label>
<input type=radio name=valvepos value=bypass id=bypass <? if($_SESSION['labbot3d']['valvepos'] == "bypass"){?> checked <? } ?>>
<label for="bypass">Bypass
<? if($_SESSION['labbot3d']['editvalvepos'] == 1) { ?> <input type=text name=bypasspos value=<?=$jsonmicrofl['valve'][$_SESSION['labbot3d']['valve']]['bypass']?>  size=3> <? } ?>
</label>
<input type=radio name=valvepos value=output id=output <? if($_SESSION['labbot3d']['valvepos'] == "output"){?> checked <? } ?>>
<label for="output">Output
<? if($_SESSION['labbot3d']['editvalvepos'] == 1) { ?> <input type=text name=outputpos value=<?=$jsonmicrofl['valve'][$_SESSION['labbot3d']['valve']]['output']?> size=3> <? } ?>
</label>
<input type=radio name=valvepos value=closesyringe id=closesyringe <? if($_SESSION['labbot3d']['valvepos'] == "closesyringe"){?> checked <? } ?>>
<label for="output">Close syringe
<? if($_SESSION['labbot3d']['editvalvepos'] == 1) { ?> <input type=text name=closesyringeval value=<?=$jsonmicrofl['valve'][$_SESSION['labbot3d']['valve']]['output']?> size=3> <? } ?>
</label>
<br>
<br>
<? if($_SESSION['labbot3d']['editvalvepos'] == 0){ ?>
<input type=submit name=valvesub value="Go to valve position">
<!--<input type=submit name=editvalvepos value="Edit valve positions">-->
<? } ?>
<br><br>
<? if(!(isset($_SESSION['labbot3d']['syringedir']))) { 
 $_SESSION['labbot3d']['syringedir'] = 'forward'; 
 } ?>
<? if(!(isset($_SESSION['labbot3d']['syringecount']))) { 
 $_SESSION['labbot3d']['syringepos'] = 0; 
 $_SESSION['labbot3d']['syringecount'] = 0; 
 $_SESSION['labbot3d']['syringefeed'] = 1000; 
 } ?>
	 <b>Syringe position (steps): </b><input type=text name=syringepos value="<?=$_SESSION['labbot3d']['syringecount']?>" size=3><br>
	 <b>Syringe feedrate: </b><input type=text name=syringefeed value="<?=$_SESSION['labbot3d']['syringefeed']?>" size=3>
<input type=submit name=gosyringepos value="Go to position">




</form>
</div>
<div class="col span_5_of_12"  style="background-color:white;text-align:left;">


<form action=<?=$_SERVER['PHP_SELF']?> method=post><font size=2>
<? if(!isset($_SESSION['labbot3d']['washon'])){ $_SESSION['labbot3d']['washon'] = 0; } ?>
<? if(!isset($_SESSION['labbot3d']['dryon'])){ $_SESSION['labbot3d']['dryon'] = 0; } ?>
<? if(!isset($_SESSION['labbot3d']['editwashdry'])){ $_SESSION['labbot3d']['editwashdry'] = 0; } ?>

<? if($_SESSION['labbot3d']['editwashdry'] == 1) { ?>
<input type=submit name=savewashdry value="Save wash waste settings">
<? } else { ?>
<input type=submit name=editwashdry value="Edit wash waste settings">
<? } ?>
<br><br>
<table><tr><td>
<? if($_SESSION['labbot3d']['washon'] == 0) { ?>
<input type=submit name=washon value="Wash on">

<? } else { ?>
<input type=submit name=washoff value="Wash off">
<? } ?><br>
<? if($_SESSION['labbot3d']['editwashdry'] == 1) { ?>
 <input type=text name=washval value=<?=$jsonmicrofl['wash']['washval']?> size=3>
<? } ?>

</td><td>
<? if($_SESSION['labbot3d']['dryon'] == 0) { ?>
<input type=submit name=dryon value="Waste on">
<? } else { ?>
<input type=submit name=dryoff value="Waste off">
<? } ?><br>
<? if($_SESSION['labbot3d']['editwashdry'] == 1) { ?>
 <input type=text name=wasteval value=<?=$jsonmicrofl['waste']['wasteval']?> size=3>
<? } ?>
</td></tr>
<?
 if (!(isset($_SESSION['labbot3d']['washpcvtime']))){
  $_SESSION['labbot3d']['washpcvtime'] = 100;
 }
?>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
    $(document).ready(function() {
      $('#mybutton').hide().delay(<?=$jsonmicrofl['washpcvtime']?>).fadeIn(<?=$jsonmicrofl['washpcvtime']?>);
});
</script>
<tr><td><input type=submit name="washpcvon" value="Wash/PCV on" id='mybutton'></td><td>&nbsp;time (ms): <input type=text name=washpcvtime value=<?=$jsonmicrofl['washpcvtime']?> size=3></td></tr>

</table>
</form>
<br><br>
<b>Pressure compensation</b><br>
<? if(!isset($_SESSION['labbot3d']['editpcv'])) { $_SESSION['labbot3d']['editpcv'] = 0; } ?>
<form action=<?=$_SERVER['PHP_SELF']?> method=post><font size=2>
<? if($_SESSION['labbot3d']['editpcv'] == 1) { ?>
<br>
<b>Power level:</b> <input type=text name=pcvval value=<?=$jsonmicrofl['pcv']['pcvval']?> size=3>
<br>
<? if(!isset($_SESSION['labbot3d']['manpcv'])) { $_SESSION['labbot3d']['manpcv'] = $jsonmicrofl['manpcv']; } ?>

<? if($_SESSION['labbot3d']['manpcv'] == 0) { ?>
<br><br><input type=submit name=manpcv value="Manually control PCV">
<? } else { ?>
<br><input type=submit name=feedbackpcv value="Turn on feedback PCV">
<br>
<? if(!isset($_SESSION['labbot3d']['pcvon'])) { $_SESSION['labbot3d']['pcvon'] = 0; } ?>
<? if ($_SESSION['labbot3d']['pcvon'] == 0){ ?>
<br>
<input type=submit name=pcvon value="Turn on PCV pump">
<? } else { ?>
<input type=submit name=pcvoff value="Turn off PCV pump">
<? }  ?>

<br>
<? } ?>
<br>
<br>
<br><table cellpadding=10><tr><td>
<input type=text name=sensorvalue value="<?=$jsonmicrofl['sensorvalue']?>" size=3></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
<font size=1>Save pressure compensation<br> settings to set value</font></td></tr></table><br><br>
<input type=submit name=readheatsensor value="Read heat sensor">
<? if(!isset($_SESSION['labbot3d']['heaton'])){$_SESSION['labbot3d']['heaton'] = $jsonmicrofl['heaton'];} ?>
<? if($_SESSION['labbot3d']['heaton'] == 0){ ?>
<input type=submit name=heaton value="Heat on">
<? } else { ?>
<input type=submit name=heatoff value="Heat off">
<? } ?>
<br><br>
<input type=submit name=savepcv value="Save pressure compensation settings">
<br>
<? } else { ?>
<input type=submit name=editpcv value="Edit pressure compensation settings">
<? } ?>
</form>

</div>
