<?

include('repstrapfunctionslib.php'); 
$json = openjson();
$json['view'] = "K";
$url = "gui.mod.php";


if (isset($_GET['headcamlinearactuatorsocketon'])){
 $json =headcam_linearactuatorsocket_start($json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['headcamlinearactuatorsocketoff'])){
 $json =headcam_linearactuatorsocket_stop($json);
 closejson($json);
 header('Location: '.$url);
}



if (isset($_GET['headcamstreamon'])){
 $json = headcam_linearactuatorsocketclient("cameraon",$json);
 closejson($json);
 $url = 'runner.php?mmmove=&tcli=headcamstreamon';
 header('Location: '.$url);
}
if (isset($_GET['headcamstreamoff'])){
 $json = headcam_linearactuatorsocketclient("cameraoff",$json);
 closejson($json);
 $url = 'runner.php?mmmove=&tcli=headcamstreamoff';
 header('Location: '.$url);
}
               
if (isset($_GET['headcamtrigon'])){
 $json = headcam_linearactuatorsocketclient("cameratriggeron",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['headcamtrigoff'])){
 $json = headcam_linearactuatorsocketclient("cameratriggeroff",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['headcamsnapon'])){
 $json = headcam_linearactuatorsocketclient("camerasnapon",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['headcamsnapoff'])){
 $json = headcam_linearactuatorsocketclient("camerasnapoff",$json);
 closejson($json);
 header('Location: '.$url);
}

 
if (isset($_GET['settings'])){
 $json = headcam_linearactuatorsocketclient("settings",$json);
 closejson($json);
 header('Location: '.$url);
}
// header('Location: '.$url);
if (isset($_GET['ledon'])){
 $json = headcam_linearactuatorsocketclient("ledon",$json);
 closejson($json);
 header('Location: '.$url);
}
if (isset($_GET['ledoff'])){
 $json['headcamled'] = 0;
 $json = headcam_linearactuatorsocketclient("ledoff",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['flashon'])){
 $json = headcam_linearactuatorsocketclient("flashon",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['flashoff'])){
 $json = headcam_linearactuatorsocketclient("flashoff",$json);
 closejson($json);
 header('Location: '.$url);
}


//<input type=submit name="triggeron" class="red" value="Trigger On">

if (isset($_GET['triggeron'])){
 $json = headcam_linearactuatorsocketclient("triggeron",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['triggeroff'])){
 $json = headcam_linearactuatorsocketclient("triggeroff",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['triggeroff'])){
 $json = headcam_linearactuatorsocketclient("triggeroff",$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['flashforphotoon'])){
 $json = headcam_linearactuatorsocketclient("flashforphotoon",$json);
 closejson($json);
 header('Location: '.$url);
}
if (isset($_GET['flashforphotooff'])){
 $json = headcam_linearactuatorsocketclient("flashforphotooff",$json);
 closejson($json);
 header('Location: '.$url);
}













if (isset($_GET['changeflashpower'])){
 $ledflashpower = $_GET['flashledpower'];
 $json = headcam_linearactuatorsocketclient("ledpower ".$ledflashpower,$json);
 closejson($json);
 header('Location: '.$url);
}


if (isset($_GET['changeflashduration'])){
 $ledflashduration = $_GET['flashduration'];
 $json = headcam_linearactuatorsocketclient("ledtimeon ".$ledflashduration,$json);
 closejson($json);
 header('Location: '.$url);
}


if (isset($_GET['changeflashdelay'])){
 $ledflashdelay = $_GET['flashdelay'];
 $json = headcam_linearactuatorsocketclient("ledflashdelay ".$ledflashdelay,$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['changeleddelay'])){
 $leddelay = $_GET['leddelay'];
 $json = headcam_linearactuatorsocketclient("leddelay ".$leddelay,$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['changetriggerNumber'])){
 $triggerNumber = $_GET['triggerNumber'];
 $json = headcam_linearactuatorsocketclient("triggernumber ".$triggerNumber,$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['changetriggerDelay'])){
 $triggerDelay = $_GET['triggerDelay'];
 $json = headcam_linearactuatorsocketclient("triggerdelay ".$triggerDelay,$json);
 closejson($json);
 header('Location: '.$url);
}

if (isset($_GET['changeledflashdelay'])){
 $ledflashdelay = $_GET['ledflashdelay'];
 $json = headcam_linearactuatorsocketclient("ledflashdelay ".$ledflashdelay,$json);
 closejson($json);
 header('Location: '.$url);
}





?>
