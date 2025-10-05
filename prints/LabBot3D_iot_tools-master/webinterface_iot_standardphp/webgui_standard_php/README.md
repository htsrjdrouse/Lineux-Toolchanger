# labauto_webserv_OS

This is designed to design and control lab automation functions using Reprap 3D printing electronics and with ARM linux clusters (ie., RaspberryPis) and open source microcontrollers (ie., Arduinos). This software enables the possibility of scheduling diverse automation steps and included are some graphical user interfaces that end users can use for designing programs. 

Include in this repository are multiple scripts which can be indifferent programming languages but all working together through a standard linux Apache webserver. More details regarding how to use the custom commands are included in the wiki while the purpose of this file is to explain generally the functions of these scripts and someincluded example data to demonstrate how they work. 

gui.mod.php  - This is the base webpage which all functional pages share begins with this file. I guess this file should be renamed to index.php for practical purposes.

page.header.inc.php - This is the base webpage which all functional pages share begins with this file. This file is called by gui.mod.php. This page also calls the following javascript libraries that need to be put on the webroot:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	jquery.js<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	jquery.tabs.js<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	jquery.min.js<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	jquery.validate.js<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	custom.js<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	skulpt.min.js<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	skulpt-stdlib.js<br />

These files are in in the javascript.libraries folder. I think the skulpt stuff is not longer needed and I guess jquery.min.js is redundant to jquery.js so in this was pect it still needs to be cleaned up. 

The page.header.inc.php also calls two json files (loggerdataset and imgdataset). 

imgdataset - This contains most of the data that is involved with the liquid handling and imaging. Sometimes a bug may occur and erases this file so we also includee a back up of imgdataset to restore these settings just in case. You can create a backup using the commandline interface. This file is called imgdataset.back

loggerdataset - There is an embedded command line interface in on these webpages that allows the user to enter special commands for this OS system. The dialog is stored here. There is also a backup to loggerdataset called loggerdataset.back. 

fopen.php - The page.header.inc.php calls this file to embed the command line interface on the top of the page.

help.php - This includes documentation about this OS that includes the relevant sockets that the other servers may have. This info will be changed as the OS conforms to the latest instrument configuration.

views.php - This page lists the possible GUI displays which are like tabs called through some javascript which also exists on this page. So many if not all of these displays have forms and the variables are mostly calling the imageviewer.process.inc.php script which is actually called through gui.mod.php that calls imageviewer.process.inc.php. However this isn't always the case, since views.php also sometimes calls, prerunner.php, runner.php, syringemove.php, gotostroboscope.php, stroboscopeonoff.php and washing.php.

imageviewer.process.inc.php - This is the backend that gets called from the various forms in views.php as part of the form action which in some cases is POST (gcodesave, pythonsave, Workplate, Deleting strobimages, Deleting images, Uploading gcode) or GET (run python script, set up source wells, operate syringe pump, tracking positions based on images, z travel height, wash / dry parameters, control piezo, stroboscope, turn on head camera, go to position, turning on specific sockets, set pressure compensation liquid level, turning on fan, report position, disconnecting and shutting down sockets, homing, image processing spot finding). Alot of stuff is going on in imageviewer.process.inc.php. This script also calls repstrapfunctionslib.php which does alot of the work and the cli.interface.php script which is sort of the command line equivalent of imageviewer.process.inc.php and views.php combined. Most of the data compiled through using this script is in imgdataset and the command line interface (cli) reports the operation in fopen.php. 

cli.interface.php - This is mostly the command line interface backend script that is accessible through fopen.php. Like imageviewer.process.inc.php, it can control many operations of the instrument but you just send commands. The help.php file details the commands that you can run and to modify this file (to point to different types of sockets, you can refer to help.php in finding these commands). One thing to point out that there is a little bit of GUI type code on this page that refers to the STOP and GO button which basically disconnects the power to the instrument, turning on and off sockets in a general way and entering positioning coordinates. Also this file calls manualmove.inc.php which is the GUI used to move the instrument.

manualmove.inc.php - This file is just a user interface for moving the X-Y-Z axis of the 3D printer. This script calls the task scheduler script, runner.php which disconnects the user from the instrument while it is moving.  

runner.php - This is an important part of the scheduling process and is the intermediate script before calling the actual scheduling script, called php smoothie.gearman.client.list.php. Actually when doing so it forks the process away and it is monitored externally through a javascript. The nice thing is that you can kill the schedular process using the stop button which is displayed there (stoprun.php). Also it is possible to select cameras for displaying streams while the system is moving and this can be selected here unforntunately it is still hardcoded. There are many special if conditions which get called based on the arguments that get passed to this script. The following available operations are enumerated (move, gotodry, gotostrob, backtoz, gotowell, dry, gotowash, gotowaste, wash, gotowash go, washdry, fillsyringe, aspirate, strobsnap, analyzestrobimg, dispense, Front, Back, Right, Left, Z up, Z down). Here these specific commands are tracked using taskjob json file and this is 'remembered' as being the as movement the instrument does. In addition to specific functions a text file containing lists of commands (transferlist) uploaded through views.php and processed by imageviewer.process.inc.php is also sent to runner.php and the individual commands in this list are scheduled and tracked using taskjob3 json file. These operations are wrapped in the taskjob() function and that is contained in the repstrapfunctionslib.php file. If more automation steps are needed then they need to be added here, but to address details about the process then restrapfunctionslib.php functions need to be modified. 

taskjob - json file that tracks individual commands that runner.php writes to.
taskjob3 - json file that tracks a list of commands within an uploaded file (transferlist) that runner.php writes to.

stoprun.php - This script kills the forked schedular process.

So if you need to adjust sockets you need to adjust both of imageviewer.process.inc.php and cli.interface.php and if you want to address the schedular in adjusting automation tasks then the runner.php script needs to be modified. The imageviewer.process.inc.php and cli.interface.php  scripts essentially compile variables from the user which are then sent to sockets; however there is also underlying code that these scripts call that collect these variables first and which operate the socket clients and this is in repstrapfunctionslib.php.

repstrapfunctionslib.php - Most of the details for handling sockets sending specific detailed commands to the various controllers that are being served by these sockets exist here. The functions are listed here:


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   openerrorjson - opens taskjoberror json file this opens errors that may get generated during strobchecks<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   closeerrorjson - closes taskjoberror<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   taskerrorjob - pushes failed transferlist data to taskjoberror if stroboscope check fails<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   opentrackjson - open taskjobtracker json file, this tracks the steps completed in schedular<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   closetrackjson - closes taskjobtracker<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   tasktrackjob - pushes completed steps into taskjobtracker<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   parsergcode - opens and read the gcode lines for transferlist and puts it onto taskjob3 json file<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   imagingcoordfindshim - image processing feature that finds fiducials for calibrating positioning called by caller.alignment.gcode.php and alignment.gcode.php. This is to find the first (top left most) fiducial.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   imagingcoordfind - image processing feature that finds fiducials for calibrating position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ing called by alignment.gcode.php, caller.alignment.gcode.php, views.php. This finds the rest of the fiducials.  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   openjson - opens imgdataset json file<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   closejson - closes imgdataset json file<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   setgearmanaspirate - parses the variables and passes it to gearmanaspirate<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanaspirate - aspiration schedular (displacment syringe pump)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   setgearmandispense - parses the variables and passes it to gearmandispense<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmandispense - dispense schedular (displacment syringe pump)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanbacktoz - there is a standard moving z height that you can set at views.php this is a schedular that goes back to this position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmangotowell - schedular going to specific source well position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanfire - schedular piezo firing event<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanstrobon - schedular turning on the stroboscope<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanstroboff - schedular turning off the stroboscope<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmansetdrops - schedular set drop number <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmansetvalve - schedular this sets teh 3 way valve position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanfillsyringe - schedular fill the syringe pump ... this was originally designed for a Cavro style syringe pump having  250ul syringe <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanquantifystrobimg - schedular quantify the stroboscope image<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanstrobsnap - schedular take a stroboscope photo<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanheadcamsnap - schedular take a photo using the head camera<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmangotodry - schedular go to dry position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmangotostrob - schedular go to stroboscope position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmandry - schedular go to dry position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmangotowash - schedular go to wash position<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmangotowaste - schedular go to waste<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanwash - schedular wash <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   taskjob - taskjob is the json file that is run by gearman system for individual commands taskjob3 is for transferlists<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   readgcodefile - parsers through the transferlist and selectively responds to correctly formatted commands and this allows you to annotate your gcode<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   laccheck - this is used to limit the linear actuator controller motion (only allows user to input within a predefined range)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   reportp1lacposition - reports the linear actuator controller position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   movep1lac - move the linear actuator to a specific position<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   reportpos - reports the position of the X-Y-Z motion controller (gcode command is M114) and is sent via php serial which is slow better to use sockets<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   connect - connects to the X-Y-Z motion controller via php serial also slow better to used sockets<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketreportposition - reports the position of X-Y-Z motion controller via socket connection (M114)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketsetposition - sets the position of X-Y-Z motion controller via socket connection (M92)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketendstopstatus - checks the status of the end stops via socket connection (M119)  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketversion - reports the X-Y-Z motion controller version<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketfan  - turns on fan  M106<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketclear - clears the X-Y-Z motion controller<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesockethoming - homes the X-Y-Z motion controller<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketopen - opens the X-Y-Z motion controller socket<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketreset - this is a basic socket client that is used to pass values to the X-Y-Z motion controller<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketcpureset - this is not used and needs to be deleted<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   addsubhys - if there is backlash this compensates for it recent motion systems have very little to none to use though<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   checksmoothiesocketmove - checks to see if the X-Y-Z motion controller is still moving mode<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketrelativemove - relative move (G91)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketmove - absolute move (G92)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesocketclient - just a general smoothie socket client<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   poscalc - this is used for finding features (imageviewer.process.inc.php)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   coordfunction - parses the xml formatted data generated by wellmap.py (this script probably needs to be modified to identify other fiducials)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   endstopstatus - checks the status of the end stops via ssh connection (M119)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   smoothiesetsteps - sets steps per mm via socket connection (G92)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   areportpos - reports position via python script (not used)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   pingsmoothie - checks to see if X-Y-Z controller is online this is a python script<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   trigger - turns on trigger via python script and ssh<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   disablesteppers - disable steppers via python script and ssh (not used)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   homephp - homes motors via python script and ssh (not used)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   pymove - G1 move via python script and ssh (not used)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   syringesocketclient - opens syringe socket client<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   powerrelaysocketclient - opens power relay socket client<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   waveformsocketclient - opens waveform socket client<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gearmanpressuresocketclient - opens gearman socket and pressure compensation vessel socket (will need to be modified)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   pressuresocketclient - opens pressure compensation vessel socket  (will need to be modified)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   logger - sends messages into the cli interface<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   parsersetoutput - this cleans the M114 returned message reformats into an associative array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   getgcoords - parses a standard G1 code command and puts the X-Y-Z coordinates into an associative array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   gcodecoordtrack - this keeps a current record of the gcode and is put in imgdataset<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ssh01caller - use to send ssh commands to a socket server (to start a socket)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ssh02caller - use to send ssh commands to a socket server (to start a socket)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ssh04caller - use to send ssh commands to a socket server (to start a socket)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ssh05caller - use to send ssh commands to a socket server (to start a socket)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ssh06caller - use to send ssh commands to a socket server (to start a socket)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   sshcontrolcaller - use to send ssh commands to a socket server (to start a socket)<br />


php_serial.class.php - this is from http://www.phpclasses.org/browse/file/17926.html

gearman.caller.image.proc.php - this is a seperate stroboscope droplet imageprocessing function that repstrapfunctionslib.php calls 

gearman.caller.image.proc.py - this is the actual python script that does the stroboscope image processing

gearmanstrobdataset - this is the json dataset that gearman.caller.image.proc.py writes to

gearmanstroblog - this stores a log of collected stroboscopic data which is important to compare sample to sample

gotostroboscope.php - this is called by views and manually moves the tip to go to the stroboscope

repstrapfunctionscaller.php - this is a commandline tool for checking to see if functions in repstrapfunctionslib.php are working ok

runner.py - this is a command line tool python script for starting mjpg_streamer, this one is for standard USB (UVC) webcam type cameras

shutdown.script.php - this shuts down the linux servers


<!--
embedcoordslist.php - this is used to find small wells in the sequenom plate and is called by views.php so this needs to be adjusted for finding other wells fiducials, there is also a poscalc function there so some redundancy with repstrapfunctionslib.php, this file calls imageprocessed.alignment.gcode.php and dataorganizer.py

imageprocessed.alignment.gcode.php - writes out the generated gcode from the imageprocessing routine 
-->

alignment.gcode.php - this generates a displays gcode to browser page based on image processing scheme for more info about this please see: <a href=http://www.htsresources.com/repstrapsoftware_manual/calibratingpositioning.php>http://www.htsresources.com/repstrapsoftware_manual/calibratingpositioning.php</a>, this is a called by views.php

caller.alignment.gcode.php - this generates a gcode  file based on image processing scheme for more info about this please see: <a href=http://www.htsresources.com/repstrapsoftware_manual/calibratingpositioning.php>http://www.htsresources.com/repstrapsoftware_manual/calibratingpositioning.php</a>, this is a called by views.php

img.processing.mod.inc.php - this is javascript that is a processingjs image processing script for adjusting the image processing functions, its like the embedded image porcessing gui


json.permish.sh - this sets the read/write privileges of the json data:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;imgdataset<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;loggerdataset<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;strobdataset<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;strobdatasetprocessing<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;taskjob<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;taskjob2<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;taskjob3<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;taskjoberror<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;taskjobtracker<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tasklogger<br />


my_script.js - this is a special javascript script written to track the schedular while its running

openpythonscript.php - this is called by views.php and is used with the python IDE so it opens saved python scripts

smoothie.gearman.client.list.php - this is the gearman client that runs the formatted taskjob json file this is called by runner.php

smoothie.gearman.worker.php - this is the gearman server that is the basis of the schedular and it is started by the startgearman.php script, stopped by stoprun.php and which is called by cli.interface.php

startgearman.php - this starts the gearman server and is called by cli.interface.php

stoprun.php - this stops the gearman server and is called by cli.interface.php

strob.img.inc.php - this is the stroboscope analysis interface that is called by views.php, there is a more current version to this and am working on integrating this 

stroboscopeonoff.php - this turns the stroboscope either on or off depending on whether what imgdataset status flag is indicating

stroboscope.php - this is the script that calls the python stroboscope image processing script (caller.image.proc.py) and then parses the json file that gets generated by caller.image.proc.py (strobdataset), this script only works in the manual mode

strobsettings.php - this is kind of similar to stroboscope.php but works with the gearman server (schedular) and instead of calling caller.image.proc.py it calls gearman.caller.image.proc.py

syringemove.php - this is the form that sends the syringe pump variables this was designed with a Tecan (Cavro) style syringe pump, it runs in a manual mode and calls runner.php scripti, this is called by views.php

washing.php - this is like syringemove.php, it is called by views.php and sets up the variables needed to execute the washing functions, it calls runner.php and also operates in a manual mode



