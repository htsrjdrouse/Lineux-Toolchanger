<? include('header.inc.php');?>

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
<img src=logo.gif width=70 height=40>
</div>
<div class="col span_4_of_12" style="background-color:white">
<p>
<form action=views.inc.php method=post>
Manage system:&nbsp;
&nbsp;<input type=submit name=view value=Logger>&nbsp;
&nbsp;<input type=submit name=view value=Manual>&nbsp;
&nbsp;<input type=submit name=view value=Macro>&nbsp;
</p>
</form>
</div>
</div>

<div class="section group">
	<div class="col span_2_of_12" style="background-color:lightblue">
	<?
	exec("ps aux | grep -i 'sudo python labbot3d.subscriber.py' | grep -v grep", $pids);
        if(empty($pids)) {
	$onfl = 0;
        ?>
 	<form action=subscribermanager.inc.php method=post>
	<input type=submit name=subscriber value=Connect>
	</form>
	<?
	} else {
	$onfl = 1;
	?>
	<form action=subscribermanager.inc.php method=post>
	<input type=submit name=subscriber value=Disconnect>
	</form>
        <? $jsonsocket = json_decode(file_get_contents('ports.json'), true);?>
	<font size=1>
	Smoothie: <?=$jsonsocket['smoothie']?><br>
	Microfluidic: <?=$jsonsocket['microfluidic']?><br>
	Stepper: <?=$jsonsocket['steppers']?><br>
	</font>
	<?	
	}	
	?>	
	</div>
	<? 
	if($onfl == 1){
	if ($jsonimg['views'] == "Manual"){
	 include('pronterface.linearactuator.inc.php');
	} else if ($jsonimg['views'] == "Macro"){
 	 include('macro.form.inc.php');	
	}
	}
	?>
	<div class="col span_4_of_12" style="background-color:white">
	<iframe src="tasklogger.php" width="400" height="400"></iframe>
	</div>
</div>
</body>
</html>

