import serial
import sys
import json



def fan(dir,ser):
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write(dir+'\r\n')
	a = ser.readline()
	ser.write('M114\r\n')
	pos = ser.readline()
	dat['smoothiemessage'] = dir
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()
	return dat




def home(dir,ser):
	dir = 'G28'+dir+'0';
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write(dir+'\r\n')
	a = ser.readline()
	ser.write('M400\r\n')
	a = ser.readline()
	ser.write('M114\r\n')
	pos = ser.readline()
	dat['smoothiemessage'] = dir
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()
	return dat


def getposition(ser):
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write('M114\r\n')
	pos = ser.readline()
	dat['smoothiemessage'] = pos
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()
	return pos


def pingsmoothie(ser):
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write('version\r\n')
	pos = ser.readline()
	dat['smoothiemessage'] = pos
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()
	return pos



def setpositions(setcmd,ser):
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write(setcmd+'\r\n')
	pos = ser.readline()
	dat['M92'] = pos
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()


def setsteps(stpcmd,ser):
	ser.write(stpcmd+'\r\n')
	a = ser.readline()


def move(pos,ser):
        f = open('imgdataset')
        dat = json.load(f)
        f.close()
	ser.write(pos+'\r\n')
	a = ser.readline()
	ser.write('M400\r\n')
	a = ser.readline()
	ser.write('M114\r\n')
	pos = ser.readline()
	dat['smoothiemessage'] = pos
	f = open('imgdataset', 'w')
	f.write(json.dumps(dat))
	f.close()
	return dat


port = 'ttyACM1'

ser = serial.Serial('/dev/'+port,115200)
a= ser.readline()
a = ser.readline()

pos = sys.argv[1]
typ = sys.argv[2]

if typ == '1':
	move(pos,ser)
if typ == '2':
	setpositions(pos,ser)
if typ == '3':
	setsteps(pos,ser)
if typ == '4':
	pingsmoothie(ser)
if typ == '5':
	getposition(ser)
if typ == '6':
	home(pos,ser)
if typ == '7':
	fan(pos,ser)



ser.close()



