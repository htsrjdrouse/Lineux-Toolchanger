#include <SoftwareSerial.h>
int myTarget = 0; // target position, 0-4095 is the range of the JRK21V3 controller. 
//stuff used for input from pc
char buffer[5] ;
int pointer = 0;
byte inByte = 0;

//for SEEED studio relay Digital 7 --> COM1 , Digital 6 --> COM2 , Digital 5 --> COM3 , Digital 4 --> COM4.
int com1 = 7; //motion system
int com2 = 6; //pressure system
int com3 = 5; //linear actuator system
int com4 = 4; //linear actuator system
int trig = 8; //going to use this as the strob trigger


void setup()
{
  Serial.begin(9600);
  Serial.flush();// Give reader a chance to see the output.
  Serial.println("Power relay Initialized");  
  Serial.println("Smoothie power on: #5002");
  Serial.println("Smoothie power off: #5003");
  Serial.println("Power on pressure system: #5004");
  Serial.println("Power off pressure system: #5005");
  Serial.println("Linear actuator power on: #5006");
  Serial.println("Linear actuator power off: #5007");
  Serial.println("Trigger on: #5010");
  Serial.println("Trigger off: #5011");

  pinMode(com1, OUTPUT);
  pinMode(com2, OUTPUT);  
  pinMode(com3, OUTPUT);
  pinMode(com4, OUTPUT);
  pinMode(trig, OUTPUT);

  
  digitalWrite(com1,LOW); 
  digitalWrite(com2,LOW);
  digitalWrite(com3,LOW); 
  digitalWrite(com4,LOW);
  digitalWrite(trig,LOW);
  
}


void loop()
{
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
   
   //makes sure the target is within the bounds


   if (myTarget == 5002){
     digitalWrite(com1,HIGH);
     Serial.println("5002 called");
   }
   else if (myTarget == 5003){
     digitalWrite(com1,LOW);
   }
   else if (myTarget == 5004){
     digitalWrite(com2,HIGH);
   }
   else if (myTarget == 5005){
     digitalWrite(com2,LOW);
   }
   else if (myTarget == 5006){
     digitalWrite(com3,HIGH);
   }
   else if (myTarget == 5007){
     digitalWrite(com3,LOW);
   }
   else if (myTarget == 5008){
     digitalWrite(com4,HIGH);
   }
   else if (myTarget == 5009){
     digitalWrite(com4,LOW);
   }
   else if (myTarget == 5010){
     digitalWrite(trig,HIGH);
   }
   else if (myTarget == 5011){
     digitalWrite(trig,LOW);
   }


  } 
}
