<html>
<head>
<script src="/processing.js"></script>
<script type=text/javascript src="/jquery.js"></script>
<script type=text/javascript src="/jquery.tabs.js"></script>
<script type=text/javascript src="/jquery.min.js"></script>
<script type=text/javascript src="/jquery.validate.js"></script>
<script type=text/javascript src="/custom.js"></script>
<script src="/skulpt.min.js" type="text/javascript"></script> 
<script src="/skulpt-stdlib.js" type="text/javascript"></script> 
<link rel="stylesheet" href="/style.css">


</head>


</head>
<body>
<font face=arial>


<?php 
$jsonlog = json_decode(file_get_contents('./loggerdataset'), true);

$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);
file_put_contents($imgdataset, json_encode($json));


//$ed = (count($jsonlog['logs'])*5);
$ed = 100;
$bg = $ed - 100;


//collecting variables for logger

?>

<script>
function gonow() {
document.getElementById('if').contentWindow.scrollTo(<?php echo $bg; ?>,<?php echo $ed; ?>);
}

function checkSubmit(e)
{
   if(e && e.keyCode == 13)
   {
      document.forms[0].submit();
   }
}

</script>
<br><br>
<!--
<form action=gui.mod.php method=GET>
<table><tr><td>
<input type=text name=cli value=<?php echo $json['htscmd']; ?>></td><td>
<td><div onKeyPress="return checkSubmit(event)"/><input type=submit name=clisub></div></td>
</tr></table>
</form>
-->
<?php
  echo '<iframe src="./fopen.php" width="1000" height="200"></iframe>';
?>

<br>Here's a quick link to get started: <a href=recipe.html>recipe.html</a>


<!--
<body onLoad="gonow()">
<iframe id="if" src="http://192.168.1.4/gui.mod6/fopen.php" width="1000" height="200"></iframe>
-->
