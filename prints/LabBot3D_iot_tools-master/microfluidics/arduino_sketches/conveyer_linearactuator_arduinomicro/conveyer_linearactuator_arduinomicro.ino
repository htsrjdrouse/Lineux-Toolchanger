

  
#include <Servo.h>
Servo myservo;

//stuff used for input from pc
char buffer[5];
int pointer = 0;

byte inByte = 0;

int valveservo = 3;

int alimitPin = A0; 
int blimitPin = A1;
int climitPin = A2;
int dlimitPin = A3; 
int elimitPin = A4;

int enablePin = 12;
//int stepresPin = 12;
//int killPin = 5;

int directionPin = 13;


int astepsPin = 11;
int asteps = 1000;
int asteprate = 500;
int astepsincrement = 0;
int astepcount = 0;

int bstepsPin = 10;
int bsteps = 1000;
int bsteprate = 500;
int bstepsincrement = 0;
int bstepcount = 0;

int cstepsPin = 9;
int csteps = 1000;
int csteprate = 500;
int cstepsincrement = 0;
int cstepcount = 0;

int dstepsPin = 8;
int dsteps = 1000;
int dsteprate = 500;
int dstepsincrement = 0;
int dstepcount = 0;

int estepsPin = 7;
int esteps = 1000;
int esteprate = 500;
int estepsincrement = 0;
int estepcount = 0;

int solenoid1 = 6;
int solenoid2 = 5;
int solenoid3 = 4;
int solenoid4 = 2;




 

String settingsdata;

char str[4];
String cmd;
int i;

String firstValue;
int secondValue;

void setup()
{
  
  analogWrite(solenoid1,0);
  analogWrite(solenoid2,0);
  analogWrite(solenoid3,0);
  analogWrite(solenoid4,0);
   
  Serial.begin(9600);
  Serial.flush();// Give reader a chance to see the output.
  Serial.println("0");
  
  pinMode(enablePin, OUTPUT);  
  digitalWrite(enablePin,LOW);
  
  pinMode(alimitPin,INPUT);
  digitalWrite(alimitPin, HIGH);
  pinMode(blimitPin,INPUT);
  digitalWrite(blimitPin, HIGH);
  pinMode(climitPin,INPUT);
  digitalWrite(climitPin, HIGH);
  pinMode(dlimitPin,INPUT);
  digitalWrite(dlimitPin, HIGH);
  pinMode(elimitPin,INPUT);
  digitalWrite(elimitPin, HIGH);



  //pinMode(4, OUTPUT); //Direction
  //digitalWrite(4, HIGH);
  pinMode(directionPin, OUTPUT); //Direction
  digitalWrite(directionPin, LOW);
  pinMode(estepsPin, OUTPUT); //Steps
  digitalWrite(estepsPin, LOW); 

  pinMode(dstepsPin, OUTPUT); //Steps
  digitalWrite(dstepsPin, LOW);  

  pinMode(bstepsPin, OUTPUT); //Steps
  digitalWrite(bstepsPin, LOW); 

  pinMode(cstepsPin, OUTPUT); //Steps
  digitalWrite(cstepsPin, LOW); 

  pinMode(astepsPin, OUTPUT); //Steps
  digitalWrite(astepsPin, LOW); 

}



void loop()
{ 
  /*
  if (digitalRead(limitPin) == HIGH){
   digitalWrite(enablePin,HIGH);
  }
  else {
    digitalWrite(enablePin,LOW);
  }
  */
  if (Serial.available() >0) {
    cmd = Serial.readStringUntil('\n');
    int spaceIndex = cmd.indexOf(' ');
    if (spaceIndex > -1){
      int secondSpaceIndex = cmd.indexOf(' ', spaceIndex+1);
      int valflag = 1;
      firstValue = cmd.substring(0, spaceIndex);
      String preSecondValue = cmd.substring(spaceIndex+1, secondSpaceIndex);
      secondValue = preSecondValue.toInt();
    }
    else {
      int valflag = 0;
      secondValue = 0;
      firstValue = cmd;
    }

   delay(10);
   if (firstValue == "M"){
     String s = "A123\n";
     Serial.println("got it");
   }
   else if (firstValue == "info"){
    Serial.println("conveyer_linearactuator_arduinomicro shield");
  }
   /*
   else if ((firstValue == "killmotors")){
    analogWrite(killPin, 255);
    digitalWrite(enablePin,HIGH);
   }
   else if ((firstValue == "revivemotors")){
    analogWrite(killPin, 0);
    digitalWrite(enablePin,LOW);
   }
   */
  else if (firstValue == "valveservo"){
    myservo.attach(valveservo);  // attaches the servo on pin 9 to the servo object
    myservo.write(secondValue);
    delay(1);
    myservo.detach();
  }
   else if ((firstValue == "solenoid1on")){
    analogWrite(solenoid1, 255);
   }
   else if ((firstValue == "solenoid1off")){
    analogWrite(solenoid1, 0);
   }
   else if ((firstValue == "solenoid2on")){
    analogWrite(solenoid2, 255);
   }
   else if ((firstValue == "solenoid2off")){
    analogWrite(solenoid2, 0);
   }
   else if ((firstValue == "solenoid3on")){
    analogWrite(solenoid3, 255);
   }
   else if ((firstValue == "solenoid3off")){
    analogWrite(solenoid3, 0);
   }
   else if ((firstValue == "solenoid4on")){
    analogWrite(solenoid4, 255);
   }
   else if ((firstValue == "solenoid4off")){
    analogWrite(solenoid4, 0);
   }

   
   
   else if ((firstValue == "drate")){
    dsteprate = secondValue;
   }
   else if ((firstValue == "drate")){
    dsteprate = secondValue;
   }
   else if ((firstValue == "drate")){
    dsteprate = secondValue;
   }
      
   else if ((firstValue == "drate")){
    dsteprate = secondValue;
   } 
   else if ((firstValue == "erate")){
    esteprate = secondValue;
   } 
   else if ((firstValue == "brate")){
    bsteprate = secondValue;
   } 
   else if ((firstValue == "crate")){
    csteprate = secondValue;
   } 
   else if ((firstValue == "arate")){
    asteprate = secondValue;
   } 
   else if ((firstValue == "dsteps")){
    dsteps = secondValue;
   } 
   else if ((firstValue == "bsteps")){
    bsteps = secondValue;
   } 
   else if ((firstValue == "csteps")){
    csteps = secondValue;
   } 
   else if ((firstValue == "esteps")){
    esteps = secondValue;
   } 
   else if ((firstValue == "asteps")){
    asteps = secondValue;
   } 
   else if ((firstValue == "aforward")){
    //Serial.println("conveyer2 forward");
    astepcount = forwardmove(asteps,astepcount,asteprate,directionPin,astepsPin);
   } 
   else if ((firstValue == "eforward")){
    //Serial.println("linearactuator forward");
    estepcount = forwardmove(esteps,estepcount,esteprate,directionPin,estepsPin);
    
   } 
   else if ((firstValue == "dforward")){
    //Serial.println("conveyer4 forward");
    dstepcount = forwardmove(dsteps,dstepcount,dsteprate,directionPin,dstepsPin);
   } 
   else if ((firstValue == "bforward")){
    //Serial.println("conveyer3 forward");
    bstepcount = forwardmove(bsteps,bstepcount,bsteprate,directionPin,bstepsPin);
   } 
   else if ((firstValue == "cforward")){
    //Serial.println("conveyer1 forward");
    cstepcount = forwardmove(csteps,cstepcount,csteprate,directionPin,cstepsPin);
   }

   else if ((firstValue == "ebackward")){
    //Serial.println("linearactuator backward");
    estepcount = backwardmove(esteps,estepcount,esteprate,directionPin,estepsPin);
   } 
   else if ((firstValue == "dbackward")){
    //Serial.println("conveyer4 backward");
    dstepcount = backwardmove(dsteps,dstepcount,dsteprate,directionPin,dstepsPin);
   } 
   else if ((firstValue == "bbackward")){
    //Serial.println("conveyer3 backward");
    bstepcount = backwardmove(bsteps,bstepcount,bsteprate,directionPin,bstepsPin);
   } 
   else if ((firstValue == "cbackward")){
    //Serial.println("conveyer1 backward");
    cstepcount = backwardmove(csteps,cstepcount,csteprate,directionPin,cstepsPin);
   } 
   else if ((firstValue == "abackward")){
    //Serial.println("conveyer2 backward");
    astepcount = backwardmove(asteps,astepcount,asteprate,directionPin,astepsPin);
   } 
   
   //homing 
   else if ((firstValue == "ahoming")){
    astepcount = homing(asteprate,astepsPin,directionPin,alimitPin);
   } 
   else if ((firstValue == "bhoming")){
    bstepcount = homing(bsteprate,bstepsPin,directionPin,blimitPin);
   } 
   else if ((firstValue == "choming")){
    cstepcount = homing(csteprate,cstepsPin,directionPin,climitPin);
   } 
   else if ((firstValue == "dhoming")){
    dstepcount = homing(dsteprate,dstepsPin,directionPin,dlimitPin);
   } 
   else if ((firstValue == "ehoming")){
    estepcount = homing(esteprate,estepsPin,directionPin,elimitPin);
   } 





   else if (firstValue == "einfo"){
    String settingsdata =  "E - Steps:";
    settingsdata = settingsdata + String(esteps);
    settingsdata = settingsdata + ",Steprate:";
    settingsdata = settingsdata + String(esteprate);
    settingsdata = settingsdata + ",Stepcount:";
    settingsdata = settingsdata + String(estepcount);
    settingsdata = settingsdata + ",Endstopstatus:";
    settingsdata = settingsdata + String(digitalRead(elimitPin));
    Serial.println(settingsdata+"\n");
   } 

 
   else if (firstValue == "dinfo"){
    String settingsdata =  "D - Steps:";
    settingsdata = settingsdata + String(dsteps);
    settingsdata = settingsdata + ",Steprate:";
    settingsdata = settingsdata + String(dsteprate);
    settingsdata = settingsdata + ",Stepcount:";
    settingsdata = settingsdata + String(dstepcount);
    settingsdata = settingsdata + ",Endstopstatus:";
    settingsdata = settingsdata + String(digitalRead(dlimitPin));
    Serial.println(settingsdata+"\n");
   } 

   else if (firstValue == "binfo"){
    String settingsdata =  "B - Steps:";
    settingsdata = settingsdata + String(bsteps);
    settingsdata = settingsdata + ",Steprate:";
    settingsdata = settingsdata + String(bsteprate);
    settingsdata = settingsdata + ",Stepcount:";
    settingsdata = settingsdata + String(bstepcount);
    settingsdata = settingsdata + ",Endstopstatus:";
    settingsdata = settingsdata + String(digitalRead(blimitPin));
    Serial.println(settingsdata+"\n");
   } 

   else if (firstValue == "cinfo"){
    String settingsdata =  "C - Steps:";
    settingsdata = settingsdata + String(csteps);
    settingsdata = settingsdata + ",Steprate:";
    settingsdata = settingsdata + String(csteprate);
    settingsdata = settingsdata + ",Stepcount:";
    settingsdata = settingsdata + String(cstepcount);
    settingsdata = settingsdata + ",Endstopstatus:";
    settingsdata = settingsdata + String(digitalRead(climitPin));
    Serial.println(settingsdata+"\n");
   } 
   else if (firstValue == "ainfo"){
    String settingsdata =  "A - Steps:";
    settingsdata = settingsdata + String(asteps);
    settingsdata = settingsdata + ",Steprate:";
    settingsdata = settingsdata + String(asteprate);
    settingsdata = settingsdata + ",Stepcount:";
    settingsdata = settingsdata + String(astepcount);
    settingsdata = settingsdata + ",Endstopstatus:";
    settingsdata = settingsdata + String(digitalRead(alimitPin));
    Serial.println(settingsdata+"\n");
   } 

  }

}


int forwardmove(int inc, int steps, int steprate,int directionPin,int stepsPin){
  digitalWrite(directionPin,HIGH); // Set Dir high
  /*
  Serial.println(inc);
  Serial.println(steps);
  Serial.println(steprate);
  Serial.println(directionPin);
  Serial.println(stepsPin);
  */
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      delayMicroseconds(steprate); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
    //Serial.print("Steps ");
    //Serial.println(x); 
    steps = steps + inc;
    return steps;
}


int backwardmove(int inc, int steps, int steprate,int directionPin, int stepsPin){
  digitalWrite(directionPin,LOW); // Set Dir high
  for(int x = 0; x < inc; x++) // Loop 200 times
  {
      digitalWrite(stepsPin,HIGH); // Output high
      delayMicroseconds(steprate); // Wait 1/2 a ms
      digitalWrite(stepsPin,LOW); // Output low
      delayMicroseconds(steprate); // Wait 1/2 a ms
   }
    steps = steps - inc;
    return steps;
}



int homing(int steprate,int stepsPin, int directionPin, int limitPin){
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


