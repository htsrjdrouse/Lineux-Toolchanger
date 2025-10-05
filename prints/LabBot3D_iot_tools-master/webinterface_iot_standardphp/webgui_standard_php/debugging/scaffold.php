


<html>
<head><title>JSON jQuery AJAX</title></head>
<body>

<font face=arial>

<script src="/jquery.js" type="text/javascript"></script>

<?php header("Cache-Control: no-cache, must-revalidate"); ?>

<div class="terminal">
<?php
  echo '<iframe src="./fopen.php" width="1000" height="200"></iframe>';
?>
</div>

<br>
 
<ul></ul>

<!-- <input type="button" value="Run" class="buttonRun">-->

<?php
include('repstrapfunctionslib.php');
$imgdataset = './imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

//$imgdataset = './imgdataset';
//file_put_contents($imgdataset, json_encode($json));

?>


<br><br>

<style type=text/css>
input.red {background-color: #F8D6D6;}
input.green {background-color: #BCF5A9;}
//input.blue {background-color: #EADFF7;}
input.blue {background-color: #FFFF00;}
input.violet {background-color: #CED8F6;}
input.txt {text-align:center;}

.imgLeftClass { 
font-size: 1em;
color: transparent;
background:url(left.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

.imgRightClass { 
font-size: 1em;
color: transparent;
background:url(right.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

.imgFrontClass { 
font-size: 1em;
color: transparent;
background:url(up.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

.imgBackClass { 
font-size: 1em;
color: transparent;
background:url(down.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

.imgUpClass { 
font-size: 1em;
color: transparent;
background:url(arrow_up_double.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}

.imgDownClass { 
font-size: 1em;
color: transparent;
background:url(arrow_down_double.png) no-repeat;
background-position:  7px 0px;
background-repeat: no-repeat;
width: 70px;
height: 63px;
border: 0px;
background-color: none;
cursor: pointer;
outline: 0;
}




</style>


<form id=myform action=runner.php method=get>
<fieldset class="gui"><legend><b>X-Y-Z Direction</b></legend>
<br>


<table cellpadding=5><tr><td>

<table cellpadding=10>
<tr><td></td><td align=center><input type="submit"  name=cli class="imgFrontClass" value="Front"></td><td></td></tr>
<tr><td>
<input type=submit name=cli class="imgLeftClass" value="Left">

</td>
<td align=center>
<input type=text class="txt" name=mmmove  value=<?php echo $json['mmmove']; ?> size=4><br>
<input type="submit" name="cli" value="Move (mm)" class="blue">
</td><td><input type=submit name=cli class="imgRightClass" value="Right"></td></tr>
<tr><td></td><td align=center><input type=submit name=cli class="imgBackClass" value="Back"></td><td></td></tr>
</table>
</td>
<td>
<table cellpadding=10>
<tr><td align=center><input type=submit name=cli class="imgUpClass" value="Z up"></td><tr>
<tr><td align=center><input type=text class="txt" name=zmmmove value=<?php echo $json['zmmmove']; ?> size=4><br><input type=submit class="blue" name=cli value="ZMove (mm)"><br></td><tr>
<tr><td align=center><input type=submit name=cli class="imgDownClass" value="Z down"></td><tr>
</td>
</table>
</fieldset>
</form>
</font>



</body>
</html>
