#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include <Wire.h>
#include <SoftwareSerial.h>

int enablePin = 7;
int directionPin = 12;
int elimitPin = A1; 
int estepsPin = 8;
int esteps = 1000;
int esteprate = 500;
int estepsincrement = 0;
int estepcount = 0;

int washpin = 10; 
int drypin = 9; 
int pcvpin = 6; 
int heatpin = 13; 
int turnon5vpin = 5;
int tempsensor = A0;
int washval = 255;
int dryval = 255;
int pcvval = 255;

String command;
int currpos;
int fillflag = 0;
int heatflag = 0;
int heatval = 255;



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(enablePin, OUTPUT);
  pinMode(directionPin, OUTPUT);
  pinMode(estepsPin, OUTPUT);
  currpos = 0;
  
}

void loop() {
  // put your main code here, to run repeatedly:

 if(Serial.available())
 {
    char c = Serial.read();
    if (c== '\n')
    {
      Serial.println("command sent");
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

int parseCommand(String com, int currpos)
{
  String part1;
  String part2;
  String part3;
  //"G1E10F200";
  part1 = com.substring(0,com.indexOf("e"));
  part2 = com.substring(com.indexOf("e")+1,com.indexOf("f"));
  part3 = com.substring(com.indexOf("f")+1);

  if(part1.equalsIgnoreCase("g1")){
    int pos = part2.toInt();
    int feed = part3.toInt();
    if (currpos < pos) {
      currpos = forwardmove(pos,feed,directionPin,estepsPin);
    } else if (currpos > pos){
      backwardmove((currpos-pos),feed,directionPin,estepsPin);
    }
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
  else if(com.equalsIgnoreCase("washon")){
    analogWrite(washpin, washval);
    delay(100);
  }  
  else if(com.equalsIgnoreCase("washoff")){
    analogWrite(washpin, 0);
    delay(100);
  }  
  else if(com.equalsIgnoreCase("dryon")){
    analogWrite(drypin, dryval);
    delay(100);
  }  
  else if(com.equalsIgnoreCase("dryoff")){
    analogWrite(drypin, 0);
    delay(100);
  } 
  else if(com.equalsIgnoreCase("info")){
    Serial.println("wash_dry_pcv_electrocaloric_kill_stepper_valve");
  }
  else if(com.equalsIgnoreCase("turnon5v")){
    analogWrite(turnon5vpin, 255);
  } 
  else if(com.equalsIgnoreCase("turnoff5v")){
    analogWrite(turnon5vpin, 0);
  }
  else if(com.equalsIgnoreCase("manpcv")){
    fillflag = 1;
  }
  else if(com.equalsIgnoreCase("feedbackpcv")){
    fillflag = 0;
  }  
  else if(com.equalsIgnoreCase("pcvon")){
    if (fillflag == 1){
     analogWrite(pcvpin, pcvval);
    }
  }  
  else if(com.equalsIgnoreCase("pcvoff")){
    if (fillflag == 1){
     analogWrite(pcvpin, 0);
    }
  else if(com.equalsIgnoreCase("manheat")){
     heatflag = 1;
  }
  else if(com.equalsIgnoreCase("feedbackheat")){
     heatflag = 0;
  }
  else if(com.equalsIgnoreCase("heaton")){
    if (heatflag == 1){
     analogWrite(heatpin, heatval);
    }
  }
  else if(com.equalsIgnoreCase("heatoff")){
    if (heatflag == 1){
     analogWrite(heatpin, 0);
    }
  }
  else if((com.substring(com.indexOf("setdryval")+1).toInt())>0){
    dryval = com.substring(com.indexOf("setdryval")+1).toInt();
  }
  else if((com.substring(com.indexOf("setwashval")+1).toInt())>0){
    washval = com.substring(com.indexOf("setwashval")+1).toInt();
  }
  else if((com.substring(com.indexOf("setpcvval")+1).toInt())>0){
    pcvval = com.substring(com.indexOf("setpcvval")+1).toInt();
  }
  else if((com.substring(com.indexOf("setheatval")+1).toInt())>0){
    heatval = com.substring(com.indexOf("setheatval")+1).toInt();
  }
  else if((com.substring(com.indexOf("valveservo")+1).toInt())>0){
    Serial.println(com.substring(com.indexOf("valveservo")+1).toInt());
    myservo.write(com.substring(com.indexOf("valveservo")+1).toInt());
  }
  else if(com.equalsIgnoreCase("readtemp")){
      Serial.println(analogRead(tempsensor));
  }
  else {
   Serial.print("Did not recognize ");
   Serial.println(com);
  }
}
   return currpos;
}



int forwardmove(int inc, int feed,int directionPin,int stepsPin){
  float stepspermm = 2267.72;
  digitalWrite(directionPin,HIGH); // Set Dir high
  steprate = (1/stepspermm * 1/feed) * 100000000;
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      delayMicroseconds(steprate); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
   return inc;
}
int backwardmove(int inc, int feed,int directionPin, int stepsPin){
  float stepspermm = 2267.72;
  steprate = (1/stepspermm * 1/feed) * 100000000;

  
  digitalWrite(directionPin,LOW); // Set Dir high
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      delayMicroseconds(steprate); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
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
