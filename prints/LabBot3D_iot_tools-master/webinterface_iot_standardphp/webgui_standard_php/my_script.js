$(document).ready(function (){

 $(".terminal").show();
 $(".gui").show();
 $(".stop").show();

 var fl = 0;
 //$("ul").text("testing");

//Reads Gearman derived JSON data
fetchDataAjax = function () {
 $("ul").text("");
   $.ajax({
     url: "tasklogger",
     async: false,
     cache: false,
     //force to handle it as text
     dataType: "text",
     success: function(data) {
         var json = $.parseJSON(data);
	 var arr = json.logs;
         //$("ul").append("<li>"+arr.length+"</li>");
  	 jQuery.each( arr, function( i, val ) {
           $("ul").append("<li>"+val+"</li>");
           //$("ul").append("<?php logger($logger, '"+val+"',1); ?>");
           //$(".container").append("<li>"+val+"</li>");
           //$(".container").html("<li>"+val+"</li>");
	   //if (val == "DATA: finish")
	   if (val.match(/JOB: finish/g))
	   {
            console.log( val + " matches" );
	    fl = 1;
           }
         });
     }
   })

   console.log( fl + " ? hope its 1" );
   return fl;
}

 $( "#success" ).load( "scaffold.php", function() {
 //$("ul").text("testing");
 $(".gui").hide();
 $(".stop").show();
 $(".terminal").hide();

 //sets up the interval function
 interval = setInterval(function(){
  fl = fetchDataAjax();
  //console.log( "its: "+fl );
  if (fl == 1){
    //$(".terminal").show();
    //$(".gui").show();
    $(".stop").hide();
    clearInterval(interval); // stop the interval
    $("ul").append("ok it should stop now");
    $("div.buttonsdisp").show();
    window.location.replace("finishrun.php");
  }
 }
 ,1000);

});

});


