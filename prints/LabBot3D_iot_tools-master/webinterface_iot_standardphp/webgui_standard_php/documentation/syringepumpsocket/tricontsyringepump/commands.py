import serial
import time, sys,re

cmd = sys.argv[1]

ser = serial.Serial('/dev/ttyUSB0',9600)

time.sleep(4)
# ------------Initialization------------
#dead volume command
#During initializaions, plunger moves upward until it contacts top of the syringe, causing forced stall initialization. Plunger then moves downward 120 full steps then upward 120 minus the <n> specified amount leaving a gap (dead volume, between syringe seal and top of plunger. Small gap designed so that seal does not hit top of the plunger each time syringe moves to home or zero position
#recommend 10 steps or 12 nanoliters
#ser.write('/1k10ZR\r')
if re.match('^I', cmd):
	ser.write('/1k10ZR\r')

# ------------Set valve input position------------
if re.match('^VI', cmd):
	ser.write('/1IR\r')

# ------------Set valve output position------------
if re.match('^VO', cmd):
	ser.write('/1OR\r')

# ------------Set valve bypass position------------
if re.match('^VB', cmd):
	ser.write('/1BR\r')

# ------------Terminate ------------
if re.match('^T', cmd):
	ser.write('/1TR\r')




# ------------Fill line loop -------------------
# Use this to fill the line WITH THE TIP OFF
# not finished ...
if re.match('^F', cmd):
	fl = re.match('^F(.*)$', cmd)
	cmd = '/1A10gIA3000OD3000G'+fl.group(1)+'R\r'
	print cmd
	ser.write('/1A10gIA3000OD3000G'+fl.group(1)+'R\r')




# ------------Set velocity and acceleration------------
#Velocity and acceleration
#[v] Set start velocity, velocity when plunger begins movement should always be less then top velocity so default is 900 or 0.643 of top velocity
#[V]  Default power up velocity is 1400steps/second or 116.7ul/second
#Velocity also can be set using predefined speed codes. Which are commonly uused velocities provided for convenience of the user and do not cover the full range of potential speeds plunger can travel
#<n>  0...40
#Default speed at power up is: 11 = 1400
#[c] Cutoff velocity in Hz - is the velocity that plunger ends its movement. Default is 900 at power up and this command [c] overwrites the [C] command its like the start velocity ... 0.643
#[C] Cutoff velocity in steps, during last phase of plunger move speed ramps down toward cutoff velocity when specified, plunger stops at <n> steps before reaching cutoff velocity, default is 0. 

#SO ASPIRATION with tip
#max velocity - 1ul/second or 12, start up is 12 * 0.643, stop is 12 * 0.643

