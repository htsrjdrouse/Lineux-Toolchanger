
<font face=arial>
-----------HTSR Command Reference-------------<br>
Outline of how the code is set up:
<ul>
<a href=/documentation/automation_modes.png style="color: #00FF00" target="_new">Automation modes layout</a><br>
<a href=/documentation/imageprocessing.jpg style="color: #00FF00" target="_new">Image processing layout</a><br>
<a href=/documentation/socket_setup.jpg style="color: #00FF00" target="_new">Socket layout</a><br>
</ul>
------------SOCKET CODE--------------------<br>
Links to socket source code and firmware:
<ul>
<a href=/documentation/devicesocket/ style="color: #00FF00" target="_new">Devices socket (WASH, DRY, PRESSURE, FAN, HEADCAM LED, HEATER, LINEAR ACTUATOR)</a>
<a href=/documentation/smoothiesocket/ style="color: #00FF00" target="_new">Smoothieware socket</a><br>
<a href=/documentation/powerrelaysocket/ style="color: #00FF00" target="_new">Power relay socket</a><br>
<a href=/documentation/gearmansocket/ style="color: #00FF00" target="_new">Gearman socket</a><br>
<a href=/documentation/syringepumpsocket/ style="color: #00FF00" target="_new">Syringe pump socket</a><br>
<a href=/documentation/functiongeneratorsocket/ style="color: #00FF00" target="_new">Function generator socket</a><br>
</ul>

This is a brief reference listing the commands and how they are used<ul>

trackon (time): Turns on system monitoring and sets refresh time <br>
trackoff: Turns off system monitoring <br>
cp jsondata <br>
external url: ip address for external network (WAN)<br>
external network: operates in wide area network (WAN)<br>
internal network: operates in local area network (LAN)<br>
remove (folder): remove folder<br>
saveimgpath (folder): select folder for saving files, if webroot then "/"<br>
list folders: list folders<br>
mkdir (folder name): create a directory to save files<br>
clear: clear data<br>
</ul>
-----------SERVERS-------------<br>
This instrument runs using a cluster of linux servers. <ul>
servers: lists servers and indicates status and their sockets and cameras<br>
shutdown: safely shutdown computers<br>
restart smoothie: restarts smoothie computer which is a way to do a reset, but you need to turn off power as well<br>
shutdown smoothie<br>
restart wavepi<br>
shutdown wavepi<br>
restart webheadcampi<br>
shutdown webheadcampi<br>
restart piezostrobpi<br>
shutdown piezostrobpi<br>
restart wavepi<br>
shutdown wavepi<br>
</ul>

-----------SOCKETS------------<br>
The sockets establish and maintain connections to serial ports that control devices<ul>
smoothiesocket stop: stops the smoothie positioning socket (192.168.1.87)<br>
smoothiesocket start: starts the smoothie positioning socket (192.168.1.87)<br>
gearman stop: stops the job schedular socket (192.168.1.72)<br>
gearman start: starts the job schedular socket (192.168.1.72)<br>
PRsocket stop: stops the power relay and linear actuator socket server (192.168.1.72)<br>
PRsocket start: starts the power relay and linear actuator socket server (192.168.1.72)<br>
pressuresocket stop: stops the wash/dry, headcamled, piezo trigger socket server (192.168.1.71)<br>
pressuresocket start: starts the pressure, wash/dry, headcamled, piezo trigger socket server (192.168.1.71)<br>
wavesocket stop: stops the waveform generator socket server (192.168.1.67)<br>
wavesocket start: starts the waveform generator socket server (192.168.1.67)<br>
</ul>
-----------CLI COMMANDS------------<ul>
<pre><font face=arial>
M114: reports position
M119: gets the endstop status
M92: sets the steps per mm
G1[XYZF]: positions the system
gearmangotostrob: positions to strob position by calling a gearman function
gearmangotodry: goes to dry position, calls a gearman function
gearmangotowash: goes to washing position, calls a gearman function
gearmanwash: washes tip, calls a gearman function
gearmanwashdry: washes and dries tip, calls a gearman function
gearmandry: dries tip, calls a gearman function
gearmangotostrob: goes to strob position, calls a gearman function
gearmandefaultz: goes to the default z position, calls a gearman function
gearmangotowell [number]: goes to a defined well position, calls a gearman function
homex: homes the x axis
homey: homes the y axis
homez: homes the z axis
smoothie version: pings the smoothiesocket socket to make sure its alive 
moveright (number): relative move mm to right
moveleft (number): relative move mm to left
moveforward (number): relative move mm forward
movebackward (number): relative move mm backward
trigger on or MH3: starts the 5V trigger (192.168.1.87)
trigger off or MH4: stops the 5V trigger (192.168.1.87)
set ztravel (number): sets the z bed height
get ztravel: gets the z bed height
setspeed (number): set speed
</pre>
</ul>
-----------GEARMAN FUNCTIONS------------<br>
This reference is useful when compiling gcode files. These functions are collected in taskjob JSON file and run by spawning a separate process which is tracked by javascript, myscript.js. Gearman functions can also be called through the CLI interface and these are described in that section.<br>
The script that spawns the process is runner.php, this organizes the commands that gets compiled to taskjob json file.<br>
The gearman socket server script, smoothie.gearman.worker.php, contains the list of functions that call more details functions in repstrapfunctionslib.php<br>
In repstrapfunctionslib.php, readgcodefile function checks the commands to make sure they are properly formed before adding to taskjob json file. This function is called by runner.php when checking the gcode file. If more functions added then readgcodefile will need to be adapted.<br>
<ul>
<pre><font face=arial>
forward: relative move forward - extent is a json variable (smoothie)
backward: relative move backward - extent is a json variable (smoothie)
left: relative move left - extent is a json variable (smoothie)
right: relative move right - extent is a json variable (smoothie)
up: relative move up - extent is a json variable (smoothie)
down: relative move down - extent is a json variable (smoothie)
move [position]: moves to a specific XYZ gcode position (smoothie)
position: reports the position (smoothie)
P1move: moves linear actuator 1 to a specific position (pololu)
P1position: reports the linear actuator position (pololu)
delay: create a delay
wash: wash to the tips (goes to wash position, turns on pumps then goes to default z position
gotowash: goes to wash position z bed moves but not linear actuator
dry: dries the tips (goes to the dry position then goes to default z position)
gotodry: goes to dry position z bed moves but not linear actuator
headcamsnap: takes image of headcam the file name is saved in saveimgpath defined folder as the coordinate XYZ position
strobcamsnap: takes image of strobcam the file name is saved in saveimgpath defined folder as the coordinate XYZ position
fire: this initiates the piezo dispensing
setdrops [number]: sets the number of drops to piezo dispense NOTE: needs to be added runner.php 
aspirate [volume_flowrate]: aspirates using syringe pump, the volume and flowrate are _ delimited
dispense [volume_flowrate]: dispenses using syringe pump, the volume and flowrate are _ delimited
gotostrob: goes to stroboscope position
stroboscope on: turns stroboscope on (this is a gearman function) 
stroboscope off: turns stroboscope off (this is a gearman function) 
gotowell [well]: goes to well position
backtoz: this goes back to your defined z position which is P1move 0500 and 70
</ul>
</font></pre>
-----------WASH, DRY, PRESSURE, FAN, HEADCAM LED, HEATER, LINEAR ACTUATOR SOCKET ------------<ul>
<pre><font face=arial>
fan on or MH1: starts the fan (192.168.1.71)
fan off or MH2: starts the fan (192.168.1.71)
pressure (number): sets the liquid level and reports current level 
P1move (position): moves the tip 1 linear actuator to defined position 
P1motor stop: turns off tip 1 linear actuator motor 
P1reportposition: reports the position of tip 1 linear actuator 
headcamled (0-255: starts the headcam led (192.168.1.67)
wash on: turns on the wash pump 
wash off: turns off the wash pump 
dry on: turns on the dry pump 
dry off: turns off the dry pump 
</font></pre>
</ul>
-----------WAVE GENERATOR SOCKET ------------<ul>
<pre><font face=arial>
wavesocket report: reports the waveform generator socket server settings (192.168.1.67)
setvolt (50-150): sets the output waveform voltage (192.168.1.67)
setpulse (50-150): sets the output waveform pulse width in microseconds (192.168.1.67)
setfrequency (20-1000): sets the output waveform frequency in hertz (192.168.1.67)
FIRE: piezo nozzle dispenses (192.168.1.67)
settrigger on: dispenses upon sensing a 5V signal (192.168.1.67)
settrigger off: does not dispense upon sensing a 5V signal (192.168.1.67)
</font></pre>
</ul>
-----------POWER RELAY SOCKET ------------<ul>
<pre><font face=arial>
poweron: connects the power 
poweroff: disconnects the power 
</font></pre>
</ul>
-----------SYRINGE PUMP SOCKET ------------<ul>
<pre><font face=arial>
flushsyringe (cycles): fills and dispenses syringe volume (250ul)
dispense (volume) (flowrate): dispenses set volume (ul) and flow rate (ul/s)
aspirate (volume) (flowrate): aspirates set volume (ul) and flow rate (ul/s)
syringewash (wash time): this flushes the line during the wash cycle
syringepump stop 
set valve bypass position 
set valve output position 
set valve input position 
syringe initialize 
</font></pre>
</ul>
-----------CAMERAS------------<ul>
<pre><font face=arial>
strobcam snap: takes a picture and the file is saved based on the timestamp,voltage and pulse width as a jpg (192.168.1.67)
strobcam start: starts the stroboscope (192.168.1.67)
strobcam stop: starts the stroboscope (192.168.1.67)
headcam snap: takes a picture and the file is saved based on the x-y-z position as a jpg (192.168.1.68)
headcam start: starts the headcam (192.168.1.68)
headcam stop: stop the headcam (192.168.1.68)
</font></pre>
</ul>
</font>
