//include<arducam-raspi.scad>
include<bom_camera.scad>


//raspberrypi_lineux_assy();

//raspberrypi_lineux_assy();
//translate([-80+30,10-2,39+1-7-2])rotate([-90,0,90])arducam_lineux();
//translate([80,7-1,-8])color("pink")arducam_adjuster();

//translate([0,0,2])translate([0,5,0])raspberrypi_case_top();
//raspberrypi_bottom_mod();

//arducam_rotate_2mount_adjuster_nut();
//miuzei_camera_breadboard_screwstub();
//miuzei_camera_breadboard_b();

//arducam_lineux();
translate([100,44,40])rotate([0,90,90])raspberrypi_lineux_assy();

import("lineux_backplate_for_raspberrypi.stl");
//translate([-27,20,-100])rotate([0,0,90])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/dock_trident_work/Dock/dock_body_linearactuator_10mmlonger.stl");
/*
*/

//import("pi4_futa_m2.6_top.stl");
/*
translate([0,-80,0]){
translate([0,100,0])import("/Users/richard/Documents/house/via_sonoma/trim_side.stl");
translate([430,100,0])import("/Users/richard/Documents/house/via_sonoma/trim_side.stl");
}
housepanel();
translate([0,-62,0])cube([730,42,3]);
*/



module housepanel(){
difference(){
translate([0,-12,0])cube([40+450,42,3]);
translate([8,8,-10])#cylinder(r=3.9/2,h=30,$fn=300);
translate([8,8+16,-10])#cylinder(r=3.9/2,h=30,$fn=300);
translate([450,0,0]){
translate([8,8,-10])#cylinder(r=2.8/2,h=30,$fn=300);
translate([8,8+16,-10])#cylinder(r=2.8/2,h=30,$fn=300);
}
translate([8-10+20,8+16-30,-10])#cylinder(r=3.5/2,h=30,$fn=300);
translate([8-10+160,8+16-30,-10])#cylinder(r=3.5/2,h=30,$fn=300);
translate([8-10+320,8+16-30,-10])#cylinder(r=3.5/2,h=30,$fn=300);
translate([8-10+440,8+16-30,-10])#cylinder(r=3.5/2,h=30,$fn=300);
}
}


//import("Raspberrypi4Bcase.stl");
//import("rail_60mm.stl");


//block_mod();
//raspberrypi_case_rail60mm();


//raspberrypi_bottom_mod();
//raspberrypi_case_rail60mm();
//translate([-80,10,39+1])rotate([-90,0,90])arducam_lineux();
//rotate([0,180,0])import("block_mod2.stl");
/*
difference(){
translate([0,0,2.1])import("block_mod.stl");
translate([0,-0.75,0])scale([1,1.05,1])#raspberrypi_case_rail60mm();
}
*/

module raspberrypi_bottom_mod(){


//translate([44,-24,-42])rotate([90,0,90])import("raspberrypi_bottom_mod.stl");
difference(){translate([44,-24,-42])rotate([90,0,90])

import("raspberry_camera.stl");
translate([85,0,5.8])#cube([30,100,5]);
}

translate([-20.5,5.3,0]){
difference(){union(){translate([27,54.5,15])color("pink")rotate([0,0,0])cylinder(r=7.5/2,h=3,$fn=300);translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])cylinder(r=5.5/2,h=3,$fn=300);}translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])#cylinder(r=2.1/2,h=13,$fn=300);}
translate([0,-48.5,0])difference(){union(){translate([27,54.5,15])color("pink")rotate([0,0,0])cylinder(r=7.5/2,h=3,$fn=300);translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])cylinder(r=5.5/2,h=3,$fn=300);}translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])#cylinder(r=2.1/2,h=13,$fn=300);}

translate([57.5,0,0]){
difference(){union(){translate([27,54.5,15])color("pink")rotate([0,0,0])cylinder(r=7.5/2,h=3,$fn=300);translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])cylinder(r=5.5/2,h=3,$fn=300);}translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])#cylinder(r=2.1/2,h=13,$fn=300);}
translate([0,-48.5,0])difference(){union(){translate([27,54.5,15])color("pink")rotate([0,0,0])cylinder(r=7.5/2,h=3,$fn=300);translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])cylinder(r=5.5/2,h=3,$fn=300);}translate([27,54.5,15-2.7])color("pink")rotate([0,0,0])#cylinder(r=2.1/2,h=13,$fn=300);}
}
}

}



//arducam_case();
module raspberrypi_lineux_assy(){
translate([80,7-1,-8])color("pink")arducam_adjuster();
translate([0,0,1.8])rotate([0,180,0]){
translate([-80+30,10-2,39+1-7-2])rotate([-90,0,90])arducam_lineux();
}
raspberrypi_case_top();
translate([0,-5,-1.5])raspberrypi_bottom_mod();
}


module raspberrypi_case_top(){
difference(){
union(){
import("pi4_futa_m2.6_top.stl");
translate([0,0,20]){
color("lime")translate([19.7,38.8,-20])cube([3,18.2,3]);
color("lime")translate([19.7+3+0.35,38.8+6.7,-20])cube([7,6.2,3]);
color("pink")translate([19.7+5+10,38.8-21,-20])cube([5,18.2+10.6,3]);
}
}

translate([0,-2,0]){
translate([54,9.5+5.5,-17])cylinder(r=2.9/2,h=30,$fn=300);
translate([54+20,9.5+5.5,-17])cylinder(r=2.9/2,h=30,$fn=300);
}

translate([-0.03,-35.0,0]){
color("pink")translate([19.7,38.8,-20])cube([3,18.2,50]);
color("pink")translate([19.7+3+0.35,38.8+6.7-1.6,-20])cube([7.4,6.2+1,50]);

color("pink")translate([19.7+3+0.35+20.3,38.8+6.7-1.6+6.9+1,-20])cube([7.2+21,6.2,50]);
#color("pink")translate([19.7+3+0.35+20.3+21,38.8+6.7-1.6+6.9+3,-20])cube([7.2,6.2,50]);
}


}



}
//translate([84,15,-2])rotate([0,-900,90])import("rail_60mm.stl");
//block_mod();


module raspberrypi_case_rail60mm(){

translate([0,0,2])difference(){union(){
translate([84,15,-2])rotate([0,-900,90])import("rail_60mm.stl");
translate([54+40,9.5+5.5,-12])cylinder(r=8/2,h=10,$fn=300);
//translate([44,9.5,-2])cube([45,12,2.5]);
}
//translate([54,9.5+5.5,-17])cylinder(r=2.9/2,h=30,$fn=300);
//translate([54+20,9.5+5.5,-17])cylinder(r=2.9/2,h=30,$fn=300);
}
}

//translate([84,15,-2-15])rotate([0,0,90])import("block_02.stl");
//translate([84,15,-2-15])rotate([0,0,90])import("block_01.stl");


module block_mod(){

difference(){
union(){
translate([84,15,-2-15])rotate([0,0,90])import("block_01.stl");
//translate([84,15,-2-35])rotate([0,0,90])#cylinder(r=2.9/2,h=40,$fn=300);
}
translate([84+5,15,-8])rotate([90,0,0])cylinder(r=2.9/2,h=500,$fn=300);
translate([84+5-30,15-15,-8-15])rotate([0,0,0])cube([20,30,40]);
}

}

module miuzei_camera_breadboard_b(){
difference(){
union(){
translate([4,16.5,-7])rotate([90,0,0]){
translate([-4,-3,-15])
translate([0,0-25-15,35.5-10+6])cube([7-3,93+30,17.5]);
translate([-4,-3,-15])
translate([-3,0-25-15+30,35.5-10+6])cube([7,63+0,17.5]);
}
//translate([-3.1+7.3,-11.725-15,-17.5-17.5+7.05 ])rotate([90,0,90]){cylinder(r=9.9/2,h=7.8);}
//translate([-3.1+7.3,-34+22.27-15,-17.5+56.55 ])rotate([90,0,90]){cylinder(r=9.9/2,h=10.53);}
}
translate([30,-4,-30+83+15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-13,-30+83+15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-4,-30-15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);
translate([30,-13,-30-15])rotate([0,-90,0])cylinder(r=3.8/2,h=100,$fn=30);

/*
translate([0-2,-7.5+2.8-4+0.3,16+13-6+4.5-8]){
for(i=[-0:9]){
 for(j=[-1:3]){
 translate([-3.1-80,-11.725-15+5+5+j,-17.5+2-36+3+i*9 ])rotate([90,0,90]){translate([0,0,82.06])cylinder(r=8/2,h=3.5);cylinder(r=3.7/2,h=500);}
 }
}
}
*/
translate([0-20,26-5-30+1,-27+24])rotate([0,90,0])cylinder(r=3.8/2,h=200,$fn=30);
translate([0-20,26-5-30+1,-27+54])rotate([0,90,0])cylinder(r=3.8/2,h=200,$fn=30);
/*
for(i=[-12:68+12]){
translate([0-10,26-5-30,-27+i+5])rotate([0,90,0])cylinder(r=5/2,h=20);
translate([0-10+12,26-5-30,-27+i+5])rotate([0,90,0])cylinder(r=12/2,h=20);
}
*/
}
}

module arducam_rotate_2mount_adjuster_nut(){
translate([42,0,0])
difference(){
union(){
color("pink")translate([-4.5+22.0+15+10-1,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
color("pink")translate([-4.5+22.0+15+10,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
color("pink")translate([-4.5+22.0+15+10+1,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
}
color("pink")translate([-4.5+22.0+15+10,-4+0+10,-4.2])cylinder(r=2.9/2,h=14,$fn=30);
}
}






module arducam_adjuster(){
difference(){
union(){
translate([-4.5+22.0-15-22-15,-4+0,0])cube([30+30,20,8]);
//translate([-4.5+22.0-15-22-15,-4+0,0])cube([60+44+30,20,8]);
//translate([-4.5+22.0-15+20,-4+0-12,0])cube([20,20,8]);
//#translate([-4.5+22.0-15+20-20,-4+0-12+5,0])cube([60,35,8]);
}
//#translate([-4.5+22.0-15+20-20+9.5-3,-4+0-12+5+6,-15])cube([3.8+8,23,30]);
//translate([-4.5+22.0-15+20-20+9.5-3+35,-4+0-12+5+6,-15])cube([3.8+8,23,30]);
//#translate([-4.5+22.0+15,-4+0+10,-10])cylinder(r=4.2/2,h=50,$fn=30);
/*
#translate([5,0,0]){
translate([-4.5+22.0+15,-4+0+10-15,-2])cylinder(r=3.7/2,h=40,$fn=30);
translate([-4.5+22.0+15,-4+0+10-15,-2+1.9])cylinder(r=8.7/2,h=4,$fn=30);
}

#translate([-5,0,0]){
translate([-4.5+22.0+15,-4+0+10-15,-2])cylinder(r=3.7/2,h=40,$fn=30);
translate([-4.5+22.0+15,-4+0+10-15,-2+1.9])cylinder(r=8.7/2,h=4,$fn=30);
}
*/

for(i=[5:68+32]){
//translate([-4.5+22.0+15+10+i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
//#translate([-4.5+22.0+15+10+i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
}
translate([0,6,0]){
translate([-6,8.,-10])cylinder(r=3.7/2,h=30,$fn=300);
translate([-6,8.,0])cylinder(r=8.7/2,h=3,$fn=300);
translate([-6-20,8.,-10])cylinder(r=3.7/2,h=30,$fn=300);
translate([-6-20,8.,0])cylinder(r=8.7/2,h=3,$fn=300);
}
}
}


