#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include <Wire.h>
#include <SoftwareSerial.h>




int valveservo = 11;

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
float currpos;
int fillflag = 0;
int heatflag = 0;
int heatval = 255;
int heatlevelval = 920;
int htcnt = 0;
int pumpdelayct = 0;
int pumpdelay = 0;
int pumponflag = 0;
int heatstreamon = 0;




void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  myservo.attach(valveservo);
  analogWrite(pcvpin, 0); 
  analogWrite(washpin,0);
  analogWrite(drypin, 0);
  analogWrite(heatpin, 0);
  currpos = 0;
  
}

void loop() {
  // put your main code here, to run repeatedly:
   if ((analogRead(tempsensor) < heatlevelval) and (fillflag == 0)){
    htcnt = htcnt + 1;
    if (htcnt > 10) {
     analogWrite(pcvpin, 255); 
     pumponflag = 1;
     delay(pumpdelay); 
     pumpdelayct = 0;
   }
  } 
  else if ((analogRead(tempsensor) > heatlevelval) and (pumponflag == 1) and (fillflag == 0)) {
    if (pumpdelayct == pumpdelay){
     analogWrite(pcvpin, 0);
     pumponflag = 0;
    }
    pumpdelayct = pumpdelayct + 1;
  }
   else if ((analogRead(tempsensor) > heatlevelval)){
   htcnt = 0;
  }
  if (heatstreamon == 1) {
   Serial.println(analogRead(tempsensor));
  }

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

  if(com.equalsIgnoreCase("washon")){
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
  }

  else if(com.equalsIgnoreCase("heatstreamon")){
   heatstreamon = 1;
  } 
  else if(com.equalsIgnoreCase("heatstreamoff")){
   heatstreamon = 0;
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
  else if(com.equalsIgnoreCase("readtemp")){
      Serial.println(analogRead(tempsensor));
  }
  
   else if (com.substring(0,10) == "setwashval") {
    washval = com.substring(11).toInt();
  }
   else if (com.substring(0,9) == "setdryval") {
    dryval = com.substring(10).toInt();
  }
   else if (com.substring(0,9) == "setpcvval") {
    pcvval = com.substring(10).toInt();
  }

   else if (com.substring(0,10) == "setheatval") {
    heatlevelval = com.substring(11).toInt();
  }
  else if (com.substring(0,10) == "valveservo") {
    myservo.write(com.substring(com.indexOf("valveservo")+11).toInt());
  }
   return currpos;
}


