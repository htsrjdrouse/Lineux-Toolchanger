	<div class="col span_4_of_12" style="background-color:white;text-align:left;">
	<? if ($onfl == 1){ 
	if ($jsonimg['views'] == "Manual"){
 	 include('pronterface.panel.inc.php');	
	} else if ($jsonimg['views'] == "Macro"){
 	 include('macro.textarea.inc.php');	
	}
	}?>
	</div>
	<div class="col span_2_of_12"  style="background-color:white;text-align:left;">
	<? if ($onfl == 1){ 
	if ($jsonimg['views'] == "Manual"){
 	  include('linearactuator.inc.php');	
  	 } else if ($jsonimg['views'] == "Macro"){
 	 include('macro.list.inc.php');	
	}
	 } ?>
	</div>

