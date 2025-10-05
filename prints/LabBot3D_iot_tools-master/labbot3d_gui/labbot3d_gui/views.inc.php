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
} else if ($views == "Imaging"){
 $jsonimg = openjson('nx.imgdataset');
 $jsonimg['views'] = "Imaging";
 closejson($jsonimg,'nx.imgdataset');
 header('Location: template.php');
} else if ($views == "Microfluidics"){
 $jsonimg = openjson('nx.imgdataset');
 $jsonimg['views'] = "Microfluidics";
 closejson($jsonimg,'nx.imgdataset');
 header('Location: template.php');
}

?>
