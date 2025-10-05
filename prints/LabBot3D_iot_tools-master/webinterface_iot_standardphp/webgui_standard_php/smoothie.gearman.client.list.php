<?php
include('repstrapfunctionslib.php');

$json = openjson();
$json['tranferslistfile'] = 1;
closejson($json);


# create the gearman client
$gmc= new GearmanClient();

# add the default server (localhost)
$gmc->addServer();

# register some callbacks
$gmc->setCreatedCallback("created");
$gmc->setDataCallback("data");
$gmc->setStatusCallback("status");
$gmc->setCompleteCallback("complete");
$gmc->setFailCallback("fail");

$jsonjob = taskjobread();
//var_dump($jsonjob);

//echo $jsonjob['transferlist'][0];

$logger = './tasklogger';
$jsonlog = json_decode(file_get_contents($logger), true);
$jsonlog['logs'] = array();
file_put_contents($logger, json_encode($jsonlog));


for($i=0;$i<count($jsonjob['transferlist']);$i++){
    //$func = $argv[1];
    //$sub = $argv[2];
    //tasklogger($jsonjob['transferlist'][$i],1);
    if (preg_match('/ /', $jsonjob['transferlist'][$i])){
     $cmdr = preg_split('/ /', $jsonjob['transferlist'][$i]);
     $sub = "";
     for($j=1;$j<count($cmdr);$j++){
      $sub = $sub.$cmdr[$j]." ";
     }
     $sub = preg_replace("/ $/", "", $sub);
     //echo $jsonjob['transferlist'][$i]."\n";
     $func = $cmdr[0];
     //$sub = $cmdr[1];
     //echo $func."\n";
     //echo $sub."\n";
     $task= $gmc->addTask($func, $sub, NULL);
     }
    # run the tasks in parallel (assuming multiple workers)
    if (! $gmc->runTasks())
    {
      echo "ERROR " . $gmc->error() . "\n";
      exit;
    }
    echo "DONE\n";

}


function created($task)
{
    echo "CREATED: " . $task->jobHandle() . "\n";
}

function status($task)
{
    //$msg = "STATUS: "  $func ." ".$sub." " . $task->jobHandle() . " - " . $task->taskNumerator() . "/" . $task->taskDenominator() . "\n";
    //tasklogger($msg,1);
    //$job->sendData($json['smoothiemessage'].'<br>';);
    echo "STATUS: " . $task->jobHandle();// . " - " . $task->taskNumerator() . 
         //"/" . $task->taskDenominator() . "\n";
    //$msg = "STATUS: " . $task->jobHandle();
    //tasklogger($msg,1);
}

function complete($task)
{
    echo "COMPLETE: " . $task->jobHandle(); // . ", " . $task->data() . "\n";
    $msg = "COMPLETE: " . $task->jobHandle(); // . ", " . $task->data() . "\n";
    tasklogger($msg,1);
}

function fail($task)
{
    echo "FAILED: " . $task->jobHandle() . "\n";
}

function data($task)
{
    echo "JOB: " . $task->data() . "\n";
    $msg =  "JOB: " . $task->data() . "\n";
    tasklogger($msg,1);
}


//logger for cli interface
function tasklogger($msg,$func){
        $logger = './tasklogger';
        $jsonlog = json_decode(file_get_contents($logger), true);
        if ($func == 0){
         //$jsonlog['logs'] = array();
	 $myfile = fopen("taskfile.txt", "w");
    	 //fwrite($myfile,"testing\n");
    	 //fwrite($myfile,$jsonjob['transferlist'][$i]);
	 fclose($myfile);
        }
	 $myfile = fopen("taskfile.txt", "a");
    	 fwrite($myfile,$msg."\n");
	 fclose($myfile);
         array_push($jsonlog['logs'],$msg);
         file_put_contents($logger, json_encode($jsonlog));
}

/*
//setting up taskjob list
function taskjob($msg,$func){
        $logger = './taskjob';
        $jsonjob = json_decode(file_get_contents($logger), true);
        if ($func == 0){
         $jsonlog['transferlist'] = array();
        }
        array_push($jsonlog['transferlist'],$msg);
        file_put_contents($logger, json_encode($jsonlog));
}
*/

//reading through taskjob list
function taskjobread(){
        $logger = './taskjob';
        $jsonjob = json_decode(file_get_contents($logger), true);
	return $jsonjob;
}

?>

