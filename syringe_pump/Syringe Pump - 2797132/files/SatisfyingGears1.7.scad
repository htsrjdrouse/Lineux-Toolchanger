//;) ;P ;) ;P ;) ;P ;) ;P ;) ;P ;) ;P 
//;P ;) ;P ;) ;P ;) ;P ;) ;P ;) ;P ;)
//;) ;P ;) SNAXXUS CODE;P ;) ;P ;) ;P 
//;P ;) ;P ;) ;P ;) ;P ;) ;P ;) ;P ;)
//;) ;P ;) ;P ;) ;P ;) ;P ;) ;P ;) ;P 

//LGPL




translate([-80,0,0])PolygonPairGearRingGear(TeethA=10,TeethB=30,BacklashA=0.1,BacklashB=0.1,RingThickness=10,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

PairGearRingGear(TeethA=10,TeethB=30,BacklashA=0.1,BacklashB=0.1,RingThickness=10,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

translate([80,0,0])PairGearRingGear(TeethA=10,TeethB=30,BacklashA=0.1,BacklashB=0.1,RingThickness=10,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=true);



translate([-80,-80,0])PolygonPairGears(TeethA=10,TeethB=20,BacklashA=0.1,BacklashB=0.1,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

translate([0,-80,0])PairGears(TeethA=10,TeethB=20,BacklashA=0.1,BacklashB=0.1,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

translate([80,-80,0])PairGears(TeethA=10,TeethB=20,BacklashA=0.1,BacklashB=0.1,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=16,Layers=2,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=true);


translate([0,80,0])PairGears(TeethA=10,TeethB=20,BacklashA=0.1,BacklashB=0.1,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=40,HelixFaceAngle=16,Layers=3,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

translate([-80,80,0])PairGears(TeethA=10,TeethB=20,BacklashA=0.1,BacklashB=0.1,PressureAngle=20,DiametralPitch=0.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=0,Layers=1,AltLayerToothPhase=0,ChamferThickness=2,InnerChamfers=false,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false);

//PairGearRingGear module
//Quality:
//AngularResolution =.1; //step size for the parameterized involute function// smaller is sharper but more points in the model
//$fn=60;
//M=10000; //Magnify then shrink factor to prevent point culling on the involute gear polygon
//slices=10 The number of slices used in the linear extrusions. More makes it sharper but more points in the model.

//Gear Parameters
//TeethA=14; //Teeth on first gear (Gear A)
//TeethB=30; //Teeth on second (ring)gear (Gear B)
//BacklashA=0;// Added Backlash in millimeters along the pitch circle on Gear A. This narrows the teeth and loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//BacklashB=0;// Added Backlash in millimeters along the pitch circle on RingGear B. This narrows the teeth and loosens the fit of the gears. Use this instead of the old Rescale parameter.
//RingThickness=10;// The Thickness of the material surrounding the teeth of the ring gear GearB
//PressureAngle=20; //degrees (Is common to both gears)
//DiametralPitch=0.6; // =Teeth/PitchDiameter (Determines tooth size and together with Teeth determines Pitch diameter. Common to both gears)
//ToothPhaseA=0; //Rotate the first Gear (Gear A) by X of a tooth, 1 is unity. The tooth is centered on the +X axis. Gear B is advanced by 0.5 and rotated 180 gegrees to enguage GearA
//Thickness=10 //The Thickness of the Gears.
//HelixFaceAngle=15 // You can angle the teeth of the gears to create helical gears. Combined with additional layers you can make double, tripple etc.. helical gears, Odd Layers reverse the helix. You still get a meshed pair.
//Layers=1 Additional Layers of the gear are added so you can make double, tripple, etc... helical gears.
//AltLayerToothPhase=0 You can shift the Tooth phase of the odd layers on multi layered gears (Usually Helical Gears) For Reasons???
//ChamferThickness=1 Select how deep you want the Chamfer at the Tooth edges. Zero Means no chamfer on tooth edges.
//InnerChamfers=true // Existance Flag for the chamfers between layers of multi layered gears.
//Rescale=1; // Use BacklashA and BacklashB instead. This is a legacy parameter to that is a Scalar to shrink gears if they printing too tight or loose.(1=normal full size)(Does not scale Z but you have your own scale command)(center distance will remain uneffected) 
//AddendumA=0 Zero is automatic! Set to zero for default of 1/DiametralPitch. This is the distance between the pitch diameter and the outer end of the tooth, on the first gear (Gear A)(This is only for the more studied gearer)
//AddendumB=0 Zero is automatic! Set to zero for default of 1/DiametralPitch. This is the distance between the pitch diameter and the outer end of the tooth, on the second gear (Gear B)(This is only for the more studied gearer)
//GearAExists=true //Existance Flag for GearA. (For generating loose parts)
//GearBExists=true //Existance Flag for GearB. (For generating loose parts)
//GearBCentered=false // Bring GearB to the center(for using on parts)
//debug=false; //Debug mode places colored cylender at PitchDiaiameter of the gears. This mihgt be good for seting up your model without wasting calculation time.
//Example: 
//PolygonPairGears(TeethA=15,TeethB=30,PressureAngle=20,ToothPhaseA=0.5);
module PairGearRingGear(AngularResolution =5,M=10000,slices=5,TeethA=12,TeethB=20,BacklashA=0,BacklashB=0,RingThickness=10,PressureAngle=20,DiametralPitch=.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=15,Layers=1,AltLayerToothPhase=0,ChamferThickness=1,InnerChamfers=true,Rescale=1,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false){

PitchDiameterA=TeethA/DiametralPitch;
PitchDiameterB=TeethB/DiametralPitch;
BaseDiameterA=PitchDiameterA*cos(PressureAngle);
BaseDiameterB=PitchDiameterB*cos(PressureAngle);

CircularPitchA=PI*PitchDiameterA/TeethA;
PitchAngleA=CircularPitchA/(PitchDiameterA/2);

CircularPitchB=PI*PitchDiameterB/TeethB;
PitchAngleB=CircularPitchB/(PitchDiameterB/2);

CenterDistance=(PitchDiameterA+PitchDiameterB)/2;

//Test for user defined addendums
AddendumA = AddendumA<=0 ? 1/DiametralPitch : AddendumA; //[1]
AddendumB = AddendumB<=0 ? 1/DiametralPitch : AddendumB; //[1]

ThLayer=(Thickness)/Layers;

//GEAR A    
if (debug || (GearAGhost && GearAExists)){
  scale([Rescale,Rescale,1]){
    #cylinder(h =Thickness, d =PitchDiameterA , center = true);
    %cylinder(h =Thickness, d =PitchDiameterA+2*AddendumA , center = true);
  color("blue")cylinder(h =4*Thickness, d =0.2 , center = true);
  }
}
if (!debug && GearAExists && !GearAGhost){
for(i = [1 : Layers]){
  
translate([0,0,-Thickness/2+(ThLayer/2)+(i-1)*(ThLayer)]){
    
difference(){
linear_extrude(height = ThLayer, center = true, convexity = 10, twist = (180/PI)*(ThLayer*pow((-1),i)*tan(HelixFaceAngle))/(PitchDiameterA/2), slices = slices, scale = 1) {
rotate([0,0,((i-1)%2)*AltLayerToothPhase*(180/PI)*PitchAngleA+((i-1)%2)*(180/PI)*(ThLayer*tan(HelixFaceAngle))/(PitchDiameterA/2)]){
PolygonPairGearRingGear(AngularResolution =AngularResolution,M=M,TeethA=TeethA,TeethB=TeethB,BacklashA=BacklashA,BacklashB=BacklashB,RingThickness=RingThickness, PressureAngle=PressureAngle,DiametralPitch=DiametralPitch,ToothPhaseA=ToothPhaseA,Rescale=Rescale,AddendumA=AddendumA,AddendumB=AddendumB,GearAExists=GearAExists,GearBExists=false,GearBCentered=false,debug=false);
}
}
union(){
if((ChamferThickness>0)&&((i==1)||(InnerChamfers))){
translate([0,0,-ThLayer/2]){
ChamferCut(R1=BaseDiameterA/2,R2=PitchDiameterA/2+AddendumA,Thickness=ChamferThickness);
}
}
if((ChamferThickness>0)&&((i==Layers)||(InnerChamfers))){
translate([0,0,ThLayer/2]){
ChamferCut(R1=BaseDiameterA/2,R2=PitchDiameterA/2+AddendumA,Thickness=ChamferThickness);
}
}
}
}
}
}
}

//GEAR B
C = GearBCentered ? 0 : CenterDistance-PitchDiameterB;//PitchDiameterB; //[1]
if (debug || (GearBGhost && GearBExists)){
  translate([C,0,0]){
  scale([Rescale,Rescale,1]){
 
 
RootClearanceB=min(max(0,0.02*(AddendumA+(PitchDiameterA-BaseDiameterA)/2)+(PitchDiameterA/2 + AddendumA)-(CenterDistance-BaseDiameterB/2)),AddendumA);
     
  ringradius=PitchDiameterB/2+PitchDiameterB/2-BaseDiameterB/2+RootClearanceB+RingThickness;
      
  #difference(){
    cylinder(h =Thickness+0.005, d =ringradius*2 , center = true);
    cylinder(h =Thickness+0.008, d =PitchDiameterB , center = true);
  }
  %difference(){
    cylinder(h =Thickness-.005, d =PitchDiameterB , center = true);
    cylinder(h =Thickness+0.005, d =PitchDiameterB-+2*AddendumB , center = true);
  }
  color("blue")cylinder(h =4*Thickness, d =0.2 , center = true);
  }
    if(!GearBCentered){
    translate([-C/2,0,4*Thickness/2]){
    rotate([90,0,0])color("blue")text(text=str(C), size=5 ,halign="center");
    }
  }

  }
}

if (!debug && GearBExists && !GearBGhost){
translate([C,0,0]){
  
for(i = [1 : Layers]){
translate([0,0,-Thickness/2+(ThLayer/2)+(i-1)*(ThLayer)]){
difference(){
union(){
//    echo(i);
linear_extrude(height = ThLayer, center = true, convexity = 10, twist = (180/PI)*(ThLayer*pow((-1),i)*tan(HelixFaceAngle))/(PitchDiameterB/2), slices = slices, scale = 1) {
rotate([0,0,-((i-1)%2)*AltLayerToothPhase*(180/PI)*PitchAngleB+((i-1)%2)*(180/PI)*(ThLayer*tan(HelixFaceAngle))/(PitchDiameterB/2)]){    
PolygonPairGearRingGear(AngularResolution =AngularResolution,M=M,TeethA=TeethA,TeethB=TeethB,BacklashA=BacklashA,BacklashB=BacklashB,RingThickness=RingThickness, PressureAngle=PressureAngle,DiametralPitch=DiametralPitch,ToothPhaseA=ToothPhaseA,Rescale=Rescale,AddendumA=AddendumA,AddendumB=AddendumB,GearAExists=false,GearBExists=GearBExists,GearBCentered=true,debug=false);
}
}
}
union(){
if((ChamferThickness>0)&&((i==1)||(InnerChamfers))){
translate([0,0,-ThLayer/2-0.001]){
cylinder(r1=PitchDiameterB/2+PitchDiameterB/2-BaseDiameterB/2,r2=PitchDiameterB/2-AddendumB,h=ChamferThickness+0.001);
}
}
if((ChamferThickness>0)&&((i==Layers)||(InnerChamfers))){
translate([0,0,ThLayer/2-ChamferThickness]){
cylinder(r2=PitchDiameterB/2+PitchDiameterB/2-BaseDiameterB/2,r1=PitchDiameterB/2-AddendumB,h=ChamferThickness+0.001);
}
}
}
}
}
}
}
}

}//end module




//PairGears module
//Quality:
//AngularResolution =.1; //step size for the parameterized involute function// smaller is sharper but more points in the model
//$fn=60;
//M=10000; //Magnify then shrink factor to prevent point culling on the involute gear polygon
//slices=10 The number of slices used in the linear extrusions. More makes it sharper but more points in the model.

//Gear Parameters
//TeethA=14; //Teeth on first gear (Gear A)
//TeethB=30; //Teeth on second gear (Gear B)
//BacklashA=0;// Added Backlash in millimeters along the pitch circle on Gear A. This narrows the teeth and loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//BacklashB=0;// Added Backlash in millimeters along the pitch circle on Gear B. This narrows the teeth and loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//PressureAngle=20; //degrees (Is common to both gears)
//DiametralPitch=0.6; // =Teeth/PitchDiameter (Determines tooth size and together with Teeth determines Pitch diameter. Common to both gears)
//ToothPhaseA=0; //Rotate the first Gear (Gear A) by X of a tooth, 1 is unity. The tooth is centered on the +X axis. Gear B is advanced by 0.5 and rotated 180 gegrees to enguage GearA
//Thickness=10 //The Thickness of the Gears.
//HelixFaceAngle=15 // You can angle the teeth of the gears to create helical gears. Combined with additional layers you can make double, tripple etc.. helical gears, Odd Layers reverse the helix. You still get a meshed pair.
//Layers=1 Additional Layers of the gear are added so you can make double, tripple, etc... helical gears.
//AltLayerToothPhase=0 You can shift the Tooth phase of the odd layers on multi layered gears (Usually Helical Gears) For Reasons???
//ChamferThickness=1 Select how deep you want the Chamfer at the Tooth edges. Zero Means no chamfer on tooth edges.
//InnerChamfers=true // Existance Flag for the chamfers between layers of multi layered gears.
//Rescale=1; // Use BacklashA and BacklashB instead. This is a legacy parameter to that is a Scalar to shrink gears if they printing too tight or loose.(1=normal full size)(Does not scale Z but you have your own scale command)(center distance will remain uneffected) 
//AddendumA=0 Zero is automatic! Set to zero for default of 1/DiametralPitch. This is the distance between the pitch diameter and the outer end of the tooth, on the first gear (Gear A)(This is only for the more studied gearer)
//AddendumB=0 Zero is automatic! Set to zero for default of 1/DiametralPitch. This is the distance between the pitch diameter and the outer end of the tooth, on the second gear (Gear B)(This is only for the more studied gearer)
//GearAExists=true //Existance Flag for GearA. (For generating loose parts)
//GearBExists=true //Existance Flag for GearB. (For generating loose parts)
//GearBCentered=false // Bring GearB to the center(for using on parts)
//debug=false; //Debug mode places colored cylender at PitchDiaiameter of the gears. This mihgt be good for seting up your model without wasting calculation time.
//Example: 
//PolygonPairGears(TeethA=15,TeethB=30,PressureAngle=20,ToothPhaseA=0.5);
module PairGears(AngularResolution =5,M=10000,slices=5,TeethA=12,TeethB=20,BacklashA=0,BacklashB=0,PressureAngle=20,DiametralPitch=.6,ToothPhaseA=0,Thickness=20,HelixFaceAngle=15,Layers=1,AltLayerToothPhase=0,ChamferThickness=1,InnerChamfers=true,Rescale=1,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,GearAGhost=false,GearBGhost=false,debug=false){



PitchDiameterA=TeethA/DiametralPitch;
PitchDiameterB=TeethB/DiametralPitch;
BaseDiameterA=PitchDiameterA*cos(PressureAngle);
BaseDiameterB=PitchDiameterB*cos(PressureAngle);

CircularPitchA=PI*PitchDiameterA/TeethA;
PitchAngleA=CircularPitchA/(PitchDiameterA/2);

CircularPitchB=PI*PitchDiameterB/TeethB;
PitchAngleB=CircularPitchB/(PitchDiameterB/2);

CenterDistance=(PitchDiameterA+PitchDiameterB)/2;

//Test for user defined addendums
AddendumA = AddendumA<=0 ? 1/DiametralPitch : AddendumA; //[1]
AddendumB = AddendumB<=0 ? 1/DiametralPitch : AddendumB; //[1]

ThLayer=(Thickness)/Layers;

//GEAR A    
if (debug || (GearAGhost && GearAExists)){
  scale([Rescale,Rescale,1]){
    #cylinder(h =Thickness, d =PitchDiameterA , center = true);
    %cylinder(h =Thickness, d =PitchDiameterA+2*AddendumA , center = true);
    color("blue")cylinder(h =4*Thickness, d =0.2 , center = true);
  }
}
if (!debug && GearAExists && !GearAGhost){
for(i = [1 : Layers]){
  
translate([0,0,-Thickness/2+(ThLayer/2)+(i-1)*(ThLayer)]){
    
difference(){
linear_extrude(height = ThLayer, center = true, convexity = 10, twist = (180/PI)*(ThLayer*pow((-1),i)*tan(HelixFaceAngle))/(PitchDiameterA/2), slices = slices, scale = 1) {
rotate([0,0,((i-1)%2)*AltLayerToothPhase*(180/PI)*PitchAngleA+((i-1)%2)*(180/PI)*(ThLayer*tan(HelixFaceAngle))/(PitchDiameterA/2)]){
PolygonPairGears(AngularResolution =AngularResolution,M=M,TeethA=TeethA,TeethB=TeethB,BacklashA=BacklashA,BacklashB=BacklashB,PressureAngle=PressureAngle,DiametralPitch=DiametralPitch,ToothPhaseA=ToothPhaseA,Rescale=Rescale,AddendumA=AddendumA,AddendumB=AddendumB,GearAExists=GearAExists,GearBExists=false,GearBCentered=false,debug=false);
}
}
union(){
if((ChamferThickness>0)&&((i==1)||(InnerChamfers))){
translate([0,0,-ThLayer/2]){
ChamferCut(R1=BaseDiameterA/2,R2=PitchDiameterA/2+AddendumA,Thickness=ChamferThickness);
}
}
if((ChamferThickness>0)&&((i==Layers)||(InnerChamfers))){
translate([0,0,ThLayer/2]){
ChamferCut(R1=BaseDiameterA/2,R2=PitchDiameterA/2+AddendumA,Thickness=ChamferThickness);
}
}
}
}
}
}
}

//GEAR B
C = GearBCentered ? 0 : CenterDistance; //[1]
if (debug || (GearBGhost && GearBExists)){
  translate([C,0,0]){
  scale([Rescale,Rescale,1]){
  #cylinder(h =Thickness, d =PitchDiameterB , center = true);
  %cylinder(h =Thickness, d =PitchDiameterB +2*AddendumB , center = true);
    color("blue")cylinder(h =4*Thickness, d =0.2 , center = true);
  }
  }
  if(!GearBCentered){
    translate([C/2,0,4*Thickness/2]){
    rotate([90,0,0])color("blue")text(text=str(CenterDistance), size=5 ,halign="center");
    }
  }
}

if (!debug && GearBExists && !GearBGhost){
translate([C,0,0]){
  
for(i = [1 : Layers]){
translate([0,0,-Thickness/2+(ThLayer/2)+(i-1)*(ThLayer)]){
difference(){
union(){
//    echo(i);
linear_extrude(height = ThLayer, center = true, convexity = 10, twist = -(180/PI)*(ThLayer*pow((-1),i)*tan(HelixFaceAngle))/(PitchDiameterB/2), slices = slices, scale = 1) {
rotate([0,0,-((i-1)%2)*AltLayerToothPhase*(180/PI)*PitchAngleB-((i-1)%2)*(180/PI)*(ThLayer*tan(HelixFaceAngle))/(PitchDiameterB/2)]){    
PolygonPairGears(AngularResolution =AngularResolution,M=M,TeethA=TeethA,TeethB=TeethB,BacklashA=BacklashA,BacklashB=BacklashB,PressureAngle=PressureAngle,DiametralPitch=DiametralPitch,ToothPhaseA=ToothPhaseA,Rescale=Rescale,AddendumA=AddendumA,AddendumB=AddendumB,GearAExists=false,GearBExists=GearBExists,GearBCentered=true,debug=false);
}
}
}
union(){
if((ChamferThickness>0)&&((i==1)||(InnerChamfers))){
translate([0,0,-ThLayer/2]){
ChamferCut(R1=BaseDiameterB/2,R2=PitchDiameterB/2+AddendumB,Thickness=ChamferThickness);
}
}
if((ChamferThickness>0)&&((i==Layers)||(InnerChamfers))){
translate([0,0,ThLayer/2]){
ChamferCut(R1=BaseDiameterB/2,R2=PitchDiameterB/2+AddendumB,Thickness=ChamferThickness);
}
}
}
}
}
}
}
}

}//end module


//The function CalcCenterDistance() of synonomously CalcPairGearsCenterDistance() returns the centerdistance to in PairGears given TeethA, TeethB, DiametralPitch, and PressureAngle.
function CalcCenterDistance(TeethA=12,TeethB=20,DiametralPitch=0.6,PressureAngle=20) = ((TeethA/DiametralPitch+TeethB/DiametralPitch)/2);

function CalcPairGearsCenterDistance(TeethA=12,TeethB=20,DiametralPitch=0.6,PressureAngle=20) = CalcCenterDistance(TeethA=TeethA,TeethB=TeethB,DiametralPitch=DiametralPitch,PressureAngle=PressureAngle);





//The function CalcCenterDistance() of synonomously CalcPairGearsCenterDistance() returns the centerdistance to in PairGears given TeethA, TeethB, DiametralPitch, and PressureAngle.
function CalcPairGearRingGearCenterDistance(TeethA=12,TeethB=20,DiametralPitch=0.6,PressureAngle=20) = (((TeethA/DiametralPitch+TeethB/DiametralPitch)/2)-TeethB/DiametralPitch);




//Quality:
//AngularResolution =.1; //step size for the parameterized involute function
//$fn=60;
//M=10000; //Magnify then shrink factor to prevent point culling

//Gear Parameters
//TeethA=14; //Teeth on first gear
//TeethB=30; //Teeth on second gear
//BacklashA=0;// Added Backlash in millimeters along the pitch circle on Gear A. This loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//BacklashB=0;// Added Backlash in millimeters along the pitch circle on Gear B. This loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//PressureAngle=20; //degrees
//DiametralPitch=0.4; // =Teeth/PitchDiameter (tooth and gear size)
//ToothPhaseA=0; //Rotate the first Gear by X of a tooth, 1 is unity. The tooth is centered on the +X axis. Gear B is advanced by 0.5 and rotated 180 gegrees to enguage GearA
//Rescale=1; // Use BacklashA and BacklashB instead. This is a legacy parameter to that is a Scalar to shrink gears if they printing too tight or loose.(1=normal full size)(center distance will remain uneffected) 
//AddendumA is the distance between the pitch diameter and the outer end of the tooth, on the first gear (For the more studied gearer)
//AddendumB is the distance between the pitch diameter and the outer end of the tooth, on the second gear (For the more studied gearer)
//GearAExists=true //Existance Flag for GearA. (For generating loose parts)
//GearBExists=true //Existance Flag for GearB. (For generating loose parts)
//GearBCentered=false // Bring GearB to the center(for using on parts)
//debug=false; //Debug mode places colored circle at PitchDiaiameter
//Example: 
//PolygonPairGears(TeethA=15,TeethB=30,PressureAngle=20,ToothPhaseA=0.5);
module PolygonPairGearRingGear(AngularResolution =0.1,M=10000,TeethA=12,TeethB=20,BacklashA=0,BacklashB=0,RingThickness=10,PressureAngle=20,DiametralPitch=.6,ToothPhaseA=0,Rescale=1,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,debug=false){

//Test for user defined addendums
AddendumA = AddendumA<=0 ? 1/DiametralPitch : AddendumA; //[1]
AddendumB = AddendumB<=0 ? 1/DiametralPitch : AddendumB; //[1]

ToothPhaseB=-ToothPhaseA+0.5*TeethB%2;

PitchDiameterA=TeethA/DiametralPitch;
PitchDiameterB=TeethB/DiametralPitch;


CenterDistance=(PitchDiameterA+PitchDiameterB)/2;

//echo("KNOW THIS!");
//echo("GearA to RingGear CenterDistance is", CenterDistance-PitchDiameterB, "openScad units");

BaseDiameterA=PitchDiameterA*cos(PressureAngle);
BaseDiameterB=PitchDiameterB*cos(PressureAngle);


//automatically cut root interfereance
//RootClearanceB=max(0,0.02*(AddendumA+(PitchDiameterA-BaseDiameterA)/2)+(PitchDiameterA/2 + AddendumA)-(CenterDistance-BaseDiameterB/2));
RootClearanceB=min(max(0,0.02*(AddendumA+(PitchDiameterA-BaseDiameterA)/2)+(PitchDiameterA/2 + AddendumA)-(CenterDistance-BaseDiameterB/2)),AddendumA);


RootClearanceA=min(max(0,0.02*(AddendumB+(PitchDiameterB-BaseDiameterB)/2)+(PitchDiameterB/2 + AddendumB)-(CenterDistance-BaseDiameterA/2)),AddendumB);

if (GearAExists){
scale([Rescale,Rescale,1]){
PolygonGearPatternDirect(AngularResolution =AngularResolution,M=M,Teeth=TeethA,Backlash=BacklashA,PitchDiameter=PitchDiameterA,PressureAngle=PressureAngle,Addendum = AddendumA,RootClearance=RootClearanceA,ToothPhase=ToothPhaseA,debug=debug);
}
}

if (GearBExists){
CenterDistance = GearBCentered ? 0 : CenterDistance-PitchDiameterB; //[1]

translate([CenterDistance,0,0]){
difference(){    
    //RingThickness
    circle(PitchDiameterB/2+PitchDiameterB/2-BaseDiameterB/2+RootClearanceB+RingThickness);
    
scale([Rescale,Rescale,1]){
rotate([0,180,0]){
 //   AddendumB
    
CircularPitchB=PI*PitchDiameterB/TeethB;
X= -1*((PitchDiameterB-BaseDiameterB)/2-(PitchDiameterA-BaseDiameterA)/2); 
    //-(PitchDiameterB-BaseDiameterB)/2;
    //echo(X);
    
XX= AddendumA+ 0.1*(PitchDiameterB/2-BaseDiameterB/2);
PolygonGearPatternDirect(AngularResolution =AngularResolution,M=M,Teeth=TeethB,Backlash=-BacklashB,PitchDiameter=PitchDiameterB,PressureAngle=PressureAngle,Addendum = XX ,RootClearance=X,ToothPhase=ToothPhaseB,debug=debug);

circle(BaseDiameterB/2-X,$fn=TeethB);    
    
    //cruft
    //RootClearance=0*BaseDiameterB/2-0*PitchDiameterB/2+0*AddendumB/8
    
}
}
}
}
}

}//end module





//Quality:
//AngularResolution =.1; //step size for the parameterized involute function
//$fn=60;
//M=10000; //Magnify then shrink factor to prevent point culling

//Gear Parameters
//TeethA=14; //Teeth on first gear
//TeethB=30; //Teeth on second gear
//BacklashA=0;// Added Backlash in millimeters along the pitch circle on Gear A. This loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//BacklashB=0;// Added Backlash in millimeters along the pitch circle on Gear B. This loosens the fit of the gears. Use this instead of the old Rescale parameter. 
//PressureAngle=20; //degrees
//DiametralPitch=0.4; // =Teeth/PitchDiameter (tooth and gear size)
//ToothPhaseA=0; //Rotate the first Gear by X of a tooth, 1 is unity. The tooth is centered on the +X axis. Gear B is advanced by 0.5 and rotated 180 gegrees to enguage GearA
//Rescale=1; // Use BacklashA and BacklashB instead. This is a legacy parameter to that is a Scalar to shrink gears if they printing too tight or loose.(1=normal full size)(center distance will remain uneffected) 
//AddendumA is the distance between the pitch diameter and the outer end of the tooth, on the first gear (For the more studied gearer)
//AddendumB is the distance between the pitch diameter and the outer end of the tooth, on the second gear (For the more studied gearer)
//GearAExists=true //Existance Flag for GearA. (For generating loose parts)
//GearBExists=true //Existance Flag for GearB. (For generating loose parts)
//GearBCentered=false // Bring GearB to the center(for using on parts)
//debug=false; //Debug mode places colored circle at PitchDiaiameter
//Example: 
//PolygonPairGears(TeethA=15,TeethB=30,PressureAngle=20,ToothPhaseA=0.5);
module PolygonPairGears(AngularResolution =0.1,M=10000,TeethA=12,TeethB=20,BacklashA=0,BacklashB=0,PressureAngle=20,DiametralPitch=.6,ToothPhaseA=0,Rescale=1,AddendumA=0,AddendumB=0,GearAExists=true,GearBExists=true,GearBCentered=false,debug=false){

//Test for user defined addendums
AddendumA = AddendumA<=0 ? 1/DiametralPitch : AddendumA; //[1]
AddendumB = AddendumB<=0 ? 1/DiametralPitch : AddendumB; //[1]

ToothPhaseB=ToothPhaseA+0.5;

PitchDiameterA=TeethA/DiametralPitch;
PitchDiameterB=TeethB/DiametralPitch;


CenterDistance=(PitchDiameterA+PitchDiameterB)/2;

//echo("KNOW THIS!");
//echo("GearA to GearB CenterDistance is", CenterDistance, "openScad units");

BaseDiameterA=PitchDiameterA*cos(PressureAngle);
BaseDiameterB=PitchDiameterB*cos(PressureAngle);


//automatically cut root interfereance
//RootClearanceB=max(0,0.02*(AddendumA+(PitchDiameterA-BaseDiameterA)/2)+(PitchDiameterA/2 + AddendumA)-(CenterDistance-BaseDiameterB/2));
RootClearanceB=min(max(0,0.02*(AddendumA+(PitchDiameterA-BaseDiameterA)/2)+(PitchDiameterA/2 + AddendumA)-(CenterDistance-BaseDiameterB/2)),AddendumA);


RootClearanceA=min(max(0,0.02*(AddendumB+(PitchDiameterB-BaseDiameterB)/2)+(PitchDiameterB/2 + AddendumB)-(CenterDistance-BaseDiameterA/2)),AddendumB);

if (GearAExists){
scale([Rescale,Rescale,1]){
PolygonGearPatternDirect(AngularResolution =AngularResolution,M=M,Teeth=TeethA,Backlash=BacklashA,PitchDiameter=PitchDiameterA,PressureAngle=PressureAngle,Addendum = AddendumA,RootClearance=RootClearanceA,ToothPhase=ToothPhaseA,debug=debug);
}
}

if (GearBExists){
CenterDistance = GearBCentered ? 0 : CenterDistance; //[1]

translate([CenterDistance,0,0]){
scale([Rescale,Rescale,1]){
rotate([0,180,0]){
PolygonGearPatternDirect(AngularResolution =AngularResolution,M=M,Teeth=TeethB,Backlash=BacklashB,PitchDiameter=PitchDiameterB,PressureAngle=PressureAngle,Addendum = AddendumB,RootClearance=RootClearanceB,ToothPhase=ToothPhaseB,debug=debug);
}
}
}
}

}//end module


//Quality:
//AngularResolution =.1; //step size for the parameterized involute function
//$fn=60;
//M=10000; //Magnify then shrink factor to prevent point culling

//Gear Parameters
//Teeth=14;
//Backlash=0;// Added Backlash in millimeters along the pitch circle on the Gear. This loosens the fit of the gear.
//PitchDiameter=10;
//PressureAngle=20; //degrees
//Addendum = 1;
//RootClearance=0; //This inverts if you make it larger that the latter calculated BaseRadius
//ToothPhase=0; //Rotate Gear by X of a tooth, 1 is unity. The tooth is centered on the +X axis.

//Example: It makes a polygon that needs extruding
//PolygonGearPatternDirect(Teeth=15,PitchDiameter=19,PressureAngle=30,Addendum = 1,RootClearance=0,ToothPhase=0);

module PolygonGearPatternDirect(AngularResolution =.1,M=10000,Teeth=20,Backlash=0,PitchDiameter=20,PressureAngle=20,Addendum = 1,RootClearance=0,ToothPhase=1,debug=false){
//Dependent Values
BaseDiameter=PitchDiameter*cos(PressureAngle);
BaseRadius=BaseDiameter/2;
PitchRadius=PitchDiameter/2;
OutsideRadius = PitchRadius + Addendum;
CircularPitch=PI*PitchDiameter/Teeth;
PitchAngle=CircularPitch/PitchRadius; //(radian)
  
BacklashAngle = Backlash/PitchRadius; //(radian)
    
A=PitchAngle/4-BacklashAngle/2;
    
    
    
t_p=sqrt(pow(PitchRadius,2)-pow(BaseRadius,2))/BaseRadius; //(radian)
Theta_p=(PI/180)*atan2(sin((180/PI)*t_p)-t_p*cos((180/PI)*t_p),cos((180/PI)*t_p)+t_p*sin((180/PI)*t_p));
    
t_max=min(sqrt(pow(OutsideRadius,2)-pow(BaseRadius,2))/BaseRadius,t_from_theta((Theta_p+A), 4.4, 0)); //(radian)


Theta_max=(PI/180)*atan2(sin((180/PI)*t_max)-t_max*cos((180/PI)*t_max),cos((180/PI)*t_max)+t_max*sin((180/PI)*t_max));

//if (Theta_max < Theta_p){
//  echo("Exception! Gear outside radius smaller than the pitch radius");
//}

t_A=t_max;



t_0= RootClearance < 0 ? sqrt(pow((BaseRadius-RootClearance),2)-pow(BaseRadius,2))/BaseRadius:0; 

Theta_0=(PI/180)*atan2(sin((180/PI)*t_0)-t_0*cos((180/PI)*t_0),cos((180/PI)*t_0)+t_0*sin((180/PI)*t_0));



//echo(A,t_from_theta(-A,-1000,1000),t_A,theta_from_t(-10));
//echo("t_0",t_0,"t_A",t_max);


invpoints = [ for (t = [(180/PI)*t_0 : AngularResolution : (180/PI)*t_A]) BaseRadius*M * ([ cos(t-(180/PI)*(Theta_p+A)), sin(t-(180/PI)*(Theta_p+A)) ] + (PI/180)*t * [sin(t-(180/PI)*(Theta_p+A)),-cos(t-(180/PI)*(Theta_p+A))]) ];


invpointcorner= BaseRadius*M * ([ cos((180/PI)*t_A-(180/PI)*(Theta_p+A)), sin((180/PI)*t_A-(180/PI)*(Theta_p+A)) ] + (PI/180)*(180/PI)*t_A * [sin((180/PI)*t_A-(180/PI)*(Theta_p+A)),-cos((180/PI)*t_A-(180/PI)*(Theta_p+A))]);
  
//=$B$1*(COS(C3-$B$2)+C3*SIN(C3-$B$2))

//=$B$1*(SIN(C3-$B$2)+C3*(-COS(C3-$B$2)))

invpointsR = [ for (t = [(180/PI)*t_A : -AngularResolution : (180/PI)*t_0]) BaseRadius*M * ([ cos(-t+(180/PI)*(Theta_p+A)), sin(-t+(180/PI)*(Theta_p+A)) ] + (PI/180)*t * [-sin(-t+(180/PI)*(Theta_p+A)),cos(-t+(180/PI)*(Theta_p+A))] ) ];

invpointsRcorner= BaseRadius*M * ([ cos(-(180/PI)*t_0+(180/PI)*(Theta_p+A)), sin(-(180/PI)*t_0+(180/PI)*(Theta_p+A)) ] + t_0 * [-sin(-(180/PI)*t_0+(180/PI)*(Theta_p+A)), cos(-(180/PI)*t_0+(180/PI)*(Theta_p+A))] ) ;



Theta_A=PitchAngle/4-Theta_max-BacklashAngle/2;
AddendumPoints = [ for (theta = [-Theta_A*(180/PI) : AngularResolution : Theta_A*(180/PI)]) OutsideRadius*M* ([ cos(theta), sin(theta) ]) ];

Theta_B=Theta_p+A;




Theta_C=0.001+3*PitchAngle/4+BacklashAngle/2+Theta_0;
RootPoints = [ for (theta = [Theta_B*(180/PI) : AngularResolution : Theta_C*(180/PI)]) (BaseRadius-RootClearance)*M* ([ cos(theta), sin(theta) ]) ];

RootPointcorner = (BaseRadius-RootClearance)*M* ([ cos(Theta_C*(180/PI)), sin(Theta_C*(180/PI)) ]);

scale([1/M,1/M,1]){


//linear_extrude(height = 10, center = true, convexity = 10,slices=100){
rotate([0,0,ToothPhase*(180/PI)*PitchAngle]){  
for (a =[0:PitchAngle*(180/PI):360]){
rotate(a = a){
polygon(concat(invpoints,[invpointcorner],AddendumPoints,invpointsR,[invpointsRcorner],RootPoints,[RootPointcorner],[[0,0]]));
}
}
}
}
//text("OpenSCAD");
//sphere(2, $fs = 0.03);
if (debug){
#circle(d=PitchDiameter);
}

}//end module


module ChamferCut(R1,R2,Thickness){
  T=Thickness*2;
  difference(){
  cylinder(h =T, r = 10*R2, center = true);
    
  union(){
  translate([0,0,-T/4]){
  cylinder(h =0.002+T/2, r1 = R2, r2 = R1, center = true);
  }
  translate([0,0,T/4]){
  cylinder(h =0.002+T/2, r1 = R1, r2 = R2, center = true);
  }
}
}
}




function t_from_theta(th, tmx, tmn) = theta_from_t(tmx)-theta_from_t(tmn) < 0.00001 ? tmn:
theta_from_t(tmn+(tmx-tmn)/2) > th ? t_from_theta(th, tmn+(tmx-tmn)/2 , tmn):
t_from_theta(th, tmx, tmn+(tmx-tmn)/2);



function theta_from_t(t) = (PI/180)*atan2(sin((180/PI)*t)-t*cos((180/PI)*t),cos((180/PI)*t)+t*sin((180/PI)*t));
 



//;D ;P ;D ;P ;D ;P ;D ;P ;D ;P ;D ;P 
//;P ;D ;P ;D ;P ;D ;P ;D ;P ;D ;P ;D
//;D ;P ;D SNAXXUS CODE;P ;D ;P ;D ;P 
//;P ;D ;P ;D ;P ;D ;P ;D ;P ;D ;P ;D
//;D ;P ;D ;P ;D ;P ;D ;P ;D ;P ;D ;P 
