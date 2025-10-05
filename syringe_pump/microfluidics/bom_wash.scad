include<arducam-raspi.scad>




module p20_use(){
cylinder(r2=5/2,r1=1/2,h=28,$fn=30);
translate([0,0,28])cylinder(r2=6.1/2,r1=6/2,h=4,$fn=30);
}


module pcr_tube(){

cylinder(r1=6.3/2,r2=2.5/2,h=11.5,$fn=30);
translate([0,0,-9.9])cylinder(r=6.3/2,h=10,$fn=30);


}


module multitip_imager(){
difference(){
union(){
//%color("orange",0.7)translate([8,-2.7-3,0])cube([7,9+2+90-83,10+3]);
translate([8,-2.7-3,0])cube([4,9+2+70,10+3]);
}
gg = 54;
for(i=[0:7]){
translate([12-3+gg/2,8.8-7.1+10-8+gg-40.3+(i*9),6])rotate([90,0,-65])cylinder(r=3.4/2,h=44.5,$fn=30);
translate([12-3+gg/2-22.5-3.2,8.8-7.1+10-8+gg-40.3+(i*9)-12,6])rotate([90,0,-65])cylinder(r=4.8/2,h=24.5,$fn=30);
}
}
}




module singletip_imager(){

//translate([27,4.5,6])rotate([0,-90,0])p20_use();
//color("lightblue")translate([0+2.3,4.5,6])rotate([0,90,0])pcr_tube();
//color("lightblue")translate([0+2.3,4.5,6])rotate([0,90,0])pcr_tube();
//color("blue")translate([12,8.8-7.1-3,6])rotate([90,0,0])cylinder(r=3.2/2,h=4.5,$fn=30);

//%color("orange",0.7)translate([7-4.2,-2.7+4,13.2])cube([20,7,3]);
difference(){
union(){
color("coral")translate([0,8.8,0])cube([20,20,4]);
color("coral")cube([30,9,10+3]);
color("coral")translate([7,-2.7,0])cube([10,9+2,10+3]);
//translate([0,0,10])cube([20,9,8]);
//color("green")translate([6,0,17])cube([14,9,7.5]);
}
//color("lightblue")translate([0+2.3,4.5,6])rotate([0,90,0])pcr_tube();
translate([27,4.5,6])rotate([0,-90,0])p20_use();
translate([12,8.8-7.1,6])rotate([90,0,0])cylinder(r=3.2/2,h=4.5,$fn=30);
translate([10,8.8+11,-6])rotate([0,0,0])cylinder(r=3.8/2,h=24.5,$fn=30);
translate([2.5,1.5,2])cube([25,6,6]);
for(i=[0:3]){
translate([2.5,4.5,6+i/2])rotate([0,90,0])cylinder(r=6.1/2,h=15,$fn=30);
}
/*
*/
for(i=[0:1]){
translate([2.5+15,4.5,6+i/2])rotate([0,90,0])cylinder(r=6.1/2,h=10,$fn=30);
}
translate([-1,4.5,6])rotate([0,90,0])cylinder(r=4.1/2,h=4,$fn=30);
//translate([2.5+10+0-9+7+2,4.5,23+3-4.5-1.5])cylinder(r=3.6/2,h=40,$fn=30);
for(i=[1:5]){
translate([2.5+10+i/2-9+7,4.5,1])cylinder(r=3/2,h=17,$fn=30);
}
}
}


module tslot_hinge_thermalblock(){
translate([0,-1.5,0])difference(){
union(){
color("")translate([-15.5-5-2,-5+10,3-12.1])cube([5+5+2,20,5]);
color("")translate([-15.5-5-2-3,-5+10+7,3-12.1])cube([5+5+2,5,5]);
color("")translate([-15.5-5-2,-5+10,3-12.1-15])cube([4,20,5+15]);
}
color("")translate([-15.5-5+7,-5+20-0.5,3-12.1-50])cylinder(r=4.5/2,h=100,$fn=30);
color("")translate([-15.5-5+7,-5+20-0.5,3-12.1-10])rotate([0,-90,0])cylinder(r=4.5/2,h=100,$fn=30);
}
}





module drillblock_1inch_lid_half(){
difference(){
union(){
translate([-8-4,0-5-4,-8])cube([26+16+8,50.5,4]);
translate([-8-4+0.0,0-5-4,-8-5])cube([3.7,50.5,4+5]);
translate([-8-4+26+16+8-3.6,0-5-4,-8-5])cube([3.6,50.5,4+5]);
translate([-8-4,0-5-4,-8-5])cube([26+16+8,3.5,4+5]);
translate([-8-4,0-5-4+50.5-3.5,-8-5])cube([26+16+8,3.5,4+5]);
//translate([-8,0-3.5,-8])cube([26+16,3.4,4+4]);
}
translate([-24,40-24,-10])rotate([0,90,0])cylinder(r=2.8/2,h=90,$fn=30);
//translate([14,140,-10])rotate([90,0,0])cylinder(r=2.8/2,h=200,$fn=30);
//translate([-8,0,-8])cube([26+16,75,4]);
//cube([25.4+0.6,30,25.4+0.6]);

translate([-4+34/2+3-5+2-2+2.5+2-2-1,6.75+3-5-3,-20])cube([8+2+2,28,20]);
for(i=[0:2]){
translate([-4+34/2+3-5+2-2+2.5+2-2+7.5-4.5,6.75+3-5-3+4+i*7+3.5,-20])cylinder(r=3/2,h=400,$fn=30);
}
for(i=[0:3]){
translate([-4+34/2+3-5+2-2+2.5+2-2+7.5,6.75+3-5-3+4+i*7,-20])cylinder(r=3/2,h=400,$fn=30);
}

/*
for(i=[0:7]){
//translate([-4+34/2+4.5,6.75+i*9+2,-20])cylinder(r=6.9/2,h=90,$fn=30);
//translate([-4+34/2+3,6.75+i*9+3,-20])cylinder(r=6.9/2,h=90,$fn=30);
}
*/
/*
translate([-4,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
*/
}
}












module drillblock_1inch_lid(){
difference(){
union(){
translate([-8-4,0-5-4,-8])cube([26+16+8,77.6+10+8,4]);
translate([-8-4+0.0,0-5-4,-8-5])cube([3.7,77.6+10+8,4+5]);
translate([-8-4+26+16+8-3.6,0-5-4,-8-5])cube([3.6,77.6+10+8,4+5]);
translate([-8-4,0-5-4,-8-5])cube([26+16+8,3.5,4+5]);
translate([-8-4,0-5-4+77.6+10+8-3.5,-8-5])cube([26+16+8,3.5,4+5]);
//translate([-8,0-3.5,-8])cube([26+16,3.4,4+4]);
}
translate([-24,40,-10])rotate([0,90,0])cylinder(r=2.8/2,h=90,$fn=30);
//translate([14,140,-10])rotate([90,0,0])cylinder(r=2.8/2,h=200,$fn=30);
//translate([-8,0,-8])cube([26+16,75,4]);
cube([25.4+0.6,75,25.4+0.6]);
//translate([-4+34/2+3-5+2-2+2.5-2,6.75+3-5-3,-20])cube([8,72+3,20]);
translate([-4+34/2+3-5+2-2+2.5,6.75+3-5-3,-20])cube([8,72+3,20]);
/*
for(i=[0:7]){
//translate([-4+34/2+4.5,6.75+i*9+2,-20])cylinder(r=6.9/2,h=90,$fn=30);
//translate([-4+34/2+3,6.75+i*9+3,-20])cylinder(r=6.9/2,h=90,$fn=30);
}
*/
/*
translate([-4,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
*/
}
}



module drillblock_1inch_lid_milling(){
difference(){
union(){
translate([-8-4+4,0-5-4+4+2,-8])cube([26+16+8-8,77.6+10+8-8-2-5,4]);
//translate([-8-4+0.0,0-5-4,-8-5])cube([3.7,77.6+10+8,4+5]);
//translate([-8-4+26+16+8-3.6,0-5-4,-8-5])cube([3.6,77.6+10+8,4+5]);
//translate([-8-4,0-5-4,-8-5])cube([26+16+8,3.5,4+5]);
//translate([-8-4,0-5-4+77.6+10+8-3.5,-8-5])cube([26+16+8,3.5,4+5]);
translate([-8,0-3.5,-8])cube([26+16,3.4,4+4]);
}
translate([-24,40,-10])rotate([0,90,0])cylinder(r=2.8/2,h=90,$fn=30);
//translate([14,140,-10])rotate([90,0,0])cylinder(r=2.8/2,h=200,$fn=30);
//translate([-8,0,-8])cube([26+16,75,4]);
cube([25.4+0.6,75,25.4+0.6]);
//translate([-4+34/2+3-5+2-2+2.5-2,6.75+3-5-3,-20])cube([8,72+3,20]);
//translate([-4+34/2+3-5+2-2+2.5,6.75+3-5-3,-20])cube([8,72+3,20]);
for(i=[0:7]){
translate([-4+34/2+4.5,6.75+i*9+2-3,-20-100])cylinder(r=1.8/2,h=290,$fn=30);
//translate([-4+34/2+3,6.75+i*9+3,-20])cylinder(r=6.9/2,h=90,$fn=30);
}
/*
*/
translate([-4,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=3.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=3.8/2,h=90,$fn=30);
/*
*/
}
}



module drillblock_1inch(){
difference(){
union(){
translate([-8,-5,-8])cube([26+16,77.6+10,26+8+3.2+1.88-6]);
translate([-8,-5-15,-8])cube([26+16,77.6+10+32,5]);
}
//translate([0,-0.3,0])cube([25.4+0.6,77+0.6,25.4+0.7]);
translate([-1.5-0.2,-0.3-0.5,0-6])cube([25.4+0.6+3+0.4,77+0.6+1,25.4+0.7+14-8]);
translate([0,-0.3+0.3,2.5])cube([25.4+0.6,77+0.6+0.4,25.4+0.7+2.5+5]);//with rubber gasket which is 2.5mm thick
/*
translate([-4,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
*/

translate([-4+34-5,65+26,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-30,65+26,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-5,-12,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-30,-12,-20])cylinder(r=4.2/2,h=90,$fn=30);


/*
for(i=[-2:2]){
translate([0,i,0]){
translate([-4+34-5-2,-12+25,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2-20,-12+25,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2,-12+25+53.5,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2,-12+25+53.5/2,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5/2,-20])cylinder(r=8.5/2,h=15,$fn=30);
translate([-4+34-5-2,-12+25,-20])cylinder(r=5.5/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25,-20])cylinder(r=5.5/2,h=90,$fn=30);
translate([-4+34-5-2,-12+25+53.5,-20])cylinder(r=5.5/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5,-20])cylinder(r=5.5/2,h=90,$fn=30);
translate([-4+34-5-2,-12+25+53.5/2,-20])cylinder(r=5.5/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5/2,-20])cylinder(r=5.5/2,h=90,$fn=30);
}
}
*/


translate([0,0,1.5-6]){
translate([12.25-4,-50,10+2])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
translate([12.25-4,-50,10])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
translate([12.25-4,-50,10-2])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
for(i=[-4:4]){
translate([-32.25,75/2+i,10])rotate([-0,90,0])cylinder(r=4/2,h=40,$fn=30);
translate([-32.25,10+i,10])rotate([-0,90,0])cylinder(r=5/2,h=50,$fn=30);
translate([-32.25,75-10+i,10])rotate([-0,90,0])cylinder(r=5/2,h=50,$fn=30);
}
}
//translate([12.25-8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([12.25+8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
}
}



module drillblock_1inch_milling(){
difference(){
union(){
translate([-8,-5+5,-8])cube([26+16,77.6+10-10,26+8+3.2]);
//translate([-8,-5-15,-8])cube([26+16,77.6+10+32,5]);
}
translate([0,-0.3+0.3,0+0.65])cube([25.4+0.6,77+0.6+0.4,25.4+0.7+2.5]);//with rubber gasket which is 2.5mm thick
//translate([-1.5-0.2,-0.3-0.5,0])cube([25.4+0.6+3+0.4,77+0.6+1,25.4+0.7+4]);
translate([-4,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
/*
*/

translate([-4+34-5,65+26,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-30,65+26,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-5,-12,-20])cylinder(r=4.2/2,h=90,$fn=30);
translate([-4+34-30,-12,-20])cylinder(r=4.2/2,h=90,$fn=30);

translate([-4+34-5-2,-12+25,-20])cylinder(r=2.7/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25,-20])cylinder(r=2.7/2,h=90,$fn=30);
translate([-4+34-5-2,-12+25+53.5,-20])cylinder(r=2.7/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5,-20])cylinder(r=2.7/2,h=90,$fn=30);
translate([-4+34-5-2,-12+25+53.5/2,-20])cylinder(r=2.7/2,h=90,$fn=30);
translate([-4+34-5-2-20,-12+25+53.5/2,-20])cylinder(r=2.7/2,h=90,$fn=30);

translate([0,0,1.5]){
translate([12.25-4,-50,10+2])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
translate([12.25-4,-50,10])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
translate([12.25-4,-50,10-2])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
/*
for(i=[-4:4]){
translate([-32.25,75/2+i,10])rotate([-0,90,0])cylinder(r=4/2,h=40,$fn=30);
translate([-32.25,10+i,10])rotate([-0,90,0])cylinder(r=5/2,h=50,$fn=30);
translate([-32.25,75-10+i,10])rotate([-0,90,0])cylinder(r=5/2,h=50,$fn=30);
}
*/
}
//translate([12.25-8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([12.25+8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
}
}









module thermoblock_holder_1inch_half(){
translate([0,0,8])difference(){
union(){
translate([-8,-5-1.5,-8])cube([26+16,77.6+10-45,26+1.5]);
translate([-8-9,-5-1.5,-8])cube([26+16+18,77.6+10-45,5]);
}
//translate([-8,-5,-8])cube([26+16,(77.6+10)/2,26+1.5]);
//translate([-8-9,-5,-8])cube([26+16+18,(77.6+10)/2,5]);
translate([0,-1.5,-8]){
translate([-1.5-0.2,-0.3,-0.1])cube([25.4+0.6+3+0.4,32+0.6,25.4+0.7+4]);
/*
translate([-4-0,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
*/
for(i=[-3:3]){
translate([-32.25,48/2+i/3+1,10+5])rotate([-0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([-32.25,10+i,10-3.4])rotate([-0,90,0])cylinder(r=3/2,h=50,$fn=30);
translate([-32.25,10+i,10+10])rotate([-0,90,0])cylinder(r=3/2,h=50,$fn=30);
//translate([-32.25,75-10+i,10])rotate([-0,90,0])cylinder(r=4.8/2,h=50,$fn=30);
}
translate([12.25-4,-50,19])rotate([-90,0,0])cylinder(r=9/2,h=70,$fn=30);
//translate([12.25-4,-50,10])rotate([-90,0,0])cylinder(r=9/2,h=70,$fn=30);
translate([12.25-4,-50,6])rotate([-90,0,0])cylinder(r=9/2,h=70,$fn=30);
//translate([12.25-8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([12.25+8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
translate([42.5,-8,0])rotate([0,180,0]){
translate([5,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
translate([5+51,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
}
translate([42.5,38,0])rotate([0,180,0]){
translate([5,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
translate([5+51,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
}
}
}
}
























module thermoblock_holder_1inch(){
translate([0,0,8])difference(){
union(){
translate([-8,-5,-8])cube([26+16,77.6+10,26+1.5]);
translate([-8-9,-5,-8])cube([26+16+18,77.6+10,5]);
}
//translate([-8,-5,-8])cube([26+16,(77.6+10)/2,26+1.5]);
//translate([-8-9,-5,-8])cube([26+16+18,(77.6+10)/2,5]);
translate([0,0,-8]){
translate([-1.5-0.2,-0.3,0])cube([25.4+0.6+3+0.4,77+0.6,25.4+0.7+4]);
/*
translate([-4-0,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,10,-20])cylinder(r=2.8/2,h=90,$fn=30);
translate([-4+34,65,-20])cylinder(r=2.8/2,h=90,$fn=30);
*/
for(i=[-3:3]){
translate([-32.25,75/2+i,10])rotate([-0,90,0])cylinder(r=3.2/2,h=40,$fn=30);
translate([-32.25,10+i,10])rotate([-0,90,0])cylinder(r=4.8/2,h=50,$fn=30);
translate([-32.25,75-10+i,10])rotate([-0,90,0])cylinder(r=4.8/2,h=50,$fn=30);
}
translate([12.25-4,-50,11])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
translate([12.25-4,-50,10])rotate([-90,0,0])cylinder(r=9/2,h=250,$fn=30);
//translate([12.25-8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([12.25+8,-50,10+10])rotate([-90,0,0])cylinder(r=2.8/2,h=250,$fn=30);
translate([42.5,-8,0])rotate([0,180,0]){
translate([5,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
translate([5+51,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
}
translate([42.5,38,0])rotate([0,180,0]){
translate([5,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
translate([5+51,45/2,-20])cylinder(r=3.7/2,h=40,$fn=30);
}
}
}
}



module actualthermoblock_1inch_half_3heater(){
/*
for(i=[0:3]){
color("lightblue")translate([19.5,4.5+7*i,30-0])rotate([0,180,0])pcr_tube();
}
for(i=[0:1]){
color("lightblue")translate([19.5-1,4.5+9*i+2,30-0])rotate([0,180,0])pcr_tube();
}
*/
difference(){
translate([0.3,0,0])color("silver")cube([25.4,39-8,25.4]);

/*
translate([-2,2.5,0]){
for(i=[-1:2]){
//translate([-4+34/2+4+2.5-4.5,6.25+i*9+4.5,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
//translate([-4+34/2+4+2.5-4.5,6.25+i*9+4.5,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
translate([-4+34/2+4+2.5-2.5+4.5,6.25+i*7+3,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+2.5-2.5+4.5,6.25+i*7+3,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
}
*/
for(i=[0:3]){
translate([-4+34/2+4+4,5.25+i*7,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+4,5.25+i*7,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
translate([-4+34/2+4+4-9,5.25+i*7,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+4-9,5.25+i*7,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
}


for(i=[0:2]){
translate([-4+34/2+4+4-4.5,3.5+5.25+i*7,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+4-4.5,3.5+5.25+i*7,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
}



//}
//translate([12.25-4,-50,10+19])rotate([-90,0,0])cylinder(r=6/2,h=50+22,$fn=30);
translate([12.25-4-2,-50,10-4])rotate([-90,0,0])cylinder(r=6/2,h=72,$fn=30);
translate([-32.25,24.5,10+5])rotate([-0,90,0])cylinder(r=2.6/2,h=35,$fn=30);

/*
translate([0,0,6.5]){
translate([12.25-4-2,-50,10-4])rotate([-90,0,0])cylinder(r=6/2,h=72,$fn=30);
translate([-32.25,10,10-3.4])rotate([-0,90,0])cylinder(r=2.9/2,h=40,$fn=30);
}
*/

translate([-32.25,10,10-3.4])rotate([-0,90,0])cylinder(r=2.9/2,h=40,$fn=30);
translate([-32.25,10,10+10])rotate([-0,90,0])cylinder(r=2.9/2,h=40,$fn=30);
translate([12.25-4-2,-50,10+9])rotate([-90,0,0])cylinder(r=6/2,h=72,$fn=30);
//translate([-32.25,75/2-14,10])rotate([-0,90,0])cylinder(r=2/2,h=250,$fn=30);
//translate([-32.25,10,10])rotate([-0,90,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([-32.25,75-10,10])rotate([-0,90,0])cylinder(r=2.8/2,h=250,$fn=30);
}
}



module actualthermoblock_1inch_half(){
/*
for(i=[0:3]){
color("lightblue")translate([19.5,4.5+7*i,30-0])rotate([0,180,0])pcr_tube();
}
*/
for(i=[0:1]){
color("lightblue")translate([19.5-1,4.5+9*i+2,30-0])rotate([0,180,0])pcr_tube();
}
difference(){
translate([0.3,0,0])color("silver")cube([25.4,39-8,25.4]);

/*
translate([-2,2.5,0]){
for(i=[-1:2]){
//translate([-4+34/2+4+2.5-4.5,6.25+i*9+4.5,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
//translate([-4+34/2+4+2.5-4.5,6.25+i*9+4.5,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
translate([-4+34/2+4+2.5-2.5+4.5,6.25+i*7+3,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+2.5-2.5+4.5,6.25+i*7+3,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
}
*/
for(i=[0:2]){
translate([-4+34/2+4+2.5,6.25+i*9,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
translate([-4+34/2+4+2.5,6.25+i*9,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
//translate([-4+34/2+4+2.5+4.5,6.25+i*9,2])cylinder(r2=4/2,r1=2/2,h=23.5,$fn=30);
//translate([-4+34/2+4+2.5+4.5,6.25+i*9,23.5])cylinder(r2=4/2,r1=4/2,h=2,$fn=30);
}
//}
//translate([12.25-4,-50,10+19])rotate([-90,0,0])cylinder(r=6/2,h=50+22,$fn=30);
translate([12.25-4,-50,10-4])rotate([-90,0,0])cylinder(r=6/2,h=72,$fn=30);
translate([-32.25,24.5,10+5])rotate([-0,90,0])cylinder(r=2.6/2,h=45,$fn=30);
translate([-32.25,10,10-3.4])rotate([-0,90,0])cylinder(r=2.9/2,h=40,$fn=30);
translate([-32.25,10,10+10])rotate([-0,90,0])cylinder(r=2.9/2,h=40,$fn=30);
translate([12.25-4,-50,10+9])rotate([-90,0,0])cylinder(r=6/2,h=72,$fn=30);
//translate([-32.25,75/2-14,10])rotate([-0,90,0])cylinder(r=2/2,h=250,$fn=30);
//translate([-32.25,10,10])rotate([-0,90,0])cylinder(r=2.8/2,h=250,$fn=30);
//translate([-32.25,75-10,10])rotate([-0,90,0])cylinder(r=2.8/2,h=250,$fn=30);
}
}











module actualthermoblock_1inch(){
difference(){
translate([0.3,0,0])color("silver")cube([25.4,76,25.4]);
for(i=[0:7]){
//translate([-4+34/2+4,6.25+i*9,1.5])cylinder(r=4/2,h=70,$fn=30);
translate([-4+34/2+4,6.25+i*9,1.5])cylinder(r=6.3/2,h=70,$fn=30);
}
translate([12.25-4,-50,10-5])rotate([-90,0,0])cylinder(r=6.1/2,h=250,$fn=30);
translate([-32.25,75/2,10-5.5])rotate([-0,90,0])cylinder(r=2/2,h=50,$fn=30);
translate([-32.25,10,10-5.5])rotate([-0,90,0])cylinder(r=2.8/2,h=40,$fn=30);
translate([-32.25,75-10,10-5.5])rotate([-0,90,0])cylinder(r=2.8/2,h=40,$fn=30);
}
}






module master_mix_reservoir(){
translate([0-9,0,0])difference(){
color("silver")translate([19.05,-12.95+0.4,-20.5])cube([20.4+19.4,72.85-0.8,17.5]);

translate([0,0,0]){
translate([19.05+1,-12.95+3,-20.5-17.5+10])cube([12+6,72.85-6,17.5]);
for(i=[-4:4]){
translate([19.05+1+8.5+i,-12.95+3,-20.5-17.5+25])rotate([-90,0,0])cylinder(r=10/2,h=67,$fn=30);
if(i==0){
translate([19.05+1+8.5+i,-12.95+3,-20.5-17.5+26])rotate([-90,0,0])cylinder(r=14/2,h=67,$fn=30);
}
}
}

translate([19,0,0]){
translate([19.05+1,-12.95+3,-20.5-17.5+10])cube([12+6,72.85-6,17.5]);
for(i=[-4:4]){
translate([19.05+1+8.5+i,-12.95+3,-20.5-17.5+25])rotate([-90,0,0])cylinder(r=10/2,h=67,$fn=30);
if(i==0){
translate([19.05+1+8.5+i,-12.95+3,-20.5-17.5+26])rotate([-90,0,0])cylinder(r=14/2,h=67,$fn=30);
}
}
}








}
}

module fan_40mm(){
cube([40,40,10]);
}

module thermoelectric_module(){
color("white")translate([10,2.5,-3])cube([40,40,3]);
}



module heatsink_plate(){
color("silver")difference(){
union(){
cube([60,45,4]);

/*
//translate([17/2,0,0])cube([43,45,28]);
for(i=[0:7]){
translate([17/2+i*6,0,0])cube([2,45,28]);
}
*/
}
translate([5,45/2,-5])cylinder(r=4.7/2,h=40,$fn=30);
translate([5+51,45/2,-5])cylinder(r=4.7/2,h=40,$fn=30);
}
}





module heatsink(){
color("silver")difference(){
union(){
cube([60,45,4]);
//translate([17/2,0,0])cube([43,45,28]);
for(i=[0:7]){
translate([17/2+i*6,0,0])cube([2,45,28]);
}
}
translate([5,45/2,-5])cylinder(r=4.7/2,h=40,$fn=30);
translate([5+51,45/2,-5])cylinder(r=4.7/2,h=40,$fn=30);
}
}






module thermoblock_breadboard_slider(){

translate([39,-5,0])rotate([0,90,0])difference(){
union(){
translate([4,16.5,-7])rotate([90,0,0]){
translate([-4,-3,-15])
translate([0,0-25-15,35.5-10+6])cube([7,93+0,17.5]);
//translate([-4,-3,-15])
//translate([-3,0-25-15+30,35.5-10+6])cube([7,63+0,17.5]);
}
//translate([-3.1+7.3,-11.725-15,-17.5-17.5+7.05 ])rotate([90,0,90]){cylinder(r=9.9/2,h=7.8);}
//translate([-3.1+7.3,-34+22.27-15,-17.5+56.55 ])rotate([90,0,90]){cylinder(r=9.9/2,h=10.53);}
}

/*
translate([30,-4,-30+83+15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-13,-30+83+15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-4,-30-15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-13,-30-15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
*/
/*
translate([0-2,-7.5+2.8-4+0.3,16+13-6+4.5-8]){
for(i=[-0:9]){
 for(j=[-1:3]){
 translate([-3.1-80,-11.725-15+5+5+j,-17.5+2-36+3+i*9 ])rotate([90,0,90]){translate([0,0,82.06])cylinder(r=8/2,h=3.5);cylinder(r=3.7/2,h=500);}
 }
}
}
*/
//translate([0-20,26-5-30+1,-27+24])rotate([0,90,0])cylinder(r=3.8/2,h=200,$fn=30);
//translate([0-20,26-5-30+1,-27+54])rotate([0,90,0])cylinder(r=3.8/2,h=200,$fn=30);
for(i=[-20:58]){
translate([0-10,26-5-30,-27+i+5])rotate([0,90,0])cylinder(r=5/2,h=20);
translate([0-10+12,26-5-30,-27+i+5])rotate([0,90,0])cylinder(r=12/2,h=20);
}
/*
*/
}
}










module thermoblockcombo(){
thermoblock();
translate([40,0,0])thermoblock();
}
module imagingblock(){
 translate([-40,42,18-4])rotate([90,0,90])color("grey")import("arducam_case.stl"); 
 //color("lightblue")cube([22,(79*2),27]);
 difference(){
 color("LemonChiffon")union(){
 translate([-3-33,-3+20,-3])cube([40+8,(15),24]);
 translate([-3-33,-3+65,-3])cube([40+8,(15),24]);
 translate([-3-20,-3,-3])cube([40+8,((77*1.2)+8),40]);
 translate([-51+19,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=(13.5+16)/2,h=40,$fn=30);
 }
 //cube([22,(79*2),27]);
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 translate([-51,24,13])rotate([0,90,0])cylinder(r=5.5/2,h=30,$fn=30);
 translate([-51,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=13.5/2,h=40,$fn=30);
 translate([-51,24+45,13])rotate([0,90,0])cylinder(r=5.5/2,h=30,$fn=30);
 }
}

module imagingblock_base(){
 //translate([-40,42,18-4])rotate([90,0,90])color("LemonChiffon")import("arducam_case.stl"); 
 //color("lightblue")cube([22,(79*2),27]);
 difference(){
 color("grey")union(){
 //translate([-3-33,-3+20,-3])cube([40+8,(15),24]);
 //translate([-3-33,-3+65,-3])cube([40+8,(15),24]);
 translate([-3-20,-3,-3])cube([40+8,((77*1.2)+8),40]);
 //translate([-51+19,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=(13.5+16)/2,h=40,$fn=30);
 }
 translate([-3-20+8,-3+7,-3+4])cube([40-8,((77*1.2))-6,40]);
 translate([-3-20+10+28,-3+7+12-6,-3+4-3.5])cube([40-8+7-32,((77*1.2))-6-18,40]);
 translate([-3-20+10+28,-3+7+12,-3+4-1])cube([40-8+7-21,((77*1.2))-6-24,40]);
 translate([-3-20+8-10,-3+7+7-3,-3+4+8])cube([70-8-5,((77*1.2))-6-14+3,18+13]);
 translate([-3-20+8-10+41,-3+7+7-2,-3+4+8-9.5])cube([9.5,13,18+13]);

 translate([20-22-60+78,1+7-2+4,23+8-12])rotate([0,90,0])cylinder(r=14/2,h=50,$fn=30);
 translate([20-22-60+78,1+7-2+4,23+8-13])rotate([0,90,0])cylinder(r=14/2,h=50,$fn=30);

 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 }
 translate([20,1,23])cylinder(r=2.9/2,h=50,$fn=30);
 translate([20,1+93,23])cylinder(r=2.9/2,h=50,$fn=30);
 translate([-39,0,0]){
 translate([20,1,23])cylinder(r=2.9/2,h=50,$fn=30);
 translate([20,1+93,23])cylinder(r=2.9/2,h=50,$fn=30);
 }
 //cube([22,(79*2),27]);
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 translate([-51,24,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=13.5/2,h=40,$fn=30);
 translate([-51,24+45,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 }
}




module imagingblock_lid(){
 difference(){
 color("grey")union(){
 translate([-3-20-5,-3,-3+40])cube([40+8+10,((77*1.2)+8),5]);
 translate([-3-20-5-50-35,-3+35,-3+40])cube([40+8+10+50+35,30,4]);
 translate([-3-20-5-50-35+20,-3+35+10,-3+40])cube([40+8+10+50+35-65,10,4+5]);
 }
 translate([11-80-35,38,23])cylinder(r=4.7/2,h=50,$fn=30);
 translate([11-80-35,37+18,23])cylinder(r=4.7/2,h=50,$fn=30);

 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=2.9/2,h=250,$fn=30);
 }
 translate([20,1,23])cylinder(r=4.9/2,h=50,$fn=30);
 translate([20,1+93,23])cylinder(r=4.9/2,h=50,$fn=30);
 translate([-39,0,0]){
 translate([20,1,23])cylinder(r=4.9/2,h=50,$fn=30);
 translate([20,1+93,23])cylinder(r=4.9/2,h=50,$fn=30);
 }
 translate([11+7-5-2,16-4-2,38-3])cube([13,72+3,30]);
 translate([-51,24,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=13.5/2,h=40,$fn=30);
 translate([-51,24+45,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 }
}























module imagingblock_imagingside(){
 difference(){
 color("")union(){
 translate([-3-20-5,-3,-3])cube([5,((77*1.2)+8),40]);
 translate([-51+24.4,24+45/2+0.4+0+0.2-25-11.,22+14])rotate([0,-180,-40])cube([6+1+12,6,16+15]);
 translate([-51+24-10.5,24+45/2+0.4+0+0.2-25,22+14])rotate([0,-180,-0])cube([4+12+12,6,16+15]);
 translate([-51+24+5,24+45/2+0.4+0+0.2-25+43.5+13,22+14])rotate([0,-180,40])cube([6+1+13,6,16+15]);
 translate([-51+24-10.5,24+45/2+0.4+0+0.2-25+43.5,22+14])rotate([0,-180,0])cube([4+12+12,6,16+15]);
 translate([-51+24,24+45/2+0.4+0+0.2-25+43.5-40-3.5-8,22+14+1])rotate([0,-180,0])cube([6+1+7.5,49.5+17,3]);
 translate([-51+24,24+45/2+0.4+0+0.2-25+43.5-40-3.5-8+8,22+14+1])rotate([0,-180,0])cube([6+1+7.5+12+12,49.5+17-17,3]);
 translate([-51+24,24+45/2+0.4+0+0.2-25+43.5-40-3.5-8,22+14+1-32])rotate([0,-180,0])cube([6+1+7.5,49.5+17,3]);
 translate([-51+24,24+45/2+0.4+0+0.2-25+43.5-40-3.5-8+8,22+14+1-32])rotate([0,-180,0])cube([6+1+7.5+12+12,49.5+17-17,3]);
}
 translate([-3-20-5+5,-3,-3])cube([5,((77*1.2)+8),40]);
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 }
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 translate([-51-20,24+1,13])rotate([0,90,0])cylinder(r=3.8/2,h=140,$fn=30);
 translate([-51-20,24+1,13+18])rotate([0,90,0])cylinder(r=3.8/2,h=140,$fn=30);
 for(i=[-4:4]){
 translate([-51+22,24+45/2+0.4+i+0.2-5.5-9.5-7.5,22-4.5-13])cube([25+6,25+4.5+14.5,29.5]);
 }
 translate([-51-20,24+45-0.4,13])rotate([0,90,0])cylinder(r=3.8/2,h=140,$fn=30);
 translate([-51-20,24+45-0.4,13+18])rotate([0,90,0])cylinder(r=3.8/2,h=140,$fn=30);
 }
}


module imagingblock_lightingside_diffuser(){
 difference(){
 union(){
 translate([-3-20-5-2,-3+15-2,-3+14])cube([5-4,((77*1.2)+8)-30+2,40-18]);
 translate([-3-20-5-2,-3+15-2-5,-3+14])cube([5-4,((77*1.2)+8)-30+2+10,40-18-6]);
 }
 translate([-51,24,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24,13+17.5])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45,13+17.5])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45,13])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 }
}

module imagingblock_lightingside(){
 difference(){
 color("")union(){
 translate([-3-20-5,-3,-3])cube([5,((77*1.2)+8),40]);
  translate([0,0,5]){
  difference(){
  union(){
  translate([-16-16-1,6-2,40-10+2-16])cube([5,75,5]);
  translate([-16-16-1-1,6-2,40-10+2-16])cube([7,75,5]);
  }
  for(i=[-1:7]){
   translate([-16-15.5,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   translate([-16-15.5-1,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   translate([-16-15.5-2,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   translate([0,0.5,0]){
   translate([-16-15.5,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   translate([-16-15.5-1,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   translate([-16-15.5-2,6+0+8.75+(i*9)-0.5,40-10+2-16-10])cylinder(r=6/2,h=40,$fn=30);
   }
  }
  }
  }
  gg = 54;
 }
 translate([0,0,5])for(i=[0:7]){
  //translate([-16-16+10,10.5+i*9-2,40-10+2-12.5-1.4])rotate([0,180,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.4/2,h=15.5,$fn=30);
  translate([-16-16+10,10.5+i*9-0.4,40-10+2-12.5-1.4-9])rotate([0,180,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.4/2,h=15.5,$fn=30);
  translate([-16-16+10-10.5-0.5,10.5+i*9-0.4,40-10+2-12.5-1.4-3+12])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=30);

  translate([-16-16+10-10.5-0.5,10.5+i*9-0.4+1.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5,10.5+i*9-0.4+1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+0.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
 for(jj=[-1,0,1]){
 translate([jj,0,0]){
  translate([-16-16+10-10.5-0.5,10.5+i*9-0.4+1.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5,10.5+i*9-0.4+1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+0.5,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1-1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2-0.5,10.5+i*9-0.4+1-1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2,10.5+i*9-0.4+1,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2-0.5,10.5+i*9-0.4+1-0.7,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
  translate([-16-16+10-10.5-0.5+0.2-0.5+0.5,10.5+i*9-0.4+1-0.7,40-10+2-12.5-1.4-3+12+6.9])rotate([0,180-90,0])translate([12-3+gg/2-45,8.8-7.1+10-8+gg-40.3-13,14-1.75])rotate([-90,45,-90])cylinder(r=1.2/2,h=15.5,$fn=4);
 }
}
}
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-21-2,1+7-2,23+8])rotate([0,90,0])cylinder(r=8.3/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-21-2,1+7+80,23+8])rotate([0,90,0])cylinder(r=8.3/2,h=50,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-21-2,1+7-2,23+8])rotate([0,90,0])cylinder(r=8.3/2,h=250,$fn=30);
 translate([20-22-21-2,1+7+80,23+8])rotate([0,90,0])cylinder(r=8.3/2,h=50,$fn=30);
 }
 //cube([22,(79*2),27]);
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 }
}
































module imagingblock_diffuser_bluewhite(){

 difference(){
 union(){
 translate([-51+15+5+1.5,24+45/2+0.4,22+3-5])rotate([0,90,0])roundedRect([14.5+2,72+2,0.5],3.5);
 translate([-51+15+5,24+45/2+0.4-30,22+3-4+8])cube([2,15,7]);
 translate([-51+15+5,24+45/2+0.4-30+45,22+3-4+8])cube([2,15,7]);
 translate([-51+15+5,24+45/2+0.4-30,22+3-4-21+0])cube([2,15,11]);
 translate([-51+15+5,24+45/2+0.4-30+45,22+3-4-21])cube([2,15,11]);
 }
 translate([-51,24,13+17.5+2])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45,13+17.5+2])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24,13-9])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-51,24+45,13-9])rotate([0,90,0])cylinder(r=3.8/2,h=40,$fn=30);

 }

}

module imagingblock_lightingside_bluewhite(){
 //translate([-40,42,18-4])rotate([90,0,90])color("grey")import("arducam_case.stl"); 
 //color("lightblue")cube([22,(79*2),27]);
 difference(){
 color("grey")union(){
 //translate([-3-33,-3+20,-3])cube([40+8,(15),24]);
 //translate([-3-33,-3+65,-3])cube([40+8,(15),24]);
 translate([-3-20-5,-3,-3])cube([5,((77*1.2)+8),40]);
 //translate([-51+19,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=(13.5+16)/2,h=40,$fn=30);
 }
 //translate([-3-20+8,-3+7,-3+4])cube([40-8,((77*1.2))-6,40]);
 //translate([-3-20+8-10,-3+7+7,-3+4+8])cube([70-8-5,((77*1.2))-6-14,18+13]);
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 }
 //cube([22,(79*2),27]);
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 translate([-51+15+5,24+45/2+0.4,22+3-5])rotate([0,90,0])roundedRect([14.5,72,12.5],3.5);
//cube([30,100,5]);
 /*
 for(i=[-34:34]){
 translate([-51+5,24+45/2+0.4+i,22+3])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22+2])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22+2])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22+1])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-1])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-2])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-3])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-4])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-5])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-6])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 translate([-51+5,24+45/2+0.4+i,22-7])rotate([0,90,0])cylinder(r=8/2,h=40,$fn=30);
 }
 */


 translate([-51,24,13+17.5+2])rotate([0,90,0])cylinder(r=4.2/2,h=40,$fn=30);
 translate([-51,24+45,13+17.5+2])rotate([0,90,0])cylinder(r=4.2/2,h=40,$fn=30);
 translate([-51,24,13-9])rotate([0,90,0])cylinder(r=4.2/2,h=40,$fn=30);
 translate([-51,24+45,13-9])rotate([0,90,0])cylinder(r=4.2/2,h=40,$fn=30);
 }
}








module imagingblock_lightingholder_whiteled(){

for(i=[0:12]){
translate([0,i*6.4+1,0]){
translate([-20,8,21])rotate([0,90,0])cylinder(r=6.2/2,h=7,$fn=30);
translate([-20,8,21-1.3])rotate([0,90,0])cylinder(r=0.5/2,h=30,$fn=30);
translate([-20,8,21-1.3+3])rotate([0,90,0])cylinder(r=0.5/2,h=30,$fn=30);
}
}
}




module imagingblock_lightingholder_led(){
for(i=[0:21]){
translate([0,i*3.7+1,0]){
translate([-20,8,21+0.2])rotate([0,90,0])cylinder(r=4.2/2,h=7,$fn=30);
translate([-20,8,21-1.3])rotate([0,90,0])cylinder(r=0.5/2,h=30,$fn=30);
translate([-20,8,21-1.3+3])rotate([0,90,0])cylinder(r=0.5/2,h=30,$fn=30);
}
}
}




module imagingblock_lightingholder(){
 //translate([-40,42,18-4])rotate([90,0,90])color("grey")import("arducam_case.stl"); 
 //color("lightblue")cube([22,(79*2),27]);
 difference(){
 color("")union(){
 //translate([-3-33,-3+20,-3])cube([40+8,(15),24]);
 //translate([-3-33,-3+65,-3])cube([40+8,(15),24]);
 //translate([-3-20-5,-3,-3])cube([5,((77*1.2)+8),40]);
 translate([11-32,14+0*9-2,23-5-8-2])cube([9.9,70,25+4]);
 translate([11-32,14+0*9-2-10,23-5-8-2+7])cube([9.9,70+22,12]);
 //translate([-51+19,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=(13.5+16)/2,h=40,$fn=30);
 }
 //translate([-3-20+8,-3+7,-3+4])cube([40-8,((77*1.2))-6,40]);
 //translate([-3-20+8-10,-3+7+7,-3+4+8])cube([70-8-5,((77*1.2))-6-14,18+13]);
 /* 
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 }
 */
 //cube([22,(79*2),27]);
 /*
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 */
 translate([11-32-3,14+0*9-2-10+3,23-5-8-2+7.5+1])cube([9.9,70+14+2,11-2]);
 translate([-51,24,13])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-51,24,13+17.5])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-11,24,13])rotate([0,-90,0])cylinder(r=8/2,h=3,$fn=30);
 translate([-11,24,13+17.5])rotate([0,-90,0])cylinder(r=8/2,h=3,$fn=30);



 /*
 for(i=[-25:25]){
 translate([-51,24+45/2+0.4+i,22])rotate([0,90,0])cylinder(r=12/2,h=40,$fn=30);
 }
 */
 //translate([-5-13,24+45,13+17.5-9])rotate([90,0,0])cylinder(r=4.8/2,h=80,$fn=30);
 translate([-51,24+45,13+17.5])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-51,24+45,13])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-11,24+45,13+17.5])rotate([0,-90,0])cylinder(r=8/2,h=3,$fn=30);
 translate([-11,24+45,13])rotate([0,-90,0])cylinder(r=8/2,h=3,$fn=30);
 for(i=[0:21]){
 translate([0,i*3.7+1,0]){
 translate([-20,8,21-1.3])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 translate([-20,8,21-1.3+2.5])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 }
 }
 }
}





module imagingblock_lightingholder_bluewhite(){
 //translate([-40,42,18-4])rotate([90,0,90])color("grey")import("arducam_case.stl"); 
 //color("lightblue")cube([22,(79*2),27]);
 difference(){
 color("")union(){
 //translate([-3-33,-3+20,-3])cube([40+8,(15),24]);
 //translate([-3-33,-3+65,-3])cube([40+8,(15),24]);
 //translate([-3-20-5,-3,-3])cube([5,((77*1.2)+8),40]);
 translate([11-32,14+0*9-2,23-5-8-2-8])cube([9.9,70,25+4+8]);
 translate([11-32,14+0*9-2-10,23-5-8-2+7+2-10])cube([9.9,70+22,12+10]);
 //translate([-51+19,24+45/2+0.4,22])rotate([0,90,0])cylinder(r=(13.5+16)/2,h=40,$fn=30);
 }
 //translate([-3-20+8,-3+7,-3+4])cube([40-8,((77*1.2))-6,40]);
 //translate([-3-20+8-10,-3+7+7,-3+4+8])cube([70-8-5,((77*1.2))-6-14,18+13]);
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([0,0,-27]){
 translate([20-22-60,1+7-2,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 translate([20-22-60,1+7+80,23+8])rotate([0,90,0])cylinder(r=3.9/2,h=250,$fn=30);
 }
 //cube([22,(79*2),27]);
 /*
 for(i=[0:7]){
 translate([11,14+i*9,23])cylinder(r=5.5/2,h=50,$fn=30);
 }
 */
 translate([11-32-3,14+0*9-2-10+3,23-5-8-2+7.5+1+2-9])cube([9.9,70+14+2,11-2+9]);
 /*
 for(i=[-25:25]){
 translate([-51,24+45/2+0.4+i,22])rotate([0,90,0])cylinder(r=12/2,h=40,$fn=30);
 }
 */
 //translate([-5-13,24+45,13+17.5-9])rotate([90,0,0])cylinder(r=4.8/2,h=80,$fn=30);
 translate([-51,24,13-9])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-51,24,13+17.5+1.7])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-51,24+45,13+17.5+1.7])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);
 translate([-51,24+45,13-9])rotate([0,90,0])cylinder(r=4.8/2,h=40,$fn=30);

 translate([-51+34,24,13-9])rotate([0,90,0])cylinder(r=8.3/2,h=40,$fn=30);
 translate([-51+34,24,13+17.5+1.7])rotate([0,90,0])cylinder(r=8.3/2,h=40,$fn=30);
 translate([-51+34,24+45,13+17.5+1.7])rotate([0,90,0])cylinder(r=8.3/2,h=40,$fn=30);
 translate([-51+34,24+45,13-9])rotate([0,90,0])cylinder(r=8.3/2,h=40,$fn=30);


 translate([-51,24-18,13-9])rotate([0,90,0])cylinder(r=8.5/2,h=40,$fn=30);
 translate([-51,24-18,13+17.5+1.7])rotate([0,90,0])cylinder(r=8.5/2,h=40,$fn=30);
 translate([-51,24+45+18,13+17.5+1.7])rotate([0,90,0])cylinder(r=8.5/2,h=40,$fn=30);
 translate([-51,24+45+18,13-9])rotate([0,90,0])cylinder(r=8.5/2,h=40,$fn=30);


 for(i=[0:21]){
 translate([0,i*3.7+1,0+2]){
 translate([-20,8,21-1.3])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 translate([-20,8,21-1.3+2.5])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 }
 }

 for(i=[0:12]){
 translate([0,i*6.4+1,0+2-8]){
 translate([-20,8,21-1.3])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 translate([-20,8,21-1.3+2.5])rotate([0,90,0])cylinder(r=1.5/2,h=30,$fn=30);
 }
 }

 }
}




































module plugblock(){
 color("lightblue")cube([22,(79*2),27]);
 difference(){
 union(){
 translate([-3,-3,-3])cube([20+8,((77*2)+8),24]);
 }
 cube([22,(79*2),27]);
}
}

module thermoblock_tslotconnect(){
 //actual_thermoblock();
 difference(){
 union(){
 //translate([-3,-3,-3])cube([20+8,77+8,24]);
 translate([-9+40,-3-20,-3])cube([10,15+68-40,7]);
 //translate([-9,-3+20,-3])cube([4+25,40,4]);
 translate([-9-50,-3-20,-3])cube([10,15+68-40,7]);
 translate([-9-50,-3-27,-3])cube([100,15+68-65,7]);
 }
 //cube([22,79,27]);
 translate([-14,3+22,1+12])rotate([0,90,0])cylinder(r=4.8/2,h=22,$fn=30);
 translate([-14,3+22+30,1+12])rotate([0,90,0])cylinder(r=4.8/2,h=22,$fn=30);
 //translate([11,7+2.5+13,-10])cylinder(r=4.7/2,h=50,$fn=30);
 //translate([11,7+2.5+14+13,-10])cylinder(r=4.7/2,h=50,$fn=30);
 translate([11-20,7+2.5-31,-10])cylinder(r=4.7/2,h=50,$fn=30);
 translate([11-60,7+2.5-31,-10])cylinder(r=4.7/2,h=50,$fn=30);
 translate([11+17,7+2.5-31,-10])cylinder(r=4.7/2,h=50,$fn=30);
 //translate([11,38+1.5,-5])cylinder(r=4/2,h=50,$fn=30);
 translate([-14-50,3,1])rotate([0,90,0])cylinder(r=3.8/2,h=122,$fn=30);
 translate([-14,74,1])rotate([0,90,0])cylinder(r=3.8/2,h=122,$fn=30);
 /*
 for(i=[-3:3]){
 translate([11-i,20+1.5,-5])cylinder(r=5/2,h=50,$fn=30);
 translate([11-i,55+1.5,-5])cylinder(r=5/2,h=50,$fn=30);
 } 
 */
 }
}




module thermoblock_lid(){
 difference(){
 translate([-3-3.5,-3-3,-3+26])cube([20+8+4,77+8+2,3]);
 for(i=[0:7]){
 translate([-3-3.5+13.5+5.5,-3-3+10+9*i+3,-3+26-10])cylinder(r=4.7/2,h=30,$fn=30);
 }
 }
}


module thermoblock_plate(){
difference(){
union(){
translate([10,5,7]){
thermoblock_breadboard_slider();
translate([0,103,0])thermoblock_breadboard_slider();
//translate([-1-20,-2+44,-4])cube([113,16,4]);
translate([25,-32,-7])cube([16,11,7]);
translate([25,-32+130,-7])cube([16,11,7]);
}
translate([-1,-2,0])cube([93,115-26,7]);
}
translate([43,-32+9,-10])cylinder(r=3.8/2,h=30,$fn=30);
translate([43,-32+9,5])cylinder(r=8/2,h=2.3,$fn=30);
translate([43,-32+9+132,-10])cylinder(r=3.8/2,h=30,$fn=30);
translate([43,-32+9+132,5])cylinder(r=8/2,h=2.3,$fn=30);
translate([25-17,-15+25-7,-1])cube([92-50+32,115-50+14,10]);
/*
   translate([7-3+9,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+18,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+18,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+55,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+55,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+70,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+70,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+38,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+38,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
*/
}
}



module pcrtuberack_8(){
translate([20,-9,0])rotate([0,0,90])difference(){
union(){
translate([0,-3,0])cube([80,20+6,10]);
translate([-9.5,5,0])cube([80+20,10,4]);
//pcrtube_stump();
}
for(i=[0:7]){
translate([9+i*9,10-4.5,11-9])pcrtube_stump();
}
for(i=[-3:73]){
translate([9+i*0.9,10+4.5,11-9])pcrtube_stump();
}
translate([9+-1*9-5,10,-2])cylinder(r=4.7/2,h=30,$fn=30);
translate([9+8*9+5,10,-2])cylinder(r=4.7/2,h=30,$fn=30);


}
}







module pcrtube_plate(){
difference(){
union(){
translate([10,5,7]){
thermoblock_breadboard_slider();
translate([0,103-12,0])thermoblock_breadboard_slider();
//translate([25,-32,-7])cube([16,11,7]);
//translate([25,-32+130,-7])cube([16,11,7]);
}
translate([-1,-2,0])cube([93,115-26-7.5-5,7]);
}
translate([25-17,-15+25-7-4,-1])cube([92-50+32,115-50+14-4,10]);
/*
translate([43,-32+9,-10])cylinder(r=3.8/2,h=30,$fn=30);
translate([43,-32+9,5])cylinder(r=8/2,h=2,$fn=30);
translate([43,-32+9+132,-10])cylinder(r=3.8/2,h=30,$fn=30);
translate([43,-32+9+132,5])cylinder(r=8/2,h=2,$fn=30);
*/
/*
   translate([7-3+9,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+18,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+18,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+55,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+55,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+70,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+70,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+38,12-40+16+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
   translate([7-3+9+38,12-40+16+103+3,-9])rotate([0,0,0])cylinder(r=2.9/2,h=159.1,$fn=30);
*/
}
}





module thermoblock(){
 translate([2,2.8,1.5])actual_thermoblock();
 difference(){
 union(){
 translate([-3-2,-3-1,-3])cube([20+8+4,77+8+2,26-5.2+4]);
 //translate([-3-2-13,-3-1+20-7,-3])cube([60,44+14,5]); //comment out for model
 translate([-3,-3-15,-3])cube([20+8,77+8-10+40,5]); //comment out for model
 //translate([-9,-3,-3])cube([40,15,7]);
 //translate([-9,82-15,-3])cube([40,15,7]);
 }
 translate([-0.5,-0.25+2,0-8])cube([22+4-3,79+2-2-2,37]);
 translate([-3-2-13+5,-3-1+20+22,-3])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-3-2-13+60-5,-3-1+20+22,-3])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-3-2-13+5,-3-1+20+22-20,-3])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-3-2-13+5,-3-1+20+22+20,-3])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-3-2-13-5+60,-3-1+20+22-20,-3])cylinder(r=3.8/2,h=40,$fn=30);
 translate([-3-2-13-5+60,-3-1+20+22+20,-3])cylinder(r=3.8/2,h=40,$fn=30);
 /*
 translate([11,7+2.5,-5])cylinder(r=4/2,h=50,$fn=30);
 translate([11,38+1.5,-5])cylinder(r=4/2,h=50,$fn=30);
 translate([24,3,1])rotate([0,90,0])cylinder(r=2.8/2,h=50,$fn=30);
 translate([24,74,1])rotate([0,90,0])cylinder(r=2.8/2,h=50,$fn=30);
 translate([-24,3,1])rotate([0,90,0])cylinder(r=2.8/2,h=22,$fn=30);
 translate([-24,74,1])rotate([0,90,0])cylinder(r=2.8/2,h=22,$fn=30);
 for(i=[-3:3]){
 translate([11-i,20+1.5,-5])cylinder(r=5/2,h=50,$fn=30);
 translate([11-i,55+1.5,-5])cylinder(r=5/2,h=50,$fn=30);
 }
 */
   translate([7+10,12-40+16,-9])rotate([0,0,0])cylinder(r=3.7/2,h=159.1,$fn=30);
   translate([7+10,12-40+16+103,-9])rotate([0,0,0])cylinder(r=3.7/2,h=159.1,$fn=30);

   translate([0,-3,0]){
   translate([7,12+3,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   translate([7,12+4,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   translate([7,12+5,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   translate([0,7.5,0]){
   translate([12,75-10+2-3,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   translate([12,75-10+2-4,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   translate([12,75-10+2-5,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   }
   /*
   */
   for(i=[2:6]){
   translate([12,75/2+2+i,9])rotate([0,90,0])cylinder(r=5.7/2,h=59.1,$fn=30);
   }
   translate([9+7-7,15+200,9])rotate([90,0,0])cylinder(r=10/2,h=259.1,$fn=30);
   //translate([7,115,7])rotate([90,0,0])cylinder(r=9/2,h=59.1,$fn=30);
   }
 }
}


module actual_thermoblock(){
 difference(){
  union(){
  //color("red")translate([-2,-2,19.2])cube([19.2+4,75+4,1.5]);
  color("silver")cube([19.2,75,19.2]);
  }
  union(){
  translate([11+1,6,23])
  for(i=[0:7]){
   //translate([0,i*9,-15])cylinder(r=3/2,h=19.1,$fn=30);
   //translate([0,i*9,-15])cylinder(r=1/2,h=19.1,$fn=30);
   translate([0,i*9,-15])cylinder(r=2/2,h=19.1+5,$fn=30);
  }
   translate([10,10,7])rotate([0,90,0])cylinder(r=3.7/2,h=59.1,$fn=30);
   translate([10,75-10,7])rotate([0,90,0])cylinder(r=3.7/2,h=59.1,$fn=30);
   translate([10,75/2,7])rotate([0,90,0])cylinder(r=3.7/2,h=59.1,$fn=30);
   translate([7,15,7])rotate([90,0,0])cylinder(r=9/2,h=59.1,$fn=30);
   translate([7,115,7])rotate([90,0,0])cylinder(r=9/2,h=59.1,$fn=30);
  }
 }
}





module multichannel_tipremoval(){
translate([-148,85,-150])difference(){
union(){
translate([-75.5-5+22-5-34+12,-40,0])cube([29+36-12,90,5]);
translate([-75.5-5+45-7,-40-10,0])cube([20,90+20,5+5]);
translate([-75.5-5+45-7-20-10,-40-10-10+20,0])cube([30,90,5+5]);
}
translate([-33,-66,-20])rotate([0,0,90]){
//actually c-to-c spacing on prusa is 8.723 not 9mm
translate([0,-31+65-12,0])
for(j=[0:7]){
for(k=[0:3]){
 translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([6.8,25/2-8,-0.1])cylinder(r=7/2,h=40);
}}
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,14])cylinder(r=5.7/2,h=240);
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,24])cylinder(r=10/2,h=240);
translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,14])cylinder(r=5.7/2,h=40);
translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,24])cylinder(r=10/2,h=40);
translate([19+7+75,2.5-10,2])translate([7.5+10,25/2-8,14])cylinder(r=5.7/2,h=240);
translate([19+7+75,2.5-10,2])translate([7.5+10,25/2-8,24])cylinder(r=10/2,h=240);
}
}
}


module singlechannel_tipremoval_base(){
//translate([-75.5-5+22-5-34+12,-40,0])cube([29+36-12,90-60,5]);
//translate([-75.5-5+45-7-20-10,-40-10-10+20,0])cube([30,90-60,5+5]);
translate([-148,85,-150])difference(){
union(){
translate([-75.5-5+45-7,-40-10,0])cube([20,90+20-60,5+5+25+15]);
}
translate([-33-2.5,-66,-20])rotate([0,0,90]){
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,14])cylinder(r=4.9/2,h=240, $fn=300);
translate([19+7+25,2.5-10,2])translate([7.5,25/2-8,14])cylinder(r=4.9/2,h=240, $fn=300);

translate([0,-32+7.2-4.5-3.5,25])rotate([-90,0,0]){
translate([11,0,0]){
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,10])cylinder(r=5.7/2,h=240, $fn=300);
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,18+4.5])cylinder(r=10/2,h=240, $fn=300);
}
translate([24,0,0]){
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,10])cylinder(r=5.7/2,h=240, $fn=300);
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,18+4.5])cylinder(r=10/2,h=240, $fn=300);
}
}
}
}
}

module singlechannel_tipremoval(){
translate([-148,85,-150])difference(){
union(){
translate([-75.5-5+22-5-34+12+30,-40,0])cube([29+36-12-30,90-60,3.5]);
translate([-75.5-5+45-7,-40-10,0])cube([20,90+20-60,5+5]);
//#translate([-75.5-5+45-7-20-10,-40-10-10+20,0])cube([30,90-60,5+5]);
}
translate([-33,-66,-20])rotate([0,0,90]){
//actually c-to-c spacing on prusa is 8.723 not 9mm
translate([0-5,-31+65-12-30,0])
for(j=[0:0]){
for(k=[0:3]){
 translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([6.8,25/2-8,-0.1])cylinder(r=7.5/2,h=40, $fn=300);
 translate([19+7+(j*9)+5+2+15,2.5-10+33-(k*1),2])translate([6.8,25/2-8,-0.1])cylinder(r=7/2,h=40, $fn=300);
}}
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,14])cylinder(r=5.7/2,h=240);
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,24])cylinder(r=10/2,h=240);
translate([19+7+25,2.5-10,2])translate([7.5,25/2-8,14])cylinder(r=5.7/2,h=40);
translate([19+7+25,2.5-10,2])translate([7.5,25/2-8,24])cylinder(r=10/2,h=40);
}
}
}




module washbowl_8tip_base(){
 difference(){
  union(){
  translate([-1.5-2,0-2,0])cube([35+4+2,90+3,18]);
  translate([-13,7,0])cube([13,13,18]);
  translate([-13,7+66,0])cube([13,13,18]);
  }
  translate([-6-1.5,14,5])cylinder(r=3.8/2,h=30);
  translate([-6-1.5,14+66,5])cylinder(r=3.8/2,h=30);
  translate([18,9+4-4,6])cube([10,73,20]);
  translate([18+2.5,9+4-4,6+1])rotate([-8,0,0])cube([5,73/2,20]);
  translate([18+2.5,9+4-4+73/2,6-4])rotate([8,0,0])cube([5,73/2,20]);
  translate([18-12.5,9+4-4,3])cube([9,10,20]);
  translate([18-12.5,9+4-4+63,3])cube([9,10,20]);
  translate([18-12.5+2,9+4-4,3])cube([7,73,20]);
  translate([35/2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35/2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,90/2,3-20])cylinder(r=3.7/2,h=40);
  translate([2,90/2,3-20])cylinder(r=3.7/2,h=40);
  translate([35/2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35/2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,90/2,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,90/2,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-12,90/2,-1])cylinder(r=6.8/2,h=20);
  translate([35-25,90/2-40+10,10])rotate([90,90,0])cylinder(r=6.8/2,h=40);
  translate([35-25,90/2-40+10+80+18,10])rotate([90,90,0])cylinder(r=6.8/2,h=40);
 }
}


module reservoir_base(){
 difference(){
 translate([-1.5-2-9,0-2+69,-3])cube([35+4+2+18,23.75,3]);
  translate([-6-1.5-1.5,14+30.5+30,5-100])cylinder(r=3.8/2,h=330);
  translate([-6-1.5-1.5+51,14+30.5+30,5-100])cylinder(r=3.8/2,h=330);
 }
 difference(){
 translate([-1.5-2-9,0-2,-3])cube([35+4+2+18,23.75,3]);
  translate([-6-1.5-1.5,14+30.5-30,5-100])cylinder(r=3.8/2,h=330);
  translate([-6-1.5-1.5+51,14+30.5-30,5-100])cylinder(r=3.8/2,h=330);
 }
 /*
 */
 difference(){
  union(){
  //translate([-1.5-2,0-2,0])cube([35+4+2,90+3,18]);
  translate([-13,7+30.5,0])cube([13+47-50,13,18]);
  translate([-13+50,7+30.5,0])cube([13+47-50,13,18]);
  //translate([-13,7+66,0])cube([13,13,18]);
  translate([-13,7+30.5-30-5-6.3+6,0])cube([13+47-50+50,7,18]);
  translate([-13,7+30.5+44.3,0])cube([13+47-50+50,7,18]);
  translate([-13,7+30.5-30-5,0])cube([13+47-50,13+23,18]);
  translate([-13+50,7+30.5-30-5,0])cube([13+47-50,13+23,18]);
  translate([-13,7+30.5+30-17,0])cube([13+47-50,13+23,18]);
  translate([-13+50,7+30.5+30-17,0])cube([13+47-50,13+23,18]);
  /*
  */
  }
  translate([-6-1.5-1.5,14+30.5,5-100])cylinder(r=3.8/2,h=330);
  translate([-6-1.5-1.5+51,14+30.5,5-100])cylinder(r=3.8/2,h=330);
  translate([-6-1.5-1.5,14+30.5-30,5-100])cylinder(r=2.8/2,h=330);
  translate([-6-1.5-1.5+51,14+30.5-30,5-100])cylinder(r=2.8/2,h=330);
  translate([-6-1.5-1.5,14+30.5+30,5-100])cylinder(r=2.8/2,h=330);
  translate([-6-1.5-1.5+51,14+30.5+30,5-100])cylinder(r=2.8/2,h=330);
  //translate([-6-1.5,14+66,5])cylinder(r=3.8/2,h=30);
  //translate([18,9+4,3])cube([8,70,6]);
  translate([18-5,9+4-4,6])cube([10+5,73,20]);
  //translate([18+2.5,9+4-4,6+1])rotate([-8,0,0])cube([5,73/2,20]);
  //translate([18+2.5,9+4-4+73/2,6-4])rotate([8,0,0])cube([5,73/2,20]);
  translate([18-12.5,9+4-4,3])cube([9,10,20]);
  translate([18-12.5,9+4-4+63,3])cube([9,10,20]);
  translate([18-12.5+2,9+4-4,-1])cube([7+13.5,73,20]);
  /*
  //translate([35/2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35/2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,90-3.5,3-20])cylinder(r=3.7/2,h=40);
  translate([35-2,90/2,3-20])cylinder(r=3.7/2,h=40);
  translate([2,90/2,3-20])cylinder(r=3.7/2,h=40);
  translate([35/2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35/2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,90-3.5,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([35-2,90/2,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  translate([2,90/2,3-25-10])cylinder(r=6.7/2,h=40,$fn=6);
  */
  //translate([35-12,90/2,-1])cylinder(r=6.8/2,h=20);
  //translate([35-25,90/2-40+10,10])rotate([90,90,0])cylinder(r=6.8/2,h=40);
  //translate([35-25,90/2-40+10+80+18,10])rotate([90,90,0])cylinder(r=6.8/2,h=40);
 }
}







module drypad_shelf(){

 difference(){
  union(){
 washbowl_8tip_drypad_model();
//translate([-3,-3,0])cube([35+6,90+6,5]);
translate([55,32,10])rotate([0,180,-90])difference(){
translate([0,-21,5])cube([25,20+13+30,5]);
translate([0,3+30,0])for(i=[0:15]){
translate([6,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
translate([19,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
}
}
  }
 /*
  for(i=[0:7]){
   translate([11,(i*9)+13,-0.1])cylinder(r=5/2,h=10);
   translate([11,(i*9)+11.5,4])rotate([0,25,0])cube([10,3,5]);
  }
  translate([18,9,-0.1])cube([8,70,6]);
  translate([35/2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35/2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90/2,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90/2,2])cylinder(r=6.5/2,h=3.1);
 */
 }
}


module reagentbasin_8tip(){
 difference(){
  union(){
translate([-3,-3,0])cube([35+6,90+6,5]);
translate([55,32,10])rotate([0,180,-90])difference(){
translate([0,-21,5])cube([25,20+13+30,5]);
translate([0,3+30,0])for(i=[0:15]){
translate([6,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
translate([19,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
}
}
  }
  for(i=[0:7]){
   translate([11,(i*9)+13,-0.1])cylinder(r=5/2,h=10);
   //translate([11,(i*9)+11.5,4])rotate([0,25,0])cube([10,3,5]);
   //translate([11,(i*9)+11.5,4])rotate([0,0,0])cube([10,3,5]);
   translate([11+11,(i*9)+13,-0.1])cylinder(r=5/2,h=10);
  }
  //translate([18,9,-0.1])cube([8,70,6]);
  translate([35/2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35/2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90/2,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90/2,2])cylinder(r=6.5/2,h=3.1);
 }
}



module washbowl_8tip(){
 difference(){
  union(){
translate([-3,-3,0])cube([35+6,90+6,5]);
translate([55,32,10])rotate([0,180,-90])difference(){
translate([0,-21,5])cube([25,20+13+30,5]);
translate([0,3+30,0])for(i=[0:15]){
translate([6,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
translate([19,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
}
}
  }
  for(i=[0:7]){
   translate([11,(i*9)+13,-0.1])cylinder(r=7/2,h=10,$fn=30);
   translate([11,(i*9)+11.5,4])rotate([0,25,0])cube([10,3,5]);
  }
  translate([18,9,-0.1])cube([8,70,6]);
  translate([35/2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35/2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90/2,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90/2,2])cylinder(r=6.5/2,h=3.1);
 }
}


module reservoir_top(){
 difference(){
  union(){
translate([-3-10,-3+5,0])cube([35+6+19,87.5,5]);
translate([55,32,10])rotate([0,180,-90])difference(){
translate([0,-21,5])cube([25,20+13+30,5]);
translate([0,3+30,0])for(i=[0:15]){
translate([6,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
translate([19,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
}
}
  }

/*
  for(i=[0:7]){
   translate([11,(i*9)+13,-0.1])cylinder(r=5/2,h=10);
   translate([11,(i*9)+11.5,4])rotate([0,25,0])cube([10,3,5]);
  }
*/
  translate([18+3,9+3-1.5,-0.1])cube([8,68,6]);
  translate([18-15,9+3-1.5,-0.1])cube([8,68,6]);

  translate([2-11.0,3.5+11.,-0.1])cylinder(r=3.7/2,h=10);
  translate([2-11,3.5+11,2])cylinder(r=6.5/2,h=3.1);
  translate([51.5,0,0]){
  translate([2-11.0,3.5+11.,-0.1])cylinder(r=3.7/2,h=10);
  translate([2-11,3.5+11,2])cylinder(r=6.5/2,h=3.1);
  }
  translate([0,60,0]){
  translate([2-11.0,3.5+11.,-0.1])cylinder(r=3.7/2,h=10);
  translate([2-11,3.5+11,2])cylinder(r=6.5/2,h=3.1);
  }
  translate([51.5,60,0]){
  translate([2-11.0,3.5+11.,-0.1])cylinder(r=3.7/2,h=10);
  translate([2-11,3.5+11,2])cylinder(r=6.5/2,h=3.1);
  }

/*
  translate([35/2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35/2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35/2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90-3.5,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90-3.5,2])cylinder(r=6.5/2,h=3.1);
  translate([35-2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([35-2,90/2,2])cylinder(r=6.5/2,h=3.1);
  translate([2,90/2,-0.1])cylinder(r=3.7/2,h=10);
  translate([2,90/2,2])cylinder(r=6.5/2,h=3.1);
*/
 }
}














module washbowl_8tip_drypad_top(){
 difference(){
  //translate([-4-10,-5,6])cube([35+4+10-9,100,5]);
  union(){
  translate([-4-10,-5,6])cube([35+4+10-1,12,5]);
  translate([-4-10,-5+90,6])cube([35+4+10-1,12,5]);
  }
  translate([31-9,14-14,-50])cylinder(r=3.8/2,h=200,$fn=30);
  translate([31-9,14-14+92,-50])cylinder(r=3.8/2,h=200,$fn=30);
  //translate([31-9,14-14+45,-50])cylinder(r=3.8/2,h=200,$fn=30);
  translate([31-41,14-14,-50])cylinder(r=3.8/2,h=200,$fn=30);
  translate([31-41,14-14+92,-50])cylinder(r=3.8/2,h=200,$fn=30);
  //translate([31-41,14-14+45,-50])cylinder(r=3.8/2,h=200,$fn=30);

  translate([0,0,3.1]){
  translate([31-9,14-14,5])cylinder(r=8/2,h=3,$fn=30);
  translate([31-9,14-14+92,5])cylinder(r=8/2,h=3,$fn=30);
  //translate([31-9,14-14+45,5])cylinder(r=8/2,h=3,$fn=30);
  translate([31-41,14-14,5])cylinder(r=8/2,h=3,$fn=30);
  translate([31-41,14-14+92,5])cylinder(r=8/2,h=3,$fn=30);
  //translate([31-41,14-14+45,5])cylinder(r=8/2,h=3,$fn=30);
  }

 }
}


module washbowl_8tip_drypad_model(){
 difference(){
  union(){ 
  translate([-4-10,-5,0])cube([35+4+10,100,5]);
  translate([-4-10+2,-5+2,0])color("white")cube([35+4+10-4,100-4,5+2]);
  }
  //translate([31-9,14-14,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-9,14-14+92,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-9,14-14+45,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-41,14-14,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-41,14-14+92,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-41,14-14+45,-50])cylinder(r=2.8/2,h=200,$fn=30);
  translate([-5,0,0]){
  translate([18-4-9-3,9,-0.1])cube([5,70,6]);
  translate([18-4-3,9,-0.1])cube([5,70,6]);
  translate([18+5-3,9,-0.1])cube([5,70,6]);
  }
  /*
  translate([31,14,-50])cylinder(r=4.7/2,h=200);
  translate([31,14,5-2.9])cylinder(r=10/2,h=3);
  translate([31,14+66,-50])cylinder(r=4.7/2,h=200);
  translate([31,14+66,5-2.9])cylinder(r=11/2,h=3);
 */
 }
}

module washbowl_8tip_drypad(color){
 difference(){
  union(){ 
  color(color)translate([-4-10,-5,0])cube([35+4+10,100,5]);
  color("white")translate([-4-10,-5,2])cube([35+4+10-10,100,5]);
/*
translate([55,32,10])rotate([0,180,-90])difference(){
translate([0,-21,5])cube([25,20+13+30,5]);
translate([0,3+30,0])for(i=[0:15]){
translate([6,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
translate([19,-13,5-3]){translate([0,i,-2])cylinder(r=4.7/2,h=10+6);}
}
}
*/
  }
 /*
  for(i=[0:7]){
   translate([11,(i*9)+13,-0.1])cylinder(r=5/2,h=10);
   translate([11,(i*9)+11.5,4])rotate([0,25,0])cube([10,3,5]);
  }
 */
 /*
  translate([31-9,14-14,-50])cylinder(r=2.8/2,h=200,$fn=30);
  translate([31-9,14-14+92,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-9,14-14+45,-50])cylinder(r=2.8/2,h=200,$fn=30);
  translate([31-41,14-14,-50])cylinder(r=2.8/2,h=200,$fn=30);
  translate([31-41,14-14+92,-50])cylinder(r=2.8/2,h=200,$fn=30);
  //translate([31-41,14-14+45,-50])cylinder(r=2.8/2,h=200,$fn=30);
  */
  translate([-5,0,0]){
  translate([18-4-9-3,9,-0.1])cube([5,70,6]);
  translate([18-4-3,9,-0.1])cube([5,70,6]);
  translate([18+5-3,9,-0.1])cube([5,70,6]);
  }
  translate([31,14,-50])cylinder(r=4.7/2,h=200);
  translate([31,14,5-2.9])cylinder(r=10/2,h=3);
  translate([31,14+66,-50])cylinder(r=4.7/2,h=200);
  translate([31,14+66,5-2.9])cylinder(r=11/2,h=3);
 }
}





