<?php


socketclient("cameraoff", 0);


/*
$result = socketclient("settings", 1);
echo $result;
*/

//$a = "ledpower: 4 ledon: 0 leddelay: 10 ledontime: 100 ledflashdelay: 500 flashOn: 0 flashforPhoto: 0 triggerPhoto: 0 triggerDelay: 6 triggerNumber: 1 readPin: 0";

/*
$b = preg_split('/:/', $result);



$ledpower =  preg_replace('/ ledon/', '', $b[1]);
$ledpower =  preg_replace('/ /', '', $ledpower);
$ledon =  preg_replace('/ leddelay/', '', $b[2]);
$ledon =  preg_replace('/ /', '', $ledon);
$leddelay =  preg_replace('/ ledontime/', '', $b[3]);
$leddelay =  preg_replace('/ /', '', $leddelay);
$ledontime =  preg_replace('/ ledflashdelay/', '', $b[4]);
$ledontime =  preg_replace('/ /', '', $ledontime);
$ledflashdelay =  preg_replace('/ flashOn/', '', $b[5]);
$ledflashdelay =  preg_replace('/ /', '', $ledflashdelay);
$flashOn =  preg_replace('/ flashforPhoto/', '', $b[6]);
$flashOn =  preg_replace('/ /', '', $flashOn);
$flashforPhoto =  preg_replace('/ triggerPhoto/', '', $b[7]);
$flashforPhoto =  preg_replace('/ /', '', $flashforPhoto);
$triggerPhoto =  preg_replace('/ triggerDelay/', '', $b[8]);
$triggerPhoto =  preg_replace('/ /', '', $triggerPhoto);
$triggerDelay =  preg_replace('/ triggerNumber/', '', $b[9]);
$triggerDelay =  preg_replace('/ /', '', $triggerDelay);
$triggerNumber =  preg_replace('/ readPin/', '', $b[10]);
$triggerNumber =  preg_replace('/ /', '', $triggerNumber);
$readPin =  preg_replace('/ /', '', $b[11]);


*/



function socketclient($query, $res){
        //Stop button - here I need to check the stop button thing ...
        // where is the socket server?
        $host="192.168.1.102";
        $port = 8888;
        //open trackjson
        // open a client connection
        $fp = fsockopen ($host, $port, $errno, $errstr);
        if (!$fp)
        {
                $result = "Error: could not open socket connection";
                echo $result.'<br>';
        } 
        else
        {
        #get endstop status
        fputs($fp,$query);
	if ($res == 1){
         $result = fread($fp, 1024);
	}
        fclose ($fp);
        }
	if ($res == 1){
         return $result;
	}
}


?>
