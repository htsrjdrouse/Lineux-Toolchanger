<?php


$message = $argv[1];

//$message = 'M114';

for ($i=0;$i<25;$i++){
 sleep(1);
 positioncaller($message);
}

function positioncaller($message){

// where is the socket server?
$host="localhost";
$port = 8888;

// open a client connection
$fp = fsockopen ($host, $port, $errno, $errstr);

if (!$fp)
{
$result = "Error: could not open socket connection";
}

else
{
fputs ($fp, $message);
$result = fgets ($fp, 1024);
echo $result;

fclose ($fp);

}
}
?>
