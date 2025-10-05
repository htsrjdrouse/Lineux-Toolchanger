<b>Cavro Syringe pump<br>
Actuation of displacement pump</b>
<form action=gui.mod.php method=get>
<input type=hidden name="view" value="H">
<input type=hidden name="act" value="Syringepump">
<br><br>
<fieldset><legend><b>Syringe pump controller</b></legend>
<br><br>
<?php if ($json['syringepump']['connect'] == "0"){ ?>
<input type=submit name=connect class="red" value="Connect">
<?php } ?>
<?php if ($json['syringepump']['connect'] == "1"){ ?>
<input type=submit name=disconnect class="red" value="Disconnect">
<input type=submit name=initialization class="red" value="Initialize">
<input type=submit name=terminate class="red" value="Stop">
<?php } ?>
<br><br>
<input type=submit name=filltubing class="red" value="Fill Tubing">
<font size=1><b>Cycles: </b></font><input type=text class="txt" name=filltubingcycles value="<?php echo $json['syringepump']['filltubingcycles']; ?>" size=2> <font size=1><b>(1 cycle is 250&micro;l = <?php echo intval($json['syringepump']['filltubingcycles']) * 250; ?>&micro;l)</b></font>
<br><br>
</form>
<form action=syringemove.php method=get>
<input type=submit name=aspirate class="red" value="Aspirate">
<font size=1>
<b>Volume: </b><input type=text name=aspiratevol class="txt" value="<?php echo $json['syringepump']['aspiratevol']; ?>" size=5><b>&nbsp;&micro;l</b>
<b>Flow rate: </b><input type=text name=aspirateflo class="txt" value="<?php echo $json['syringepump']['aspirateflo']; ?>" size=5><b>&nbsp;&micro;l/second</b>
&nbsp;&nbsp;&nbsp;<b>Total volume aspirated: </b><?php echo $json['syringepump']['trackaspvol']; ?>
<br> 
<br>
<input type=submit name=dispense class="red" value="Dispense">
<b>Volume: </b><input type=text name=dispensevol class="txt" value="<?php echo $json['syringepump']['dispensevol']; ?>" size=5><b>&nbsp;&micro;l</b>
<b>Flow rate: </b><input type=text name=dispenseflo class="txt" value="<?php echo $json['syringepump']['dispenseflo']; ?>" size=5><b>&nbsp;&micro;l/second</b>
<br>
<br>
<input type=submit name=fillsyringe class="red" value="Fill Syringe">
<b>Volume: </b><input type=text name=fillvol class="txt" value="<?php echo $json['syringepump']['fillvol']; ?>" size=5><b>&nbsp;&micro;l</b>
<b>Flow rate: </b><input type=text name=fillflo class="txt" value="<?php echo $json['syringepump']['fillflo']; ?>" size=5><b>&nbsp;&micro;l/second</b>

</font>
</fieldset><p>
</form>







