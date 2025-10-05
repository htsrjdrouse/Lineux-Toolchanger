<?php

$message = $argv[1];
$result = socketclient($message, 1);
echo $result;
sleep(2);

/*
$message = 'leddelay 34';
socketclient($message, 0);
sleep(2);

$message = 'settings';
$res = socketclient($message, 1);
sleep(2);
echo $res;
*/

/*
$message = 'camerasnapoff';
socketclient($message, 0);
sleep(2);

$message = 'cameratriggeroff';
socketclient($message, 0);
sleep(2);
*/

/*
$message = 'cameraoff';
socketclient($message, 0);
sleep(2);
*/
//$message = 'P1position';
///$message = 'raspicameraoff';
//socketclient($message, 0);

//chatbox client
function socketclient($query, $mode){
        //Stop button - here I need to check the stop button thing ...
        // where is the socket server?
        $host="172.24.1.69";
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
	if ($mode == 1){
         $result = fread($fp, 1024);
	}
        fclose ($fp);
        }
	if ($mode == 1){
         return $result;
	}
}

?>
