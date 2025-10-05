<?php
$res = chatboxsocketclient('hello');

echo $res;
//chatbox client
function chatboxsocketclient($query){
        //Stop button - here I need to check the stop button thing ...
        // where is the socket server?
        $host="localhost";
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
        //$result = fgets($fp, 1024);
	$result = fread($fp, 1024);
	fclose ($fp);
        }
	return $result;
}

?>


