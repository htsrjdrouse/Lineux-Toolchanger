<?php
$filename = $argv[1];

$filename = preg_replace('/^.*\//', '', $filename);
$connection = ssh2_connect('172.24.1.64', 22);
ssh2_auth_password($connection, 'pi', '9hockey');
ssh2_scp_send($connection, './gcodes/'.$filename, '/home/pi/gcodes/'.$filename, 0644);
?>
