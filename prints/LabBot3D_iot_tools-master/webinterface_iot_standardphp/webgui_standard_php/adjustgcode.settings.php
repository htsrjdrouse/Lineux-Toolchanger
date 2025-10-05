<?php
?>
<form action=adjustgcode.php method=get>
<ul><b>This tool allows you to adjust the gcode upon uploading it</b>
<br><br>
<?php
$jsongcodesettings = json_decode(file_get_contents('adjustgcode.json'), true);
//$jsongcodesettings = openjson('adjustgcode.json');
?>
<b>Extrusion steps per unit (M92): </b><input type=text name=m92 value=<?= $jsongcodesettings['M92'] ?> size=5>
<br>
<b>Speed (%): </b><input type=text name=speed value=<?= $jsongcodesettings['speed'] ?> size=5>
<b>Extrusion vol (%): </b>
<input type=text name=extrusionvol value=<?= $jsongcodesettings['extrusionvol'] ?> size=5>
<b>Retraction vol (%): <input type=text name=retractionvol value=<?= $jsongcodesettings['retractionvol'] ?> size=5>
<br><b>Origin X: </b>
<input type=text name=originx value=<?= $jsongcodesettings['originx'] ?> size=5>
<b>Y: 
<input type=text name=originy value=<?= $jsongcodesettings['originy'] ?> size=5>
<b>Z: 
<input type=text name=originz value=<?= $jsongcodesettings['originz'] ?> size=5>
<input type=submit name="Change settings" value="Change settings">
</form>


