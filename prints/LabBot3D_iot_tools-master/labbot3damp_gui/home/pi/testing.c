#include <stdlib.h>
#include <stdio.h>
#include <wiringPi.h>

#define STEPPIN 0 //7 
#define DIRPIN 2 //11 
#define ENABLPIN 3//15 

// ./stepper 100 1000 1

int steps = 0;
int feed = 0;
int dir = 0;
int a;

int main (int argc, char *argv[])
{
  wiringPiSetup () ;
  printf ("Enter steps feed dir\n") ;
  steps = atoi(argv[1]);
  feed = atoi(argv[2]);
  dir = atoi(argv[3]);
  pinMode (STEPPIN, OUTPUT) ;
  pinMode (0, OUTPUT) ;
  pinMode (DIRPIN, OUTPUT) ;
  pinMode (ENABLPIN, OUTPUT) ;
  digitalWrite (STEPPIN, LOW) ;	// Off
  digitalWrite (ENABLPIN, LOW) ;	// Off
  digitalWrite (DIRPIN, LOW) ;	// Off
  if (dir == 1){
   digitalWrite (DIRPIN, HIGH) ;	// Off
   printf ("goes forward\n") ;
  } else {
   digitalWrite (DIRPIN, LOW) ;	// Off
   printf ("goes backward\n") ;
  }

 for( a = 0; a < steps; a = a + 1 ){
  digitalWrite (STEPPIN, HIGH) ;	// Off
  delayMicroseconds(feed);
  digitalWrite (STEPPIN, LOW) ;	// Off
  delayMicroseconds(feed);
 } 
 return 0 ;

}
