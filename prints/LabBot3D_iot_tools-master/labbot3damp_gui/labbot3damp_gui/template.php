<? include('header.inc.php');?>
        <? $jsonsocket = json_decode(file_get_contents('ports.json'), true);
exec("ps aux | grep -i 'python /var/www/html/labbot3damp_gui/caller.labbot3d.subscriber.py' | grep -v grep", $pids);
        if(empty($pids)) {
	$onfl = 0;
	} else {
        if ($jsonsocket['license'] == "yes"){
	 $onfl = 1;
        }
        else {
	 $onfl = 0;
	}
 	}
	?>
<body>
<? include('functionslib.php');?>

<? 
$jsonimg = openjson('nx.imgdataset');
 closejson($jsonimg,'nx.imgdataset'); 
?>

<div class="header">
<h1>LabBot3D Interface</h1>
</div>
<div class="section group">
<div class="col span_2_of_12" style="background-color:white">
<img src=array_image.png width=140 height=80>
<div class="section group">
<div class="col span_12_of_12" style="background-color:lightblue">
<br>
        <? if ($onfl == 0){ ?>
 	<form action=subscribermanager.inc.php method=post>
	<input type=submit name=subscriber value=Connect>
	</form>
        <? } ?>
        <? if ($jsonsocket['license'] == "no"){ ?>
	<font color=red><b>Software use is not authorized with this computer<br>
	Please contact info@htsresources.com to get a copy</b></font>
	<? } ?>
        <? if ($onfl == 1) { ?>
	<form action=subscribermanager.inc.php method=post>
	<input type=submit name=subscriber value=Disconnect>
	</form>
	<font size=1>
	Microfluidic: <?=$jsonsocket['microfluidic']?><br>

	Amplifier1: <? if($jsonsocket['piezocontroller1']){ echo $jsonsocket['piezocontroller1']; } else { echo "Not available"; }?><br>
	</font>
	<?	
	}	
	?>	

</div>
</div>
</div>
<div class="col span_6_of_12" style="background-color:white">
<div class="section group">
<p>

<? if($onfl == 1){ ?>
<form action=views.inc.php method=post>
Manage system:&nbsp;
&nbsp;<input type=submit name=view value=Manual>&nbsp;
&nbsp;<input type=submit name=view value=Macro>&nbsp;
&nbsp;<input type=submit name=view value=Imaging>&nbsp;
&nbsp;<input type=submit name=view value=Microfluidics>&nbsp;
</p>
</form>
<? } ?>
	<? 
	if($onfl == 1){
	if ($jsonimg['views'] == "Manual"){
	 include('pronterface.linearactuator.inc.php');
	} else if ($jsonimg['views'] == "Macro"){
 	 include('macro.form.inc.php');	
	} else if ($jsonimg['views'] == "Imaging"){
 	 include('imaging.inc.php');	
	} else if ($jsonimg['views'] == "Microfluidics"){
 	 include('microfluidics.inc.php');	
	}
        }
	?>
</div>
</div>
<div class="col span_3_of_12" style="background-color:white">
	<? if($onfl == 1){ ?>
        <form action="cleartrackdata.php" method=post>
        <input type=submit name=clear value="clear tracking data"><br>
        </form><br>
	<iframe src=http://<?=$_SERVER['SERVER_ADDR']?>:3000 width="400" height="400"></iframe>
	<? } ?>
</div>




</div>

</body>
</html>

