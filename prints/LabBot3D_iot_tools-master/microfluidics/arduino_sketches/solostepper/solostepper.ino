#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include <Wire.h>
#include <SoftwareSerial.h>

int enablePin = 5;
int directionPin = 4;
int elimitPin = A1; 
int estepsPin = 3;
int esteps = 1000;
int esteprate = 500;
int estepsincrement = 0;
int estepcount = 0;



String command;
float currpos;




void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(enablePin, OUTPUT);
  pinMode(directionPin, OUTPUT);
  pinMode(estepsPin, OUTPUT);
  digitalWrite(enablePin,LOW);
  currpos = 0;
  
}

void loop() {
  // put your main code here, to run repeatedly:

 if(Serial.available())
 {
    char c = Serial.read();
    if (c== '\n')
    {
      currpos = parseCommand(command, currpos);
      command = "";
    }
    else 
    {
      command +=c;
    }
 }
 delay(30);
}

float parseCommand(String com, int currpos)
{
  Serial.print("Your command: ");
  Serial.println(com);
  String part1;
  String part2;
  String part3;
  //"G1E10F200";
  part1 = com.substring(0,com.indexOf("e"));
  part2 = com.substring(com.indexOf("e")+1,com.indexOf("f"));
  part3 = com.substring(com.indexOf("f")+1);
  Serial.print("your current position ");
  Serial.println(currpos);

  if(part1.equalsIgnoreCase("g1")){
    float pos = part2.toInt();
    int feed = part3.toInt();
    float calcpos = pos - currpos;
    if (calcpos > 0) {
      currpos = forwardmove(pos-currpos,feed,directionPin,estepsPin);
      Serial.print("moved forward ");
      Serial.print(currpos);
      Serial.println(" steps");
    } else if (calcpos < 0){
      currpos = backwardmove((currpos-pos),feed,directionPin,estepsPin);
      Serial.print("moved backward ");
      Serial.print(currpos);
      Serial.println(" steps");
    }
      Serial.print("directionPin val ");
      Serial.println(digitalRead(directionPin));
      currpos = pos;
  }
  else if(com.equalsIgnoreCase("m114")){
   Serial.print("Position: ");
   Serial.println(currpos);
  }
  else if(com.equalsIgnoreCase("g92e0")){
   currpos = 0;
  }  
  else if(com.equalsIgnoreCase("g28e0")){
   currpos = 0;
   currpos = homing(estepsPin,directionPin,elimitPin);
  }  
  else if(com.equalsIgnoreCase("info")){
    Serial.println("solostepper");
  }
  else {
   Serial.print("Did not recognize ");
   Serial.println(com);
  }
   return currpos;
}


float forwardmove(int inc, int feed,int directionPin, int stepsPin){
  Serial.println("forwardmove function called");
  float stepspermm = 2267.72;
  digitalWrite(directionPin,HIGH); // Set Dir high
  int steprate = ((1/stepspermm * 1/feed) * 100000000);
  Serial.print("Calculated steprate: ");
  Serial.println(steprate);
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      delayMicroseconds(steprate); // Wait 1/2 a ms
      //delayMicroseconds(500); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      //delayMicroseconds(500); // Wait 1/2 a ms
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
   return inc;
}
float backwardmove(int inc, int feed,int directionPin, int stepsPin){
  Serial.println("backwardmove function called");
  float stepspermm = 2267.72;
  int steprate = ((1/stepspermm * 1/feed) * 100000000);  
  Serial.print("Calculated steprate: ");
  Serial.println(steprate);
  digitalWrite(directionPin,LOW); // Set Dir high
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      //delayMicroseconds(200); // Wait 1/2 a ms
      delayMicroseconds(steprate); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      //delayMicroseconds(steprate); // Wait 1/2 a ms
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
   return inc;
}

int homing(int stepsPin, int directionPin, int limitPin){
  digitalWrite(directionPin,LOW); // Set Dir high
  int checker = 1;
  int cnter = 0;
  int stpper = 1;
   while(stpper > 0){
    checker = digitalRead(limitPin);
    if (checker == 0){
      cnter = cnter + 1;
    }
    else {
      cnter = 0;
    }
    if (cnter > 4){
      stpper = 0;
    }
    digitalWrite(stepsPin,HIGH); // Output high
    delayMicroseconds(200); // Wait 1/2 a ms
    digitalWrite(stepsPin,LOW); // Output low
    delayMicroseconds(200); // Wait 1/2 a ms
   }
   digitalWrite(directionPin,HIGH); // Set Dir high
   for(int x = 0; x < 600; x++){ // Loop 200 times
    digitalWrite(stepsPin,HIGH); // Output high
    delayMicroseconds(1000); // Wait 1/2 a ms
    digitalWrite(stepsPin,LOW); // Output low
    delayMicroseconds(1000); // Wait 1/2 a ms
   }
    int stepcount = 0;
    return stepcount;
}
