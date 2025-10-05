<html style="overflow-y: auto;">
  <head>
    <script type="text/javascript" src="jquery.js"></script>
    
	<link type="text/css" href="jquery.ui.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="jquery.ui.core.min.js"></script>    
    <script type="text/javascript" src="jquery.ui.widget.min.js"></script>    
    <script type="text/javascript" src="jquery.ui.tabs.min.js"></script>    
            
    <link type="text/css" rel="stylesheet" href="JQuerySpinBtn.css" />
    <script type="text/javascript" src="JQuerySpinBtn.js"></script>    
    
	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	
	$(document).ready(function() {
		//top.resizeTo($(window).width(), $(document).height() + (top.outerHeight - $(window).height()));
	});
	</script>

  </head>
  <body style="overflow-y: auto;">
    <script type="text/javascript"> 
		function setControl(dest, plugin, id, group, value) {
          $.get('/?action=command&dest=' +		dest +
          						'&plugin=' +	plugin+
          						'&id='+ 		id + 
          						'&group='+ 		group + 
          						'&value=' +		value );
        }

        function setControl_bool(dest, plugin, id, group, value) {
          if (value == false)
            setControl(dest, plugin, id, group, 0);
          else
            setControl(dest, plugin, id, group, 1);
        }

        function setControl_string(dest, plugin, id, group, value) {
          if (value.length < minlength) {
            alert("The input string has to be least"+minlength+" characters!");
            return;
          }
          $.get('/?action=command&dest=' +		dest +
          						'&plugin=' +	plugin+
          						'&id='+ 		id + 
          						'&group='+ 		group + 
          						'&value=' +		value , 
			function(data){
             alert("Data Loaded: " + data);
           });
        }
                        
        function setResolution(plugin, controlId, group, value) {
	        $.get('/?action=command&dest=0'	+		// resolution command always goes to the input plugin
					'&plugin=' +	plugin+
					'&id'+ 			controlId + 
					'&group=1'	+					// IN_CMD_RESOLUTION == 1,		
					'&value=' +		value, 
				function(data){
				     if (data == 0) {
				     	$("#statustd").text("Success");
				     } else {
				     	$("#statustd").text("Error: " + data);
				     }
		        }
	        );
        }
                
        function addInput(plugin_id) {
        $.getJSON("input_"+plugin_id+".json",
          function(data) {
            $.each(data.controls, function(i,item){
              $('<tr/>').attr("id", "tr_"+item.group+"-"+item.id).appendTo("#controltable_in-"+plugin_id);
              // BUTTON type controls does not have a label 
              if (item.type == 4) {
                $("<td/>").appendTo("#tr-"+item