<? include('functionslib.php');
 $jsonimg = openjson('nx.imgdataset');

 if (isset($_POST['sendgcodecmd'])){
   $sendgcode = $_POST['sendgcode']; 
   $jsonimg['smoothielastcommand'] = $sendgcode;
   publish_message($sendgcode, 'labbot3d_1_control', 'localhost', 1883, 5);    
 }
 if (isset($_POST['getgcodepos'])){
   publish_message("M114", 'labbot3d_1_control', 'localhost', 1883, 5);    
 }


/*
<p><input type=text name=xyfeed value="<?=$jsonimg['speed']['xyjogfeed']?>" size=15 style="text-align:right;"><input type=submit name=sendxyfeed value="Adjust XY speed "></p>
*/


 if (isset($_POST['sendxyfeed'])){
   $xyfeed = $_POST['xyfeed']; 
   $jsonimg['speed']['xyjogfeed'] = $xyfeed;
   publish_message('XY jog feed: '.$xyfeed, 'labbot3d_1_control', 'localhost', 1883, 5);    
 }
 if (isset($_POST['sendzfeed'])){
   $zfeed = $_POST['zfeed']; 
   $jsonimg['speed']['zjogfeed'] = $zfeed;
   publish_message('Z jog feed: '.$zfeed, 'labbot3d_1_control', 'localhost', 1883, 5);    
 }
 if (isset($_POST['homelinact'])){
   $jsonimg['linact']['position'] = 0;
   publish_message('linact--home', 'labbot3d_1_control', 'localhost', 1883, 5);    
 }
 if (isset($_POST['reportpos'])){
   publish_message('linact--info', 'labbot3d_1_control', 'localhost', 1883, 5);    
 }
 if (isset($_POST['linactsettings'])){
   //"linact":{"steprate":500,"steps":2000}
   $jsonimg['linact']['steps'] = $_POST['linactsteps'];
   $jsonimg['linact']['steprate'] = $_POST['linactspeed'];
   $linactsteps = $_POST['linactsteps'];
   $linactspeed = $_POST['linactspeed'];
   publish_message('linact--stepsandrate '.$linactsteps.'_'.$linactspeed, 'labbot3d_1_control', 'localhost', 1883, 5);
 }
 if (isset($_POST['linactmvup'])){
   //$jsonimg['linact']['position'] = $jsonimg['linact']['position'] - $jsonimg['linact']['steps'];
   publish_message('linact--up', 'labbot3d_1_control', 'localhost', 1883, 5);
 }
 if (isset($_POST['linactmvdown'])){
   //$jsonimg['linact']['position'] = $jsonimg['linact']['position'] + $jsonimg['linact']['steps'];
   publish_message('linact--down', 'labbot3d_1_control', 'localhost', 1883, 5);
 }
 if (isset($_GET['id'])){
  echo $_GET['id'].'<br>';
  $idtag = $_GET['id'];
  $position = 'G1 X'.$jsonimg['currcoord']['X'].' Y'.$jsonimg['currcoord']['Y'].' Z'.$jsonimg['currcoord']['Z']; 
  if (preg_match('/^moveypos.*/', $idtag)){
   preg_match('/^moveypos(.*)$/', $idtag, $ar);
   $jsonimg['currcoord']['Y'] = $jsonimg['currcoord']['Y'] + $ar[1];
  }
  if (preg_match('/^moveyneg.*/', $_GET['id'])){
   preg_match('/^moveyneg(.*)$/', $_GET['id'], $ar);
   $jsonimg['currcoord']['Y'] = $jsonimg['currcoord']['Y'] - $ar[1];
  }
  if (preg_match('/^movexpos.*/', $_GET['id'])){
   preg_match('/^movexpos(.*)$/', $_GET['id'], $ar);
   $jsonimg['currcoord']['X'] = $jsonimg['currcoord']['X'] + $ar[1];
  }
  if (preg_match('/^movexneg.*/', $_GET['id'])){
   preg_match('/^movexneg(.*)$/', $_GET['id'], $ar);
   $jsonimg['currcoord']['X'] = $jsonimg['currcoord']['X'] - $ar[1];
  }
  if (preg_match('/^movezpos.*/', $_GET['id'])){
   preg_match('/^movezpos(.*)$/', $_GET['id'], $ar);
   echo "check ".$ar[1]."<br>";
   $jsonimg['currcoord']['Z'] = $jsonimg['currcoord']['Z'] + $ar[1];
  }
  if (preg_match('/^movezneg.*/', $_GET['id'])){
   preg_match('/^movezneg(.*)$/', $_GET['id'], $ar);
   $jsonimg['currcoord']['Z'] = $jsonimg['currcoord']['Z'] - $ar[1];
  }

  if (preg_match('/^homez/', $_GET['id'])){
   $jsonimg['currcoord']['Z'] = 0; 
   publish_message("G28 Z0", 'labbot3d_1_control', 'localhost', 1883, 5);      
  } else if (preg_match('/^homex/', $_GET['id'])){
   $jsonimg['currcoord']['X'] = 0; 
   publish_message("G28 X0", 'labbot3d_1_control', 'localhost', 1883, 5);      
  } else if (preg_match('/^homey/', $_GET['id'])){
   $jsonimg['currcoord']['Y'] = 0; 
   publish_message("G28 Y0", 'labbot3d_1_control', 'localhost', 1883, 5);      
  } else {
  $gcodecmd = 'G1 X'.$jsonimg['currcoord']['X'].' Y'.$jsonimg['currcoord']['Y'].' Z'.$jsonimg['currcoord']['Z'].' F'.$jsonimg['speed']['xyjogfeed'];
   publish_message($gcodecmd, 'labbot3d_1_control', 'localhost', 1883, 5);      
   sleep(1);
  }

 }
   closejson($jsonimg,'nx.imgdataset');
   header('Location: template.php');

?>
