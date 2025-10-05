#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include <Wire.h>
#include <SoftwareSerial.h>


int enablePin = 7;
int directionPin = 12;
int alimitPin = A1; 
int astepsPin = 8;
int asteps = 1000;
int asteprate = 500;
int astepsincrement = 0;
int astepcount = 0;


int washpin = 10; 
int drypin = 9; 
int pcvpin = 6; 
int heatpin = 13; 
int turnon5vpin = 5;
int tempsensor = A0;
//int enablePin = 11;
int valveservo = 11;
int killsmoothiePin = 3;
int readkill = 2;
String firstValue;
String cmd;
int secondValue;
int pumponflag = 0;
int fillflag = 1;
int heatflag = 1;
int washval = 105;
int dryval = 255;
int pcvval = 255;
int heatval = 155;

int valveservoval = 100;
int pumpdelay = 0;
int pumpdelayct = 0;

void setup() {
  Serial.begin(9600);
  Serial.println("washdrypcv_valveservo_electrocaloric_stepper");

  pinMode(enablePin, OUTPUT);  
  digitalWrite(enablePin,LOW);
  pinMode(alimitPin,INPUT);
  digitalWrite(alimitPin, HIGH);
  pinMode(astepsPin, OUTPUT); //Steps
  digitalWrite(astepsPin, LOW); 
  
  // put your setup code here, to run once:
  //myservo.attach(valveservo);  // attaches the servo on pin 9 to the servo object
  //pinMode(tempsensor, INPUT);
  pinMode(killsmoothiePin, OUTPUT);
  pinMode(readkill, INPUT);
  //digitalWrite(enablePin,LOW);
  //pinMode(washpin, OUTPUT);
  analogWrite(valveservo, 0);
  analogWrite(pcvpin, 0);
  analogWrite(drypin, 0);
  analogWrite(heatpin, 0);
  analogWrite(turnon5vpin, 0);
  analogWrite(washpin, 0);
  digitalWrite(killsmoothiePin, LOW);
}

void loop() {
 
  if (digitalRead(readkill) == HIGH){
   delay(100);
   digitalWrite(killsmoothiePin, HIGH);
   delay(100);
   Serial.println("killbuttonpressed");
   delay(100);
   digitalWrite(killsmoothiePin, HIGH);
  }
  else {
    digitalWrite(killsmoothiePin, LOW);
  }
  
  if ((digitalRead(tempsensor) == HIGH) and (fillflag == 0)){
    analogWrite(pcvpin, 255);
    pumponflag = 1;
    delay(pumpdelay);
    pumpdelayct = 0;
  }
  else if ((digitalRead(tempsensor) == LOW) and (pumponflag == 1) and (fillflag == 0)) {
    pumpdelayct = pumpdelayct + 1;
    if (pumpdelayct == pumpdelay){
     analogWrite(pcvpin, 0); 
     pumponflag = 0;
    }
  } 

  // put your main code here, to run repeatedly:
  if (Serial.available() >0 ){
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

  if (firstValue == "washon"){
    analogWrite(washpin, washval);
    delay(100);
  }
  else if (firstValue == "info"){
    Serial.println("wash_dry_pcv_electrocaloric_kill");
  }
  else if (firstValue == "killsmoothieon"){
    digitalWrite(killsmoothiePin, HIGH);
  }
  else if (firstValue == "killsmoothieoff"){
    digitalWrite(killsmoothiePin, LOW);
  }
  else if (firstValue == "washoff"){
    analogWrite(washpin, 0);
  }
  else if (firstValue == "turnon5v"){
    analogWrite(turnon5vpin, 255);
  } 
  else if (firstValue == "turnoff5v"){
    analogWrite(turnon5vpin, 0);
  }
  else if (firstValue == "dryon"){
    analogWrite(drypin, dryval);
  }
  else if (firstValue == "dryoff"){
    analogWrite(drypin, 0);
  }
    else if (firstValue == "manpcv"){
    fillflag = 1;
  }
  else if (firstValue == "feedbackpcv"){
    fillflag = 0;
  } 
  else if (firstValue == "pcvon"){
    if (fillflag == 1){
     analogWrite(pcvpin, pcvval);
    }
  }
  else if (firstValue == "pcvoff"){
    if (fillflag == 1){
     analogWrite(pcvpin, 0);
    }
  }
  else if (firstValue == "manheat"){
    heatflag = 1;
  }
  else if (firstValue == "feedbackheat"){
    heatflag = 0;
  } 
  else if (firstValue == "heaton"){
    if (heatflag == 1){
     analogWrite(heatpin, heatval);
    }
  }
  else if (firstValue == "heatoff"){
    if (heatflag == 1){
     analogWrite(heatpin, 0);
    }
  }
  else if (firstValue == "setwashval"){
    washval = secondValue;
  }
  else if (firstValue == "setdryval"){
    dryval = secondValue;
  }
  else if (firstValue == "setpcvval"){
    pcvval = secondValue;
  }
  else if (firstValue == "setheatval"){
    heatval = secondValue;
  }
  else if (firstValue == "valveservo"){
    myservo.write(secondValue);
  }
  else if (firstValue == "readtemp"){
    Serial.println(analogRead(tempsensor));
  }
  else if (firstValue == "digread"){
    Serial.println(digitalRead(tempsensor));
  }
  else if ((firstValue == "arate")){
    asteprate = secondValue;
   } 
  else if ((firstValue == "asteps")){
    asteps = secondValue;
  }
  else if ((firstValue == "aforward")){
    //Serial.println("conveyer2 forward");
    astepcount = forwardmove(asteps,astepcount,asteprate,directionPin,astepsPin);
  } 
     else if ((firstValue == "abackward")){
    //Serial.println("conveyer2 backward");
    astepcount = backwardmove(asteps,astepcount,asteprate,directionPin,astepsPin);
   } 
   //homing 
   else if ((firstValue == "ahoming")){
    astepcount = homing(asteprate,astepsPin,directionPin,alimitPin);
   } 
  }
  delay(30);
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
