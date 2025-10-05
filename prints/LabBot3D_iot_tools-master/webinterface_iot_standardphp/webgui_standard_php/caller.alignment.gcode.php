<?php

include('repstrapfunctionslib.php');
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

$jsontasker3 = json_decode(file_get_contents('taskjob3'), true);

$gfile = $_POST['gfile'];
$subval = $_POST['subval'];

$dir = $json['imgprocessingtracker']['directory'];

$jsontasker3['track'] = (array_search($gfile,$jsontasker3['filename']));
$json['view'] = "D";


//This edits the file but adheres to array pattern
if ($subval == 'Edit File'){
 $json['editgcode'] = "1";
 //now need to change to taskjob3 file_put_contents('taskjob2', json_encode($jsontasker));
 file_put_contents('taskjob3', json_encode($jsontasker3));
 file_put_contents($imgdataset, json_encode($json));
 header('Location: gui.mod.php');
}
else {


$json['editgcode'] = "0";

//echo '<br>--testing<br>';
//echo $counttrack.'<br>';

//$jsontasker3['data'][$jsontasker3['track']] = "";

$filcontent = [];
for($i=0;$i<count($json['workplate']['tarxpos']);$i++){
 $reference = $json['workplate']['reference'][$i];
 if ($json['workplate']['enabledtargets'][$i] == 1){
   $arraytype = $json['workplate']['arraytype'][$i];
   $ii = $json['workplate']['arraytyperef'][$arraytype];
   echo 'passes'.$json['workplate']['enabledtargets'][$i].'<br>';
   $flag = checkcoordinates($json,$ii);
    
   $bx = $json['positioningtheory']['bcol'];
   $by = $json['positioningtheory']['brow'];
   $ex = $json['positioningtheory']['ecol'];
   $ey = $json['positioningtheory']['erow'];
   

 if ($flag == 0) {
  $xbrefx = $json['positionimgprocessing']['xbcol'];
  $xerefx = $json['positionimgprocessing']['xecol'];
  $xbrefy = $json['positionimgprocessing']['xbrow'];
  $xerefy = $json['positionimgprocessing']['xerow'];
  $xbposx = $json['positionimgprocessing']['xbcolpos'];
  $xeposx = $json['positionimgprocessing']['xecolpos'];
  $xbposy = $json['positionimgprocessing']['xbrowpos'];
  $xeposy = $json['positionimgprocessing']['xerowpos'];

  $ybrefx = $json['positionimgprocessing']['ybcol'];
  $yerefx = $json['positionimgprocessing']['yecol'];
  $ybrefy = $json['positionimgprocessing']['ybrow'];
  $yerefy = $json['positionimgprocessing']['yerow'];
  $ybposx = $json['positionimgprocessing']['ybcolpos'];
  $yeposx = $json['positionimgprocessing']['yecolpos'];
  $ybposy = $json['positionimgprocessing']['ybrowpos'];
  $yeposy = $json['positionimgprocessing']['yerowpos'];

  $targettypeindex = 0;
  $spotcolsp = $json['workplate']['targettype'][$targettypeindex]['spotcolsp'];
  $spotrowsp = $json['workplate']['targettype'][$targettypeindex]['spotrowsp'];
  $calcxspacing = ((($xeposx - $xbposx))/($xerefx - $xbrefx));
  $calcyspacing = ((($yeposy - $ybposy))/($yerefy - $ybrefy));
  $refxspacing = $json['positionimgprocessing']['refxspacing'];
  $refyspacing = $json['positionimgprocessing']['refyspacing'];

  $reftarx = $json['positionimgprocessing']['reftarx'];
  $reftary = $json['positionimgprocessing']['reftary'];
  $searchstr = $reftary."_".$reftarx;
  $tarind = ($json['workplate']['reference'][$searchstr] - 1);
  $reftarxpos = $json['workplate']['tarxpos'][$tarind];
  $reftarypos = $json['workplate']['tarypos'][$tarind];
  $shiftx = $json['workplate']['tarxpos'][$i] - $reftarxpos;
  $shifty = $json['workplate']['tarypos'][$i] - $reftarypos;

  $bposx = $json['positionimgprocessing']['bcolpos'];
  $eposx = $json['positionimgprocessing']['ecolpos'];
  $spotdiff = round((($yeposx - $ybposx)),3); 
  $unitpermmxshift = $spotdiff / abs($yerefy-$ybrefy);
  $xspotdiff = round((($xeposy - $xbposy)),3);

  $unitpermmyshift = $xspotdiff / abs($xerefx-$xbrefx);
  for($y=$by;$y<=$ey;$y++){
    $diagspotdiff = $unitpermmxshift * (($y - $json['positionimgprocessing']['ybrow']) * $spotrowsp);
  for($x=$bx;$x<=$ex;$x++){
    $xdiagspotdiff = $unitpermmyshift * (($x - $json['positionimgprocessing']['xbrow']) * $spotcolsp);

    if ($json['positioningscheme'] == 'imaging'){
	if (isset($_POST['firstpos'])){
	 $coords = imagingcoordfindshim($json,$i,$x,$y,$spotdiff,$xspotdiff,$targettypeindex,$_POST['firstpos']);
	}
	else {
	 $coords = imagingcoordfind($json,$i,$x,$y,$spotdiff,$xspotdiff,$targettypeindex);
	}
	$xpos = $coords[0];
	$ypos = $coords[1];
	$cmd = 'G1X'.(round($xpos,3)+$diffx).'Y'.(round($ypos,3)+$diffy).'Z'.$json['trackxyz']['z'].'F'.$json['xyfeedrate'];
        array_push($filcontent,$cmd);
	//$jsontasker['filecontent'][$counttrack] = $jsontasker['filecontent'][$counttrack] + $cmd;
	if ($json['positioningmode'] == 'imaging'){
	 //echo 'headcamsnap go<br>';
	 $cmd = 'headcamsnap go';
         //$jsontasker['filecontent'][$counttrack] = $jsontasker['filecontent'][$counttrack] + $cmd;
	 array_push($filcontent,$cmd);
	 //echo $cmd;
	}
    }
    else {
     $xpos = $json['workplate']['targettype'][$ii]['leftmargin'] + (($x - 1) * ($json['workplate']['targettype'][$ii]['spotcolsp'])) + $json['workplate']['tarxpos'][$i];
     $ypos = $json['workplate']['targettype'][$ii]['topmargin'] + (($y - 1) * ($json['workplate']['targettype'][$ii]['spotrowsp'])) + $json['workplate']['tarypos'][$i];
     //echo 'G1X'.round($xpos,3).'Y'.round($ypos,3).'Z'.$json['trackxyz']['z'].'F'.$json['xyfeedrate'].'<br>';
     $cmd = 'G1X'.round($xpos,3).'Y'.round($ypos,3).'Z'.$json['trackxyz']['z'].'F'.$json['xyfeedrate'];
     //$jsontasker['filecontent'][$counttrack] = $jsontasker['filecontent'][$counttrack] + $cmd;
     array_push($filcontent,$cmd);
     //echo $cmd;
     if ($json['positioningmode'] == 'imaging'){
	//echo 'headcamsnap go<br>';
	$cmd = 'headcamsnap go';
        //$jsontasker['filecontent'][$counttrack] = $jsontasker['filecontent'][$counttrack] + $cmd;
	array_push($filcontent,$cmd);
	//echo $cmd;
     }
    }
  }
  }
 } 
 }
}


$jsontasker3['data'][$jsontasker3['track']] = $filcontent;
$json['view'] = "D";
$json['gfile'] = $gfile;
file_put_contents('taskjob3', json_encode($jsontasker3));
file_put_contents($imgdataset, json_encode($json));

header('Location: gui.mod.php');

}

function checkcoordinates($json,$ii){

 $flag = 0;
 if ($json['positioningtheory']['bcol'] <= $json['workplate']['targettype'][$ii]['spotcol']) {
  $bx = $json['positioningtheory']['bcol'];
 }
 else {
  $flag = 1;
  //$bx = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['ecol'] <= $json['workplate']['targettype'][$ii]['spotcol']) {
  $ex = $json['positioningtheory']['ecol'];
 }
 else {
  $flag = 1;
  //$ex = $json['workplate']['targettype'][$ii]['spotcol'];
 }

 if ($json['positioningtheory']['brow'] <= $json['workplate']['targettype'][$ii]['spotrow']) {
  $by = $json['positioningtheory']['brow'];
 }
 else {
  $flag = 1;
  //$by = $json['workplate']['targettype'][$ii]['spotrow'];
 }

 if ($json['positioningtheory']['erow'] <= $json['workplate']['targettype'][$ii]['spotrow']) {
  $ey = $json['positioningtheory']['erow'];
 }
 else {
  $flag = 1;
  //$ey = $json['workplate']['targettype'][$ii]['spotrow'];
 }
return $flag;
}




function tarpos($index,$json){
	$x = $json['workplate']['tarxpos'][$index-1];
	$y = $json['workplate']['tarypos'][$index-1];
	$xycoord = array('X'=>$x,'Y'=>$y);
	return $xycoord;
}


//"positioningtheory":{"brow":"1","bcol":"10","erow":"24","ecol":"16"}

function spotpos($index,$json,$xycoord,$arraytypeindex){
	$px = $xycoord['X'];
	$py = $xycoord['Y'];
	for($y=1;$y<=$json['workplate']['targettype'][$arraytypeindex]['spotrow'];$y++){
		$gy = $py + ($y * $json['workplate']['targettype'][$arraytypeindex]['spotrowsp']);
	for($x=1;$x<=$json['workplate']['targettype'][$arraytypeindex]['spotcol'];$x++){
		$gx = $px + ($x * $json['workplate']['targettype'][$arraytypeindex]['spotcolsp']);
		$gmd = 'G1X'.$gx.'Y'.$gy.'F1000<br>';	
		echo $gmd;
	}
	}
}

function spotposimaging($index,$json,$xycoord,$arraytypeindex){
	$px = $xycoord['X'];
	$py = $xycoord['Y'];
	for($y=1;$y<=$json['workplate']['targettype'][$arraytypeindex]['spotrow'];$y++){
		$gy = $py + ($y * $json['workplate']['targettype'][$arraytypeindex]['spotrowsp']);
	for($x=1;$x<=$json['workplate']['targettype'][$arraytypeindex]['spotcol'];$x++){
		$gx = $px + ($x * $json['workplate']['targettype'][$arraytypeindex]['spotcolsp']);
		$gmd = 'G1X'.$gx.'Y'.$gy.'F1000<br>';	
		echo $gmd;
	}
	}
}

//}
?>
