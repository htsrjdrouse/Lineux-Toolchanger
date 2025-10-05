<?
include('functionslib.php');
$views = $_POST['view'];

//echo $views.'<br>';
if ($views == "Manual"){
 $jsonimg = openjson('nx.imgdataset');
 $jsonimg['views'] = "Manual";
 closejson($jsonimg,'nx.imgdataset');
 header('Location: template.php');
} else if ($views == "Macro"){
 $jsonimg = openjson('nx.imgdataset');
 $jsonimg['views'] = "Macro";
 closejson($jsonimg,'nx.imgdataset');
 header('Location: template.php');
}

?>
