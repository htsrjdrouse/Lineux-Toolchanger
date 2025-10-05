<html>
<title>LabBot3D tasklogger</title>
<? include('functionslib.php'); ?>
<body>

<form action=<?=$_SERVER['PHP_SELF']?> method=post>
<input type=submit name=cleardata value="Clear log">
</form>
<? $logger = json_decode(file_get_contents('tasklogger'), true);?>

<? if (isset($_POST['cleardata'])){
 $logger['mesg'] = array(); 
}
closejson($logger,'tasklogger');
?>

<?
$page = $_SERVER['PHP_SELF'];
$sec = "1";
header("Refresh: $sec; url=$page");
?>
<font face=arial size=1>
<?
 $datr = array_reverse($logger['mesg']);
 foreach($datr as $ll){
  echo $ll.'<br>';
 }
?>
</font>
</body>
</html>

