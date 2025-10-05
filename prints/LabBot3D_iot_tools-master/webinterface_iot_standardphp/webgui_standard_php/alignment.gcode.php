<?php


include('repstrapfunctionslib.php');
$imgdataset = 'imgdataset';
$json = json_decode(file_get_contents($imgdataset), true);

echo '<font face=arial>';

$homing = $json['homingxafterrow']; 

/*
echo 'homing: '.$homing.'<br>';

echo '-----------------<br>';
echo '<font color=red>';
echo 'X Grid calibration: '.round(($json['imageprocessing']['px'][1] - $json['imageprocessing']['px'][0]),3).'<br>';
echo 'Y Grid calibration: '.round(($json['imageprocessing']['py'][2] - $json['imageprocessing']['py'][0]),3).'<br>';
echo 'X substrate shift: '.round(($json['imageprocessing']['px'][2] - $json['imageprocessing']['px'][0]),3).'<br>';
echo 'Y substrate shift: '.round(($json['imageprocessing']['py'][1] - $json['imageprocessing']['py'][0]),3).'<br>';
echo '</font>'; 


echo '-----------------<br>';
echo 'Location scheme: '.$json['positioningscheme'].'<br>';
echo 'Positioning mode: '.$json['positioningmode'].'<br>';

*/
//$targetry = $json['workplate']['enabletar'];

/*
if $_POST['subval'] == 'Save File') {
echo "yes";
}
else {
*/




for($i=0;$i<count($json['workplate']['tarxpos']);$i++){
 $reference = $json['workplate']['reference'][$i];
 if ($json['workplate']['enabledtargets'][$i] == 1){
  //here is the counter to track the first position
  $ct = 0;
echo '<ul>';
 //echo 'Target: '.($i+1).'<br>';
 
 $arraytype = $json['workplate']['arraytype'][$i];
 //echo 'Arraytype: '.$json['workplate']['arraytype'][$i].'<br>';
echo '</ul>';

 $ii = $json['workplate']['arraytyperef'][$arraytype];

 $flag = checkcoordinates($json,$ii);
 


 $bx = $json['positioningtheory']['bcol'];
 $by = $json['positioningtheory']['brow'];
 $ex = $json['positioningtheory']['ecol'];
 $ey = $json['positioningtheory']['erow'];



 if ($flag == 0) {

 //{"positionimgprocessing":{"refxspacing":"1","refyspacing":"1","adjypixpermm":"50.67567","adjxpixpermm":"50.67567","ypixpermm":"50","xpixpermm":"50","edit":"0","brow":"1","bcol":"1","erow":"24","ecol":"16","browpos":"15.52","bcolpos":"18.6","erowpos":"38.16","ecolpos":"33.4"}
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


 //$scalex = ($json['positionimgprocessing']['adjxpixpermm'] / $json['positionimgprocessing']['xpixpermm']);
 //$scaley = ($json['positionimgprocessing']['adjypixpermm'] / $json['positionimgprocessing']['ypixpermm']);
 //"targettype":[{"spotrow":"24","spotrowsp":"1","blockcolsp":"1","spotcolsp":"1","tartypename":"A","blockrow":"1","blockcol":"1","spotcol":"16","blockrowsp":"1","leftmargin":"2","topmargin":"3"}
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

	//What I want to do is when traversing targets the tips may need to move up. So I have to make a counter to track 
	//Here is the traversing part
	if (($ct == 0) and ($json['positioningmode'] == 'spotting')){
	 echo 'G1Z'.$json['workplate']['spottingzacrosstargets'].'F'.$json['zfeedrate'].'<br>';
	 echo 'P1move '.$json['workplate']['spottingzlacacrosstargets'].'<br>';
 	}
	if (($ct == 0) and ($json['positioningmode'] == 'imaging')){
	 echo 'G1Z'.$json['workplate']['imagingzacrosstargets'].'F'.$json['zfeedrate'].'<br>';
	 echo 'P1move '.$json['workplate']['imagingzlacacrosstargets'].'<br>';
 	}
	//Here is the positioning command
	//echo 'G1X'.(round($xpos,3)+$diffx).'Y'.(round($ypos,3)+$diffy).'Z'.$json['trackxyz']['z'].'F'.$json['xyfeedrate'].'<br>';
	echo 'G1X'.(round($xpos,3)+$diffx+$json['camera']['offsetx']).'Y'.(round($ypos,3)+$diffy+$json['camera']['offsety']).'F'.$json['xyfeedrate'].'<br>';
	//Now here I need to set the spotting z height or imaging z height
	if (($json['positioningmode'] == 'spotting')){
	 if (($ct == 0) or ($json['workplate']['spottinglacz'] != $json['workplate']['spottingzlacacrossspottingposition']) or ($json['workplate']['spottingz'] != $json['workplate']['spottingzacrossspottingposition'])){
	  echo 'G1Z'.$json['workplate']['spottingz'].'F'.$json['zfeedrate'].'<br>';
	  echo 'P1move '.$json['workplate']['spottinglacz'].'<br>';
	 }
	 echo 'fire go<br>';
	 //here I have to do the spotting position traverse thing
	 //So this is a conditional
	 if ($json['workplate']['spottinglacz'] != $json['workplate']['spottingzlacacrossspottingposition']){
	  echo 'P1move '.$json['workplate']['spottingzlacacrossspottingposition'].'<br>';
	 }
	 if ($json['workplate']['spottingz'] != $json['workplate']['spottingzacrossspottingposition']){
	 echo 'G1Z'.$json['workplate']['spottingzacrossspottingposition'].'F'.$json['zfeedrate'].'<br>';
	 }
	}
	if (($json['positioningmode'] == 'imaging')){
	 echo 'G1Z'.$json['workplate']['imagingz'].'F'.$json['zfeedrate'].'<br>';
	 echo 'P1move '.$json['workplate']['imaginglacz'].'<br>';
	 echo 'headcamsnap go<br>';
	}
	//Get the counter going which gets set to 0 when the target is traversed
	$ct = $ct + 1;
    }
    else {
     $xpos = $json['workplate']['targettype'][$ii]['leftmargin'] + (($x - 1) * ($json['workplate']['targettype'][$ii]['spotcolsp'])) + $json['workplate']['tarxpos'][$i];
     $ypos = $json['workplate']['targettype'][$ii]['topmargin'] + (($y - 1) * ($json['workplate']['targettype'][$ii]['spotrowsp'])) + $json['workplate']['tarypos'][$i];
     echo 'G1X'.round($xpos,3).'Y'.round($ypos,3).'Z'.$json['trackxyz']['z'].'F'.$json['xyfeedrate'].'<br>';
     if ($json['positioningmode'] == 'imaging'){
	echo 'headcamsnap go<br>';
     }
    }
  }
  }
 } 



 }
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
