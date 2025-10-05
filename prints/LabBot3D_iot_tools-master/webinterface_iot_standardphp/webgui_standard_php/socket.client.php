<?php

$message = $argv[1];


$res = socketclient($message);

echo $res;
//chatbox client
function socketclient($query){
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
        $result = fread($fp, 1024);
        fclose ($fp);
        }
        return $result;
}

?>


