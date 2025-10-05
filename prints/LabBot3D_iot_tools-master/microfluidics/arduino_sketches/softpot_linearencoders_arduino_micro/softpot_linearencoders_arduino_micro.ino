
#include <Wire.h>
#include <Adafruit_ADS1015.h>
#include <SoftwareSerial.h>

Adafruit_ADS1115 ads1115;

//#define SERIESRESISTOR 560 
//#define rxPin 3
//#define txPin 2 

//SoftwareSerial mySerial = SoftwareSerial(rxPin, txPin);

const int X_POT = 1; // Pin connected to softpot wiper
const int Y_POT = 0; // Pin connected to softpot wiper
const int Z_POT = 2; // Pin connected to softpot wiper
const int E_POT = 3; // Pin connected to softpot wiper

const int GRAPH_LENGTH = 40; // Length of line graph

String firstValue;
String cmd;
int secondValue;
int pumponflag = 0;
int fillflag = 0;
int stream=0;

void setup() 
{
  Serial.begin(115200);
  Serial.println("linearencoders");
  ads1115.begin();
  adsGain_t gain = ads1115.getGain();
  ads1115.setGain(GAIN_ONE);
}

void loop() 
{
 int16_t adc0, adc1, adc2, adc3;
 
 /*
  This is commented out 
 graph("X",X_POT,0,65355);
 graph("Y",Y_POT,0,65355);
 graph("Z",Z_POT,0,65355);
 graph("E",E_POT,0,65355);
 */
 if (stream == 1){
    Serial.print("x");
    delay(50);
    Serial.print(ads1115.readADC_SingleEnded(X_POT));
    delay(50);
    Serial.print("_y");
    delay(50);
    Serial.println(ads1115.readADC_SingleEnded(Y_POT));
    delay(500);
 }
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
  if (firstValue == "zread"){
    Serial.println(ads1115.readADC_SingleEnded(Z_POT));
  }
  else if (firstValue == "yread"){
    Serial.println(ads1115.readADC_SingleEnded(Y_POT));
  }
  else if (firstValue == "streamon"){
    stream = 1;
  }
  else if (firstValue == "streamoff"){
    stream = 0;
  }
  else if (firstValue == "info"){
   Serial.println("linearencoders");
  }
  else if (firstValue == "xread"){
    Serial.println(ads1115.readADC_SingleEnded(X_POT));
  }
  else if (firstValue == "xyread"){
    Serial.print("x");
    delay(50);
    Serial.print(ads1115.readADC_SingleEnded(X_POT));
    delay(50);
    Serial.print("_y");
    delay(50);
    Serial.println(ads1115.readADC_SingleEnded(Y_POT));
  }
  else if (firstValue == "eread"){
    Serial.println(ads1115.readADC_SingleEnded(E_POT));
  }
 }
} 


void graph(String dir, int pin, int mine, int maxe){

  int softPotADC = ads1115.readADC_SingleEnded(pin);
  // Map the 0-1023 value to 0-40
  // Here need to find the min max for each encoder
  int softPotPosition = map(softPotADC, mine, maxe, 0, GRAPH_LENGTH);
  // Print a line graph:
  Serial.print(dir+"<"); // Starting end
  for (int i=0; i<GRAPH_LENGTH; i++)
  {
    if (i == softPotPosition) Serial.print("|");
    else Serial.print("-");
  }
  Serial.println("> (" + String(softPotADC) + ")");
  delay(500);
}
