<? session_start(); ?>

<?
$_SESSION['tstin'] = "yes";
?>
 hello the session is: <?=$_SESSION['tstin']?>
<br>

<a href=t2.php>go to next</a>
