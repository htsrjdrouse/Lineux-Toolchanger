/*
* Motor control setup for pololu jrk21v3 with Arduino UNO R3, verified using linear actualtor LACT2P
*
* Pololu jrk config utility in Serial mode using UART detect baud rate interface. 
* starting with the default configuration settings for LACT2P linear actuators provided on the pololu website
*
* pin 8 connected to jrk pin Rx
* jrk grnd connected to arduino ground
*/


#include <SoftwareSerial.h>
SoftwareSerial mySerial(4,3); // RX, TX, plug your control line to the RX pin on the JRK21v3
int myTarget = 0; // target position, 0-4095 is the range of the JRK21V3 controller. 
//stuff used for input from pc
char buffer[5] ;
int pointer = 0;
byte inByte = 0;


//int relaya = 11;
//int relayb = 12;
int washpin = 7;
int drypin = 8;
//int fanpin = 5;
int ledpin = 10;
//int trigger = 2;


// announcer for PC Serial output
void announcePos(int (position)) {
  Serial.print("position set to ");
  Serial.println(position);
  Serial.flush();
} 

//sets the new target for the JRK21V3 controller, this uses pololu high resulution protocal
void Move(int x) {
  word target = x;  //only pass this ints, i tried doing math in this and the remainder error screwed something up
  mySerial.write(0xAA); //tells the controller we're starting to send it commands
  mySerial.write(0xB);   //This is the pololu device # you're connected too that is found in the config utility(converted to hex). I'm using #11 in this example
  mySerial.write(0x40 + (target & 0x1F)); //first half of the target, see the pololu jrk manual for more specifics
  mySerial.write((target >> 5) & 0x7F);   //second half of the target, " " " 
}  

void Position(){
  char response[2];
  mySerial.flush();
  mySerial.write(0xA7);
  mySerial.readBytes(response,2);
  Serial.println(word(response[1],response[0]));  
}

 
void MotorOff(){
  char response[2];
  mySerial.flush();
  mySerial.write(0xFF);
}

void setup()
{
  mySerial.begin(9600);
  mySerial.flush();
  Serial.begin(9600);
  Serial.flush();// Give reader a chance to see the output.
  Serial.println("Power relay Initialized");
  int myTarget = 0; //the health level at any point in time
  Serial.println("Report linear actuator position: #5000");
  Serial.println("Go to linear actuator position range: #0500 to #3500");  
  Serial.println("Motor off: #5001");    
  Serial.println("Turn wash on: #5004");
  Serial.println("Turn wash off: #5005");
  Serial.println("Turn dry on: #5006");
  Serial.println("Turn dry off: #5007");
  Serial.println("Turn on led: (#6000-#6255)");
  
  pinMode(washpin, OUTPUT);
  pinMode(drypin, OUTPUT);
  //pinMode(fanpin,OUTPUT);
  pinMode(ledpin,OUTPUT);
  digitalWrite(washpin, LOW);
  digitalWrite(drypin, LOW);
  analogWrite(ledpin, 0);

  MotorOff();

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

   if (myTarget < 500){
      myTarget = 500;
   }
   
   if (myTarget == 5000){
    Position();
   }   
   else if (myTarget == 5001){
    MotorOff();
   }

   else if (myTarget == 5004){
     digitalWrite(washpin,HIGH);
   }   
   else if (myTarget == 5005){
     digitalWrite(washpin,LOW);
   } 
   else if (myTarget == 5006){
     digitalWrite(drypin,HIGH);
   }   
   else if (myTarget == 5007){
     digitalWrite(drypin,LOW);
   } 

   else if ((myTarget > 5999) and (myTarget < 6499)){
    analogWrite(ledpin,(myTarget-6000)); 
   }     
   else  {
     Move(myTarget);  
   }  
  } 
}
