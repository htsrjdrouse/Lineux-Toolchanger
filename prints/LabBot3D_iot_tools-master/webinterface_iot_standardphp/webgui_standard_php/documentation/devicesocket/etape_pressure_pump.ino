

#include <SoftwareSerial.h>
int myTarget = 0; // target position, 0-4095 is the range of the JRK21V3 controller. 
//stuff used for input from pc
char buffer[5] ;
int pointer = 0;
byte inByte = 0;


#define SENSORPIN A0
#define SERIESRESISTOR 1000
int presspin = 3;

int level; 
float reading;
float normreading;
float convertreading;

int flag;


void setup()
{
  Serial.begin(9600);
  Serial.flush();// Give reader a chance to see the output.
  int myTarget = 0; //the health level at any point in time

    
  level = 3000;  

  pinMode(presspin, OUTPUT);
  //pinMode(fanpin,OUTPUT);
  digitalWrite(presspin, LOW);
  flag = 0;
}

void loop()
{
  reading = analogRead(SENSORPIN);
  normreading = (1023 / reading)  - 1;
  convertreading = SERIESRESISTOR / normreading;  
 
   if (convertreading > (level)){
         flag = 1;
   }
   if ((convertreading) < level-50){
         flag = 0;
   }
   
   if (flag == 1){
    digitalWrite(presspin, HIGH);
   }
   else {
     digitalWrite(presspin, LOW);
   }
 
  if (Serial.available() >0) {
   // read the incoming byte:   
   inByte = Serial.read();
   delay(10);
   // If the marker's found, next 4 characters are the position
   if (inByte == '#') {
     while (pointer < 4) { // accumulate 4 chars
        buffer[pointer] = Serial.read(); // store in the buffer
        pointer++; // move the pointer forward by 1
      }
      Serial.flush();
      //translating into an int
      myTarget=(buffer[0]-48)*1000+(buffer[1]-48)*100+(buffer[2]-48)*10+(buffer[3]-48);
      pointer =0;
   }

   if (myTarget == 4000){
     Serial.println(convertreading); 
   }
   else if (myTarget == 5008){
     digitalWrite(presspin,HIGH);
   } 
   else if (myTarget == 5009){
     digitalWrite(presspin,LOW);
   } 
   else if (myTarget > 6499){
    level = myTarget - 6499;
    Serial.println(level);
   }   
  } 
}
