//Hardware objects such as bearings and motors
//defined here for convenience

//Mark Benson - April 2013
//
// CC - GNU



module filter(dia){
cylinder(r=dia/2,h=5,$fn=30);
}


module microservo(){
  cube([12,22.5,22.5]);
  translate([6,6,22.5])cylinder(r=2.5,h=7);
  translate([0,-9.5/2,22.5-4.2-2.5])difference(){
    cube([12,32,2.5]);
    translate([12/2,2.5,-13])cylinder(r=3/2,h=30);
    translate([12/2,32-2.5,-13])cylinder(r=3/2,h=30);
  }
}







module servo(){
 bcl = 0.4;
 color([bcl,bcl,bcl])
 cube([40.75,19.85,35]);
 difference(){
 color([bcl,bcl,bcl])translate([-(55.5-40.74)/2,0,35-8])cube([55.5,19.85,2.5]);
 translate([-(55.5-40.74)/2+3.8,0+4.5,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8,0+4.5+10,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8+49,0+4.5,35-8-10])cylinder(r=3.7/2,h=20);
 translate([-(55.5-40.74)/2+3.8+49,0+4.5+10,35-8-10])cylinder(r=3.7/2,h=20);
 }
 cl = 0.9;
 color([cl,cl,cl]){
 translate([10,10,30])cylinder(r=8/2,h=12);
 translate([10,10,41])cylinder(r=30/2,h=5);
 }
}






//Define generic, configurable module to generate a 'bearing'
module bearing(outerRaceSize, innerRaceSize, thickness)
{
	difference()
	{	
		cylinder(r=outerRaceSize/2, h=thickness);
		cylinder(r=innerRaceSize/2, h=thickness);
	}
}

//Now define bearing module with real world parameters

//Predefined 608 Bearing
module bearing608()
{
	bearing(22, 8, 7);
}

//Predefined 624 Bearing
module bearing624()
{
	bearing(13, 4, 5);
}

//Predefined 626 Bearing
module bearing626()
{
	bearing(19, 6, 6);
}

//Predefined LM8UU Bearing
module bearingLM8UU()
{
	bearing(15, 8, 24);
}

//Test bearing modules
//Uncomment line(s) below to test
//
//Note: Translations allow all bearings to shown at the same time
//rather than being on top of each other

//translate([0,0,0]) bearing624();
//translate([0,20,0]) bearingLM8UU();
//translate([0,43,0]) bearing626();
//translate([0,70,0]) bearing608();




//IKO
module iko_rail(len){
 num =  (len/20)-1;
 difference(){
  cube([9,len,6]);
  for(i=[0:num]){
  translate([4.5,10+(20*i),2])cylinder(r=6.5/2,h=50,$fn=30);
  translate([4.5,10+(20*i),-2])cylinder(r=3.7/2,h=50,$fn=30);
  }
 }
}

//IKO ML9
module iko_ml9_shuttle(){
difference(){
cube([20,30,8]);
translate([10,15,-1]){
 translate([15/2,10/2,0])cylinder(r=2.8/2,h=30,$fn=30);
 translate([15/2,-10/2,0])cylinder(r=2.8/2,h=30,$fn=30);
 translate([-15/2,10/2,0])cylinder(r=2.8/2,h=30,$fn=30);
 translate([-15/2,-10/2,0])cylinder(r=2.8/2,h=30,$fn=30);
 }
}
}
module iko_ml9_shuttle_3dprint(){
difference(){
union(){
cube([20,30,4]);
translate([-20,15,0])cube([20,5,10]);
translate([5,25,0])cube([15,5,17]);
}
#translate([9.5,50,10.5])rotate([90,0,0])cylinder(r=5.8/2,h=23,$fn=30);
translate([9.5-2,27.5-0,10.5])rotate([0,90,0])cylinder(r=2.8/2,h=40,$fn=30);
translate([-15,30,5.5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([-15+8,30,5.5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([10,15,-1]){
 translate([15/2,10/2,0])cylinder(r=3.8/2,h=30,$fn=30);
 translate([15/2,-10/2,0])cylinder(r=3.8/2,h=30,$fn=30);
 translate([-15/2,10/2,0])cylinder(r=3.8/2,h=30,$fn=30);
 translate([-15/2,-10/2,0])cylinder(r=3.8/2,h=30,$fn=30);
 }
}
}





// ** STEPPER MOTORS **
//
//
//Define a generic stepper motor module

module stepperMotor(caseSize, caseHeight, holeSpacing, holeDiameter, shaftDiameter, shaftHeight, shaftCollarDiameter, shaftCollarThickness)
{
	
	//Mounting Hole Depth is predefined @ >= 4.5mm
	mountingHoleDepth = 4.5;
	union()
	{
		//Shaft
		//Note: We add 1mm and translate to -1 in Z to show shaft 
		//on bottom of motor
		color("silver")translate([caseSize/2,caseSize/2,-1]) 
		cylinder(r=shaftDiameter/2, h=caseHeight+shaftHeight+1);	

		//Shaft collar
		color("silver")translate([caseSize/2,caseSize/2,caseHeight]) 
		cylinder(r=shaftCollarDiameter/2, h=shaftCollarThickness);

		difference()
		{
			color("black")cube([caseSize, caseSize, caseHeight]);
		
			translate([(caseSize-holeSpacing)/2,(caseSize-holeSpacing)/2,caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([caseSize-((caseSize-holeSpacing)/2),(caseSize-holeSpacing)/2,caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([(caseSize-holeSpacing)/2,caseSize-((caseSize-holeSpacing)/2),caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([caseSize-((caseSize-holeSpacing)/2),caseSize-((caseSize-holeSpacing)/2),caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
		}
	}
}


module linactstepperMotor(caseSize, caseHeight, holeSpacing, holeDiameter, shaftDiameter, shaftHeight, shaftCollarDiameter, shaftCollarThickness)
{
	
	//Mounting Hole Depth is predefined @ >= 4.5mm
	mountingHoleDepth = 4.5;
	union()
	{
		//Shaft
		//Note: We add 1mm and translate to -1 in Z to show shaft 
		//on bottom of motor
		color("silver")translate([caseSize/2,caseSize/2,-1]) 
		cylinder(r=shaftDiameter/2, h=caseHeight+shaftHeight+1);	

		//Shaft collar
		color("silver")translate([caseSize/2,caseSize/2,caseHeight]) 
		cylinder(r=shaftCollarDiameter/2, h=shaftCollarThickness);

		difference()
		{
			color("black")cube([caseSize, caseSize, caseHeight]);
		
			translate([(caseSize-holeSpacing)/2,(caseSize-holeSpacing)/2,caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([caseSize-((caseSize-holeSpacing)/2),(caseSize-holeSpacing)/2,caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([(caseSize-holeSpacing)/2,caseSize-((caseSize-holeSpacing)/2),caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
			translate([caseSize-((caseSize-holeSpacing)/2),caseSize-((caseSize-holeSpacing)/2),caseHeight-mountingHoleDepth+0.1]) 
			cylinder(r=holeDiameter/2, h=mountingHoleDepth);
		}
	}
}
















//Define stepper motor with real world parameters


//Predefined NEMA11 stepper motor
module nema11()
{
	stepperMotor(28, 33, 23.0, 3, 5, 24, 22, 2);
}


//Predefined NEMA17 stepper motor



//Predefined NEMA14 stepper motor
module nema14()
{
	stepperMotor(35.2, 36, 26.0, 3, 5, 24, 22, 2);
}


//Predefined NEMA17 stepper motor
module nema17()
{
	stepperMotor(42, 48, 31, 3, 5, 24, 22, 2);
}

//Predefined NEMA17 stepper motor
module linactnema17()
{
	linactstepperMotor(42, 48, 31, 3, 5, 24, 22, 2);
}






//Test stepper motors
//Note: Translations allow all objects to appear on screen together
//rather than being shown one on top of the other
//translate([20,0,0]) nema14();
//translate([20,50,0]) nema17();
