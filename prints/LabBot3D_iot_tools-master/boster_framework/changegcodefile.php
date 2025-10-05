<? include('functionslib.php');?>
<? $jsonimg = openjson('nx.imgdataset');?>
<?php 
  $jsontasker3 = openjson('taskjob3');
?>
<?
if (isset($_POST['gcodesave'])){
 $scriptname = $_POST['scriptname'];
 $pregcoderp = $_POST['macroscript'];
 $gcoderp = preg_split('/\r\n/', $pregcoderp);
 $gcoderp = preg_replace('/"/', '', $gcoderp);
 $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
 if (array_search($scriptname,$jsontasker3['filename'])){
   $jsontasker3 = json_decode(file_get_contents('taskjob3'), true);
   $track = array_search($scriptname,$jsontasker3['filename']);
   $jsontasker3['data'][$track] = $gcoderp;
   $jsontasker3['track'] = $track;
  }
 else {
   array_push($jsontasker3['filename'],$scriptname);
   array_push($jsontasker3['data'],$gcoderp);
   $jsontasker3['track'] =  array_search($scriptname,$jsontasker3['filename']);
  }
 file_put_contents('taskjob3', json_encode($jsontasker3));
 header("Location: template.driver.php");
}
else if (isset($_POST['delete'])){
 $scriptname = $_POST['scriptname'];
 $newtrack =  (array_search($scriptname,$jsontasker3['filename'])-1);
 unset($jsontasker3['filename'][$jsontasker3['track']]);
 unset($jsontasker3['data'][$jsontasker3['track']]);
 $jsontasker3['track'] = $newtrack;
 file_put_contents('taskjob3', json_encode($jsontasker3));
 header("Location: template.driver.php");
}
else if (isset($_POST['tmove'])){
 $jsonimg['mmmove'] = $_POST['mmmove'];
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}
else if (isset($_POST['tzmove'])){
 $jsonimg['zmmmove'] = $_POST['zmmmove'];
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}

else if (isset($_POST['mvfor'])){
 $py = $jsonimg['parsedposition']['Y'] + $jsonimg['mmmove'];
 $jsonimg['mmmove'] = $_POST['mmmove'];
 $cmd = "G1 Y".$py;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["Y"] = $py;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}
else if (isset($_POST['mvback'])){
 $py = $jsonimg['parsedposition']['Y'] - $jsonimg['mmmove'];
 $jsonimg['mmmove'] = $_POST['mmmove'];
 $cmd = "G1 Y".$py;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["Y"] = $py;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}
else if (isset($_POST['mvright'])){
 $px = $jsonimg['parsedposition']['X'] + $jsonimg['mmmove'];
 $jsonimg['mmmove'] = $_POST['mmmove'];
 $cmd = "G1 X".$px;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["X"] = $px;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}
else if (isset($_POST['mvleft'])){
 $px = $jsonimg['parsedposition']['X'] - $jsonimg['mmmove'];
 $jsonimg['mmmove'] = $_POST['mmmove'];
 $cmd = "G1 X".$px;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["X"] = $px;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}

else if (isset($_POST['mvup'])){
 $pz = $jsonimg['parsedposition']['Z'] - $jsonimg['zmmmove'];
 $cmd = "G1 Z".$pz;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["Z"] = $pz;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}

else if (isset($_POST['mvdown'])){
 $pz = $jsonimg['parsedposition']['Z'] + $jsonimg['zmmmove'];
 $cmd = "G1 Z".$pz;
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 $jsonimg["parsedposition"]["Z"] = $pz;
 $jsonimg['smoothielastcommand'] = $cmd;
 closejson($jsonimg,'nx.imgdataset');
 header("Location: template.driver.php");
}


else if (isset($_POST['runmacro'])){
 echo "running ".$jsontasker3['filename'][$jsontasker3['track']];
 var_dump($jsontasker3['data'][$jsontasker3['track']]);

 $fname = $jsontasker3['filename'][$jsontasker3['track']];
 $fp = fopen("/home/richard/gcode.files/".$fname, "w");
 for($i=0;$i<count($jsontasker3['data'][$jsontasker3['track']]);$i++){
  fwrite($fp,$jsontasker3['data'][$jsontasker3['track']][$i]."\n");
 }
 fclose($fp);

 //if re.match('^runfile.*',bdata)
 $cmd = 'runfile '.$jsontasker3['filename'][$jsontasker3['track']];
 $jsonimg = socketclient('localhost',$cmd,$jsonimg);
 header("Location: template.driver.php");
}



else{
 $track = $_GET['track'];
 $jsontasker3['track'] = $track;
 echo $jsontasker3['filename'][$jsontasker3['track']];
 closejson($jsontasker3,'taskjob3');
 header('Location: template.driver.php');
}
?>
