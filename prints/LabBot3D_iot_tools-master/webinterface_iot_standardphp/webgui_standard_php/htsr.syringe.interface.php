<b>HTSR Syringe pump<br>
<br>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="H">
<input type=hidden name="act" value="Syringepump">
<br><br>
<fieldset><legend><b>Syringe pump controller</b></legend>
<br>

<?php 
if ($json['syringesocket'] == 0){
 echo "<br><font size=2><b>You need to turn on the socket: syringesocket start</b></font>";
}
?>

<?php
if ($json['syringesocket'] == "0"){ ?>
<input type=submit name=connect class="red" value="Connect">
<?php } ?>
<?php if ($json['syringesocket'] == "1"){ ?>
<input type=submit name=disconnect class="red" value="Disconnect">
<input type=submit name=initialization class="red" value="Initialize">
<input type=submit name=terminate class="red" value="Stop">
<?php } ?>
<br>
</form>
<br><font size=2><b>Calibrate HTSR syringe</b></font><br>
<br>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="H">
<input type=hidden name="act" value="Syringepump">
<input type=submit name="Syringe Volume" class="red" value="Syringe Volume">
<input type=text name=syringevolume class="txt" value="<?=$json['htsrsyringevol']?>" size=5><font size=1> <b>ml</b> <b>(What size syringe are you using?)</b></font>
<input type=text name=stepsperml class="txt" value="<?=$json['htsrsyringestepsperml']?>" size=5><font size=1> <b>steps</b> <b>(How many steps per ml?)</b></font>
<br>
<font size=1><b>Calculated steps to fill syringe: <u><?=$json['htsrsyringevol']?></u> * <u><?=$json['htsrsyringestepsperml']?></u> = <u><?=$json['htsrsyringestepspersyringe']?></u></b></font>
</form>
<br>
<?
$cleansteps = preg_replace('/^.*:/', '',$json['htsrsyringe']['steps']); 
$cleansteprate = preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate']) * 2; 
$microliterspersteps = round(($cleansteps / $json['htsrsyringestepsperml'])*1000,2);  
$microliterperstepspersecond = ($cleansteps / $cleansteprate)*$microliterspersteps;
?>
<b>Steps: <?=$cleansteps?> </b><br>
<b>Step rate: <?=$cleansteprate?> steps per second</b><br>
<b>Microliter per <?=$cleansteps ?> steps: <?=$microliterspersteps?> </b><br>
<b>Microliter per second: <?=$microliterperstepspersecond?> </b><br>


<br>
<br>
<table><tr><td>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="H">
<input type=hidden name="act" value="Syringepump">
<input type=submit name=steps class="red" value="Steps">
<font size=1>
<b>Steps: </b>

<input type=text name=stepspermove class="txt" value="<?= $cleansteps; ?>" size=5> 
<b>
<?
echo $microliterspersteps;
?> &micro;l</b>
</form>
</td><td>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="H">
<input type=hidden name="act" value="Syringepump">
<input type=submit name=steprate class="red" value="Steprate"> 
<input type=text name=stepspermoverate class="txt" value="<?php echo preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate']); ?>" size=5> <font size=1><b>&nbsp;&micro;s per steps = 

<? $flowrate = round(((1000 / ((preg_replace('/^.*:/', '',$json['htsrsyringe']['steprate'])) * 2) * 1000) / $json['htsrsyringestepsperml'])*1000,2); ?>
<? echo $flowrate; ?> &nbsp;&micro;l per second</font>
</b>
</form>
</td></tr></table>
<form action=syringemove.php method=get>
<input type=submit name=aspirate class="red" value="Aspirate">
<input type=submit name=dispense class="red" value="Dispense">
<font size=1>
<!--&nbsp;&nbsp;&nbsp;-->
<b>Time: <?= round(($cleansteps / $flowrate),2); ?> s</b>
<br>
<br>
<input type=submit name=fillsyringe class="red" value="Fill Syringe">
<b>Loop: </b>
<input type=text name=fillvol class="txt" value="<?php echo $json['syringepump']['filltubingcycles']; ?>" size=5><b> cycles</b>

<b> Aspiration vol: (<?= round($json['syringepump']['trackaspvol'] / 1);?> ul) </b>
<b> Homing time: (<?= round($json['syringepump']['trackaspvol'] / $flowrate);?> s) </b>
<b> Per cycle time: (<?= round(($json['htsrsyringevol'] * 1000)/ $flowrate);?> s) </b>
<b> Cycle time: (<?= (round(($json['htsrsyringevol'] * 1000)/ $flowrate) * $json['syringepump']['filltubingcycles']) + round($json['syringepump']['trackaspvol'] / $flowrate); ?> s) </b>


</font>
</fieldset><p>
</form>


