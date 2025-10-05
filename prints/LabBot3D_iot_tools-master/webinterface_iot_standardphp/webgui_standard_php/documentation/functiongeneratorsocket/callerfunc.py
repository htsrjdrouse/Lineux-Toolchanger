import serial



def eightbitconv(val):
	mult = val / 254
	subt = val - (mult*254)
	return [mult,subt]



def check(number):
    if number%2==0:
        num = number
    else:
	num = number + 1
    return num


def voltval(volt):
        look = {}
        volt = check(volt)
        look = {'4':25,'54':101,'56':103,'58 ':105,'60 ':107,'62 ':109,'64 ':111,'66 ':113,'68 ':115,'70 ':117,'72':119,'74':121,'76':123,'78':125,'80':128,'82':131,'84':133,'86':135,'88':137,'90':139,'92':141,'94':143,'96':145,'98':147,'100':149,'102':151,'104':153,'106':155,'108':158,'110':161,'112':163,'114':165,'116':167,'118':169,'120':171}
        ampraw = look[str(volt)]
        return ampraw



def connect():
	ser = serial.Serial('/dev/ttyACM0', 9600)
	return ser

def disconnect(ser):
	ser.close()

'''
def trigconnect():
	ser = serial.Serial('/dev/tty.usbmodem641', 9600)
	return ser

def trigon(ser,dey):
	ser.write(chr(25))
	ser.write(chr(dey))

def enablepin(ser):
	ser.write(chr(35))

def disablepin(ser):
	ser.write(chr(36))
'''

def settrigger(ser,trigval):
	ser.write(chr(29))
	ser.write(chr(trigval))
	ser.write(chr(0))

def fire(ser):
	ser.write(chr(31))
	ser.write(chr(0))
	ser.write(chr(0))


def setvolt(ser,ovolt):
	volt = voltval(ovolt)
	ser.write(chr(25))
	ser.write(chr(volt))
	ser.write(chr(0))

def setpulse(ser,pulse):
	ser.write(chr(26))
	ser.write(chr(pulse))
	ser.write(chr(0))

def setfreq(ser,freq):
	ser.write(chr(27))
	datr = eightbitconv(freq)
	ser.write(chr(datr[0]))
	ser.write(chr(datr[1]))

def setdrops(ser,drops):
	ser.write(chr(28))
	datr = eightbitconv(drops)
	ser.write(chr(datr[0]))
	ser.write(chr(datr[1]))

def setleddelay(ser,leddelay):
	ser.write(chr(30))
	datr = eightbitconv(leddelay)
	ser.write(chr(datr[0]))
	ser.write(chr(datr[1]))

def setledtime(ser,ledtime):
	ser.write(chr(30))
	datr = eightbitconv(ledtime)
	ser.write(chr(datr[0]))
	ser.write(chr(datr[1]))

def stroboscope(ser):
	ser.write(chr(33))
	ser.write(chr(0))
	ser.write(chr(0))

def report(ser):
	ser.write(chr(32))
	ser.write(chr(0))
	ser.write(chr(0))
	dat = ser.readline()
	return dat

def ledon(ser):
	ser.write(chr(45))
	ser.write(chr(0))
	ser.write(chr(0))

def ledoff(ser):
	ser.write(chr(46))
	ser.write(chr(0))
	ser.write(chr(0))

