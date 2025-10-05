/**************************************************************************/
/*!
    This example will generate a sine wave with the MCP4725 DAC.

    This is an example sketch for the Adafruit MCP4725 breakout board
    ----> http://www.adafruit.com/products/935
*/
/**************************************************************************/
#include <Wire.h>
#include <Adafruit_MCP4725.h>
#include <SoftwareSerial.h>
Adafruit_MCP4725 dac;

// Set this value to 9, 8, 7, 6 or 5 to adjust the resolution
#define DAC_RESOLUTION    (9)

/* Note: If flash space is tight a quarter sine wave is enough
   to generate full sine and cos waves, but some additional
   calculation will be required at each step after the first
   quarter wave.                                              */


String txtMsg = "";   
int startbyte;
int secondbyte;
int volt = 100;
int pulse = 50;
int freq = 10;
int drops = 100;
int trigger = 0;
int leddelay = 250;
int ledtime = 5;
int level;
const int numReadings = 10;
int readings[numReadings];      // the readings from the analog input
int index = 0;                  // the index of the current reading
int total = 0;                  // the running total
int average = 0;                // the average
int inputPin = A0;




PROGMEM uint16_t DacSquareVal[252] =
{
          0,    1,    2,    4,    6,    8,   10,   12,   15,   19,   22,
         26,   30,   35,   39,   44,   50,   55,   61,   68,   74,   81,
         88,   96,  103,  111,  120,  128,  137,  146,  156,  166,  176,
        186,  197,  208,  219,  230,  242,  254,  266,  279,  291,  304,
        318,  331,  345,  359,  374,  388,  403,  418,  433,  449,  465,
        481,  497,  514,  531,  548,  565,  582,  600,  618,  636,  654,
        673,  691,  710,  729,  749,  768,  788,  808,  828,  848,  869,
        889,  910,  931,  952,  974,  995, 1017, 1039, 1060, 1083, 1105,
       1127, 1150, 1172, 1195, 1218, 1241, 1264, 1288, 1311, 1334, 1358,
       1382, 1406, 1429, 1453, 1478, 1502, 1526, 1550, 1575, 1599, 1624,
       1648, 1673, 1698, 1723, 1747, 1772, 1797, 1822, 1847, 1872, 1897,
       1922, 1948, 1973, 1998, 2023, 2048, 2073, 2098, 2123, 2148, 2174,
       2199, 2224, 2249, 2274, 2299, 2324, 2349, 2373, 2398, 2423, 2448,
       2472, 2497, 2521, 2546, 2570, 2594, 2618, 2643, 2667, 2690, 2714,
       2738, 2762, 2785, 2808, 2832, 2855, 2878, 2901, 2924, 2946, 2969,
       2991, 3013, 3036, 3057, 3079, 3101, 3122, 3144, 3165, 3186, 3207,
       3227, 3248, 3268, 3288, 3308, 3328, 3347, 3367, 3386, 3405, 3423,
       3442, 3460, 3478, 3496, 3514, 3531, 3548, 3565, 3582, 3599, 3615,
       3631, 3647, 3663, 3678, 3693, 3708, 3722, 3737, 3751, 3765, 3778,
       3792, 3805, 3817, 3830, 3842, 3854, 3866, 3877, 3888, 3899, 3910,
       3920, 3930, 3940, 3950, 3959, 3968, 3976, 3985, 3993, 4000, 4008,
       4015, 4022, 4028, 4035, 4041, 4046, 4052, 4057, 4061, 4066, 4070,
       4074, 4077, 4081, 4084, 4086, 4088, 4090, 4092, 4094, 4095
};




void setup(void) {
  Serial.begin(9600);
  Serial.println("Waveform generator");

  // For Adafruit MCP4725A1 the address is 0x62 (default) or 0x63 (ADDR pin tied to VCC)
  // For MCP4725A0 the address is 0x60 or 0x61
  // For MCP4725A2 the address is 0x64 or 0x65
  dac.begin(0x62);
  dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
  for (int thisReading = 0; thisReading < numReadings; thisReading++)
    readings[thisReading] = 0;   

}

void loop(void) {
   //uint16_t i;
   //analogWrite(11,2);
   dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
   total= total - readings[index];  
  // read from the sensor:  
  readings[index] = analogRead(inputPin);  
    // add the reading to the total:
  total= total + readings[index];
   // advance to the next position in the array:  
  index = index + 1;  
    // if we're at the end of the array...
  if (index >= numReadings)              
    // ...wrap around to the beginning: 
    index = 0;     
    // calculate the average:
  average = total / numReadings;   
 
 
    //So you have to call spotting command then submitting a null command to trigger twice
    if (Serial.available() > 2) {
       // Read the first byte
       startbyte = Serial.read();
       // If it's really the startbyte (255) ...
       if (startbyte == 25){
          volt = Serial.read();
       }
       // If it's really the startbyte (255) ...
       if (startbyte == 26){
          pulse = Serial.read();
       }
       // If it's really the startbyte (255) ...
       if (startbyte == 27){
        int pre = Serial.read();
        int pfreq = Serial.read();
        int ppfreq = (pre*254);
        freq = ppfreq + pfreq;
       }
       if (startbyte == 28){
        int pre = Serial.read();
        int pfreq = Serial.read();
        int ppfreq = (pre*254);
        drops = ppfreq + pfreq;
       } 
       if (startbyte == 29){
          trigger = Serial.read();
       }
       if (startbyte == 30){
        int pre = Serial.read();
        int pfreq = Serial.read();
        int ppfreq = (pre*254);
        leddelay = ppfreq + pfreq;
       }
       if (startbyte == 36){
        int pre = Serial.read();
        int pfreq = Serial.read();
        int ppfreq = (pre*254);
        ledtime = ppfreq + pfreq;
       }
        
       // If it's really the startbyte (255) ...
       if (startbyte == 31){
        drivesquarewave(volt, pulse,freq,drops);
       }
       if (startbyte == 32){
        Serial.print("RefVolts ");
        Serial.print(volt); 
        Serial.print(" Pulse ");
        Serial.print(pulse); 
        Serial.print(" Freq ");
        Serial.print(freq);
        Serial.print(" Drop ");
        Serial.print(drops);
        Serial.print(" Trigger ");
        Serial.print(trigger);
        Serial.print(" leddelay ");
        Serial.print(leddelay);
        Serial.print(" ledtime ");
        Serial.print(ledtime);
        Serial.print(" inputpin ");
        Serial.println(average);
       }  
       if (startbyte == 33){
        stroboscope(volt, pulse,freq,drops,leddelay,ledtime);
       }
       if (startbyte == 34){
        digitalWrite(12,HIGH);
       }
       if (startbyte == 35){
        digitalWrite(12,LOW);
       }
       if (startbyte == 45){
        analogWrite(3,255);
       } 
       if (startbyte == 46){
        analogWrite(3,0);
       } 


  //To turn on with 5V trigger     
  if ((average > 850) and (trigger == 1)){
    drivesquarewave(volt,pulse,freq,drops);
  }




    }
  delay(1);
  
}

void drivesquarewave(int volt,int pulse,int freq,int drops){
   digitalWrite(12, HIGH);
   int i;
   for (i = 0; i < drops; i++){
   dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
   dac.setVoltage(pgm_read_word(&(DacSquareVal[volt])), false);
   delayMicroseconds(pulse);
   dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
   delay(freq);
   }
  digitalWrite(12, LOW);
}


void stroboscope(int volt,int pulse,int freq,int drops,int leddelay,int ledtime){
   int strobtimer = 1;
   int counter = 0;
   digitalWrite(12, HIGH);

   int i;
   //for (i = 0; i < drops; i++){
   while (strobtimer > 0){  
     
   dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
   dac.setVoltage(pgm_read_word(&(DacSquareVal[volt])), false);
   delayMicroseconds(pulse);
   dac.setVoltage(pgm_read_word(&(DacSquareVal[0])), false);
   delayMicroseconds(leddelay);
   analogWrite(3,255);
   delayMicroseconds(100);
   analogWrite(3,0);
   delay(freq);
   
   total= total - readings[index];   
   readings[index] = analogRead(inputPin);  
   total= total + readings[index]; 
   index = index + 1;  
   if (index >= numReadings)              
     index = 0;     
   average = total / numReadings; 
   if (average > 800)break;

   strobtimer++;
   }
   //}
   digitalWrite(12, LOW);

}











