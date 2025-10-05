#include <Servo.h>
Servo myservo;  // create servo object to control a servo

#include <Wire.h>
#include <SoftwareSerial.h>

String firstValue;
int secondValue;
String cmd;

void setup() {
  Serial.begin(9600);
  Serial.println("blinker");
  // put your setup code here, to run once:
  //myservo.attach(valveservo);  // attaches the servo on pin 9 to the servo object
  //pinMode(tempsensor, INPUT);
  pinMode(13, OUTPUT);
}

void loop() {
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
  if (firstValue == "on"){
    digitalWrite(13, HIGH);
    delay(100);
  }
  else if (firstValue == "off"){
    digitalWrite(13, LOW);
  }
  else if (firstValue == "help"){
   Serial.println("blinker test, look for led 13");
  }   
  }
  delay(30);
}
