<?php
$handle = opendir('strobimages');
$imgfiles = array();
  while (false !== ($entry = readdir($handle))) {
        //echo "$entry\n";
	if (strlen($entry) > 3){
   	 array_push($imgfiles,$entry);
	}
    }
var_dump($imgfiles);
closedir($handle);

?>
