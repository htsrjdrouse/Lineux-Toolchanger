include <dr.robotlab_repstrap.scad>
include <Raspberry_Pi_Camera_Mount_with_Ball_Joint_for_Reprap/stroboscope.scad>
include <azteegx5mini-box.scad>
include <compact_direct_drive_extruder.scad>
include <nanoplotter.scad>
include <LM8UU_holder_ziptie.scad>
include <bom_zbed.scad>
include <bom_syringe.scad>
use<writescad/write.scad>




//rightside_underneath_plate_x1();

//leftside_underneath_plate_x1();

//coverpanel_screw();
//coverpanel_screw();
//pcb_panels();

//translate([0,-5,25])rotate([0,90,0])tslot20(200);
//tslot_breadboard();

//tslot20innerbracketlonger();

//tslot20innerbracket();
//tslot20innerbracket_rtangle();
//microscope_toolmount_thorlabs();

//rotate([0,180,0])screenpost();

//translate([440,35,-4])rotate([0,90,0])binding_post_connector();
//translate([440,35,-4])rotate([0,90,0])cover_connector();
//translate([50,80,0])binding_post_connector();

//translate([-9,-9,-14])screen_cover();


//cover_connector();

//syringe_pcb_holder_for_syringemodule();
 
//printhead_pcb_holes();
//rotate([0,180,0])barrierstrip_screws();
//color("peru")back_plate_x1();
//rotate([0,180,0])barrierstrip_screws();
/*
electronics_configuration();
*/
// color("grey")translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();


//outside_frame(tcl,thcl);
//electronics_connectormod();
//labbot3d_electronics_configuration();
//wash_dry_pcv_brd();
//amplifier_brd_holder();
//solenoids_mosfets();
//translate([180-0.4,341.3,5.7])rotate([0,180,0])electronics_connectormod();
//electronics_connectormod();
//rotate([0,180,0])solenoids_mosfets();

/*
rotate([0,180,0])
translate([0,0,-6.3])atzeeg_mount_to_plate();
*/

//5stepper_brd_holder();

//labbot3d_electronics_configuration();
//conveyer_panel_pcb_holes();

//conveyer_panel_mount_pcb();

//translate([0,0,-10])conveyer_panel_mount_pcb_back();

//conveyer_panel_pcb_holes();


/*
difference(){
cylinder(r=18,h=40);
translate([0,0,-1])cylinder(r=10/2,h=51);
translate([13,13,-1])cylinder(r=26,h=50,$fn=4);
}
*/
//translate([0,-7,0])conveyer_pcb_holder_front();
//translate([0,-7,0])conveyer_pcb_holder_backsupport();

/*
right_plate_x1();
translate([0,-70,0])front_plate_x1();
*/



/*
translate([28,21,5])syringe_pcb_holder_back();
translate([0,-40,0])syringe_pcb_holder();
translate([40,-40,0])syringe_pcb_holder_cover();
*/


module cable_support_extrusion(){
difference(){
cube([45,18,4]);
translate([10,9,-1])cylinder(r=5/2,h=20);
translate([35,9,-1])cylinder(r=5/2,h=20);
}
}




module pi_bottom_for_panel(){

difference(){union(){
translate([-4,-8+5,0])cube([5,56,4]);
translate([-4,-8+5,0])cube([5+58,5,4]);
translate([-4+60,-8+5,0])cube([5,56,4]);
translate([-4,-8+60-5.5,0])cube([5+60,5,4]);
cylinder(r=10/2,h=8);
translate([0,49,0])cylinder(r=10/2,h=8);
translate([0+58,49,0])cylinder(r=10/2,h=8);
translate([0+58,0,0])cylinder(r=10/2,h=8);

xx = -3;
yy = -47;
sy = -50;
for(i=[28]){
for(y=[0,38]){
translate([i,5+y,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i-3,5+y,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i+3,5+y,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);

}
rotate([0,0,90]){
translate([i+xx,5+38+yy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i-3+xx,5+38+yy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i+3+xx,5+38+yy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
}
rotate([0,0,90]){
translate([i+xx,5+38+yy+sy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i-3+xx,5+38+yy+sy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
translate([i+3+xx,5+38+yy+sy,0])rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);
}
}
}
translate([0,0,-1])cylinder(r=2.8/2,h=12);
translate([0,49,-1])cylinder(r=2.8/2,h=12);
translate([0+58,49,-1])cylinder(r=2.8/2,h=12);
translate([0+58,0,-1])cylinder(r=2.8/2,h=12);
for(i=[28]){
for(y=[0,38]){
translate([i,5+y,-1])cylinder(r=2.8/2,h=12);
}}
for(i=[3,54]){
for(y=[20]){
translate([i,5+y,-1])cylinder(r=2.8/2,h=12);
}}




}
//translate([25,5,0])difference(){rotate([0,0,45])cylinder(r=10/2,h=4,$fn=4);cylinder(r=2.8/2,h=12);}
}





module zbed_washer_hold_plate_into_place(){

difference(){
cylinder(r=21/2,h=5);
translate([0,0,-0.1])cylinder(r=2.8/2,h=6);
}
}


module tslot_clamp_filament_linearactuator_shuttle_noextrusion(){
translate([2,-5,-13])difference(){
union(){
//translate([0,0,-3.5])cube([16,60,4+3.5]);
translate([0-15.5,17.4,0-3.4])cube([16+15.5+4,25,4+5+3.5]);
translate([0-15.5,17.4,0-3.4+7.5])cube([16+15.5+4+20,25,4+5+3.5-7.5]);
}
translate([0.35+0.75+40+6-83-2-0.1,75-1-5.35,-25-2.5])rotate([0,0,90]){
translate([-38.25+14-13.9+6.5,-70+30-10+8+5-16+1.5,22.5+8-8-2.5])rotate([-0,0,0])cylinder(r=4.5/2,h=11.8,$fn=35);
translate([-38.25+14-13.9+6.5,-70+30-10+8+5-16+1.5,22.5+8-8])rotate([-0,0,0])cylinder(r=2.5/2,h=36,$fn=35);
translate([-38.25+14-13.9+6.5-15,-70+30-10+8+5-16+1.5,22.5+8-8-2.5])rotate([-0,0,0])cylinder(r=4.5/2,h=11.8,$fn=35);
translate([-38.25+14-13.9+6.5-15,-70+30-10+8+5-16+1.5,22.5+8-8])rotate([-0,0,0])cylinder(r=2.5/2,h=36,$fn=35);
translate([-38.25+14-13.9+6.5,-70+30-10+8+5-16+1.5+13,22.5+8-8-2.5])rotate([-0,0,0])cylinder(r=4.5/2,h=11.8,$fn=35);
translate([-38.25+14-13.9+6.5,-70+30-10+8+5-16+1.5+13,22.5+8-8])rotate([-0,0,0])cylinder(r=2.5/2,h=36,$fn=35);
translate([-38.25+14-13.9+6.5-15,-70+30-10+8+5-16+1.5+13,22.5+8-8-2.5])rotate([-0,0,0])cylinder(r=4.5/2,h=11.8,$fn=35);
translate([-38.25+14-13.9+6.5-15,-70+30-10+8+5-16+1.5+13,22.5+8-8])rotate([-0,0,0])cylinder(r=2.5/2,h=36,$fn=35);
}
/*
translate([8,30-6,-1])cylinder(r=3.7/2,h=20);
translate([8,30-6,0-3.6])cylinder(r=6.5/2,h=3.6);
translate([8,30+6,-1])cylinder(r=3.7/2,h=20);
translate([8,30+6,0-3.6])cylinder(r=6.5/2,h=3.6);
*/
//translate([8,30-22,-1])cylinder(r=5.9/2,h=20);
//translate([8,30+22,-1])cylinder(r=5.9/2,h=20);
//translate([8,30-22,-1])cylinder(r=5.9/2,h=20);

translate([8+22,30-15+8,-1-6])cylinder(r=2.8/2,h=50);
translate([8+22,30-15+8+13,-1-6])cylinder(r=2.8/2,h=50);
/*
translate([8,30+15,-1-6])cylinder(r=5.9/2,h=50);
translate([8,30-15,4-3.5])cylinder(r=10/2,h=20);
translate([8,30+15,4-3.5])cylinder(r=10/2,h=20);
*/
}
}
















module tslot_clamp_filament_linearactuator_shuttle(){
difference(){
union(){
translate([0,0,-3.5])cube([16,60,4+3.5]);
translate([0,17.5,0-3.5])cube([16,25,4+5+3.5]);
}
translate([8,30-6,-1])cylinder(r=3.7/2,h=20);
translate([8,30-6,0-3.6])cylinder(r=6.5/2,h=3.6);
translate([8,30+6,-1])cylinder(r=3.7/2,h=20);
translate([8,30+6,0-3.6])cylinder(r=6.5/2,h=3.6);
//translate([8,30-22,-1])cylinder(r=5.9/2,h=20);
//translate([8,30+22,-1])cylinder(r=5.9/2,h=20);
translate([8,30-15,-1-6])cylinder(r=5.9/2,h=50);
translate([8,30+15,-1-6])cylinder(r=5.9/2,h=50);
translate([8,30-15,4-3.5])cylinder(r=10/2,h=20);
translate([8,30+15,4-3.5])cylinder(r=10/2,h=20);
}
}





module tslot_clamp_filament_linearactuator_shuttle_shim(wd){
rotate([0,0,45])difference(){
cylinder(r=18/2,h=wd,$fn=4);
translate([0,0,-1])cylinder(r=6/2,h=10);
}
}


module iverntech_slider_x4(){
color("silver")difference(){union(){
//translate([-34-0.65,39-0.5,0])cube([69.3,1,25]);
//translate([-2+2,-12+0.065,0])cube([1,60.94+26,25]);

difference(){cylinder(r=24/2,h=3.3);translate([0,-3.115,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
translate([-14,29-20,0])rotate([0,0,0])cube([28,40,4.5]);
translate([-24,29,0])rotate([0,0,0])cube([48,20,3.3]);
translate([10,-6,0])rotate([0,0,63])cube([47,20,3.3]);
translate([-32,36,0])rotate([0,0,-63])cube([47,20,3.3]);
translate([0,38.94,0])difference(){cylinder(r=7.68+2., h=3.3);
for(i=[-3,-2,-1,0,1,2,3]){
translate([0,i,-0.1])cylinder(r=(5.5+0.8)/2,h=6);//translate([0,1,-0.1])cylinder(r=(5+0.8)/2,h=6);
}
translate([0,-42,-0.1])cylinder(r=(5.5+0.8)/2,h=6);//translate([0,1,-0.1])cylinder(r=(5.5+0.8)/2,h=6);
}

//For milling
translate([-25,38.94,0])difference(){cylinder(r=10, h=3.3);translate([-1,0,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
translate([25,38.94,0])difference(){cylinder(r=10, h=3.3);translate([1,0,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
}
translate([0,-3.115,-0.1])cylinder(r=(5.7+0.8)/2,h=6);
translate([0,38.94,0]){
for(i=[-1,0,1]){
translate([0,i,-0.1])cylinder(r=5.5/2,h=6);//translate([0,1,-0.1])cylinder(r=(5+0.8)/2,h=6);
}
}
//For 3D printing I like this
//translate([-23.56-0.5,38.94,0])translate([-1,0,-6.1])cylinder(r=(5.7+0.8)/2,h=16);
//translate([23.56+0.5,38.94,0])translate([1,0,-6.1])cylinder(r=(5.7+0.8)/2,h=16);
//For milling
translate([-25,38.94,0])translate([-1,0,-6.1])cylinder(r=(5.9+0.8)/2,h=36);
translate([25,38.94,0])translate([1,0,-6.1])cylinder(r=(5.9+0.8)/2,h=36);
}
}

module iverntech_slider_tslot_connector(){

/*
//bearings for corexy example
translate([-27/2+12/2+29.5,150-5+8,2-3+6-25-3-3.2])
translate([4,1,-15]){
color("silver")
cylinder(r=5.3/2,h=20);
difference(){
union(){
color("silver")
cylinder(r=17/2,h=5);
color("black")
translate([0,0,0.5])cylinder(r=18/2,h=4);
}
translate([0,0,-0.5])cylinder(r=5.7/2,h=6);
}
}
translate([-27/2+12/2+29.5,150-5+8+52,2-3+6-25-3-3.2])
translate([4,1,-15]){
color("silver")
cylinder(r=5.3/2,h=20);
difference(){
union(){
color("silver")
cylinder(r=17/2,h=5);
color("black")
translate([0,0,0.5])cylinder(r=18/2,h=4);
}
translate([0,0,-0.5])cylinder(r=5.7/2,h=6);
}
}
*/
//for show
/*
//This is the screw
translate([-27/2+12/2+29.5,150-5,2-3+6-25-3-3.2]){
translate([9,9+9,6.0-2])cylinder(r=5.9/2,h=11);
translate([9,9+9,2])difference(){
 cylinder(r=9/2,h=3);
 translate([0,0,-0.1])cylinder(r=5/2,h=3.1,$fn=6);
}
translate([9,9+52-9,6.0-2])cylinder(r=5.9/2,h=10);
translate([9,9+52-9,2])difference(){
 cylinder(r=9/2,h=3);
 translate([0,0,-0.1])cylinder(r=5/2,h=3.1,$fn=6);
 }
}
*/


translate([-27/2+12/2+29.5,150-5,2-3+6-25-3-3.2])difference(){
union(){

color("")cube([18,70,4.5+3+3.3]);
color("")translate([-30,20,0])cube([18+30,30,3.3]);
color("")translate([-30+35,20,0])cube([18+30-15,30,4.4]);
}
translate([9,9+9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+9,6.0-30-10])cylinder(r=12/2,h=40);
translate([9,9+52-9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+52-9,6.0-30-10])cylinder(r=12/2,h=40);
translate([9-5+23,9+52/2,-6])cylinder(r=5.9/2,h=20);
//translate([9-5,9+52/2,4])cylinder(r=12/2,h=10);
translate([9-5-20-4,9+52/2,-20.5])cylinder(r=5/2,h=50);
//translate([9-5-30,9+52/2,-20.5])cylinder(r=2.8/2,h=50);
translate([9-5,9+52,-34])cylinder(r=5/2,h=40);
translate([9-5,9+52,6])cylinder(r=11/2,h=30);
translate([9-5,9,-34])cylinder(r=5/2,h=40);
translate([9-5,9,6])cylinder(r=11/2,h=40);
}
}








module iverntech_slider(){
//slider model 
//here is the rail
color("silver")cube([12,300,8]);
//here is the slider 
translate([-27/2+12/2,150,2-3+6])color("silver")cube([27,45,9]);
translate([-9,350,-25])rotate([90,0,0])tslot20(400);
translate([-9+23+2,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
/*
*/

/*
translate([-27/2+12/2+29.5,150-5,2-3+6-25-3-3.2])color("")difference(){
union(){
cube([18,70,4.5+3+3.3]);
translate([-30,20,0])cube([18+30,35,3.3]);
}
translate([9,9+9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+9,6.0-30-10])cylinder(r=12/2,h=40);
translate([9,9+52-9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+52-9,6.0-30-10])cylinder(r=12/2,h=40);

translate([9-5,9,-20.5])cylinder(r=5.9/2,h=50);
translate([9-5,9+52/2,-6])cylinder(r=5.9/2,h=10);
translate([9-5,9+52/2,4])cylinder(r=12/2,h=10);
translate([9-5-20,9+52/2,-20.5])cylinder(r=5/2,h=50);
translate([9-5-30,9+52/2,-20.5])cylinder(r=2.8/2,h=50);
translate([9-5,9+52,-20.5])cylinder(r=5.9/2,h=50);
}
*/
iverntech_slider_tslot_connector();
//for show
translate([-27/2+12/2,150,3+3]){
translate([0,0,9]){
 translate([27/2+23+2,45/2-26,-11])cylinder(r=5/2,h=20);
 translate([27/2+23+2,45/2-26,8])difference(){
 cylinder(r=9/2,h=3);translate([0,0,-0.1])cylinder(r=5/2,h=3.3,$fn=6);
 }
 translate([27/2+23+2,45/2+26,-11])cylinder(r=5/2,h=20);
 translate([27/2+23+2,45/2+26,8])difference(){
 cylinder(r=9/2,h=3);translate([0,0,-0.1])cylinder(r=5/2,h=3.3,$fn=6);
 }
}}
/*
*/
translate([-27/2+12/2,150,3+3]){
translate([0,0,9])difference(){
 union(){
 translate([0,0,-1])color("")cube([27,45,9]);
 color("")translate([20+10,45/2-9,2])cube([16,18,6]);
 color("")translate([20+10-3,45/2-7-30,2])cube([16+5,14+60,6]);
 }
 //translate([27/2+23,45/2,-5])cylinder(r=5.7/2,h=20);
 translate([27/2+23,45/2,2])cylinder(r=10/2,h=3);
 translate([27/2+23+2,45/2-26,-5])cylinder(r=5.7/2,h=20);
 translate([27/2+23+2,45/2+26,-5])cylinder(r=5.7/2,h=20);
 translate([27/2-10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2-10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+4,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2-8,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2+4,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-8,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2-10,45/2+10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2+10,5])cylinder(r=6.5/2,h=3);
}
}
}



module iverntech_slider_wider(y){
/*
//slider model 
//here is the rail
translate([0,0,0])color("silver")cube([12,300,8]);
//here is the slider 
translate([-27/2+12/2,150,2-3+6])color("silver")cube([27,45,9]);
translate([-9,350,-25])rotate([90,0,0])tslot20(400);
*/
translate([-9+23+2-8,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
/*
translate([-27/2+12/2+29.5,150-5,2-3+6-25-3-3.2])color("")difference(){
union(){
cube([18,70,4.5+3+3.3]);
translate([-30,20,0])cube([18+30,35,3.3]);
}
translate([9,9+9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+9,6.0-30-10])cylinder(r=12/2,h=40);
translate([9,9+52-9,6.0])cylinder(r=5.9/2,h=10);
translate([9,9+52-9,6.0-30-10])cylinder(r=12/2,h=40);
translate([9-5,9,-20.5])cylinder(r=5.9/2,h=50);
translate([9-5,9+52/2,-6])cylinder(r=5.9/2,h=10);
translate([9-5,9+52/2,4])cylinder(r=12/2,h=10);
translate([9-5-20,9+52/2,-20.5])cylinder(r=5/2,h=50);
translate([9-5-30,9+52/2,-20.5])cylinder(r=2.8/2,h=50);
translate([9-5,9+52,-20.5])cylinder(r=5.9/2,h=50);
}
*/
translate([-8,0,0])iverntech_slider_tslot_connector();
//for show its the screws
translate([-27/2+12/2-8,150,3+3]){
translate([0,0,9]){
 translate([27/2+23+2,45/2-26,-11])color("black")cylinder(r=5/2,h=20);
 translate([27/2+23+2,45/2-26,8])difference(){
 color("black")cylinder(r=9/2,h=3);translate([0,0,-0.1])color("black")cylinder(r=5/2,h=3.3,$fn=6);
 }
 translate([27/2+23+2,45/2+26,-11])color("black")cylinder(r=5/2,h=20);
 translate([27/2+23+2,45/2+26,8])difference(){
  color("black")
 cylinder(r=9/2,h=3);translate([0,0,-0.1])color("black")cylinder(r=5/2,h=3.3,$fn=6);
 }
}}
/*
*/
iverntech_slider_shuttle_bottom();
}




module iverntech_slider_xshuttle_connect(){
translate([-27/2+12/2,150,3+3]){
translate([0,0,9])difference(){
 union(){
 translate([0,0,-1])color("")cube([27,45,9+4.9]);
 color("")translate([20+10,45/2-9,2+1.5])cube([16-5,18,6+4.9-1.5]);
 color("")translate([20+10-3,45/2-7-30-9,2+1.5])cube([16+5-5,14+60+19,6+4.9-1.5]);
 } //end union
 translate([27/2+23+2-8+5,45/2-2,-5+12.5-10+3])#cylinder(r=17/2,h=10);
 translate([27/2+23+2-8+8,45/2-2,-5+12.5-10+3])#cylinder(r=17/2,h=10);
 translate([27/2+23+2-8+5,45/2-0,-5+12.5-10+3])#cylinder(r=17/2,h=10);
 translate([27/2+23+2-8+8,45/2-0,-5+12.5-10+3])#cylinder(r=17/2,h=10);

// translate([27/2+23,45/2,-5])cylinder(r=5.7/2,h=20);
// translate([27/2+23,45/2,2-0.1])cylinder(r=10/2,h=3);
 translate([27/2+23+2-8+2,45/2-26-9,-5+12.5])cylinder(r=5.7/2,h=10);
 translate([27/2+23+2-8+2,45/2-26-9,-5+12.5-10])cylinder(r=10/2,h=10);
 translate([27/2+23+2-8+2,45/2+26+9,-5+12.5])cylinder(r=5.7/2,h=10);
 translate([27/2+23+2-8+2,45/2+26+9,-5+12.5-10])cylinder(r=10/2,h=10);
 translate([27/2+4+16.5,45/2-18,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+4+16.5,45/2-18,-5+14])cylinder(r=8.5/2,h=4);
 translate([27/2+4+16.5,45/2+15,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+4+16.5,45/2+15,-5+14])cylinder(r=8.5/2,h=4);
 translate([27/2-10,45/2-10,-4])cylinder(r=3.7/2,h=10);
 translate([27/2-10,45/2-10,6])cylinder(r=8/2,h=10);
 translate([27/2+10,45/2-10,-4])cylinder(r=3.7/2,h=10);
 translate([27/2+10,45/2-10,6])cylinder(r=8/2,h=10);
 translate([27/2-10,45/2+10,-4])cylinder(r=3.7/2,h=10);
 translate([27/2-10,45/2+10,6])cylinder(r=8/2,h=10);
 translate([27/2+10,45/2+10,-4])cylinder(r=3.7/2,h=10);
 translate([27/2+10,45/2+10,6])cylinder(r=8/2,h=10);
 translate([27/2+4,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2-8,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2+4,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-8,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2-10,45/2+10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2+10,5])cylinder(r=6.5/2,h=3);
}
}
}







module iverntech_slider_shuttle_bottom(){
translate([-27/2+12/2,150,3+3]){
translate([0,0,9])difference(){
 union(){
 translate([0,0,-1])color("")cube([27,45,9]);
 color("")translate([20+10,45/2-9,2])cube([16-5,18,6]);
 color("")translate([20+10-3,45/2-7-30,2])cube([16+5-5,14+60,6]);
 }
 translate([27/2+23,45/2,-5])cylinder(r=5.7/2,h=20);
 translate([27/2+23,45/2,2-0.1])cylinder(r=10/2,h=3);
 translate([27/2+23+2-8,45/2-26,-5])cylinder(r=5.7/2,h=20);
 translate([27/2+23+2-8,45/2+26,-5])cylinder(r=5.7/2,h=20);
 translate([27/2-10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2-10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+4,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2-8,45/2,-5])cylinder(r=2.8/2,h=20);
 translate([27/2+4,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-8,45/2,-1])cylinder(r=7/2,h=4,$fn=6);
 translate([27/2-10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2-10,5])cylinder(r=6.5/2,h=3);
 translate([27/2-10,45/2+10,5])cylinder(r=6.5/2,h=3);
 translate([27/2+10,45/2+10,5])cylinder(r=6.5/2,h=3);
}
}
}


















































module coverpanel_screw(){
difference(){union(){
translate([10,105,-55])cube([5,60,10]);
translate([10,105+17.5,-55])cube([20,25,5]);
}
for(i=[-2:5]){
translate([10+10+(i*1),105+30+5,-55])cylinder(r=2.8/2,h=200);
translate([10+10+(i*1),105+30-5,-55])cylinder(r=2.8/2,h=200);
}

translate([10+10-60,105+30+5+20+0.5,-50+1])rotate([0,90,0])cylinder(r=2.9/2,h=200);
translate([10+10-60,105+30+5+20+0.5-50,-50+1])rotate([0,90,0])cylinder(r=2.9/2,h=200);
}
}


module pcb_panels_wider(){
//col = "lightgrey";
//coverpanel_screw();
//translate([-9,-9,-14+60])screen_cover();
//translate([74,10,-18])rotate([-90,0,0])kill_button_leds_panelmount();
//translate([440-435,35+50+50,-4-50])rotate([0,-90,0])binding_post_connector();
//This is the syringe panel
translate([440,200-0.8,-64])rotate([90,0,-90]){
/*
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([-260+250-142,200-0.8-150-13,443-15])rotate([180,0,0]){
translate([0,-7,0])conveyer_pcb_holder_front();
translate([0,-7,0])conveyer_pcb_holder_backsupport();
}
*/
}
translate([440+80+45,200-0.8-52-42,-63])rotate([90,0,-90]){
color("")translate([28,21,5])bananajackpanel();
//translate([40-12.5,-40+61,2])syringe_pcb_holder();
//translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the liquid level pcb
translate([440+80+45,200-0.8+162-52-42,-63])rotate([90,0,-90]){
translate([28,21,5])color("green")liquidlevel_pumps_pcb();
//translate([40-12.5,-40+61,2])syringe_pcb_holder();
//translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the power connect panel
color(col)
translate([424-75,0+30,-63])rotate([0,180,0])atx_power_connect_assy();
//This is the conveyer pcb part
translate([49-75,200-0.8+162+50-6+30,-63.5])rotate([90,0,-0]){
color(col)
translate([28,21,5])conveyer_panel_pcb_holder();
}
//This is the syringe panel hay hay
color(col)
translate([219-75,200-0.8+162+50-6-403+3-60-42,-2.2+3.5])rotate([-90,0,0]){
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([40-12.5+53,-40+61,2])syringe_pcb_holder_placeholder();

}
//This is the control panel
color(col)
translate([69.2-75,13-60-42+3,-52])rotate([90,0,0])bom_controlpanel();
//usbs_socket
//translate([-52,0,-75])difference(){
translate([8+12.5,17.5-52,-61.4])rotate([90,180,-90]){
//color("")
color(col)
translate([2-45,0,12+80-4])
 //usbs_socket_alu_support_lid_usbs_simplier();
 hdmi_rj45_usb_panel();
}
//open slot for hacking
translate([8+12.5-80+4,17.5+140-52-45,-61.4])rotate([90,180,-90]){
//color("")
color(col)
//translate([2,0,12])usbs_socket_alu_support_lid_usbs_cover();
//translate([2,0,12])syringe_panel_wider();
translate([2+90,0-43,12])liquidlevel_pumps_pcb();


}
//cooling fan
translate([8+12.5-80+4,17.5+140-52-45,-61.4])rotate([90,180,-90]){
//color("")
color("black")
translate([2-125,0-55,12])cube([40+5,40+5,3]);
}
}





























module pcb_panels_wider_deeper(){
col = "lightgrey";
//coverpanel_screw();
//translate([-9,-9,-14+60])screen_cover();
//translate([74,10,-18])rotate([-90,0,0])kill_button_leds_panelmount();
//translate([440-435,35+50+50,-4-50])rotate([0,-90,0])binding_post_connector();
//This is the syringe panel
translate([440,200-0.8,-64])rotate([90,0,-90]){
/*
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([-260+250-142,200-0.8-150-13,443-15])rotate([180,0,0]){
translate([0,-7,0])conveyer_pcb_holder_front();
translate([0,-7,0])conveyer_pcb_holder_backsupport();
}
*/
}
//This is the banana jack panel
translate([440+80+45,200-0.8-52-42,-63])rotate([90,0,-90]){
color(col)translate([28,21,5])bananajackpanel();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the liquid level pcb
translate([440+80+45,200-0.8+162-52-42,-63])rotate([90,0,-90]){
color(col)
translate([28,21,5])liquidlevel_pumps_pcb();
//translate([40-12.5,-40+61,2])syringe_pcb_holder();
//translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the power connect panel
color(col)
translate([424-75,0+30+60,-63])rotate([0,180,0])atx_power_connect_assy();
//This is the conveyer pcb part
translate([49-75,200-0.8+162+50-6+30+60,-63.5])rotate([90,0,-0]){
color(col)
translate([28,21,5])conveyer_panel_pcb_holder();
}
//This is the syringe panel hay hay
color(col)
translate([219-75,200-0.8+162+50-6-403+3-60-42,-2.2+3.5])rotate([-90,0,0]){
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([40-12.5+53,-40+61,2])syringe_pcb_holder_placeholder();
}
//This is the control panel
color(col)
translate([69.2-75,13-60-42,-52])rotate([90,0,0])bom_controlpanel();
//usbs_socket
//translate([-52,0,-75])difference(){
translate([8+12.5,17.5-52,-61.4])rotate([90,180,-90]){
//color("")
color(col)
translate([2-45,0,12+80])
 //usbs_socket_alu_support_lid_usbs_simplier();
 hdmi_rj45_usb_panel();
}
//open slot for hacking
translate([8+12.5-80,17.5+140-52-45,-61.4])rotate([90,180,-90]){
//color("")
color(col)
translate([2,0,12])usbs_socket_alu_support_lid_usbs_cover();
}
//cooling fan
translate([8+12.5-80,17.5+140-52-45,-61.4])rotate([90,180,-90]){
//color("")
color("black")
translate([2-125,0-55,12])cube([40+5,40+5,3]);
}
}




















module pcb_panels(){
col = "lightgrey";
//coverpanel_screw();
//translate([-9,-9,-14+60])screen_cover();
//translate([74,10,-18])rotate([-90,0,0])kill_button_leds_panelmount();
//translate([440-435,35+50+50,-4-50])rotate([0,-90,0])binding_post_connector();
//This is the syringe panel
translate([440,200-0.8,-64])rotate([90,0,-90]){
/*
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([-260+250-142,200-0.8-150-13,443-15])rotate([180,0,0]){
translate([0,-7,0])conveyer_pcb_holder_front();
translate([0,-7,0])conveyer_pcb_holder_backsupport();
}
*/
}
//This is the banana jack panel
translate([440,200-0.8,-63])rotate([90,0,-90]){
color(col)
translate([28,21,5])bananajackpanel();
//translate([40-12.5,-40+61,2])syringe_pcb_holder();
//translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the liquid level pcb
translate([440,200-0.8+162,-63])rotate([90,0,-90]){
color(col)
translate([28,21,5])liquidlevel_pumps_pcb();
//translate([40-12.5,-40+61,2])syringe_pcb_holder();
//translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
}
//This is the power connect panel
color(col)
translate([424,0,-63])rotate([0,180,0])atx_power_connect_assy();
//This is the conveyer pcb part
translate([49,200-0.8+162+50-6,-63.5])rotate([90,0,-0]){
color(col)
translate([28,21,5])conveyer_panel_pcb_holder();
}
//This is the syringe panel
color(col)
translate([219,200-0.8+162+50-6-403+3,-2.2+3.5])rotate([-90,0,0]){
translate([28,21,5])syringe_pcb_holder_back();
translate([40-12.5,-40+61,2])syringe_pcb_holder();
translate([40-12.5,-40+61,6])syringe_pcb_holder_cover();
translate([40-12.5+53,-40+61,2])syringe_pcb_holder_placeholder();
}
//This is the control panel
color(col)
translate([69.2,13,-52])rotate([90,0,0])bom_controlpanel();
//usbs_socket
translate([8+12.5,17.5,-61.4])rotate([90,180,-90]){
//color("")
color(col)
translate([2,0,12])
 //usbs_socket_alu_support_lid_usbs_simplier();
 hdmi_rj45_usb_panel();
}
//open slot for hacking
translate([8+12.5,17.5+140,-61.4])rotate([90,180,-90]){
//color("")
color(col)
translate([2,0,12])usbs_socket_alu_support_lid_usbs_cover();
}
//cooling fan
translate([8+12.5,17.5+140,-61.4])rotate([90,180,-90]){
//color("")
color("black")
translate([2-125,0-55,12])cube([40+5,40+5,3]);
}
}
















module bom_controlpanel(){
//translate([0,40,6])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_controlpanel",h=8);
difference(){
cube([61.9,39.3,3]);
translate([5.772,33.154,-50.1])cylinder(r=3.5/2,h=200);
translate([56.627,33.256,-50.1])cylinder(r=3.5/2,h=200);
translate([5.772,5.117,-50.1])cylinder(r=3.5/2,h=200);
translate([57.957,6.038,-50.1])cylinder(r=3.5/2,h=200);
//translate([15.186,20.875,-50.1])rotate([0,0,45])cylinder(r=9/2,h=200);
//translate([34.627,21.591,-50.1])rotate([0,0,45])cylinder(r=5.5/2,h=200);
//translate([52.329,21.591,-50.1])rotate([0,0,45])cylinder(r=5.5/2,h=200);
}
}



module microwell_plate_centrifuge(){

//import("96_microwell_plate.STL.stl");
difference(){
union(){
translate([-70,-50,0])cube([140,113-13,2]);
translate([-70-15,-50,0])cube([140+30,20,2]);
translate([-70-15,-50+80,0])cube([140+30,20,2]);
translate([-70,-50,0])cube([14,5,6]);
translate([-70,-50,0])cube([5,14,6]);
translate([-70+126,-50,0])cube([14,5,6]);
translate([-70+126+9,-50,0])cube([5,14,6]);
translate([-70+126+9,-50+80,0])cube([5,14,6]);
translate([-70,-50+80,0])cube([5,14,6]);
translate([-70,-50+94,0])cube([14,5,6]);
translate([-70+126,-50+94,0])cube([14,5,6]);
}
translate([-70+25,-50+20,-0.2])cube([90,60,3]);
translate([-70+20,50,-0.3])cube([100,120,3]);

//translate([-70+10,55,-0.3])cylinder(r=4/2,h=30);
//translate([-70+10+120,55,-0.3])cylinder(r=4/2,h=30);


translate([-70+10-16,55-15,-0.3])cylinder(r=4/2,h=30);
translate([-70+10+120+16,55-15,-0.3])cylinder(r=4/2,h=30);

translate([-70+10-16,55-98,-0.3])cylinder(r=4/2,h=30);
translate([-70+10+120+16,55-98,-0.3])cylinder(r=4/2,h=30);
}
}


module screen_cover(){

translate([22,27,-40])
difference(){
translate([0,2-2,-10])cube([412+2.5,370+4.5,3]);
translate([-10,-10,-20.4])cube([19,25,35]);
translate([-10+412+2,-10+370+5,-20.4])cube([25,25,35]);
translate([-10,-10+370+5,-20.4])cube([20,15,35]);
translate([-10+412+2,-10-6,-20.4])cube([25,25,35]);
}
}


module screenpost(){

 difference(){
 union(){
 color("")translate([70-2,61-5,-5-2.4])cube([10,25+5,5]);
 color("")translate([70-2+5.5-3.5-0.2-4.7625-4-12,61+5.25+13/2-0.5+0.1-5-4,-5-2.4-5])
cube([19,20,10]);
//rotate([0,0,45])
//cylinder(r=15/2,h=8,$fn=4);
 }
 //color("")translate([70-2+5.5-3.5-0.2-4.7625,61+5.25+13/2-0.5+0.1,-5-2.4])cylinder(r=4/2,h=40);
 for(i=[-2:15]){ 
 color("")translate([70-2+5.5-3.5-0.2-4.7625-i*0.5-3,61+5.25+13/2-0.5+0.1+i*0.5-3,-5-2.4-40])rotate([0,0,0])cylinder(r=4/2,h=80);
 color("")translate([70-2+5.5-3.5-0.2-4.7625-i*0.5-3,61+5.25+13/2-0.5+0.1+i*0.5-3,-5-2.4-40-40])rotate([0,0,0])cylinder(r=5.7/2,h=80);
}

 for(i=[-2:10]){
 color("")translate([70-2+5.5,61+5.25-i*0.5,-5-2.4-10])cylinder(r=4/2,h=30);
 color("")translate([70-2+5.5,61+5.25+13-i*0.5,-5-2.4-10])cylinder(r=4/2,h=30);
 }
 color("")translate([70-2+5.5,61+5.25+13,-5-2.4-10])cylinder(r=4/2,h=30);
 }
}



module printhead_pcb_holes(){
translate([-35,51,0])solenoid_endstop_brd(63.5,48);
translate([35-50,25,0])difference(){
cube([20,20,5]);
translate([10,10,-0.2])cylinder(r=5.7/2,h=20);
}

translate([35-70,45,0])
cube([64,51,1.5]);
}

module conveyer_panel_pcb_holes(){
 translate([-35,51,0])solenoid_endstop_brd(110,44);
translate([35-30,25,0])difference(){
cube([20,20,5]);
translate([10,10,-0.2])cylinder(r=5.7/2,h=20);
}
}



module conveyer_pcb_holder_backsupport(){
difference(){
union(){
translate([-5-5,-0.192-10-5,0])cube([109+10,43+10-6-2,5]);
//translate([3.2,-0.192,0])cube([43,22,3]);

i=0;

translate([i*50-5,-6.5-8.7,0])cube([110,10,10]);
translate([i*50-5,-6.5-8.7+43,0])cube([110,10-5,10]);
for(i=[0:2]){
translate([i*50,-6.5,0])cylinder(r=(2.8+2)/2,h=5);
translate([i*50,35-6.5,0])cylinder(r=(2.8+2)/2,h=5);
}
}
//translate([-5,-0.192-10,-0.1])cube([109/2,43-10,5]);
//translate([-5,-0.192-10,-0.1])cube([109/2,43+10,6]);
translate([-5+6.5+3,-0.192-10+6.5+8-16,-0.2])cube([(109-13)/2-6,46,14]);
translate([-5+6.5+3+49,-0.192-10+6.5+8-16,-0.2])cube([(109-13)/2-6,46,14]);
translate([-5+10.6,-0.192-10+9.6,-0.1])cube([9.5,21,9]);
translate([-5+33.3,-0.192-10+9.6,-0.1])cube([9.5,21,9]);
translate([-5+58.5,-0.192-10+9.6,-0.1])cube([9.5,21,9]);
translate([-5+81.5,-0.192-10+9.6,-0.1])cube([9.5,21,9]);

/*

translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);

translate([52,0,0]){
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
*/
for(i=[0:2]){
translate([i*50,-6.5,-50])cylinder(r=2.8/2,h=200);
translate([i*50,35-6.5,-50])cylinder(r=2.8/2,h=200);
}
}
}


module conveyer_pcb_holder_front(){
difference(){
union(){
translate([-5,-0.192-10-1-2,0])cube([109,43+1+4-5,5]);
}


translate([-5+5,-0.192-10+5,2])cube([109-10,43-10,5]);
translate([-5+5+5-2,-0.192-10+0,2])cube([(109-10)/2-10+5,(43-10)+9,5]);
translate([-5+5+5-2+50,-0.192-10+0,2])cube([(109-10)/2-10+5,(43-10)+9,5]);
translate([-5+10.6+0.75-1,-0.192-10+9.6-1.5+1,-0.1])cube([9.5+1,21+2,9]);
translate([-5+33.3+0.75-1,-0.192-10+9.6-1.5+1,-0.1])cube([9.5+1,21+2,9]);
translate([-5+58.5+0.75-1,-0.192-10+9.6-1.5+1,-0.1])cube([9.5+1,21+2,9]);
translate([-5+81.5+0.75-1,-0.192-10+9.6-1.5+1,-0.1])cube([9.5+1,21+2,9]);
for(i=[0:2]){
translate([i*50,-6.5,-50])cylinder(r=4/2,h=200);
translate([i*50,35-6.5,-50])cylinder(r=4/2,h=200);
}
}
}








module syringe_pcb_holder(){
difference(){
translate([3.2,-0.192,0])cube([39,22,3]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
}

module syringe_pcb_holder_placeholder(){
difference(){
translate([3.2,-0.192,0])cube([39,22,3]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
//translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
}




module syringe_pcb_holder_cover(){
difference(){
translate([3.2,-0.192,0])cube([39,22,6]);
translate([3.2-1,-0.192+6,3])cube([39+2,5+4,10]);
translate([3.2-10,-0.192+6,0])cube([39/2,5+4,10]);
translate([3.2+26,-0.192+6,0])cube([39/2,5+4,10]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
//translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
}


module bananajackpanel(){
difference(){
union(){
translate([-5,-0.192-10,0])cube([109,43,3]);
translate([3.2,-0.192,0])cube([43,22,3]);
}

/*
translate([5.456+3.7/2+3,0.376+3.7/2+1,-0.1])cylinder(r=4.5/2,h=200);
translate([5.456+3.7/2+3,0.376+3.7/2+15,-0.1])cylinder(r=4.5/2,h=200);

translate([5.456+3.7/2+3+40,0.376+3.7/2+1,-0.1])cylinder(r=4.5/2,h=200);
translate([5.456+3.7/2+3+40,0.376+3.7/2+15,-0.1])cylinder(r=4.5/2,h=200);

translate([5.456+3.7/2+3+80,0.376+3.7/2+1,-0.1])cylinder(r=4.5/2,h=200);
translate([5.456+3.7/2+3+80,0.376+3.7/2+15,-0.1])cylinder(r=4.5/2,h=200);
*/
/*
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([52,0,0]){
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
*/


for(i=[0,2]){
translate([i*50,-6.5,-50])cylinder(r=2.8/2,h=200);
translate([i*50,35-6.5,-50])cylinder(r=2.8/2,h=200);
}
}
}


module liquidlevel_pumps_pcb(){

//translate([12,-4,0])
//color("")BOM_liquidlevel_pumps();

difference(){
union(){
translate([-5,-0.192-10,0])cube([109,43,3]);
translate([3.2,-0.192,0])cube([43,22,3]);
}

translate([12+78,-0.5,0])rotate([0,180,0]){
translate([4.2,10.721,-50.1])cylinder(r=3.5/2,h=200);
translate([12.8-1-1,11.8-1-1,-50.1])cube([10.4+2+2,2.7+2+2,200]);
//translate([12.8-1,1.1-1,-50.1-2])cube([10.4+2,2.7+2,52]);
translate([77.892,10.721,-50.1])cylinder(r=3.5/2,h=200);
translate([54.1-1,11.8-1,-50.1])cube([15.5+2,2.7+2+2,200]);
//translate([54.1-1,1.1-1,-50.1-2])cube([15.5+2,2.7+2,52]);
}


/*
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);

translate([52,0,0]){
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
*/
for(i=[0,2]){
translate([i*50,-6.5,-50])cylinder(r=2.8/2,h=200);
translate([i*50,35-6.5,-50])cylinder(r=2.8/2,h=200);
}
}
}

module conveyer_panel_pcb_holder(){
//translate([100,-10,-0])color("blue")BOM_conveyer_panel();
difference(){
union(){
translate([-5,-0.192-10,0])cube([109+3,43,3]);
translate([3.2,-0.192,0])cube([43,22,3]);
}
//translate([1*50+0.0,-6.5+0.0,-50])cylinder(r=4/2,h=200);
translate([2*50+2.0,-6.5+0.0,-50])cylinder(r=4/2,h=200);
translate([0*50.+3,35-6.5+1,-50])cylinder(r=4/2,h=200);
//translate([1*50.-2.7+3,35-6.5+0,-50])cylinder(r=4/2,h=200);
translate([2*50.-5.7,35-6.5-1.5,-50])cylinder(r=4/2,h=200);
translate([0*50.+6,-6.5+0.8,-50])cylinder(r=4/2,h=200);

/*
translate([0,-10,0]){
translate([9.4-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([32.25-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([57.7-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([80.6-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
}
*/


}
}

module syringe_pcb_holder_back(){
difference(){
union(){
translate([-5,-0.192-10,0])cube([109,43,3]);
translate([3.2,-0.192,0])cube([43,22,3]);
}
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);

translate([52,0,0]){
translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=2.8/2,h=20);
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
}
for(i=[0:2]){
translate([i*50,-6.5,-50])cylinder(r=2.8/2,h=200);
translate([i*50,35-6.5,-50])cylinder(r=2.8/2,h=200);
}
}
}






module wash_dry_pcv_brd(){

 color("green")translate([-35,51,0])cube([28,29,1]);
 translate([-35,51,0])solenoid_endstop_brd(28,29);
 color("green")translate([-0,99,0])cube([25.5,16,1]);
 translate([-0,99,0])solenoid_endstop_brd(25.5,16);
 color("green")cube([116,92,1]);
 solenoid_endstop_brd(116,92);
 difference(){
 translate([-20,5,0])cube([16,13,3]);
 translate([-13.5,11.5,-23])cylinder(r=4/2,h=140);
 }
 translate([138,-3,0])difference(){
 translate([-20,5,0])cube([16,13,3]);
 translate([-13.5+3.8,14.2,-23])cylinder(r=4/2,h=140);
 }
 difference(){
 translate([-33,82,0])cube([28,13,3]);
 translate([-13.5-12,82+6.4,-23])cylinder(r=4/2,h=140);
 }
 difference(){
 translate([-33+100,82+10,0])cube([18,15,3]);
 translate([-33.5+110,82+19.5,-23])cylinder(r=4/2,h=140);
 }
}

module conveyer_panel_mount_pcb_back(){
difference(){
color("")translate([72-13+25,20-13-30/2,12])cube([60,42+30,5]);
color("")translate([72-13+25+30+5,20-13-30/2+35,-0.1])rotate([0,0,45])cylinder(r=20,h=200,$fn=4);
color("")translate([72-13+25+30,20-13-30/2+35,-0.1])rotate([0,0,45])cylinder(r=20,h=200,$fn=4);

color("")translate([72-13+25+30-25,20-13-30/2+35,-0.1])rotate([0,0,45])cylinder(r=20,h=200,$fn=4);
color("")translate([72-13+25,20-13-30/2+(72-58)/2,12+3.5])cube([60,58,2]);
color("")translate([72-5-9+80+24-20-8,20-6+3+29+14,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-20-8,20-6+3+29+14-64,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14-64,-0.2])cylinder(r=3.2/2,h=200);

}
}
module conveyer_panel_mount_pcb(){
//translate([45-7,2,10])import("svgs/conveyer_panel_pcb.dxf");
color("peru")back_plate_x1();
difference(){
union(){
color("")translate([72-13,20-13,12])cube([64+43,42,5]);
color("")translate([72-13+25,20-13-30/2,12])cube([20,42+30,5]);
color("")translate([72-13+25+40,20-13-30/2,12])cube([20,42+30,5]);
color("")translate([72-13+25+54,20-13-30/2,12])cube([20,42+18,5]);
}

color("")translate([72-5-9+80+24-20-8,20-6+3+29+14,-0.2])cylinder(r=4/2,h=200);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14,-0.2])cylinder(r=4/2,h=200);
color("")translate([72-5-9+80+24-20-8,20-6+3+29+14-64,-0.2])cylinder(r=4/2,h=200);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14-64,-0.2])cylinder(r=4/2,h=200);


color("")translate([72-5-9+80+24-20-8,20-6+3+29+14,14])cylinder(r=9/2,h=3);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14,14])cylinder(r=9/2,h=3);
color("")translate([72-5-9+80+24-20-8,20-6+3+29+14-64,14])cylinder(r=9/2,h=3);
color("")translate([72-5-9+80+24-20-8-40,20-6+3+29+14-64,14])cylinder(r=9/2,h=3);


color("")translate([72,20,-0.2])cube([68,23,20]);
color("")translate([72-5-9,20-6,-0.2])cube([5,6+22,20]);
color("")translate([72-5-9+80,20-6+3+6-15,-0.2])cube([18,38,20]);
//color("")translate([72-5-9+80,20-6+3+24,-0.2])cube([18,10,20]);
color("")translate([72-5-9+80+24,20-6+3+29,-0.2])cylinder(r=3.2/2,h=200);

color("")translate([72-5-9+80+24,20-6+3+29-35,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-50,20-6+3+29,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-50,20-6+3+29-35,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-100,20-6+3+29-35,-0.2])cylinder(r=3.2/2,h=200);
color("")translate([72-5-9+80+24-100,20-6+3+29,-0.2])cylinder(r=3.2/2,h=200);
}
}
//outside_frame(tcl,thcl);
//electronics_connectormod();

module electronics_connectormod(){
difference(){
union(){
translate([-42+104,6-50+20+13,0])cube([50,25,8]);
translate([-42+104+13,6-50+20,0])cube([25,50,8]);
}
translate([81-16+3+38,20-12,-2])cylinder(r=2.6/2,100);
translate([81-16+3+38,20-12-13,-2])cylinder(r=2.6/2,100);
translate([81-16+3,20-12,-2])cylinder(r=2.6/2,100);
translate([81-16+3,20-12-13,-2])cylinder(r=2.6/2,100);
translate([81,20,-2])cylinder(r=2.6/2,100);
translate([81+13,20,-2])cylinder(r=2.6/2,100);
translate([81+13/2,20-38/2,-2])cylinder(r=5/2,100);
translate([81+13/2,20-38/2,2.5])rotate([0,0,])cylinder(r=30/2,10,$fn=4);
translate([81,-18,-2])cylinder(r=2.6/2,100);
translate([81+13,-18,-2])cylinder(r=2.6/2,100);
}
}
//rotate([0,0,90])solenoid_endstop_brd(36,42);

//amplifier_brd_holder();


module barrierstrip_screws(){

translate([330,270-40+150,0])rotate([0,180,90])
difference(){
color("white")translate([-42+114-40+10,6-55+13+2,2])rotate([0,0,90])cube([13,96,4]);
for(i=[0:11]){
translate([i*8-54+4,-27.4,-10])cylinder(r=3.7/2,h=60);
}
}
// this is also the european connector design

//translate([370,270-40+100,0])rotate([0,180,0])
//translate([-42+114,6-50,0])rotate([0,0,90])solenoid_endstop_brd(40,81);

translate([370,270-40+100,0])rotate([0,180,0])
difference(){
union(){
translate([-42+114-40,6-55,0])rotate([0,0,90])cube([47,50,2]);
translate([-42+114-40+10,6-55+13+2,0])rotate([0,0,90])cube([13,70,4]);
}

translate([(10.5*1)-18,-13,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);
translate([(10.5*2)-18+5,-13,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);
translate([(10.5*4)-18,-13,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);

translate([(10.5*1)-18,-13-28,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);
translate([(10.5*2)-18+5,-13-28,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);
translate([(10.5*4)-18,-13-28,-5])rotate([0,0,45])cylinder(r=12/2,h=20,$fn=4);
translate([-5,-8+2,0])for(i=[0:6]){
translate([(10.5*i)-20,-22,-5])cylinder(r=1.8/2,h=20);
}
}
translate([370,270-40+100-2,-3])
difference(){
translate([0,-2,0])
cube([20,16,3]);
translate([13-1.35,10-1.7,-40])cylinder(r=4/2,h=150);
}
translate([370-38,270-40+100-2,-3])
difference(){
translate([0,-2,0])
cube([20,16,3]);
translate([13-1.35,10-1.7,-40])cylinder(r=4/2,h=150);
}
translate([370-13,270-40+100-2-62-13,-3])
difference(){
cube([20,15+16,3]);
translate([13-1.4,10-1.7-3,-40])cylinder(r=4/2,h=150);
}
}













module solenoids_mosfets(){

translate([370,270-40+100,0])rotate([0,180,0])
color("green")translate([-42+114,6-50,0])rotate([0,0,90])cube([40,81,1]);
translate([370,270-40+100,0])rotate([0,180,0])
translate([-42+114,6-50,0])rotate([0,0,90])solenoid_endstop_brd(40,81);
translate([370,270-40+100-2,-3])
difference(){
translate([0,-2,0])
cube([20,16,3]);
translate([13-1.35,10-1.7,-40])cylinder(r=4/2,h=150);
}
translate([370-84,270-40+100-2,-3])
difference(){
translate([0,-2,0])
cube([14,14,3]);
translate([7-1.35,10-1.7,-40])cylinder(r=4/2,h=150);
}
translate([370-13,270-40+100-2-62,-3])
difference(){
cube([20,15,3]);
translate([13-1.4,10-1.7-3,-40])cylinder(r=4/2,h=150);
}
}


module labbot3d_electronics_configuration(){
//supports
translate([180-0.4,341.3,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4,341.3-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4,341.3-90-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90,341.3,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90,341.3-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90,341.3-90-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90+90,341.3,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90+90,341.3-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90+90+90,341.3-90-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90+90+90,341.3-90-90-90,5.7])rotate([0,180,0])electronics_connectormod();

translate([180-0.4+90+90+90,341.3-90,5.7])rotate([0,180,0])electronics_connectormod();
translate([180-0.4+90+90+90,341.3,5.7])rotate([0,180,0])electronics_connectormod();
//end supports

//brds
translate([280,270-40,0])rotate([0,180,0])amplifier_brd_holder();


//rotate([0,180,0])
translate([163-55-20,200-5.5,6-12+7])difference(){
rotate([0,180,-90])5stepper_brd_holder();
//translate([-30,100-25,-20])cube([130,50,40]);
}
//rotate([0,180,0])
translate([0,0,-6.3])atzeeg_mount_to_plate();


translate([330,55,0]){
rotate([0,180,0])wash_dry_pcv_brd();
}
translate([-100,20,0])solenoids_mosfets();
translate([0,-90+13,0])barrierstrip_screws();
}


module atzeeg_mount_to_plate(){
translate([-60,120,0]){
difference(){
translate([305-53,26-10,4])cube([18,25,3]);
translate([305-80+18-1+19.6,26+16.25-6,-153])cylinder(r=4/2,h=230);
}
translate([0,-65,0])difference(){
translate([305-53,26-10,4])cube([18,25,3]);
translate([305-80+18-1+19.6,26+16.25-18,-153])cylinder(r=4/2,h=230);
}

translate([-90,-75,0])difference(){
translate([305-53,26-10,4])cube([18,25,3]);
translate([305-80+18-1+19.6,26+16.25-18-3,-153])cylinder(r=4/2,h=230);
}

translate([-90,0,0])difference(){
translate([305-53,26-10,4])cube([18,25,3]);
translate([305-80+18-1+19.6,26+16.25-6,-153])cylinder(r=4/2,h=230);
}

translate([305,0,0])rotate([0,180,0])azteeg_controller();

}
}


//include <waste_simple_hinge.scad>

//rotate([0,90,0])lasermount_assy();
//rotate([-90,0,90])lasermount_connector();
//rotate([90,0,0]) lasermount_connector_cap();

//openmv_camera_base_justclip_otherend();
//color("")translate([-80,36,4.85])rotate([0,-90,0])translate([0,0,0])nanoplotter_breadboard4_head();

/*
balladjust_openmv();
translate([-90,-5,0])rotate([90,0,0]) lasermount_connector_cap();
color("")translate([-80,36,4.85])rotate([0,-90,0])translate([0,0,0])nanoplotter_breadboard4_head();
*/

/*
rotate([90,0,0]) lasermount_connector_cap();
*/
/*
translate([0,15,0])rotate([90,0,0])connectionarms2(0);
translate([0,30,0])rotate([90,0,0])connectionarms2(0);
*/

//translate([-200,36-25+1.5,4])rotate([0,0,0])openmv_camera_base();

//openmv_set();
//filtermount();

module openmv_set(){
translate([29,10-3,151.85])rotate([0,180,0])openmv_camera_mnt_zbed();
translate([-45,60,0])filtermount();
translate([-80,90,13])openmv_camera_base_justclip_otherend();
translate([-40+10,0,-0.15]){
//rotate([90,0,0])connectionarms2(0);
//translate([0,15,0])rotate([90,0,0])connectionarms2(0);
translate([0,30,0])rotate([90,0,0])connectionarms2(0);
translate([0,45,0])rotate([90,0,0])connectionarms2(0);
}
translate([-70,36-20,-2])rotate([0,0,0])openmv_camera_base();
difference(){
translate([-85,115,0.39])rotate([0,0,90])import("openmv/files/OpenMV_rev_6_Camera_Bottom_cover.stl");
translate([-130,40,1.85])cube([50,50,20]);
}
translate([0,0,-2])openmv_camera_lensmount();
translate([0,0,-2])openmv_camera_lensmount_lensepart();
//translate([-135,80-30-50,3.35])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim_spacer(12,21.95);
}



module filtermount(){
difference(){
union(){
//cylinder(r=(27+8)/2,h=10);
translate([0,0,5])cylinder(r2=(27+8)/2,r1=(20)/2,h=6);
translate([0,0,5+6])cylinder(r=(27+8)/2,h=2.5);
cylinder(r=(20)/2,h=10);
}
translate([0,0,2.5+8])rotate([0,90,0])cylinder(r=3/2,h=100);
translate([0,0,2.5])rotate([0,90,0])cylinder(r=3/2,h=100);
translate([0,0,8.5])cylinder(r=(27)/2,h=10);
translate([0,0,-1])cylinder(r=(15)/2,h=100);
}
}

//translate([0,36-25+1.5,4])rotate([0,0,0])openmv_camera_base();
//translate([-120,50,1.82])openmv_core_base();

//openmv_ball_adjust_set();

module openmv_ball_adjust_set(){
 //translate([0,36-25+1.5,4])rotate([0,0,0])openmv_camera_base();
 translate([-70,59-50+6,17.85-1])translate([0,20,39])rotate([-90,0,-0])lasermount_connector_two();
}

//translate([-200,36-25+1.5,4])rotate([0,180,0])openmv_camera_base();
//openmv_nice_assy_for_nanoplotter();


module balladjust_openmv(){
translate([-100+65-66-1+32,59+30-150-9+30,17.85-6-10])rotate([0,90,90])lasermount_assy();
difference(){
translate([-206.7,30,10])rotate([0,0,180]){
translate([-133.1-5+7+17,60-20,1.85-15])cube([23,10+30,10]);
}
translate([-104-5,-18,-3.2+5])cylinder(r=10.5/2,h=30);
translate([-104-5,-18,-3.2])cylinder(r=4.7/2,h=30);
}
//openmv_camera_base_justclip_otherend_cylinder();
//translate([-100+65,59+30,17.85])rotate([0,90,0])lasermount_assy();
}


//translate([-100,59,17.85])translate([0,20,39])rotate([-90,0,90])lasermount_connector();


module lasermount_connector_cap(){
//translate([-62.5,24,-10+10])rotate([90,0,0])import("stls/cap.stl"); //cap();
difference(){
translate([0,-5,0])cube([15,5+5,15]);
translate([7.5,7.5,7.5])sphere(r=6.5);
translate([7.5,7.5+20,7.5])rotate([90,90,0])cylinder(r=3.7/2,h=60);
translate([7.5,-2.1,7.5])rotate([90,90,0])cylinder(r=7.8/2,h=3,$fn=6);
}
}

//lasermount_assy();

//openmv_camera_lensmount();

//import("../openmv/files/OpenMV_rev_6_Camera_Top_cover.stl");
//translate([0,0,10])openmv_camera_base();




/*
include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/dr.robotlab_repstrap.scad>
include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/Raspberry_Pi_Camera_Mount_with_Ball_Joint_for_Reprap/stroboscope.scad>
include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/azteegx5mini-box.scad>
include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/compact_direct_drive_extruder.scad>
include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/nanoplotter.scad>
*/
/*
translate([-85,-90,0])raspi2_top_lego();
mirror([0,1,0])raspi2_bottom_lego_female();
translate([180-6,0,-30+4])rotate([90,0,0])tslot20(300);
*/
//raspicamera_assy();
//include </Users/richard/Google Drive/mac_dev_drrobotlabs/dr.robotlabs/smartfriendz/dr.robotlabs.adjustable.mirror.ball.for.laser.scad>
/*
include <C:\Users\nanoplotter\Google Drive\009Reprapcatcube010715\dr.robotlab_repstrap.scad>
include <C:\Users\nanoplotter\Google Drive\009Reprapcatcube010715\Raspberry_Pi_Camera_Mount_with_Ball_Joint_for_Reprap\stroboscope.scad>
include </Users/richard/Google Drive/009Reprapcatcube010715/dr.robotlab_repstrap.scad>
include </Users/richard/Google Drive/009Reprapcatcube010715/Raspberry_Pi_Camera_Mount_with_Ball_Joint_for_Reprap/stroboscope.scad>
*/
/*
module shorternema17()
module sliderwheel_assy()
module conveyer_sliderwheel_assy()
module slide_conveyer(xx,zh)
module wash_and_strobparts()
module washbowl_assy()
module XY_motor_x2()
module y_encoder_support(sh)
module x_encoder_support()
module left_outside_frame()
module right_outside_frame()
module backside_frame()
module frontside_frame()
module lm8uu_smz_glider()
module zbed_smz_components(shim,modshim)
module laser_zbed(zz)
module zbed_smz()
module outside_frame()
module delrinwheel()
module gantry_assy(x,y,z,xx)
module slider_front_assy()
module slider_back_assy()
module slider_assy(x)
module x_axis(x)
module zdrive_assay()
module bottom_x1()
module left_plate_x1()
module right_plate_x1()
module back_plate_x1()
module front_plate_x1()
module back_plate_x1()
module XY_bearings_Left_x1()
module XY_bearings_Right_x1()
module slider_x4()
module gantry()
module linearactuator_filament_encodershuttle_filamentclamp()
module linearactuator_endstop_encoder()
module endstop_for_linearactuator()
module filament_clamp()
module filament_linearactuator()
module linearactuator_cordglide()
module cordclamp()
module raspi_azteeg_baseplate()
module azteeg_controller()
module raspi_smoothie_base_plate()
module raspi_plate()
module azteeg_x5_mini_plate()
module smoothie_raspi()
module wiper_clamp()
module shuttle_back()
module backextruder_clamp()
module shuttle_front()

zbedslot_516_smz_zbed();
rotate([0,90,0])lm8uu_smz_glider();

*/

//rotate([0,90,0])import("files/gt2belt_holder.stl");

//XY_motor_x2higher();

//zbed_smz();
//wash_and_strobparts();

//steppermotordriver_brd();
//stroboscope_base();

//pololu_screw_nobacklash_cap();

//translate([0,50,0])motormount_smz();

//rotate([0,90,0])backextruder_clamp();
///translate([30,0,0])rotate([0,90,0])backextruder_clamp();

//simple_m8_smoothrodholder_for_z();
//bearing_mount_smz();
//left_outside_frame();
//basic_bearingholder();
//translate([30,0,0])motormount_smz();
 
//rotate([0,90,0])lm8uu_smz_glider();

//conveyer_sliderwheel_assy();
//slidedeck_adjust_wheel();

//endstop_for_conveyer();
//conveyer_solenoid_pcb();


//slide_conveyer(-60,0,0,0,0);
//conveyer_sliderwheel_assy();
//conveyer_stepper_linear_m8nut_coupler();
//rotate([90,0,0])conveyer_stepper_linear_m8nut_coupler_a();
//rotate([90,0,0])conveyer_stepper_linear_m8nut_coupler_b();
//projection(cut = false){
//back_plate_x1();
//back_plate_x1();
//}
//translate([0,0,5])shaft_516(); 
//translate([0,50,5])pololu_screw_nobacklash();
//translate([0,0,5])pololu_screw_nobacklash();
//translate([0,40,5])pololu_screw_nobacklash_cap();
//rotate([0,180,0])zbedslot_516_smz_zbed();
//wiper_tip();

//translate([-70,0,0])rotate([0,0,0])import("files/endstop_y.stl");
//shuttle_back();
//slider_assy();
//sandwich_sliderwheel_assy();
//shuttle_front();

//nextgen_syringe10ml_assy();
//linearactuator_igus_slidermount_encoder();
//conveyer_slider_x4();
//conveyer_sliderwheel_assy();
//slidedeck_adjust_wheel();
//conveyer_slider_spacer();
//conveyer_verticallinearpulleybearingbottom();
//conveyer_slider_x4();
//rotate([0,180,0])solenoid_flag();
//rotate([90,0,0])mirror([1,0,0])conveyer_stepper_linear_m8nut_coupler_a();
//washer_for_conveyer();
//import("files/foot_big.stl");
//rotate([90,0,0])mirror([1,0,0])conveyer_stepper_linear_m8nut_coupler_b();
//projection(cut = false)
//slidedeck(0); //(3 of them)
//sst_sensing_liquidlevel();

//rotate([90,0,0])stepper_linear_m8nut_coupler();
//sst_sensing_liquidlevel();
//sst_sensing_liquidlevel_cap();
//nalgene_cap_for_sst_liquidlevel();



//rotate([0,180,0])standoffkey_prismmountmod_bigger_rails_bigger_lens();
//middle_lens_set();

//camera_assy();
//stroboscope_assy();
//m12_plate();


//biggernew_compact_wash_dry_pcv_arduinomicro();

//rj45jack();


/*
module Idonotknow(){
difference(){
union(){
translate([-90+43+10,-5-6,-0])cube([20,10+12,20]);
cylinder(r=(35+20)/2,h=15);
translate([25,0,0])
difference(){
cylinder(r=(25+5)/2,h=12);
translate([-0,0,-10])rotate([0,0,0])cube([10,20,35]);
}
}
translate([-31,40,10])rotate([90,0,0])cylinder(r=(5)/2,h=100);
translate([0,0,-0.5])cylinder(r=35/2,h=21);
translate([-90,-5,-0.5])cube([100,10,25]);
}
}
*/

//fullsize_arduinomicro_5a4988_endstop();
//arduino_micro_wash_dry_pcv_valveservo_tmp_fix_rightside_up_simplify_traces_electrocaloric();
//justhdmi();
//5stepper_brd_holder();
//linearactuator_endstop_encoder();
//rotate([180,0,0])motorclamp_filament_driver();
//pcv_sensor_usb_connect();
//extrusion_lid_coupler();

//translate([0,-30,0])powersupply_atx_connectbrd(42,102.5);
//nalgene_cap_for_electrocaloric();
//amp_powersupply_box_assy();
//teensy_amp_module();
//amp_powersupply_wallB();
//back_plate_plug_rise();
//rotate([0,90,0])amp_powersupply_wallB();

// translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
//bottom_x1();

//left_plate_x1();
//back_plate_x1();
//front_plate_x1();

//translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)front_plate_x1();
/*
projection(cut = false){
left_plate_x1();
translate([0,66,0])right_plate_x1();
translate([0,66+66,0])front_plate_x1();
translate([0,66+(65*2),0])back_plate_x1();
translate([0,-380,0])bottom_x1();

translate([0,40,0]){
translate([-40,0,0])gantryhead_back_slider_x4();
translate([-40,90,0])slider_x4();
translate([-40,90+67,0])slider_x4();
translate([-40,90-160,0])slider_x4();
translate([-40,10-140,0])XY_bearings_Right_x1();
translate([-40-23,50-155-200,0])XY_bearings_Left_x1();
translate([-40,90-290,0])slider_x4();
translate([-40,90-290-65,0])slider_x4();
//translate([-40,90-290-65-65,0])slider_x4();
}
}
*/
/*
projection(cut = false){
back_plate_x1();
}
*/

//translate([0,0,260+66])rotate([0,180,0])
//conveyer_verticallinearpulleybearingbottom();



//right here
//outside_frame(tcl,thcl);
//noconveyer_gantry_assy(20,-30,-45+50+100-50-100+150,-55,0,267,tcl,thcl);
//projection(cut = false){
//}
//bottom_cover();

/*
bottom_cover();
 translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
 translate([15,16.5+380,-60])rotate([90,0,0])color(bcl)back_plate_x1();
 translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();
 translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)right_plate_x1();
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
*/


module bottom_cover(){
difference(){union(){

translate([-9,-9,-14+10])screen_cover();

/*
translate([0,0.5,0])coverpanel_screw();
translate([0,140,0])coverpanel_screw();
translate([16.5,404,0])rotate([0,0,-90])coverpanel_screw();
translate([16+170.5,404,0])rotate([0,0,-90])coverpanel_screw();
translate([16+170.5+260+10,404-398,0])rotate([0,0,90])coverpanel_screw();
translate([16+170.5+252,404-10.5,0])rotate([0,0,-180])coverpanel_screw();
translate([16+170.5+252,404-10.5+49.5,0])rotate([0,0,-180])coverpanel_screw();
translate([16+170.5+252,404-10.5-162,0])rotate([0,0,-180])coverpanel_screw();
translate([16+170.5+252,404-10.5-162+49.5,0])rotate([0,0,-180])coverpanel_screw();
*/
}

translate([22,130.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+139.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10+139.5,-70])cylinder(r=3.7/2,h=200);
translate([0,49.5,0]){
translate([22,130.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+139.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10+139.5,-70])cylinder(r=3.7/2,h=200);
}

translate([395,-16.5,0]){
translate([22,130.5-22.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10-22.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+139.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10+139.5,-70])cylinder(r=3.7/2,h=200);
translate([0,49.5,0]){
translate([22,130.5-22.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10-22.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+139.5,-70])cylinder(r=3.7/2,h=200);
translate([22,130.5+10+139.5,-70])cylinder(r=3.7/2,h=200);
}

translate([21.5-90,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-170,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-170,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-170-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-170-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);

translate([0,-355,0]){
translate([21.5-90,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-170,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-170,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-170-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
translate([21.5-90-10-170-49.5,130.5+268.5,-70])cylinder(r=3.7/2,h=200);
}
}
}
}

//gantry();
//conveyer_connector_tslots();
//gantry_assy(20,-30,-45+50+100-50-100+150,-55,0,267,tcl,thcl);
//camera_assy();
//another begin
//conveyer fix model
//slide_conveyer_frame();
//gantry();
//left_outside_frame();
//right_outside_frame();

xx = 200-248+246-250;
xp = -1;
sph = 267;
z = -5;
/*
translate([-55,410,400])rotate([0,90,0])tslot20innerbracket();
translate([-55,410,400])rotate([0,90,0])tslot20_2060(150);

gantry();
//slide_conveyer_frame();
slide_conveyer_caller(z,xx,xp,sph);
filament_driver_assy();
zencoder_assy();
zbed_assy(z=-45+50+100-50-100+150);
//noconveyer_backside_panel();
xshuttle_assy(x=20,y=-100);
xymotor_assy();
left_outside_frame();
//right_outside_frame();
bcl = [155/255,155/255,155/255];
translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();
*/
/*
*/
/*
cl = [155/255,155/255,155/255];
leftside_panel(cl,bcl);
rightside_panel(cl,bcl);
*/
/*
translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
translate([15,16.5+380,-60])rotate([90,0,0])color(bcl)back_plate_x1();
translate([-4+12.5,19+370,-60])rotate([90,0,-90])color(bcl)right_plate_x1();
translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
*/
/*
//outside_frame(tcl,thcl);
leftside_panel(cl,bcl);
cl = [155/255,155/255,155/255];
translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
translate([15,16.5+380,-60])rotate([90,0,0])color(bcl)back_plate_x1();
//translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)right_plate_x1();
//translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
translate([-4+12.5,19+370,-60])rotate([90,0,-90])color(bcl)right_plate_x1();


translate([0,42,-52])rotate([90,0,90])rj45jack();
translate([0,90+3,-22])rotate([90,90,90])justusb_otherend();
translate([0,90+3+50,-22])rotate([90,90,90])justusb();

translate([430,90+3+149,-22])rotate([90,90,90])justusb();
*/
//right_outside_frame();

//z_encoder_inbetween();
//electronics_configuration();

//atx_power_socket_24pin();
//translate([10,410,-63])rotate([90,0,0])atx_power_sockets();



//translate([38,19,0])atx_power_socket_8pin();



//translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
//translate([130,3+7,-50])rotate([-90,180,0])kill_button_leds_panelmount();
//module gantry_assy(x,y,z,xx,xp,sph,tcl,thcl){
//gantry_assy(20,-30,-45+50+100-50-100+150,-55,0,267,tcl,thcl);

//amp_powersupply_box_assy();



//rotate([90,0,0])aluminum_frontcover();
//atx_power_connect_assy();
//translate([0,0,400])rotate([-90,0,0])atx_power_connect_assy();

//rotate([0,180,0])azteeg_raspi_plate();
//translate([110+10,405,-0])rotate([0,180,90])
//translate([110+10,405,-0])rotate([0,180,90])
//translate([0,0,400])rotate([-90,0,0])usbs_socket_alu_support();
//usbs_socket_alu_support_lid_usbs();
/// azteeg_connect_alu();



/*
difference(){
cylinder(r=32/2,h=20);
cylinder(r=22.22/2,h=50);
}
*/

/*
module connectionarms2(){
translate([0,0,0])connector_wider();
translate([-40,0,0])cube([40,2.8,10]);
translate([-39,2.8,0])rotate([0,0,180])connector_wider();
}
*/

module connectionarms2(a){
translate([0,0,0])openmv_connector();
translate([-a,0,0])cube([a,2.5,10]);
//if (a == 0){
translate([-a+7.5,0,0])cube([a-a/2,2.5+2.5,10]);
//}
if (a == 1){
translate([-a+10,-2.5,0])cube([a-a/2,2.5+2.5,10]);
}
translate([-a+1,2.5,0])rotate([0,0,180])openmv_connector();
}


module connectionarms2_half(a){
translate([0-20,0,0])openmv_connector();
translate([-40,0,0])cube([40-20,2.5,10]);
if (a == 0){
translate([-30-5,0,0])cube([40-20-10,2.5+2.5,10]);
}
if (a == 1){
translate([-30,-2.5,0])cube([40-20,2.5+2.5,10]);
}
translate([-39,2.5,0])rotate([0,0,180])openmv_connector();
}





module usbs_socket_alu_support_lid_usbs_simplier(){
difference(){
union(){
translate([0,0,400])rotate([-90,0,0])translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([117,43+8,3]);
translate([0,1,0])color(""){
}
}
translate([40,-58,0])for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([10,0,0]){
translate([77.5+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*2),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*3),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
}
}
}

module hdmi_rj45_usb_panel(){
difference(){
union(){
translate([0,0,400])rotate([-90,0,0])translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([117,43+8,3]);
translate([0,1,0])color(""){
}
}
translate([40,-58,0])for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([10,0,0]){

//usb port
translate([77.5+17-1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}

//usb port
translate([77.5+17-1+25,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}

translate([77.5+17-1+50,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}






/*
//usb port other end
translate([77.5+17*2+1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
//translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([-4.5,-19/2,-1])cube([9,19,10]);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
//hdmi port
translate([77.5+17*3+1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([-4.5,-19/2,-1])cube([9,19,10]);
//rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
}
*/
//rj45 jack
/*
translate([77.5+17+(17*3)+6,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
}
*/
/*
translate([77.5+17+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*2),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*3),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
*/
}
}
}












































module hdmi_usb_4pin_5pin_10pin_panel(){
difference(){
union(){
translate([0,0,400])rotate([-90,0,0])translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([117+25,43+8,3]);
translate([0,1,0])color(""){
}
}
translate([40,-58,0])for(i=[0,2.55]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([10,0,0]){

translate([4,-4,0]){
//5pin connector
translate([174+10,-30,0])translate([-4.5,-19/2,-1])cube([15.5,6.5+1,10]);
translate([174+10,-30+(1.5+6.5)*2*0,0])translate([-4.5,-19/2,-1])cube([10.5,6.5+16,10]);
translate([174+10,-30+(1.5+6.5)*2*0,0])translate([-4.5,-19/2,-1])cube([13.5,6.5+9,10]);
translate([174+10,-30+1.5+6.5,0])translate([-4.5,-19/2,-1])cube([13.5,6.5,10]);
translate([174+10,-30+(1.5+6.5)*2,0])translate([-4.5,-19/2,-1])cube([10.5,6.5,10]);

translate([174+10+1+5,-30+6.5+4.5+11+6,0])translate([-4.5,-19/2,-1])cylinder(r=3.8/2,h=20);
translate([174+10+1+5,-30+6.5+4.5+11-27,0])translate([-4.5,-19/2,-1])cylinder(r=3.8/2,h=20);
}
//10pin connector
translate([158+18,-55,0])rotate([0,0,90]){
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
//translate([5.456+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([5.456+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
translate([35.936+3.7/2,15.616+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
//translate([35.936+3.7/2,0.376+3.7/2,-0.1])cylinder(r=3.7/2,h=20);
}


//usb port
translate([77.5+17-1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}

//usb port other end
translate([77.5+17*2+1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
//translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([-4.5,-19/2,-1])cube([9,19,10]);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}

//hdmi port
translate([77.5+17*3+1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([-4.5,-19/2,-1])cube([9,19,10]);
//rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
}
/*
//rj45 jack
translate([77.5+17+(17*3)+6,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
}

translate([77.5+17+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}

translate([77.5+17+(17*2),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*3),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
*/
}
}
}





module usbs_socket_alu_support_lid_usbs_cover(){
difference(){
union(){
translate([0,0,400])rotate([-90,0,0])translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([117,43+8,3]);
translate([0,1,0]){
}
}
translate([40,-58,0])for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([145,-40,-5]){
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1-20])cylinder(r=2.8/2,h=40);
translate([5.456+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,0.376+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
}
translate([97,-40,-5]){
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1-20])cylinder(r=2.8/2,h=40);
translate([5.456+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,0.376+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
}
}
}


module syringe_panel_wider(){
difference(){
union(){
translate([0,0,400])rotate([-90,0,0])translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([117,43+8,3]);
translate([0,1,0]){
}
}
translate([40,-58,0])for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([145,-40,-5]){
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1-20])cylinder(r=2.8/2,h=40);
translate([5.456+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,0.376+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
}
translate([97,-40,-5]){
translate([12.8,6.9,-0.1])cube([21,9.5,9]);
translate([5.456+3.7/2,0.376+3.7/2,-0.1-20])cylinder(r=2.8/2,h=40);
translate([5.456+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,15.616+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
translate([35.936+3.7/2,0.376+3.7/2,-20.1])cylinder(r=2.8/2,h=40);
}
}
}














module usbs_socket_alu_support_lid_usbs(){
difference(){
union(){
translate([-2,0,400])rotate([-90,0,0])usbs_socket_alu_support_lid();
translate([0,1,0])color(""){
translate([77.5+17,20+3-76,0])rotate([0,0,0])justusb_alu();
translate([77.5+17+17,20+3-76,0])rotate([0,0,0])justusb_alu();
translate([77.5+17+(17*2),20+3-76,0])rotate([0,0,0])justusb_alu();
translate([77.5+17+(17*3),20+3-76,0])rotate([0,0,0])justusb_alu();
}
}
translate([77.5+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+17,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*2),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
translate([77.5+17+(17*3),20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}
}
}








module openmv_core_base(){
msh = 1.75;
difference(){
union(){
cube([40,49,6.6+msh]);
}
translate([1.75,1.8+0.05,0.9+msh])cube([40-3.6,49-3.7-0.05,6.5]);
translate([1.75+5.5,1.8-10,1.3+1.1+msh])cube([7.85,20,6.5]);
translate([1.75+5.5-10,1.8-10+31.6-1.5,1.3+1.3+msh])cube([7.85,12.1+1,2.4]);
translate([11.1,33-3.3,0.9])cube([10+8,16.3,16.5]);
translate([11,30-0.4-4+2,-6])cube([10+7.9,16+5.5-2,30]);
translate([3,30-0.4+4.9,-6])cube([10+7.9+16.1,7,30]);
translate([3-0.4,3-0.25-1,-6])cube([2.3+0.8,20.5+0.5+1,30]);
translate([34.8-0.4,3-1,-6])cube([2.3+0.8,20.5+0.5+1,30]);
}
difference(){
union(){
translate([3-0.3-1,41.45,0+msh])cube([6,5+1,4.8]);
translate([3-0.3+1.25,41.45,1.75-0.4+msh])rotate([0,50,0])cube([5,5+1,4.8]);
//translate([3-0.3+1.25+1+2,41.45-5.8-3,1.75-0.4+msh-3.1])rotate([0,0,0])cube([6,5+4,4.8+1.75]);


//translate([3-0.3+1.25+1+22,41.45-5.8-3,1.75-0.4+msh-3.1])rotate([0,0,0])cube([6,5+4,4.8+1.75]);
translate([13-0.3+20-0.4,41.45,0+msh])cube([6,5+1,4.8]);
translate([13-0.3+20+.2,41.45,-1.75-0.55+msh])rotate([0,-50,0])cube([5,5+1,4.8]);
}
translate([11,30-0.4,-6])cube([10+7.9,16,30]);
translate([3,30-0.4+4.9,-6])cube([10+7.9+16.1,7,30]);
translate([3,3,-6])cube([2.3,20.5,30]);
translate([34.8,3,-6])cube([2.3,20.5,30]);

translate([0,0,-6])cube([40,49,6]);
translate([3-0.3+3,41.45+1.85,0-0])cylinder(r=2/2,h=10);
translate([3-0.3+3+28.6,41.45+1.85,0-0])cylinder(r=2/2,h=10);
}
/*
difference(){union(){
translate([-0.75,0,0]){
translate([3-0.3+3+4.5,41.45+1.85-5.5,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5,41.45+1.85-5.5-1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5,41.45+1.85-5.5+1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5-1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5+1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
}
translate([21,0,0]){
translate([3-0.3+3+4.5,41.45+1.85-5.5,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5,41.45+1.85-5.5-1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5,41.45+1.85-5.5+1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5-1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
translate([3-0.3+3+4.5-1,41.45+1.85-5.5+1,1.75-0.4+msh-3.1])cylinder(r=8/2,h=4.8+1.75);
}
}
translate([3-0.3+3+4.5,41.45+1.85-5.5,-6])cylinder(r=2./2,h=100);
translate([3-0.3+3+28.6-4.5,41.45+1.85-5.5,-6])cylinder(r=2./2,h=100);
}
*/
}

//color("")translate([140,0,-2])rotate([0,0,0])import("../openmv/files/OpenMV_rev_6_Camera_Top_cover.stl");
//translate([20,50.5,-0.145])openmv_core_base();

//import("openmv_scad_test/openmv_bottom.stl");
//rotate([0,180,0])import("../openmv/files/OpenMV_rev_6_Camera_Top_cover.stl");


//color("")translate([-120,50.5,1.85])openmv_core_base();
//openmv_camera_lensmount();
//translate([-82,5,28])standoffkey_prismmountmod_bigger_rails_bigger_lens();
//translate([-82.075,5-0.075,23])middle_lens_set();

/*
translate([-82,5,28])standoffkey_prismmountmod_bigger_rails_bigger_lens();
translate([-82.075,5-0.075,23])middle_lens_set();
translate([0,0,19])imagingsource_cover();
imagingsource_base();
*/




module sm_connector(w=2) {
  translate([1.5, w, 5])
  difference() {
    rotate([90])
      scale([1.7,1])
      cylinder(r=5, h=w);
    rotate([90])
      translate([4,0])
      cylinder(r=1.6, h=w, $fn=7);
    translate([-11.5, -3, -5])
    cube([10,4,10]);
  }
}

module sm_connectors() {
  //sm_connector();
  translate([0, 5]) sm_connector();
  translate([0, 10]) sm_connector();
}







module sm_justclip(thickness){
translate([0, 15]) rotate([90]) difference() {
  //color("blue")
  cube([15, 15, 15]);

  //translate([0,4.5])
  //cube([10, 6.2, 15]);
}
module base() {
  cube([10,thickness,3]);
  translate([8,0])
    cube([2,thickness,5]);
}
translate([15, 1.5]) {
  //base();
  translate([0,5-3]) base();
  translate([0,10-3]) base();
  translate([0,-3,0])sm_connectors();
}
}









module openmv_camera_base_justclip_otherend(){
difference(){
union(){
translate([-206.7,0,0])rotate([0,0,180]){
translate([-133.1-5+7+17,60-20,1.85-15])cube([23,10,10+15]);
/*
translate([-133.1-5+7,60-10,1.85])rotate([0,0,-90])justclip();
translate([-133.1-5+7+40,60-10,1.85])rotate([0,0,-90])justclip();
*/
translate([-9-1.3,2,-15]){
translate([-133.1-5+7+25+5-1,60-10-2,1.85])rotate([0,0,-90])sm_justclip(2);
translate([-133.1-5+7+40-5-1,60-12,1.85])rotate([0,0,-90])sm_justclip(2);
}
}
}
translate([-133.1-5+7+35-14+6.5,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
translate([-133.1-5+7+35-14+6.5,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
//translate([-133.1-5+7+35,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
//translate([-133.1-5+7+35,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
}
}



module openmv_camera_base_justclip_otherend_cylinder(){
translate([-100+65-66-1,59+30-150-9,17.85-6])rotate([0,90,0])lasermount_assy();
difference(){
union(){
translate([-206.7,0,0])rotate([0,0,180]){
translate([-133.1-5+7+17,60-20,1.85-15])cube([23,10+30,10+15]);
/*
translate([-133.1-5+7,60-10,1.85])rotate([0,0,-90])justclip();
translate([-133.1-5+7+40,60-10,1.85])rotate([0,0,-90])justclip();
*/
translate([-9-1.3,2,-15]){
translate([-133.1-5+7+25+5-1,60-10-2,1.85])rotate([0,0,-90])sm_justclip(2);
translate([-133.1-5+7+40-5-1,60-12,1.85])rotate([0,0,-90])sm_justclip(2);
}
}
}
translate([-133.1-5+7+35-14+6.5,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
translate([-133.1-5+7+35-14+6.5,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
//translate([-133.1-5+7+35,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
//translate([-133.1-5+7+35,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
}
}






















module openmv_camera_base_justclip(){
difference(){
union(){
translate([-206.7,0,0])rotate([0,0,180]){
translate([-133.1-5+7+17,60-20,1.85-15])cube([23,10,10+15]);
/*
translate([-133.1-5+7,60-10,1.85])rotate([0,0,-90])justclip();
translate([-133.1-5+7+40,60-10,1.85])rotate([0,0,-90])justclip();
*/
translate([-9-1.3,2,-15]){
translate([-133.1-5+7+25+5-1,60-10-2,1.85])rotate([0,0,-90])justclip();
translate([-133.1-5+7+40-5-1,60-12,1.85])rotate([0,0,-90])justclip();
}
}
}
translate([-133.1-5+7+35-14+6.5,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
translate([-133.1-5+7+35-14+6.5,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
//translate([-133.1-5+7+35,60-10-10-70-10,1.85+5])rotate([90,0,0])cylinder(r=8/2,h=4);
//translate([-133.1-5+7+35,60-10-10-70-14,1.85+5])rotate([90,0,0])cylinder(r=4.7/2,h=10);
}
}




module openmv_camera_base(){
translate([-133.1-4+7,60-2,1.85])rotate([0,0,-90])cube([10,10,5.5]);

translate([-133.1-4+51.4+5-20-1,60-2-7,1.85])rotate([0,0,-90])cube([4,20,5.5]);
//translate([-133.1-5+7+25+5-1,60-10-2,1.85])rotate([0,0,-90])justclip();
translate([-133.1-5+7+40-5-1,60-12,1.85])rotate([0,0,-90])
justclip();


translate([-120,50,1.82])openmv_core_base();
translate([-133.1-4+28-11-10,60+50-2,1.85]){
difference(){
rotate([0,0,-90])cube([10+0,18+42,5.5]);
translate([5+51,-10,-1.5])cylinder(r=2.8/2,h=8);
//translate([5+25,-10+6,-1.5])cylinder(r=2.8/2,h=8);
translate([5,-10-30,-1.5])cylinder(r=2.8/2,h=8);
translate([5,-10,-1.5])cylinder(r=2.8/2,h=8);
}
}
translate([-133.1-4+28-11-10,60+50-2,1.85]){
difference(){rotate([0,0,-90])cube([10+11,18-7,5.5]);
translate([5,-10,-1.5])cylinder(r=2.8/2,h=8.2);
}
}
translate([-133.1-4+28-11-10,60+50-2-35,1.85])
difference(){
translate([0,-1,0])rotate([0,0,-90])cube([10+5,18-7,5.5]);
translate([5,-10-30+35,-1.5])cylinder(r=2.8/2,h=8.2);
}
translate([-133.1-4+28-11-10+50,60+50-2,1.85])
difference(){
rotate([0,0,-90])cube([10+40-0,18-7,5.5]);
translate([5+51-50,-10,-1.5])cylinder(r=2.8/2,h=8);
translate([5+51-50,-10-30,-1.5])cylinder(r=2.8/2,h=8);
}
}


module m12lens_screwshim_spacer(h,w){
//best is 21.95
difference(){
union(){
cylinder(r=(28.5)/2,h=h);
translate([-22.5-2,-7.5,0])cube([49,15,5]);
}
cylinder(r=(w)/2,h=h+0.3);

rotate([0,0,0]){
translate([20,0,-0.1])cylinder(r=(4.7)/2,h=h+3);
translate([-20,0,-0.1])cylinder(r=(4.7)/2,h=h+3);
}
for(i=[-45,45]){
rotate([0,0,i]){
translate([18-18,0+20,7])rotate([90,0,0])cylinder(r=(3.1)/2,h=h+13+50);
translate([18-18,0+20,7])rotate([90,0,0])cylinder(r=(3.1)/2,h=h+13+50);
}
}
}
}
module m12lens_screwshim(h,w){
//works with this cylinder(r=(28.5)/2,h=30);
difference(){
cylinder(r=(w)/2,h=h);
cylinder(r=(12)/2,h=h+0.3);
}
}
module m12lens_stubb(h){
//works with this cylinder(r=(28.5)/2,h=30);
difference(){
cylinder(r=(21.25)/2,h=h);
cylinder(r=(17.5)/2,h=h+0.3);
}
}





module openmv_camera_lensmount_lensepart(){
translate([-135,80,3.35])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim(12,21.2);
translate([-135,80-30,3.35])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim_spacer(12,21.95);
}

module openmv_camera_lensmount(){
//openmv_camera_lensmount_lensepart();
translate([-133.1-4+28-11-10,60+50-2,1.85]){
translate([5+25,-10+6-15-2+2,4])m12lens_stubb(7.5+5-4);
translate([-0.8,1.5,0])difference(){
union(){
rotate([0,0,-90])cube([10+0,18+42,7.5]);
rotate([0,0,-90])cube([10+5,18-7,7.5]);
rotate([0,0,-90])cube([10+11+28,18-7,7.5]);
rotate([0,0,-90])cube([10+22,18-7+40,7.5]);
rotate([0,0,-90])cube([10+5,18-7,7.5]);
translate([50,0,0])rotate([0,0,-90])cube([10+40-0,18-7,7.5]);
//translate([5+25,-10+6-15-2+2,0])rotate([0,0,45])cylinder(r=(12.25+8+8.25)/2,h=30);
}
translate([5+51,-10,-1.5])cylinder(r=3.7/2,h=50);
//translate([5+25,-10+6,-1.5])rotate([0,90,0])cylinder(r=3.7/2,h=30);
translate([5,-10-30,-1.5])cylinder(r=3.7/2,h=30);
translate([5,-10,-1.5])cylinder(r=3.7/2,h=30);
translate([5,-10-30+30,-1.5])cylinder(r=3.7/2,h=30);
translate([5+51,-10-30,-1.5])cylinder(r=3.7/2,h=20);
//ugg


translate([5+25+0.8,-10+6-15-2+2-1.5,7.5-3]){
//rotate([0,0,45])cylinder(r=(26)/2,h=3,$fn=4);
translate([20,0,-3.1+2.8-8])cylinder(r=(2.8)/2,h=h+3);
translate([-20,0,-3.1+2.8-8])cylinder(r=(2.8)/2,h=h+3);
}

//uggg
translate([0.8,-1.5,0]){
translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(12.2)/2,h=100);
translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(12.25+8)/2,h=100);
translate([5+25,-10+6-15-2+2,-0.1])rotate([0,0,45])cylinder(r=(28)/2,h=4,$fn=4);
translate([5+25-9,-10+6-15-2+2-16.3/2,-0.1])cube([10+8,16.3,4]);
translate([5+25-((10+7.9)/2),-10+6-15-2+2-((16+5.5-2)/2),-0.1])cube([10+7.9,16+5.5-2,4]);
translate([5+25-((10+7.9+16.1)/2),-10+6-15-2+2-7/2,-0.1])cube([10+7.9+16.1,7,4]);
}
}
}
}






/*
module openmv_camera_lensmount(){
//translate([-133.1-5,60,1.85])rotate([0,0,-90])justclip();
//translate([-133.1-4,60,1.85])rotate([0,0,-90])cube([10,18,5.5]);
//translate([-133.1-4+51.4+5,60,1.85])rotate([0,0,-90])cube([10,18,5.5]);
//translate([-133.1+51.4+5,60,1.85])rotate([0,0,-90])justclip();
//import("../openmv/files/OpenMV_rev_6_Camera_Top_cover.stl");

translate([-135,80,3.35])m12lens_screwshim();


translate([-133.1-4+28-11-10,60+50-2,1.85]){
difference(){
union(){
rotate([0,0,-90])cube([10+0,18+42,7.5]);
rotate([0,0,-90])cube([10+5,18-7,7.5]);
rotate([0,0,-90])cube([10+11+28,18-7,7.5]);
rotate([0,0,-90])cube([10+22,18-7+40,7.5]);
rotate([0,0,-90])cube([10+5,18-7,7.5]);
translate([50,0,0])rotate([0,0,-90])cube([10+40-0,18-7,7.5]);
translate([5+25,-10+6-15-2+2,0])rotate([0,0,45])cylinder(r=(12.25+8+8.25)/2,h=30);
}
translate([5+51,-10,-1.5])cylinder(r=3.7/2,h=50);


//translate([5+25,-10+6,-1.5])rotate([0,90,0])cylinder(r=3.7/2,h=30);


translate([5,-10-30,-1.5])cylinder(r=3.7/2,h=30);
translate([5,-10,-1.5])cylinder(r=3.7/2,h=30);
translate([5,-10-30+30,-1.5])cylinder(r=3.7/2,h=30);
translate([5+51,-10-30,-1.5])cylinder(r=3.7/2,h=20);

translate([5+25,-10+6-15-2+2,7.5-3])rotate([0,0,45])cylinder(r=(26)/2,h=3,$fn=4);
translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(12.2)/2,h=100);
translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(12.25+8)/2,h=100);
/*
translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(26)/2,h=30,$fn=4);
for(i=[0:6]){
translate([5+25+i+5,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(6.5)/2,h=30);
translate([5+25-i-5,-10+6-15-2+2,-1.5])rotate([0,0,45])cylinder(r=(6.5)/2,h=30);
}
*/

/*
}
}
}
*/
//import("../openmv/files/OpenMV_rev_6_Camera_Bottom_cover.stl");
//OpenMV_rev_6_Camera_Bottom_cover.stl");

//translate([-4+12.5+420,37,-60])rotate([90,0,90])color(bcl)left_plate_x1();
//translate([0,0,400])rotate([-90,0,0])usbs_socket_alu_support();
//color("")translate([2,0,12])usbs_socket_alu_support_lid_usbs();

//shim_for_z_rail_alignement();
//color("")translate([2,0,12])usbs_socket_alu_support_lid_usbs();

/*
translate([431.7,47.3,1])rotate([90,0,90]){
//translate([0,0,400])rotate([-90,0,0])usbs_socket_alu_support();
//color("")translate([2,0,12])usbs_socket_alu_support_lid_usbs();
}
*/

//usbs_socket_alu_support();
//openmv_camera_base_justclip();

//translate([64,-5,0])openmv_camera_base();


/*
translate([-200,6,400+1.85])rotate([-90,0,0])usbs_socket_alu_support();
translate([0,-6,0])openmv_camera_lensmount();
*/
//translate([-82,5,28])standoffkey_prismmountmod_bigger_rails_bigger_lens();
//translate([-82.075,5-0.075,23])middle_lens_set();
//translate([0,0,19])imagingsource_cover();
//imagingsource_base();




//translate([190,52,420])rotate([180,0,90])color([160/255,160/255,160/255])camera_assy();
//begin coding
///endstop_for_conveyer();
//translate([77.5,20+3,5])rotate([0,0,90])justusb_otherend();
//rotate([0,-180,0])steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids();
//rotate([0,180,0])steppermotordriver_4setplate();
//rotate([0,180,0])steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids();
//steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids();
///valvesupportmodule_plate();
//mirror([0,1,0])import("files/endstop_y.stl");
//rotate([0,-90,0])z_encoder_clamp_wiper();
//rotate([0,180,0])z_encoder_clamp();
//translate([25,25,11])rotate([0,0,180])gesim_tipmount_formed_noigus();

//shuttle_front();
//filament_linearactuator();
//E3Dv6_Bowden();
//translate([0,40,0])rotate([0,0,0])import("bowden_extruder/Fan_Duct_E3D_Tech2_Reduced_2mm.stl");

//translate([0,20,0])rotate([0,0,0])import("bowden_extruder/Fan_Duct_E3D_Tech2_no_support.stl");
///translate([0,-20,30])rotate([0,0,0])import("bowden_extruder/Duct.stl");


//translate([0,-30,0])solenoid_connects_brd(38,22);
//solenoid_power_control_assy_brd();

//solenoid_2pin_connects_endstop_brd();

//solenoid_2pin_connects_endstop_brd();


//translate([25,25-5,11])rotate([0,0,180])gesim_tipmount_formed_noigus_1tip_basic();
//linearactuator_filament_encodershuttle_filamentclamp();

//usascientific_p20();

//disposablep200();

//new_conveyerdriver_arduinomicro();
//new_compact_4conveyer_driver();
//new_compact_wash_dry_pcv_arduinomicro();

//diaphragmpump_case_base();

//This is for the sparkfun vacuum pumps
//module diaphragm_pump_printing_instructions(){
//printed this first diaphragmpump_case_base();
//then this one rotate([-90,0,0])translate([0,-3+70,0])mirror([0,1,0])diaphragmpump_longwall();
//then this one rotate([0,90,0])diaphragmpump_end();
//then this one rotate([0,90,0])translate([0,-50,0])mirror([0,1,0])diaphragmpump_end_justusb();
//then this one diaphragmpump_lid();
//then this onerotate([90,0,0])translate([0,-3+70,0])mirror([0,0,0])diaphragmpump_longwall_pumpports();
//}





//amp_lidbox_assy();
//fullsize_arduinomicro_5a4988_endstop();

//arduinomicro_washdryppressurepcv();
//atx_power_sockets()jk
//atx_power_socket_24pin();
//translate([38,19,0])atx_power_socket_8pin();



module openmv_nice_assy_stroboscope(){
//color("")
col = "lightgrey";
color(col)translate([0,36-25,0])openmv_camera_lensmount();
color(col)translate([-200,36-25+1.5,4])rotate([0,180,0])openmv_camera_base();
color(col)translate([-130,80+39,14+3])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim(12,21.2);
color(col)translate([-130,80+39,10.35])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim_spacer(12,21.95);
color(col)translate([0,12,-8])rotate([0,0,0])import("openmv/files/OpenMV_rev_6_Camera_Bottom_cover.stl");
color(col)translate([-100,100,25+10])filtermount();
color(col)translate([-111.7,30+4.5,3])rotate([0,90,90])connectionarms2(0);
color(col)translate([-111.7+2.5,45,3])rotate([0,90,-90])connectionarms2(0);
color(col)translate([-7,48,20])rotate([-90,0,0])openmv_camera_base_justclip_otherend();
}





module openmv_nice_assy_for_nanoplotter(){
translate([0,36-25,0])color("")openmv_camera_lensmount();
translate([-200,36-25+1.5,4])rotate([0,180,0])openmv_camera_base();
translate([-130,80+39,14+3])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim(12,21.2);
translate([-130,80+39,10.35])translate([5+25,-10+6-15-2+2,-1.5])rotate([0,0,0])m12lens_screwshim_spacer(12,21.95);
translate([0,12,-8])rotate([0,0,0])import("openmv/files/OpenMV_rev_6_Camera_Bottom_cover.stl");
translate([-100,100,25+10])filtermount();
translate([-111.7,30+3,-8])rotate([0,0,90])connectionarms2(0);
translate([-111.7+2.5,30+3-40+1,-8])rotate([0,0,-90])connectionarms2(0);
}





module shim_for_z_rail_alignement(){
translate([10+418+1+45-10,102+4.5,100])cube([20,10,5]);
translate([10+418+1+45-10,102+4.5,100])cube([10,93.,5]);

translate([-16,-14,0]){
translate([10+418+1+45-10,102+4.5,100])cube([20,10,5]);
translate([10+418+1+45-10,102+4.5,100])cube([10,93.+14.,5]);
}
}





module azteeg_connect_alu(){
translate([10,52,0])difference(){
cube([20,20,3]);
translate([10,10,-10])cylinder(r=4.7/2,h=30);
}
azteeg_x5_mini_plate();
}



module aluminum_frontcover(){

difference(){
translate([92+34-53,410-10,-53])rotate([90,0,0])cube([110,43,3]);
translate([92+34-53+20,410-10,-43])rotate([90,0,0])cube([70,23-5,3]);
translate([92+34-53+6-2,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
}
}


module usbs_socket_alu_support(){
difference(){
union(){
translate([92+34-53,410-10,-53])rotate([90,0,0])cube([110+20,45,3]);
translate([92+34-53+15-3,410-10,-53-4])rotate([90,0,0])cube([110-30+3+20,4+3,12]);
translate([92+34-53+15-3,410-10,-53+39])rotate([90,0,0])cube([110-30+3+20,4+4,12]);
translate([92+34-53+15-6,410-10,-53])rotate([90,0,0])cube([4,43,12]);
translate([92+34-53+15+80+17,410-10,-53])rotate([90,0,0])cube([4+0,43,12]);
translate([92+34-53+15-3+4,410-10,-53+6])rotate([90,45,0])cylinder(r=5,h=12,$fn=4);
translate([92+34-53+15-3+4,410-10,-53+6+31])rotate([90,45,0])cylinder(r=5,h=12,$fn=4);
translate([92+34-53+15-3+4+78+15,410-10,-53+6])rotate([90,45,0])cylinder(r=5,h=12,$fn=4);
translate([92+34-53+15-3+4+78+15,410-10,-53+6+31])rotate([90,45,0])cylinder(r=5,h=12,$fn=4);

}
translate([92+34-53+15-3+4,410-10+31,-53+6])rotate([90,45,0])cylinder(r=3.1/2,h=120);
translate([92+34-53+15-3+4,410-10+30,-53+6+31])rotate([90,45,0])
cylinder(r=3.1/2,h=120);
translate([92+34-53+15-3+4+78+15,410-10+30,-53+6])rotate([90,45,0])
cylinder(r=3.1/2,h=120);
translate([92+34-53+15-3+4+78+15,410-10+30,-53+6+31-0])rotate([90,45,0])
cylinder(r=3.1/2,h=120);
translate([92+34-53+6+3+7,410-10+0,-53+11])rotate([90,0,0])cube([110-18-2.5-15+20,23,3]);
translate([92+34-53+6+3+7+5,410-10+0,-53+11-12])rotate([90,0,0])cube([110-18-2.5-15+20-13,23+23,33]);
//translate([92+34-53+6-2+50,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2+50,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);

for(i=[1,1.5,2]){
translate([92+34-53+6-2,410-10,-53+4+i])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2,410-10,-53+4+35+i])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100+17,410-10+10,-53+4+i])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100+17,410-10,-53+4+35+1])rotate([90,0,0])cylinder(r=3.7/2,h=30);
}
}
}





module usbs_socket_alu_support_lid(){
difference(){
union(){
translate([92+34-53+10,410-10,-53-4])rotate([90,0,0])cube([110-4,43+8,3]);
translate([92+34-53+15-3,410-10,-53])rotate([90,0,0])cube([110-30+3,4,3]);
translate([92+34-53+15-3,410-10,-53+39])rotate([90,0,0])cube([110-30+3,4,3]);
translate([92+34-53+15-6,410-10,-53])rotate([90,0,0])cube([4,43,3]);
translate([92+34-53+15+80,410-10,-53])rotate([90,0,0])cube([4,43,3]);
translate([92+34-53+15-3+4,410-10,-53+6])rotate([90,45,0])cylinder(r=5,h=3,$fn=4);
translate([92+34-53+15-3+4,410-10,-53+6+31])rotate([90,45,0])cylinder(r=5,h=3,$fn=4);
translate([92+34-53+15-3+4+78,410-10,-53+6])rotate([90,45,0])cylinder(r=5,h=3,$fn=4);
translate([92+34-53+15-3+4+78,410-10,-53+6+31])rotate([90,45,0])cylinder(r=5,h=3,$fn=4);
}
translate([92+34-53+15-3+4-0,410-10,-53+6-0])rotate([90,45,0])cylinder(r=3.7/2,h=120);
translate([92+34-53+15-3+4,410-10,-53+6+31])rotate([90,45,0])cylinder(r=3.7/2,h=120);
translate([92+34-53+15-3+4+78+15,410-10+0,-53+6])rotate([90,45,0])cylinder(r=3.7/2,h=12);
translate([92+34-53+15-3+4+78+15,410-10,-53+6+31])rotate([90,45,0])cylinder(r=3.7/2,h=12);

translate([92+34-53+6+3+13,410-10,-53+9])rotate([90,0,0])cube([110-18-2.5-20,23,3]);
//translate([92+34-53+6-2,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2+50,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2+50,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100+5,410-10,-53+4+2])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100+5,410-10,-53+4+35-2])rotate([90,0,0])cylinder(r=3.7/2,h=30);
}
}

















module atx_power_connect_assy(){
translate([92,410-10,-52])rotate([90,0,0])atx_power_socket_24pin();
translate([92+34,410-10,-33])rotate([90,0,0])atx_power_socket_8pin();
difference(){
translate([92+34-53,410-10,-53])rotate([90,0,0])cube([110,43,3]);
translate([92+34-53+6,410-10+1,-53+9])rotate([90,0,0])cube([110-18,23,3+5]);
translate([92+34-53+6-2,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2+50,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
//translate([92+34-53+6-2+50,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100,410-10,-53+4])rotate([90,0,0])cylinder(r=3.7/2,h=30);
translate([92+34-53+6-2+100,410-10,-53+4+35])rotate([90,0,0])cylinder(r=3.7/2,h=30);
}
}











module atx_power_socket_8pin(){
difference(){
translate([16,-12,0])cube([100-65,24,3]);
translate([14.5,-20,0])translate([15.5,-32+42+6.5+4,-0.1])rotate([-20,0,0])cube([10+0-6,14-10+1,5+6]);
translate([0,-20,0])translate([40.95+0.5,-32+42+6.5,-4])rotate([0,-65,0])cube([10+0,14-10+1,5]);
translate([31,-20,0])translate([-11.55-0.5,-32+42+6.5,4])rotate([0,65,0])cube([10+0,14-10+1,5]);
translate([31,-20,0])translate([-7.59-0.6/2,14,-0.1])cube([18.1+0.6,10,10]);
}
}

module atx_power_socket_24pin(){
difference(){
translate([-16,7,0])cube([100-30,24,3]);
//ATX 24 pin
translate([-50+40-2.05+4-0.54,-32+42+6.5-2.5,-0.1])cube([30+22.1,10,10]);
translate([-50+40-2.05+0.5-0.5,-32+42+6.5,4])rotate([0,65,0])cube([10+0,14-10+1,5]);
translate([-50+40-2.05+55.4+0.5,-32+42+6.5,-4])rotate([0,-65,0])cube([10+0,14-10+1,5]);
translate([-50+40-2.05+55.4/2-0.15,-32+42+6.5+4,-0.1])rotate([-20,0,0])cube([10+0-6,14-10+1,5+6]);
}
}



module atx_power_sockets(){

//import("BackPanel09.stl");
translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])atx_power_socket_24pin();
translate([77.5+30-50+28,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
translate([77.5+30-50+28+35,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();

}



module pcv_sensor_usb_connect(){

translate([77.5,20+3,5])rotate([0,0,90])justusb_otherend();
translate([77.5-30+16,12.7+3+20,5])difference(){
cube([8,10+10,4]);
translate([6.6-2-0.75,5+9,-0.3])cylinder(r=4.7/2,h=20);
}

}


module arduinomicro_washdryppressurepcv(){
union(){
translate([-25,94/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(82.5,114.5);
}
}



module fullsize_arduinomicro_5a4988_endstop(){
union(){
translate([-25,94/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(102,128);
}
}

module arduino_micro_wash_dry_pcv_valveservo_tmp_fix_rightside_up_simplify_traces_electrocaloric(){
union(){
translate([-25,94/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(85,112);
}
}





module amp_lidbox_assy(){
difference(){union(){
amp_lid_box();
translate([-48+32+1.2+15,14+3,58+0]){
for(i=[0:3]){
translate([(i*28.6),0,0])teensy_amp_module();
}
}
}
//rotate([0,-90,0])mirror([0,1,0])amp_powersupply_wallB();
translate([-5-7-3+16,-5-3+35,0+55-0.5])cube([94.17+10+(8.83+20)+7+6-30-5,114.31+10+6-70,6+10]);
}
}

module amp_powersupply_box_assy(){
//rotate([90,0,0])
//rotate([-90,0,0])
//mirror([0,1,0])amp_powersupply_wallA();
//rotate([0,-90,0])

amp_powersupply();

/*
amp_powersupply_wallA();
amp_powersupply_wallB();
translate([143,0,0])amp_powersupply_wallB_plug();
translate([0,114.3,0])mirror([0,1,0])amp_powersupply_wallA();
amp_lid_box();
*/
}


//translate([-48,0,0])teensy_amp_module();
//amp_powersupply();

module teensy_amp_module(){
difference(){
 cube([28.52,79.69,3]);
 //translate([2,10,0])cube([28.52-4,79.69-20,3]);
 translate([28.52/2,4.8545,-0.2])cylinder(r=2.8/2,h=20);
 translate([28.52/2,79.69-4.8545,-0.2])cylinder(r=2.8/2,h=20);
}
}


module amp_lid_box(){
difference(){
translate([-5-7-3,-5-3,0+55])cube([94.17+10+(8.83+20)+7+6,114.31+10+6,3]);
translate([-5-7-3+16,-5-3+35,0+55-0.5])cube([94.17+10+(8.83+20)+7+6-30-5,114.31+10+6-70,6]);
translate([150-10+5-21.83,-5+10-4.1,-30-0.1+6+55])rotate([0,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-21.83,-5+10-4.1+112.5,-30-0.1+6+55])rotate([0,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-21.83-130.17,-5+10-4.1+112.5,-30-0.1+6+55])rotate([0,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-21.83-130.17,-5+10-4.1,-30-0.1+6+55])rotate([0,0,0])cylinder(r=3/2,h=50);

 //translate([-48+32+1.2,14+3,58+0-3])translate([28.52/2,4.8545,-0.2]){cylinder(r=4.7/2,h=20);cylinder(r=8/2,h=3,$fn=6);}
 //translate([-48+32+1.2,14+3,58+0-3])translate([28.52/2,79.69-4.8545,-0.2]){cylinder(r=4.7/2,h=20);cylinder(r=8/2,h=3,$fn=6);}


translate([-48+32+1.2+15,14+3,58+0-3]){
for(i=[0:3]){
//translate([(i*28.6),0,0])teensy_amp_module();
 //translate([-48+32+1.2,14+3,58+0-3])
 translate([28.52/2+(i*28.6),4.8545,-0.2]){cylinder(r=2.8/2,h=20);}//cylinder(r=8/2,h=6.1-,$fn=6);}
 //translate([-48+32+1.2,14+3,58+0-3])
 translate([28.52/2+(i*28.6),79.69-4.8545,-0.2]){cylinder(r=2.8/2,h=20);}//cylinder(r=8/2,h=3,$fn=6);}
}
}
//rotate([0,-90,0])mirror([0,1,0])amp_powersupply_wallB();



}
}


module amp_powersupply_wallB_plug(){
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([320-192-143,15+10,-0.1-29+47-4])rotate([90,0,90])difference(){
union(){
translate([-3,-3,0])cube([(48+6),(28+6),3]);
translate([-3+54/2-4,-3-7,0])cube([(8),(8),3]);
translate([-3+54/2-4,-3+34-2,0])cube([(8),(8),3]);
}
translate([0,-0,-10])cube([(48),(28),35+5]);
translate([(48)/2,(28)/2-(39)/2,-10])cylinder(r=4.2/2,h=35);
translate([(48)/2,(28)/2+(39)/2,-10])cylinder(r=4.2/2,h=35);
}
difference(){
translate([-15,-8+20,0])cube([3,114.31+10+3+3-57,55]);
translate([320-192-143-10,15+10-0,-0.1-29+47-4-0])rotate([90,0,90])cube([(48),(28),35]);
translate([-42-110-4,5+47,30-3.5])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=4.2/2,h=50);
translate([-42-110-4,5+47,30-3.5+39])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=4.2/2,h=50);
translate([-42-110,5,30])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
translate([-42-110,5+110.3,30])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
translate([-42-110,5+20,30+15])rotate([-90,0,0])
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
translate([-42-110,5+20,30+15])rotate([-90,0,0])
translate([150-10+5-20,-5+10-8,-30-0.1+12+100.5])rotate([90,0,90])cylinder(r=3.7/2,h=500);
}
}







module amp_powersupply_wallB(){
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([320-192-143,15+10,-0.1-29+47-4])rotate([90,0,90])difference(){
union(){
translate([-3,-3,0])cube([(48+6),(28+6),3]);
translate([-3+54/2-4,-3-7,0])cube([(8),(8),3]);
translate([-3+54/2-4,-3+34-2,0])cube([(8),(8),3]);
}
translate([0,-0,-10])cube([(48),(28),35+5]);
translate([(48)/2,(28)/2-(39)/2,-10])cylinder(r=4.2/2,h=35);
translate([(48)/2,(28)/2+(39)/2,-10])cylinder(r=4.2/2,h=35);
}
*/
difference(){
translate([-15,-8,0])cube([3,114.31+10+3+3,55]);
//translate([320-192-143-10,15+10-0,-0.1-29+47-4-0])rotate([90,0,90])cube([(48),(28),35]);
//translate([-42-110-4,5+47,30-3.5])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=4.2/2,h=50);
//translate([-42-110-4,5+47,30-3.5+39])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=4.2/2,h=50);
translate([-42-110,5,30])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([-42-110,5+110.3,30])translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([-42-110,5+20,30+15])rotate([-90,0,0])
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([-42-110,5+20,30+15])rotate([-90,0,0])
translate([150-10+5-20,-5+10-8,-30-0.1+12+100.5])rotate([90,0,90])cylinder(r=3/2,h=500);
}
}






module amp_powersupply_wallA(){

difference(){
union(){
translate([-12,-8,0])cube([94.17+46,3,55]);
//connect 1
translate([-42+20.17,5+20,30+15])rotate([-90,0,0])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
//connect 2
translate([-42-110,5+20,30+15])rotate([-90,0,0])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
}
translate([-12+15,-8,0+10])cube([94.17+46-30,3,55-20]);
translate([-42+20,5,30])translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([-42-110,5,30])translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
}
//diaphragmpump_longwall_pumpports();

}

module amp_powersupply(){
difference(){
union(){
color("lime")cube([94.17,114.31,5+4]);
translate([-5-7,-5,0])cube([94.17+10+(8.83+20)+7,114.31+10,3]);

//connect 1
translate([-42+20,5,30])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
//connect 2 
translate([-42-110,5,30])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
translate([0,110.3,0]){
//connect 3
translate([-42+20,5,30])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
//connect 4
translate([-42-110,5,30])difference(){
translate([0+20+120,-10,-30])cube([10,14,18]);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
translate([150-10+5-20,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
}
}
} //end union


translate([10,10,-0.2])cube([94.17-20,114.31-20,6+4]);
translate([4.95,4.95,0]){
translate([0,0,-3]){cylinder(r=2.9/2,h=20);} //translate([0,0,2.8])cylinder(r=9/2,h=3.5,$fn=6);}
translate([0,104.40-104.40+94,-3]){cylinder(r=2.9/2,h=20);}//translate([0,0,2.8])cylinder(r=9/2,h=3.5,$fn=6);}
translate([84.26-84.26+123,104.40-104.4+94,-3]){cylinder(r=2.9/2,h=20);}//translate([0,0,2.8])cylinder(r=9/2,h=3.5,$fn=6);}
translate([84.26-84.26+123,0,-3]){cylinder(r=2.9/2,h=20);}//translate([0,0,2.8])cylinder(r=9/2,h=3.5,$fn=6);}
}
}

}



module new_compact_4conveyer_driver(){
union(){
translate([-25,115/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(49,115);
}
}



module new_conveyerdriver_arduinomicro(){
union(){
translate([-25,94/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(61,94);
}
}


module new_compact_wash_dry_pcv_arduinomicro(){
union(){
translate([-25,75/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(54,75);
}
}

module biggernew_compact_wash_dry_pcv_arduinomicro(){
union(){

translate([-25,94/2-10,0])difference(){cube([20,20,4]);translate([10,10,-4])cylinder(r=4.7/2,h=20);}
5steppers_5endstops_4solenoids_brd(102,128);


}
}



module usascientific_p20(){

difference(){
union(){
cylinder(r=10/2,h=16);
translate([0,0,16])cylinder(r=5.5/2,h=6);
}
translate([0,0,-2])cylinder(r=2/2,h=50);
translate([0,0,-0.1])cylinder(r=6/2,h=10);
translate([0,0,8.5])cylinder(r=4/2,h=10);
}
}


module filament_clamp_assy(){

linearactuator_filament_encodershuttle_filamentclamp();
filament_linearactuator_shuttle();
translate([25,25-5,11])rotate([0,0,180])gesim_tipmount_formed_noigus_1tip_basic();

}


module diaphragmpump_end(){
difference(){
translate([0-3,-10-3,-30])cube([3,85+6,83+3+60]);
//translate([0-3-2,-10-3+20,-30+20])cube([3,85+6-40,83+3-40+60]);
//1      
translate([-5,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//2
translate([-5,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//3   
translate([-5,-5+10-8+3-3.4,-30-0.1+12+65+60-2.8])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//4 
translate([-5,-5+10-8+71-4+3.7,-30-0.1+12+65+60-2.8])rotate([90,0,90])cylinder(r=3.7/2,h=50);


//2
/*
translate([-5,-5+10-8+71-13,-30-0.1+12+10])rotate([90,0,90])cylinder(r=5.5/2,h=50);
translate([-5,-5+10-8+71-13-(1*15),-30-0.1+12+10])rotate([90,0,90])cylinder(r=5.5/2,h=50);
translate([-5,-5+10-8+71-13-(2*15),-30-0.1+12+10])rotate([90,0,90])cylinder(r=5.5/2,h=50);
translate([-5,-5+10-8+71-13-(3*15),-30-0.1+12+10])rotate([90,0,90])cylinder(r=5.5/2,h=50);
*/
}
}


module diaphragmpump_end_6pin_pcb(){
wll = 10;
difference(){
translate([-wll/2,-wll/2,0])cube([61.1+wll,40.2+wll,3]);
translate([-0,0,3])cube([61.1,40.2,30]);
translate([5.908,12.785,-0.1])cylinder(r=4.2/2,h=100);
translate([56.784,12.889,-0.1])cylinder(r=4.2/2,h=100);
translate([16.146,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([26.384,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([39.13,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([49.262,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([17.6,14-1-0.5,-0.1])cube([17,4.5+1,50]);
}
}

module diaphragmpump_end_6pin_pcb_lid(){
wll = 10;
difference(){
translate([-wll/2,-wll/2,0])cube([61.1+wll,40.2+wll,1]);
translate([-0,0,3])cube([61.1,40.2,30]);
translate([5.908,12.785,-0.1])cylinder(r=4.2/2,h=100);
translate([56.784,12.889,-0.1])cylinder(r=4.2/2,h=100);
translate([26.384+10,6.517+20,-0.1])rotate([0,0,45])cylinder(r=15/2,h=100,$fn=4);
translate([26.384+10+10,6.517+20,-0.1])rotate([0,0,45])cylinder(r=15/2,h=100,$fn=4);
translate([26.384+10-10,6.517+20,-0.1])rotate([0,0,45])cylinder(r=15/2,h=100,$fn=4);
/*
translate([39.13,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([16.146,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([49.262,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([17.6,14-1,-0.1])cube([17,4.5,50]);
*/
}
}





module diaphragmpump_end_6pin(){
difference(){
union(){
translate([0-3,-10-3,-30])cube([3,85+6,83+3+60]);
//translate([0,0,100])rotate([-90,0,90])diaphragmpump_end_6pin_pcb();
}

//pcb pins

translate([0,0,100])rotate([-90,0,90]){
translate([5.908,12.785,-0.1])cylinder(r=4.2/2,h=100);
translate([56.784,12.889,-0.1])cylinder(r=4.2/2,h=100);
translate([16.146,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([26.384,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([39.13,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([49.262,6.517,-0.1])cylinder(r=6.5/2,h=100);
translate([17.6,14-1,-0.1])cube([17,4.5,50]);
}

//end pins


//translate([0-3-2,-10-3+20,-30+20])cube([3,85+6-40,83+3-40+60]);


//1
translate([-5,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//2
translate([-5,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//3
translate([-5,-5+10-8+3,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//4
translate([-5,-5+10-8+71-4,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);
/*
translate([15/2-15,20+12,0+100])rotate([0,90,0]){
translate([0,-14.6,-1])cylinder(r=3.3/2,h=10);
translate([0,14.6,-1])cylinder(r=3.3/2,h=10);
translate([-10.7/2,-13.2/2,-1])cube([10.7,13.2,13]);
}
*/
/*
translate([46/2-15.4/2,43/2-15.2/2,-1])cube([15.4,15.2,13]);
translate([46/2-25/2,43/2,-1])cylinder(r=3.7/2,h=20);
translate([46/2+25/2,43/2,-1])cylinder(r=3.7/2,h=20);
*/
//translate([-15.2/2,-22.6/2,0])cube([15.2,22.6,3]);
}
}




module diaphragmpump_end_justusb(){
difference(){
translate([0-3,-10-3,-30])cube([3,85+6,83+3+60]);
translate([0-3-2,-10-3+20,-30+20])cube([3,85+6-40,83+3-40+60]);
//1
translate([-5,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//2
translate([-5,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//3
translate([-5,-5+10-8+3,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//4
translate([-5,-5+10-8+71-4,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);
translate([15/2-15,20+12,0+100])rotate([0,90,0]){
translate([0,-14.6,-1])cylinder(r=3.3/2,h=10);
translate([0,14.6,-1])cylinder(r=3.3/2,h=10);
translate([-10.7/2,-13.2/2,-1])cube([10.7,13.2,13]);
/*
translate([46/2-15.4/2,43/2-15.2/2,-1])cube([15.4,15.2,13]);
translate([46/2-25/2,43/2,-1])cylinder(r=3.7/2,h=20);
translate([46/2+25/2,43/2,-1])cylinder(r=3.7/2,h=20);
*/
//translate([-15.2/2,-22.6/2,0])cube([15.2,22.6,3]);
}
}
}


module diaphragmpump_end_rj45(){
difference(){
translate([0-3,-10-3,-30])cube([3,85+6,83+3+60]);
translate([0-3-2,-10-3+20,-30+20])cube([3,85+6-40,83+3-40+60]);
//1
translate([-5,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//2
translate([-5,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//3
translate([-5,-5+10-8+3,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);
//4
translate([-5,-5+10-8+71-4,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3.7/2,h=50);

translate([15/2-15,20+12,0+100])rotate([0,90,0]){

/*
translate([0,-14.6,-1])cylinder(r=3.3/2,h=10);
translate([0,14.6,-1])cylinder(r=3.3/2,h=10);
translate([-10.7/2,-13.2/2,-1])cube([10.7,13.2,13]);
*/
translate([21,-22,0])rotate([0,0,90]){
translate([46/2-15.4/2,43/2-15.2/2,-1])cube([15.4,15.2,13]);
translate([46/2-25/2,43/2,-1])cylinder(r=3.7/2,h=20);
translate([46/2+25/2,43/2,-1])cylinder(r=3.7/2,h=20);
}
//translate([-15.2/2,-22.6/2,0])cube([15.2,22.6,3]);
}
}
}










module diaphragmpump_lid(){
difference(){
translate([0,-10-3,-30+80+3])cube([150,85+6,3]);
translate([150-10+5-20+20+0,-5+10-8+6-5-3.,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);
translate([150-10+5-20+20+0,-5+10-8+6-5-3+74,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);
translate([150-10+5-20+20+0-60,-5+10-8+6-5-3,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);
translate([150-10+5-20+20+0-60,-5+10-8+6-5-3+74,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);
translate([5,-5+10-8+6-5-3,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);
translate([5,-5+10-8+6-5-3+74+1,-30-0.1+12+65-30])rotate([0,0,0])cylinder(r=3.7/2,h=50);

}
}

module vacuumpump_tubing(){

//tubing to PCV
translate([20,34-10,88])rotate([90,0,0])color("lightblue")cylinder(r=6.5/2,h=50);
translate([20,34-10-50,88])rotate([0,0,90])color("lightblue")rotate([0,0,0])cylinder(r=6.5/2,h=150);
for(i=[0:200]){
translate([20+i/8,34-10-50+i,88+150+i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:110]){
translate([20+200/8+i,34-10-50+200+i/5,88+150+200+i/1.5])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:10]){
translate([20+200/8+110+i/4,34-10-50+200+110/5+i/1.5,88+150+200+110/1.5-i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
//end tubing PCV

//translate([20,34-10-50,88+150])rotate([17,50,90])color("lightblue")rotate([0,0,0])cylinder(r=6.5/2,h=400);

//begin to wash station
/*
*/
translate([20+44,34-10,88])rotate([90,0,0])color("lightblue")cylinder(r=6.5/2,h=50);
translate([20+44,34-10-50,88])rotate([0,0,90])color("lightblue")rotate([0,0,0])cylinder(r=6.5/2,h=87);
for(i=[0:65]){
translate([20+i/8+44,34-10-50+i,88+87+i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:180]){
translate([20+65/8+44+i,34-10-50+65,88+87+65])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:30]){
translate([20+65/8+44+180,34-10-50+65+i,88+87+65])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:53]){
translate([20+65/8+44+180+i,34-10-50+65+30,88+87+65])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:30]){
translate([20+65/8+44+180+53,34-10-50+65+30-i,88+87+65])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}


//end to wash station

//begin waste 
translate([20+44+66,34-10,88])rotate([90,0,0])color("lightblue")cylinder(r=6.5/2,h=50);
translate([20+44+66,34-10-50,88])rotate([0,0,90])color("lightblue")rotate([0,0,0])cylinder(r=6.5/2,h=87);
for(i=[0:45]){
translate([20+i/8+44+66,34-10-50+i,88+87+i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:210]){
translate([20+45/8+44+66+i,34-10-50+45,88+87+45])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:14]){
translate([20+45/8+44+66+173,34-10-50+45+i,88+87+45+i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
for(i=[0:14]){
translate([20+45/8+44+66+210,34-10-50+45+i,88+87+45+i])color("lightblue")rotate([0,0,0])sphere(6.5/2);
}
/*
*/

}


module diaphragmpump_longwall_pumpports(){

vacuumpump_tubing();


color("white"){
translate([20,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
translate([40,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
translate([65,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
translate([85,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
translate([130,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
translate([110,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=50);
}
//1


difference(){
union(){
translate([0,-10,-30])color("")cube([150,3,3+80+60]);
/*
//1
translate([0+20+120,-10+3,-30+65+60])cube([10,14,18]);
//2
translate([0+20+120-60,-10+3,-30+65+60])cube([10,14,18]);
//3
translate([0,-10+3,-30+65+60])cube([10,14,18]);
*/
}

//translate([15,-10+1.5,-30+20])cube([120,3,3+80]);

translate([20,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
translate([40,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
translate([65,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
translate([85,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
translate([130,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
translate([110,34,88])rotate([90,0,0])cylinder(r=6.3/2,h=200);
/*

*/

//1
translate([150-10+5,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);
//2
translate([150-10+5-80,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);
//3
translate([150-10+5-140,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);


//1
translate([150-10+5-20,-5+10-8+6,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([150-10+5-20+20,-5+10-8+6-5,-30-0.1+12+65-30+60])rotate([0,0,0])cylinder(r=3/2,h=50);
//2
translate([150-10+5-20+20-60,-5+10-8+6-5,-30-0.1+12+65-30+60])rotate([0,0,0])cylinder(r=3/2,h=50);
//3
translate([-5,-5+10-8+6,-30-0.1+12+65+60])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([-5+10,-5+10-8,-30-0.1+12+65-30+60])rotate([0,0,0])cylinder(r=3/2,h=50);
translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);
translate([150-10+5-60,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);
translate([5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);


}
}

module diaphragmpump_longwall(){
difference(){
union(){
translate([0,-10,-30])cube([150,3,3+80+60]);
//1
//translate([0+20+120,-10+3,-30+65+60])cube([10,14,18]);
//2
//translate([0+20+120-60,-10+3,-30+65+60])cube([10,14,18]);
//3
//translate([0,-10+3,-30+65+60])cube([10,14,18]);
}
//1
translate([150-10+5,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);
//2
translate([150-10+5-80,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);
//3
translate([150-10+5-140,-5+10-8+6+20,-30-0.1+12+65+61])rotate([90,0,0])cylinder(r=3.7/2,h=150);

translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);
translate([150-10+5-60,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);
translate([5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3.7/2,h=50);
}
}

module diaphragmpump_case_base(){
//translate([0,27,-5])airpo_d2028B_pump_mount_assy();
//translate([0,20,0])rotate([0,90,0])tslot20(150);
//rotate([0,90,0])tslot20(150);

difference(){union(){
translate([0,-10,-30])cube([150,85,3]);
//translate([0+20,-5+10,-30])cube([20,20,5]);
//translate([0+20+80,-5+10,-30])cube([20,20,5]);
//1
//translate([0+20+120,-10,-30])cube([10,14,18]);
//translate([0+(140)+10,0,0])mirror([1,0,0])boxcouplers();
//2
//translate([0+20+120,-10+71,-30])cube([10,14,18]);
//translate([0+(140)+10,-71,0])mirror([1,0,0])boxcouplers();
//3
//translate([0+20+120-60,-10+71,-30])cube([10,14,18]);
//4
//translate([0+20+120-60,-10,-30])cube([10,14,18]);
//translate([0-(20+120-60),-71,0])boxcouplers();
//5
//translate([0,-10,-30])cube([10,14,18]);
//translate([0,-71,0])boxcouplers();
//6
//translate([0,-10+71,-30])cube([10,14,18]);
//boxcouplers();




}

translate([0+30,-5+20,-30-0.1])cylinder(r=5.7/2,h=10);
//translate([0+30,-5+40,-30-0.1])cylinder(r=2.8/2,h=10);
translate([0+30+80,-5+20,-30-0.1])cylinder(r=5.7/2,h=10);
//translate([0+30+80,-5+40,-30-0.1])cylinder(r=2.8/2,h=10);
/*
translate([10,-5,-30-0.1])cylinder(r=3.7/2,h=10);
translate([10+60,-5,-30-0.1])cylinder(r=3.7/2,h=10);
*/
//1
//translate([150-10+5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([150-10+5-10,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10+130,-5+10-8,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//translate([10,-5+10-8+71+150,-40])rotate([0,0,0])cylinder(r=3/2,h=50);
//2
//translate([150-10+5,-5+10+71,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([150-10+5-10,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10+130,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//3
//translate([150-10+5-60,-5+10+71,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//4
//translate([150-10+5-60,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//5
//translate([5,-5+10,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([-15,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10,-5+10-8,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//6
//translate([5,-5+10+71,-30-0.1+6])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([-5-10,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
/*
translate([10,70,-30-0.1])cylinder(r=3.7/2,h=10);
translate([10+60,70,-30-0.1])cylinder(r=3.7/2,h=10);
translate([150-10,70,-30-0.1])cylinder(r=3.7/2,h=10);
*/
}
}

module diaphragmpump_case_lid_from_base(){
//translate([0,27,-5])airpo_d2028B_pump_mount_assy();
//rotate([0,90,0])tslot20(150);
//translate([0,20,0])rotate([0,90,0])tslot20(150);
difference(){union(){
translate([0,-10-3,-30])cube([150,83+7.8,3]);
//1
//translate([0+20+120,-10,-30])cube([10,14,18]);
//translate([0+(140)+10,0,0])mirror([1,0,0])boxcouplers();
//2
//translate([0+20+120,-10+71,-30])cube([10,14,18]);
//translate([0+(140)+10,0-71,0])mirror([1,0,0])boxcouplers();
//3
//translate([0+20+120-60,-10+71,-30])cube([10,14,18]);
//4
//translate([0+20+120-60,-10,-30])cube([10,14,18]);
//5
//translate([0,-10,-30])cube([10,14,18]);
//translate([0+(0),0,0])mirror([0,0,0])boxcouplers();
//6
//translate([0,-10+71,-30])cube([10,14,18]);
//translate([0+(0),0-71,0])mirror([0,0,0])boxcouplers();

/*
translate([0+(140)+10,0,0])mirror([1,0,0])boxcouplers();
translate([0+(140)+10,0-71,0])mirror([1,0,0])boxcouplers();
translate([0+(0),0,0])mirror([0,0,0])boxcouplers();
translate([0+(0),0-71,0])mirror([0,0,0])boxcouplers();
*/
}
//translate([0+30,-5+20,-30-0.1])cylinder(r=5.7/2,h=10);
//translate([0+30+80,-5+20,-30-0.1])cylinder(r=5.7/2,h=10);
//1
//translate([150-10+5,-5+10+5,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([150-10+5-10,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10+130,-5+10-8,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//2
//translate([150-10+5,-5+10+71+5,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([150-10+5-10,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10+130,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//3
//translate([150-10+5-60,-5+10+71+5,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//4
//translate([150-10+5-60,-5+10+5,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//5
//translate([5,-5+10,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([-15,-5+10-8,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10,-5+10-8,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
//6
//translate([5,-5+10+71+5,-30-0.1+6+2])rotate([90,0,0])cylinder(r=3/2,h=50);
//translate([-5-10,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=3/2,h=50);
translate([10,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=3.7/2,h=50);
}
}











module amplifier_brd_holder(){

//translate([372,-217,0])rotate([0,180,0])solenoids_mosfets();

//to indicate
color("green")translate([-42+114,6-50,0])rotate([0,0,90])cube([36,42,1]);
color("green")cube([92,62,1]);


translate([-42+114,6-50,0])rotate([0,0,90])solenoid_endstop_brd(36,42);
solenoid_endstop_brd(92,62);

translate([35+12-20+41,-54,0])difference(){
translate([-10+20,2-2,0])cube([20,50,3]);
translate([10-9+22.5,10+1-3-2-0.8,-5.2])cylinder(r=4/2,h=120);
}
/*
translate([35+12-20+80,-24,0])difference(){
translate([-10+20,2-2,0])cube([30,20,5]);
translate([10-9+20-1+10,10+1-3-0,-0.2])cylinder(r=5.7/2,h=20);
}
*/
translate([35+12-20+33,-24+90-2,0])difference(){
translate([-10+20+10,2-2,0])cube([15,35,3]);
translate([10-9+20-1+10-4+5.2,10+1-3-0+21.2,-10.2])cylinder(r=4/2,h=50);
}
translate([35+12-59,-24+90-2,0])difference(){
translate([-10+20+10,2-2,0])cube([10,35,3]);
translate([10-9+20-1+10-4,10+1-3-0+21.4,-10.2])cylinder(r=4/2,h=50);
}
translate([35+12-20+41-77,-54,0])difference(){
union(){
translate([-10+20+7,2-2,0])cube([10,50,3]);
translate([-10+20+7,2-2+20,0])cube([22,30,3]);
}
translate([10-9+22.5,10+1-3-2-0.8,-5.2])cylinder(r=4/2,h=120);
}
}



module 5stepper_brd_holder_brd(){

translate([118,100-10,3])rotate([0,0,180])
difference(){
color("green")cube([121.2,96.2,1]);
translate([8.138,5.580,-20.5])cylinder(r=4/2,h=50);
translate([114.7,5.58,-20.5])cylinder(r=4/2,h=50);
translate([25.727,92,-20.5])cylinder(r=4/2,h=50);
translate([114.706,92,-20.5])cylinder(r=4/2,h=50);
}

}
module 5stepper_brd_holder(){

5stepper_brd_holder_brd();

/*
solenoid_endstop_brd(120,89);
translate([105,-14,0])difference(){
translate([-10+25.5,6,0])cube([15,10,5]);
translate([10-9+22.75,10+2,-10.2])cylinder(r=4/2,h=200);
}
translate([105,-14+90,0])difference(){
translate([-10+25.5,6,0])cube([15,10,5]);
translate([10-9+22.75,10+2,-10.2])cylinder(r=4/2,h=200);
}
translate([105-140,-14,0])difference(){
translate([-10+25.5,6,0])cube([15,10,5]);
translate([10-9+22.75-2,10+2,-10.2])cylinder(r=4/2,h=200);
}
translate([105-140,-14+90,0])difference(){
translate([-10+25.5,6,0])cube([15,10,5]);
translate([10-9+22.75-2,10+2,-10.2])cylinder(r=4/2,h=200);
}
*/
}

module solenoid_2pin_connects_endstop_brd(){
union(){
solenoid_endstop_brd(65,26);
translate([62+10,0,0])solenoid_2pin_connects(37,23);
}
translate([35,-24,0])difference(){
cube([20,20,5]);
translate([10,10,-0.2])cylinder(r=5.7/2,h=20);
}
}

module solenoid_endstop_brd(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}



module solenoid_2pin_connects(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}


module solenoid_power_control_assy_brd(){
union(){
translate([-40,0,0])solenoid_power_connects_brd(33,27);
solenoid_mosfet_brd(80,40);
translate([0,-24,0])difference(){
cube([20,20,5]);
translate([10,10,-0.2])cylinder(r=5.7/2,h=20);
}
}
}

module solenoid_power_connects_brd(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}


module powersupply_atx_connectbrd(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
translate([0-16,y/2-4,0])difference(){
cube([12,12,6]);
translate([5.5,6,-2])cylinder(r=3.7/2,h=30);
}
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}




module solenoid_connects_brd(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}


module solenoid_mosfet_brd(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}










//import("bowden_extruder/Fan_Duct_E3D_Tech2.stl");



module E3Dv6_Bowden(){
translate([15,30,10])difference(){union(){
import("bowden_extruder/Bowden_mount_v2.stl");
//translate([0,10,20])rotate([90,0,0])cylinder(r=10,h=70);
translate([-11.25,-11.25,0])cylinder(r=8.6/2,h=8,$fn=6);
translate([-11.25,-11.25+22.5,0])cylinder(r=8.6/2,h=8,$fn=6);
translate([-11.25+22.5,-11.25,0])cylinder(r=8.6/2,h=8,$fn=6);
translate([-11.25+22.5,-11.25+22.5,0])cylinder(r=8.6/2,h=8,$fn=6);
}
translate([-11.25+22.5/2-11.5,-11.25+3.25,0])cylinder(r=3.7/2,h=9);
translate([-11.25+22.5/2-11.5,-11.25+3.25,5])cylinder(r=7/2,h=4);
translate([-11.25+22.5/2-11.5+14,-11.25+3.25,0])cylinder(r=3.7/2,h=9);
translate([-11.25+22.5/2-11.5+14,-11.25+3.25,5])cylinder(r=7/2,h=4);
translate([-11.25+22.5/2-11.5+7,-11.25+3.25+14,0])cylinder(r=3.7/2,h=9);
translate([-11.25+22.5/2-11.5+7,-11.25+3.25+14,5])cylinder(r=7/2,h=4);
}
}


module wiper_set(){
wiper_tip_m5(10);
translate([13,0,0])wiper_tip_m5(10);
translate([26,0,0])wiper_tip_m5(6);
translate([39,0,0])wiper_tip_m5(25);
}

//rotate([0,180,0])wiper_clamp();
//nalgene_cap_for_sst_liquidlevel();
//rotate([0,-90,0])z_encoder_clamp_wiper();
//endstop_z();
//luerlocksockets_1();
//mirror([0,1,0])color("lightgrey")translate([36,295.5,18])rotate([0,90,90])valvemountplate_screwattach_smallersyringe();
//pressure_compensation_bottle();
//pressurecompensation_bottle();
//valve_assy();
//rotate([0,-90,0])smallsyringe_valvesupportmodule_plate();
//valveconnectpart();
//rotate([90,0,0])valvemountplate_screwattach_smallersyringe_vertical_attach();
//drypad();
//rotate([-90,0,0])lasermount_connector();
//lasermount_assy();
//rotate([180,0,0])import("stls/cap.stl");

//lasermount_assy();
//conveyer_slider_x4();
//slidedeck(3);
//conveyer_sliderwheel_assy();
//linearactuator_filament_encodershuttle();
//translate([0,141.8,0])rotate([0,0,180])linearactuator_filament_encodershuttle_filamentclamp();
//endstop_for_conveyer();
//compact_extruder();
//compact_extruder();
//conveyer_endstop_brd(43,19.5);
/*
translate([20, 0, 0])
        idler_608_v1();
*/
//kill_signal_mosfet_brd(33,28);
//encoder_ribboncable();
//kill_button_leds_panelmount();
//translate([-100,-100,0])rotate([90,-90,0])linearactuator_cordglide();
//cables_wall();
/*
rotate([0,90,0])cable_support_lid();
rotate([0,90,0])cable_support();
x_encoder_cableclip();
*/

//kill_button_leds_panelmount();
//arduino_mega_base_template_bottomattach();
//rotate([0,180,0])arduino_softpot_linearencoder_plate_washdry();
//rotate([0,180,0])steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids();
//electronics_configuration();
// translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();
//rotate([0,180,0])azteeg_raspi_plate();
//azteegx5_case();
//azteeg_x5_mini_plate();
/*
translate([-150,-14,0])rotate([0,180,-90])arduino_base_template();
translate([-200,54,0])rotate([0,180,90])arduino_mega_base_template();
*/
//back_plate_plug_rise();
//conveyer_stepper_linear_m8nut_coupler();
//translate([3.5,75,-15])conveyer_stepper_linear_m8nut_coupler_a();
//rotate([90,0,0])mirror([1,0,0])conveyer_stepper_linear_m8nut_coupler_b();

//slide_conveyer_motormount();
//conveyer_slider_spacer();
//endstop_for_linearactuator();
//translate([-15,-65-15,-20])linearactuator_filament_encodershuttle();
//left_outside_frame();
//zbed_smz();
//rotate([0,-90,0])z_encoder_clamp_wiper();
//rotate([0,180,0])z_encoder_clamp();
//XY_motor_x2higher();
//translate([77.5-45.2,20+3-13.7,5])rotate([0,0,0])
//rj45jack();
//color("red")translate([0,63,0])left_plate_x1();
//projection(cut = false){
//color("blue")right_plate_x1();
//simple_m8_smoothrodholder_for_z();
//projection(cut = false)
//color("blue")right_plate_x1();
//color("red")translate([0,63,0])left_plate_x1();
//color("green")translate([0,130,0])back_plate_x1();
//translate([0,193,0])front_plate_x1();
///}
// laser cut components
// laser_zbed(zz);
// slidedeck(zzh); (3 of them)
//right_plate_x1();
//left_plate_x1();
//back_plate_x1();
//front_plate_x1();
//bottom_x1();
//Extrusions
//gantry part
//HFS5-2020-400-TPW  - 4 of them
//HFS5-2020-400-TPW-XA10-XB390-YA10-YB390 - 2 of them
//HFS5-2020-360-TPW - 2 of them
//HFS5-2020-380-TPW-XA70-YA70 - 4 of them
//X encoder 
//HFS5-2020-385-TPW  - 1 of them
//X rail
//HFS5-2020-400-TPW  - 1 of them
//Y encoder 
//HFS5-2020-484-TPW  - 1 of them
//slide deck rail
//HFS5-2020-200-TPW  - 1 of them
//slide conveyer rail
//HFS5-2020-315-TPW  - 4 of them
//slide conveyer back motor rail ... not could be higher
//HFS5-2020-400-TPW  - 1 of them
//right_outside_frame
//HFS5-2020-400-TPW  - 3 of them
//HFS5-2020-484-TPW  - 2 of them
//left_outside_frame
//HFS5-2020-400-TPW  - 3 of them
//HFS5-2020-484-TPW  - 1 of them
//backside_frame();
//HFS5-2020-400-TPW  - 2 of them
//frontside_frame();
//HFS5-2020-400-TPW  - 2 of them
//zbed_smz_components()
//HFS5-2020-300-TPW  - 2 of them
//zbed_smz()
//HFS5-2020-348.5-TPW  - 2 of them


//wash_and_strobparts();

//rotate([0,90,0])tslot20innerbracketlonger_smfrnz_back();
//projection(cut = false)
//translate([0,100,0])XY_bearings_Left_x1();
//XY_bearings_Right_x1();
//projection(cut = false)
//translate([80,75,0])rotate([0,0,90])shuttle_front();
//shuttle_back();
//conveyer_stepper_linear_m8nut_coupler();
//rotate([0,180,0])wiper_clamp_yaxis();
//gantry();



//projection(cut = false)
//gantryhead_back_slider_x4();


//sandwich_sliderwheel_assy();
//gantryhead_back_slider_x4();
//translate([12.4,-1.7,-3])gantryhead_back_slider_x4();

//translate([-250,100,-200])rotate([0,90,0])cable_support_lid();
//translate([-200,0,0])rotate([0,90,0])cable_support();

//x_encoder_cableclip();
//translate([30,0,0])rotate([0,90,0])backextruder_clamp();
//jagged_armholder();
//steppermotorbrd_5steppers_5endstops_4solenoids_brd();
//translate([75,0,0])sst_sensing_liquidlevel_cap();

//airpo_d2028B_pump_mount_assy();
//rotate([0,90,0])lm8uu_smz_glider();
//rotate([0,180,0])wiper_clamp_yaxis();


//rotate([0,-90,0])motorclamp_filament_driver();
//conveyer_rail_on_bedsupport_shim();

/*
conveyer_hole_calib(6.1);
translate([31,0,0])conveyer_hole_calib(6.0);
translate([31,31,0])conveyer_hole_calib(5.9);
translate([0,31,0])conveyer_hole_calib(5.8);


*/

module wiper_tip_m5(ht){
//ht = 20;
difference(){
union(){
translate([0,0,ht])sphere(r=2);
translate([0,0,0])cylinder(r=10/2,ht);
}
translate([0,0,-2])cylinder(r=4.7/2,h=ht);
}
}






module wiper_tip(){
difference(){
union(){
translate([0,0,20])sphere(r=2);
translate([0,0,0])cylinder(r=10/2,20);
}
translate([0,0,-2])cylinder(r=6.2/2,h=10);
}
}



module endstop_z(){
difference(){
union(){
//import("files/endstop_y.stl");
translate([40+30-38,1.5,-0.0])cube([85-10+38,20,4]);
translate([40+30-38,1.5,-0.0])cube([18,28,4]);
//translate([40.9,12.5,0])rotate([0,0,45])cylinder(r=8.7/2,h=8,$fn=4);
}
translate([40.75+80,4.5,-0.2])cylinder(r=2.7/2,h=30,$fn=30);
translate([60.75+80,4.5,-0.2])cylinder(r=2.7/2,h=30,$fn=30);
translate([40.9,25,-0.2])cylinder(r=4.7/2,h=30);
translate([40.9,5,-0.2])cylinder(r=4.7/2,h=30);
translate([50.,12,-0.2])cube([120,20,20]);
}
}


module arduino_mega_base_template_bottomattach(){
difference(){union(){
arduino_mega_base_template();
translate([20,-22,0])cube([20,20,3]);
translate([20,100,0])cube([20,20,3]);
}
translate([10,5,-0.2])cube([35,85,3]);
translate([20+8,100+14.8,-0.2])cylinder(r=3.2/2,h=30);
translate([20+8,-22+7,0])cylinder(r=3.2/2,h=30);

}
}

module washer_for_conveyer(){
 difference(){
 cylinder(r=8.5/2,h=1);
 translate([0,0,-0.2])cylinder(r=5.7/2,h=3);
 }
}

module conveyer_hole_calib(diam){

translate([0,0,0])cube([30,30,3]);
translate([-106-4,102.5,0])rotate([0,0,-90]){
translate([175/2-8,240/2,0])cylinder(r=diam/2,h=5);
translate([175/2,240/2+10,0])cylinder(r=diam/2,h=5);
translate([175/2+8,240/2,0])cylinder(r=diam/2,h=5);
}

}



module gt2belt_holder(){

translate([0,-32,-55.5])rotate([0,-90,0])import("files/gt2belt_holder.stl");
translate([-12,-2,0])cube([12,2,8]);
}


module conveyer_rail_on_bedsupport_shim(){

//rotate([0,90,0])tslot20(200);
difference(){union(){
translate([70,6,-32])cube([20,18,7]);
translate([70,6+9-2.5,-32])cube([20,5,7+1.5]);
}
translate([70+10,6+9,-32-5])cylinder(r=5.7/2,h=16);
}
}

module conveyer_slider_spacer(){
difference(){
cylinder(r=9/2,h=5);
translate([0,0,-0.2])cylinder(r=5.7/2,h=8);
}
}

module bottom_conveyer_mount_clamp(){
//to straighten the rail
difference(){union(){
translate([26,-20,180])rotate([0,90,0])tslot20innerbracket();
translate([-1,0,0])cube([18,20,5]);
}
translate([7,-8+20,-0.2])cylinder(r=5.7/2,h=30);
}
}




module bed_leveler_better(){
difference(){
union(){
cube([25,15,6]);
translate([25-7.5,7.5,0])cylinder(r=15/2,h=11+5);
}
translate([5,7.5,-1])cylinder(r=4.7/2,h=20);
translate([25-7.5,7.5,6+5])cylinder(r=10/2,h=11);
translate([25-7.5,7.5,-1])cylinder(r=3/2,h=20);
translate([25-7.5,7.5,-0.1])cylinder(r=6.5/2,h=4);
}
}



module bed_leveler_better_lm8uu_for_metalversion(){
difference(){
color("silver")union(){
cube([35,15,6]);
cube([25+10+25+4-27,15,6]);
//translate([25-7.5,7.5,0])cylinder(r=15/2,h=11+5);
translate([35/2,7.5,0])cylinder(r=15/2,h=11+5);
}
translate([5,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5,7.5,-1])cylinder(r=3.8/2,h=20);
translate([5+25,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([35/2,7.5,6+5])cylinder(r=10/2,h=11);
translate([35/2,7.5,-1+0])cylinder(r=2.8/2,h=300);
translate([35/2,7.5,-0.1])cylinder(r=9.5/2,h=4);
/*
translate([5+53,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+52,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+51,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+50,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+49,7.5,-1-50])cylinder(r=3.8/2,h=200);
*/
}
//for display
translate([35/2,7.5,-1+0])color("silver")cylinder(r=2.8/2,h=40);
}




module bed_leveler_better_lm8uu(){
difference(){
union(){
cube([35,15,6]);
cube([25+10+25+4,15,6]);
//translate([25-7.5,7.5,0])cylinder(r=15/2,h=11+5);
translate([35/2,7.5,0])cylinder(r=15/2,h=11+5);
}
translate([5,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5,7.5,-1])cylinder(r=3.8/2,h=20);
translate([5+25,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([35/2,7.5,6+5])cylinder(r=10/2,h=11);
translate([35/2,7.5,-1+0])cylinder(r=2.8/2,h=300);
translate([35/2,7.5,-0.1])cylinder(r=9.5/2,h=4);
translate([5+53,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+52,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+51,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+50,7.5,-1-50])cylinder(r=3.8/2,h=200);
translate([5+49,7.5,-1-50])cylinder(r=3.8/2,h=200);
}
}





module m5bearing_washer(){
difference(){union(){
cylinder(r=(19+6)/2,h=2-0.5-0.3);
translate([0,0,0])cylinder(r=8/2,h=3.5-1.75+0.3);
}
translate([0,0,-1])cylinder(r=5.8/2,h=20);
}
}


module airpo_d2028B_pump_mount_assy(){
difference(){union(){
airpo_d2028B_pump_mount();
translate([50,0,0])airpo_d2028B_pump_mount();
translate([100,0,0])airpo_d2028B_pump_mount();
}
translate([47.5,3,0])cube([5,14,25]);
translate([47.5+50,3,0])cube([5,14,25]);
}
}
//sst_sensing_liquidlevel();
module airpo_d2028B_pump_mount(){
difference(){union(){
cube([50,20,20]);
cube([50,50-5,5]);
translate([15,-18,0])cube([20,18,5]);
}
translate([12,5,-0.1])cube([26,30,5.5]);
translate([0,-0.1,0])translate([(50-39)/2,0,5])cube([39,22,20]);
translate([4,40,-5])cylinder(r=4.7/2,h=10);
translate([50-4,40,-5])cylinder(r=4.7/2,h=10);
translate([25,-12,-5])cylinder(r=4.7/2,h=10);
}
}


module waterbottle_tubes(){
color("lightblue")translate([53+6.5,-56.5,-10+230])cylinder(r=6.5/2,h=20);
color("lightblue")translate([53+6.5-1.5,-56.5,-10+250])rotate([0,90,0])cylinder(r=6.5/2,h=20);
for(i=[0:100]){
color("lightblue")translate([53+6.5-1.5+20+i,-56.5,-10+250-i*1.5])sphere(6.5/2);
}


color("lightblue")translate([53+6.5-1.5+20+100,-56.5,-10+250-100*1.5])sphere(6.5/2);


for(i=[0:44]){
color("lightblue")translate([53+6.5-1.5+20+100+i,-56.5,-10+250-100*1.5])sphere(6.5/2);
}

for(i=[0:25]){
color("lightblue")translate([53+6.5-1.5+20+100+44,-56.5+i,-10+250-100*1.5-i/1.5])sphere(6.5/2);
}

for(i=[0:10]){
color("lightblue")translate([53+6.5-1.5+20+100+44,-56.5+25+i,-10+250-100*1.5-25/1.5])sphere(6.5/2);
}

for(i=[0:89]){
color("lightblue")translate([53+6.5-1.5+20+100+i,-56.5,-10+250-100*1.5])sphere(6.5/2);
}
for(i=[0:25]){
color("lightblue")translate([53+6.5-1.5+20+100+89,-56.5+i,-10+250-100*1.5-i/1.5])sphere(6.5/2);
}

for(i=[0:10]){
color("lightblue")translate([53+6.5-1.5+20+100+89,-56.5+25+i,-10+250-100*1.5-25/1.5])sphere(6.5/2);
}

}


module wastebottle_tubes(){

color("lightblue")translate([53+6.5,-56.5,-10+230])cylinder(r=6.5/2,h=20);
color("lightblue")translate([53+6.5-1.5,-56.5,-10+250])rotate([0,90,0])cylinder(r=6.5/2,h=20);
for(i=[0:110]){
color("lightblue")translate([53+6.5-1.5+20+i,-56.5-i,-10+250-i*1.5])sphere(6.5/2);
}

for(i=[0:202]){
color("lightblue")translate([53+6.5-1.5+20+110+i,-56.5-110,-10+250-110*1.5])sphere(6.5/2);
}

for(i=[0:143]){
color("lightblue")translate([53+6.5-1.5+20+110+202,-56.5-110+i,-10+250-110*1.5])sphere(6.5/2);
}



}

module bottle_cap(){
//tubing to pump
//color("lightblue")translate([53,-50,40])cylinder(r=3.2/2,h=15);
/*
for(i=[0:10]){
color("lightblue")translate([53+i,-50+i,60])sphere(3.25);
}
*/
color("black")translate([38,-30,-10])cylinder(r=9.8/2,h=50);
color("white")translate([53,-50,-10])cylinder(r=6.5/2,h=50);
color("white")translate([37,-38-15,-10])cylinder(r=6.5/2,h=50);
//color("white")translate([18,-38-10,-10])cylinder(r=6.5/2,h=50);
difference(){union(){
translate([38,-38,15])color("")cylinder(r=70/2,h=3);
color("lightblue")rotate([90,0,0])import("Cap.STL");
}
translate([38,-30,-10])cylinder(r=9.8/2,h=29);
translate([53,-50,-10])cylinder(r=6.5/2,h=29);
translate([37,-38-15,-10])cylinder(r=6.5/2,h=29);
//translate([18,-38-10,-10])cylinder(r=6.5/2,h=29);
translate([38+23,-28,-10])cylinder(r=3/2,h=29);
translate([38-10,-38-20,-10])cylinder(r=3/2,h=29);
translate([38-22,-38+10,-10])cylinder(r=3/2,h=29);
}
}








module waterbottle(){
 //translate([40+5,-42,80])color("")pressurecompensation_bottle();
 translate([6.5,-6.5,185])bottle_cap();
 color("lightblue")rotate([90,0,0])import("Bottle.STL");
}


module nalgene_bottle_assy_electrocaloric(){
 translate([40+5,-42,80])color("")pressurecompensation_bottle();
 translate([6.5,-6.5,185])nalgene_cap_for_electrocaloric();
 color("lightblue")rotate([90,0,0])import("Bottle.STL");
 translate([6.5,-6.5,185])bottle_cap();
}


module nalgene_cap_for_electrocaloric(){
//tubing to pump
//color("lightblue")translate([53,-50,40])cylinder(r=3.2/2,h=15);
/*
for(i=[0:10]){
color("lightblue")translate([53+i,-50+i,60])sphere(3.25);
}
color("black")translate([38,-30,-10])cylinder(r=9.8/2,h=50);
color("white")translate([53,-50,-10])cylinder(r=6.5/2,h=50);
color("white")translate([37,-38-15,-10])cylinder(r=6.5/2,h=50);
color("white")translate([18,-38-10,-10])cylinder(r=6.5/2,h=50);
*/

difference(){union(){
//translate([38,-38,15])color("")cylinder(r=70/2,h=3);
translate([38,-38,15])color("")cylinder(r=64/2,h=3);
//color("lightblue")rotate([90,0,0])import("Cap.STL");
}
translate([38,-30,-10])cylinder(r=9.8/2,h=29);
translate([53,-50,-10])cylinder(r=6.5/2,h=29);
translate([37,-38-15,-10])cylinder(r=6.5/2,h=29);
translate([18,-38-10,-10])cylinder(r=6.5/2,h=29);
translate([38+23,-28,-10])cylinder(r=3/2,h=29);
translate([38-10,-38-20,-10])cylinder(r=3/2,h=29);
translate([38-22,-38+10,-10])cylinder(r=3/2,h=29);
}
}



module nalgene_cap_for_sst_liquidlevel(){
difference(){union(){
translate([38,-38,15])cylinder(r=70/2,h=3);
rotate([90,0,0])import("/Users/richard/Documents/009Reprapcatcube010715/cap.STL");
}
translate([38,-30,-10])cylinder(r=29.6/2,h=50);
translate([53,-50,-10])cylinder(r=6.5/2,h=50);
translate([37,-38-15,-10])cylinder(r=6.5/2,h=50);
translate([18,-38-10,-10])cylinder(r=6.5/2,h=50);
translate([38+23,-28,-10])cylinder(r=3/2,h=50);
translate([38-10,-38-20,-10])cylinder(r=3/2,h=50);
translate([38-22,-38+10,-10])cylinder(r=3/2,h=50);
}
}






module sst_sensing_liquidlevel_cap(){
 difference(){
 cylinder(r=(23+6+6)/2,h=3);
 for(i=[0:5]){
 translate([0,i-3,-0.1])cylinder(r=(2)/2,h=15);
 }
 }
 difference(){
 cylinder(r=(23+6+6)/2,h=6);
 translate([0,0,-0.1])cylinder(r=(23+7)/2,h=15);
 }
}
module sst_sensing_liquidlevel(){
//sparkfun sst sensing
 difference(){
 cylinder(r=(23+6)/2,h=15+70);
 translate([0,0,-0.1])cylinder(r=13/2,h=10+1000);
 translate([0,0,5])cylinder(r=23/2,h=1000,$fn=6);
 }
}








//47,53
//This is probably is deprecated
module steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids(x,y){
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}



//kill_signal_mosfet_brd(33,28);
module kill_button_leds_panelmount(){
kill_button_led_indicator_brd(58,35);
color("gray")kill_button_led_indicator_brd_cutout(58,35);
}


//9pinconnector_for_softpot(42,37);
//95,32
module highcurrent_power_mosfet_wash_dry_pcv_fan(x,y){
//x = 47;
//y = 52;
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}



module 9pinconnector_for_softpot(x,y){
//x = 47;
//y = 52;
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,8]);
translate([-4,-4,2])cube([x+4,y+4,8]);
}
translate([-4,-4,0])cube([x+4,y+4,5]);
translate([14,4,0])cube([x+4,20,3]);
}
translate([0,0,2])cube([x-4,y-4,8]);
translate([52,14,0])cylinder(r=4.7/2,h=20);
}
}






//softpot_linearencoder_16bitadc_brd_assy();
module softpot_linearencoder_16bitadc_brd_assy(){
//translate([34,20,16])scale([0.1, 0.1, 0.01])rotate([0,0,90])color("green")
//surface(file = "electronics/softpot_linearencoder_16bitadc_4_pcb.png", center = true);
translate([0,0,10])softpot_linearencoder_16bitadc_brd(64,42);
}


module softpot_linearencoder_16bitadc_brd(x,y){
//x = 47;
//y = 52;
//color("green")translate([-4,-4,3])cube([x+4,y+4,1]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}

module conveyer_endstop_brd(x,y){
//translate([-4,-4,5])color("green")cube([x+4,y+4,3]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
difference(){
translate([7,17,0])cube([20,17,3]);
translate([7+10,17+19/2,-1])cylinder(r=4.7/2,h=20);
}
}

module kill_signal_mosfet_brd(x,y){
//x = 47;
//y = 52;
//translate([-4,-4,5])color("green")cube([x+4,y+4,3]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}


module kill_button_led_indicator_brd_cutout(x,y){
translate([1,1,0])difference(){
union(){
translate([-13,-13+2,-3])cube([x+20,y+20-1,6]);
translate([-28,5-10,-3])cube([20,20+20,6]);
translate([62,5-10,-3])cube([20,20+20,6]);
}
translate([-20,15-15,-5])cylinder(r=2.8/2,h=120);
translate([-20,15+15,-5])cylinder(r=2.8/2,h=120);
translate([74,15-15,-5])cylinder(r=2.8/2,h=120);
translate([74,15+15,-5])cylinder(r=2.8/2,h=120);
//translate([-8,-8,-3.1])cube([x+10,y+10,7]);
translate([-7,-7,-3.1])cube([x+8,y+8,7]);
}
}

module kill_button_led_indicator_brd(x,y){
//x = 47;
//y = 52;
//kill_button_led_indicator_brd(58,35);
//for display
/*
translate([x-25.5+16/2+2,y-21+14/2,-5])color("red")cylinder(r=9/2,h=10);
translate([x-25.5+16/2-19+2,y-21+14/2+2,-5])color("red")cylinder(r=5.5/2,h=10);
translate([x-25.5+16/2-19-17.5+2,y-21+14/2+2,-5])color("lightgreen")cylinder(r=5.5/2,h=10);
*/
//end for display

difference(){
union(){
color("gray")translate([-6,-6,-3])cube([x+8,y+8,6]);
//color("blue")translate([-4-(4.96/2),-4+(11.09/2),-3])cube([62,39,16]);
}
/*
translate([4-4.96,-4.2+11.09,0]){
color("blue")translate([-4+56.72,-4+31.12,-13])cylinder(r=4.7/2,h=30);
color("blue")translate([-4+5.91,-4+31.12,-13])cylinder(r=4.7/2,h=30);
color("blue")translate([-4+5.91,-4+5.18,-13])cylinder(r=4.7/2,h=30);
color("blue")translate([-4+57.94,-4+5.94,-13])cylinder(r=4.7/2,h=30);
}*/

translate([x-25.5+2,y-21,-1])cube([16,14,4.5]);
translate([x-25.5+16/2+2,y-21+14/2,-3])cylinder(r=9/2,h=10);
translate([x-25.5+16/2-19+2,y-21+14/2+2,-3])cylinder(r=5.5/2,h=10);
translate([x-25.5+16/2-19-17.5+2,y-21+14/2+2,-3])cylinder(r=5.5/2,h=10);
translate([0,0,-1.5])cube([x-4,y-4-21,8]);
translate([0,0,-1.5])cube([x-4-25,y-4-15,8]);
translate([0,0+25,-1.5])cube([x-4-25,y-4-25,8]);
translate([-4+5,-4-10,1])cube([x+4-10,y+4,7]);
}
difference(){
union(){
difference(){
translate([-6+0.3,-6+0.1,0])cube([x+8-0.6,y+8-0.2,8]);
translate([-4,-4,4.5])cube([x+4,y+4,7]);
translate([-4+5,-4-10,0])cube([x+4-10,y+4,9]);
}
difference(){
translate([-4,-4,0])cube([x+4,y+4,3]);
translate([-4+5,-4-10,1])cube([x+4-10,y+4,7]);
}
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}








module steppermotorbrd_5steppers_5endstops_4solenoids_brd(){
translate([54,-5,0])5steppers_5endstops_4solenoids_brd(47,52);
steppermotordriver_brd();
}
module 5steppers_5endstops_4solenoids_brd(x,y){
//x = 47;
//y = 52;
difference(){
union(){
difference(){
translate([-6,-6,0])cube([x+8,y+8,6]);
translate([-4,-4,0])cube([x+4,y+4,7]);
}
translate([-4,-4,0])cube([x+4,y+4,3]);
}
translate([0,0,-0.2])cube([x-4,y-4,8]);
}
}





module steppermotordriver_brd(){
//translate([-4,-4,5])color("green")cube([46+4,45+4,3]);
difference(){
union(){
difference(){
translate([-6,-6,0])cube([56+8,58+8,6]);
translate([-4,-4,0])cube([56+4,58+4,7]);
}
translate([-4,-4,0])cube([56+4,58+4,3]);
}
translate([0,0,-0.2])cube([56-4,58-4,8]);
}
}

module conveyer_solenoid_pcb(){

translate([-2-3,-2,5])color("green")cube([28,37,3]);

translate([-3,0,0])difference(){
union(){
difference(){
translate([-4,-4,0.1])cube([32,41,5]);
translate([-2,-2,0.1])cube([28,37,6]);
}
translate([-2,-2,0.1])cube([28,37,3]);
translate([32/2+10,7,0.1])cube([20,20,3]);
}
cube([24,33,10]);
translate([37.5,16.5,-0])cylinder(r=4.7/2,h=12);
}

}


module slidedeck_adjust_wheel_larger(){
//for leveling bed works with bed level 
difference(){
cylinder(r=10,h=3);
//cylinder(r=10,h=5);
translate([0,0,0]){cylinder(r=2.8/2,h=80);}
//translate([0,0,2])cylinder(r=6.0/2,h=3.5,$fn=6);}
}
}






module slidedeck_adjust_wheel(){
//for leveling bed works with bed level 
difference(){
//cylinder(r=10,h=5);
cylinder(r=5,h=5);
translate([0,0,0]){cylinder(r=2.8/2,h=80);}
//translate([0,0,2])cylinder(r=6.0/2,h=3.5,$fn=6);}
}
}




module cables_wall(){
//translate([0,-6,30])rotate([0,90,0])tslot20(200);
difference(){
union(){
cube([30,40,5]);
translate([18,9-5.5/2,0])cube([8,5.5,9]);
}
translate([8,9,-0.1])cylinder(r=5.7/2,h=10);
//translate([30-8,9,-0.1])cylinder(r=5.7/2,h=10);
}
}


module x_encoder_cableclip(){
//translate([0,-5,30])rotate([0,90,0])tslot20(100);

difference(){
cube([18,20,4]);
translate([9,10,-0.1])cylinder(r=4.7/2,h=10);
}
}

module cable_support_lid(){

difference(){
translate([-40,15-10,200-10])
union(){
cube([5,20,43]);
translate([0,20,15])cube([5,75,10]);
}
translate([-40,15,200-4])rotate([0,90,0])cylinder(r=3.2/2,h=40);
translate([-40,15,200-4+32])rotate([0,90,0])cylinder(r=3.2/2,h=40);
}
}


module cable_support(){
//tslot20(300);
difference(){
union(){
translate([-175,3,200])rotate([0,0,0])tslot20innerbracket();
translate([-15,5,200-8])cube([30-10,20,40]);
translate([0,5,200-8-40+5])cube([5,20,20]);
}
translate([-23,5,200-8])
translate([12,25,20])rotate([90,90,0])cylinder(r=25/2,h=30);
translate([-35,5-1,200-3-10])cube([30-10,30,30]);
translate([-40,15,200-19-17])rotate([0,90,0])cylinder(r=5.7/2,h=300);
translate([-40,15,200-4])rotate([0,90,0])cylinder(r=2.8/2,h=40);
translate([-40,15,200-4+32])rotate([0,90,0])cylinder(r=2.8/2,h=40);
}
}


//encoder_ribboncable();
module encoder_ribboncable(){
9pinconnector_for_softpot(42,37);
/*
//translate([0,-40+4,30])rotate([0,90,0])tslot20(300);
//color("green")cube([36+4,41+4,6]);
difference(){
union(){
cube([36+4,41+4,3]);
translate([10,-35+4,0])cube([20,30,5]);
difference(){
translate([-2,-2,0])cube([36+8,41+8,5]);
cube([36+4,41+4,6]);
}
}
translate([4,4,-0.1])cube([36-4,41-4,5]);
translate([10+10,-35+4+10,0]){translate([0,0,0])cylinder(r=5.7/2,h=10);}
}
*/
}
module pololu_screw_nobacklash_cap(){
difference(){
union(){
cylinder(r=31/2,h=3);
translate([0,0,2])cylinder(r=22.6/2,h=3);
}
translate([0,0,-0.2])cylinder(r=10.9/2,h=25);
}
}




module pololu_screw_nobacklash(){
difference(){
cylinder(r=31/2,h=23);
translate([0,0,5])cylinder(r1=23/2,r2=22.5/2,h=19);
translate([0,0,5+10])cylinder(r=22.5/2,h=19);
translate([0,0,-0.2])cylinder(r=11.5/2,h=25);
translate([0,0,-0.2])cylinder(r=8.7/2,h=205);
translate([0,-8,-0.2])cylinder(r=3.5/2,h=25);
translate([0,8,-0.2])cylinder(r=3.5/2,h=25);
translate([-8,0,-0.2])cylinder(r=3.5/2,h=25);
translate([8,0,-0.2])cylinder(r=3.5/2,h=25);
}
}

module slidedeck_components(zzh){
translate([0,295,5])translate([83-10,25-15+5,zzh])
difference(){
union(){
//color("")cube([175,240,3]);
translate([175-10,210+10-20,-0])cube([10,60,5]);
}
translate([175-10+5,210+10-10,-4])cylinder(r=3.2/2,h=20);
translate([175-10+5,210+10+12,-4])cylinder(r=3.2/2,h=20);
translate([175-10,0,-0.1])cube([10,20,10]);
}
//slides
translate([0,295,10]){
for(y=[0]){for(i=[0:5]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
for(y=[1]){for(i=[0:5]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
for(y=[2]){for(i=[0:5]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
}
}



module solenoid_connector(zzh){
translate([0-17+10,295,5])translate([83-10,25-15+5,zzh]){
difference(){union(){
translate([180+5,240-16+15,3])cube([10,22,3]);
translate([180+5,240+20,1])cube([10,50-7-20,5]);
}
translate([180-10+20.4,240-16+10+10,-33])cylinder(r=3.5/2,h=200);
translate([180-10+20.4,240-16+10+20,-33])cylinder(r=3.5/2,h=200);
translate([180-10+20.4,240-16+55.5-7,-33])cylinder(r=4.5/2,h=200);
}
}

}


//cube([20,20,5]);
//SLIDEDECK CHANGED
module solenoid_flag(){

difference(){union(){
translate([2.5,0,0])cube([13-2.9,15+4,3]);
translate([-5+7.5,10+3+3+3,0])cube([16+5-3.4-10+2,10+3-3-3-3,3]);
translate([-5+7.5,10+7+3,-2])cube([16+5-3.4-10+2,3,2]);
}
translate([7.25,4,-1]){cylinder(r=3.2/2,h=10);}//translate([0,0,0])cylinder(r=6.8/2,h=3,$fn=6);}
translate([7.25,4+10,-1]){cylinder(r=3.2/2,h=10);}//translate([0,0,0])cylinder(r=6.8/2,h=3,$fn=6);}
}
}
module slidedeck(zzh){
//color("lightgrey")translate([0-20+252+20-3,495+25+30,zzh+2])solenoid_flag();
/*
translate([0-20,295,5])translate([83-10,25-15+5,zzh]){
translate([60,70+10,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
translate([60,170+10,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
translate([60+135,70+10,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
translate([60+135,170+10,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
}
*/
//slidedeck_components(zzh);
//translate([0-20,295+10+5,5])translate([83-10,25-15+5-12,zzh])translate([-19,20,4])rotate([0,0,0])color("red")cube([214,214,3]);
//translate([0+10-25,295+10,5])translate([83-10,25-15+5-12,zzh])translate([-19,20,4])rotate([0,0,0])color("red")cube([300,200,3]);
//SCSD1
//slides
/*
translate([-5-16,295,10]){
for(y=[0]){for(i=[-1,0,1,2,3,4,5,6,8,9]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
for(y=[1]){for(i=[-1:9]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
for(y=[2]){for(i=[-1:9]){translate([83+(i*26),25+(y*76),zzh])cube([25,75,1]);}}
}
*/
//color("grey")solenoid_connector(zzh);

translate([0-17,295,5])translate([83-10,25-15+5,zzh])
difference(){
union(){
translate([-39/2-25+20,0,0])color([191/255,191/255,191/255])rotate([0,0,0])cube([293,240,3]);
translate([-39/2-25+20+200+10+10,240,0])color([191/255,191/255,191/255])rotate([0,0,0])cube([10,20,3]);

//color("")rotate([0,0,0])cube([175,240,3]);
//translate([90,70,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
//translate([90,170+10,4])rotate([0,0,0])import("96_microwell_plate.STL.stl");
//translate([175-10,210+10-20,-0])cube([10,60,5]);
//translate([175-10+5,210+10-10,-4])cube([])cylinder(r=3.7/2,h=20);
}
translate([180-10+20.4+10,240-16+10+10,-33])cylinder(r=3.7/2,h=200);
translate([180-10+20.4+10,240-16+10+20,-33])cylinder(r=3.7/2,h=200);


translate([-25+3,0,0]){
translate([175-10+5,210+10-10,-4])cylinder(r=2.8/2,h=20);
translate([175-10+5,210+10+12,-4])cylinder(r=2.8/2,h=20);
//translate([175-72+102,-0.1,-0.1])cube([15,40,10]);
translate([175-72+102+10.5,-0.1+220-220,-0.1])cube([13,30,10]);
translate([25+17,1,0]){
translate([175/2-8,240/2,-4])cylinder(r=6.2/2,h=20);
translate([175/2,240/2+10,-4])cylinder(r=6.2/2,h=20);
translate([175/2+8,240/2,-4])cylinder(r=6.2/2,h=20);

//there are the tapped holes
translate([175/2,240/2-10,-4])cylinder(r=2.8/2,h=20);
translate([175/2-8,240/2-10+20,-4])cylinder(r=2.8/2,h=20);
translate([175/2+8,240/2-10+20,-4])cylinder(r=2.8/2,h=20);
}
translate([-4+18,-40+16,0]){
translate([-12,50,0])cylinder(r=2.8/2,h=200);
translate([-12+209,50,0])cylinder(r=2.8/2,h=200);
translate([-12,50+209,0])cylinder(r=2.8/2,h=200);
translate([-12+209,50+209,0])cylinder(r=2.8/2,h=200);
}
translate([-12,6,-4]){
//for(i=[0:3]){translate([50*i,0,0])cylinder(r=3.5/2,h=20);}
for(i=[1:5]){translate([50*i,210,0])cylinder(r=2.8/2,h=20);}
for(i=[0,1,2,4,5,6]){translate([50*i,120,0])cylinder(r=2.8/2,h=20);}
for(i=[1,2,3,4,5]){translate([50*i,0+20,0])cylinder(r=2.8/2,h=20);}
//for(i=[0:4]){translate([0,50*i,0])cylinder(r=3.5/2,h=20);}
for(i=[0:4]){translate([200+100-300+13,50*i,0])cylinder(r=2.8/2,h=20);}
for(i=[0:4]){translate([200+100,50*i,0])cylinder(r=2.8/2,h=20);}
}
}
}
}


/*
projection(cut = false){
gantryhead_back_slider_x4();
}
*/


module gantryhead_back_slider_x4(){
//projection(cut = false){
//slider_x4();
slider_x4();
difference(){
translate([-32,45,0.0])color("silver")cube([54,30-3.5,4.5]);
translate([10.5,64.,-10])cylinder(r=(5.7+0.8)/2,h=20);
translate([-19.5,64,-10])cylinder(r=(5.7+0.8)/2,h=20);
}
//}
}

//thinnermotormount();
//projection(cut = false)slider_x4();
//filament_linearactuator();

/*
smaller_igus_slidermount();
wiper_clamp();
*/
//cordclamp();


//rotate([0,90,0])tslot20innerbracketlonger();
//import("/Users/richard/Documents/009Reprapcatcube010715/igus_sliders/TW_04_09_4.stl");
//filament_linearactuator();


//dxffiles/XY_bearings_Left__x1.dxf

//linear_extrude(height = 20)
//import(“slider2.dxf”);

//surface(file="slider.png", invert=true);
//linear_extrude(height = 20, center = true, convexity = 10,twist=10)
//import(“dxffiles/back_test.dxf”);
//scale([0.2822,0.2822,0.2822])surface(file="pngfiles/path3401.png",invert=true); 
//translate([])cube([]);

//nema17();

//translate([-42.3/2,-42.3/2,-34])
//shorternema17();




module shorternema17(){

translate([-42.3/2,-42.3/2,-34])difference(){union(){
color("black")cube([42.3,42.3,34]);
translate([42.3/2,42.3/2,34])color("silver")cylinder(r=11,h=2);
translate([42.3/2,42.3/2,34])color("silver")cylinder(r=5/2,h=22);
translate([42.3/2,42.3/2,34])color("silver")cylinder(r=10/2,h=22);
}
translate([5.5,5.5,24])color("white"){
cylinder(r=3.7/2,h=20);
translate([31,0,0])cylinder(r=3.7/2,h=20);
translate([31,31,0])cylinder(r=3.7/2,h=20);
translate([0,31,0])cylinder(r=3.7/2,h=20);
}
}
}
//slider_back_assy();
//simple_m8_smoothrodholder_for_z();

//rotate([90,0,0])conveyer_stepper_linear_m8nut_coupler();

//sandwich_sliderwheel_assy();

//slider_x4();

/*
projection(cut = false)
hole_calibration();
*/

//projection(cut = false)slider_x4();

module hole_calibration(){


difference(){
cube([20,20,2]);
//translate([5,10,-2])cylinder(r=5.7/2,h=20);
translate([10,10,-2])cylinder(r=(5.7+0.8)/2,h=20);
//translate([25,10,-2])cylinder(r=(5.7+1)/2,h=20);
}

}

//valve_assy();
//translate([10,7,5-1.5])valvesupport();

module sliderwheel_assy(){
//translate([-40,3.5,4])rotate([0,90,0])tslot20(200);
translate([0,0,-0])slider_x4();

translate([0,-3,-20]){
delrinwheel();
}

translate([-24.5-1.5,-3+42,-20]){
  delrinwheel();
  color("silver")translate([0,0,15])cylinder(r=(5.7)/2,h=25);
  color("silver")translate([0,0,30])cylinder(r=(13)/2,h=5);
  color("black")translate([0,0,30])cylinder(r=(13+8)/2,h=5);
  color("silver")translate([0,0,30])cylinder(r=(17)/2,h=1);
  color("silver")translate([0,0,35])cylinder(r=(17)/2,h=1);
}
translate([24.5+1.5,-3+42,-20]){
 delrinwheel();
  color("silver")translate([0,0,15])cylinder(r=(5.7)/2,h=25);
  color("silver")translate([0,0,30])cylinder(r=(13)/2,h=5);
  color("black")translate([0,0,30])cylinder(r=(13+8)/2,h=5);
  color("silver")translate([0,0,30])cylinder(r=(17)/2,h=1);
  color("silver")translate([0,0,35])cylinder(r=(17)/2,h=1);
}
}

module sandwich_sliderwheel_assy(){
/*
translate([-40,3.5,4])rotate([0,90,0])tslot20(200);
*/
slider_x4();
translate([0,-3,-10.3-6])sandwich_delrinwheel();
translate([-25-1,-3+42,-16.3])sandwich_delrinwheel();
translate([25+1,-3+42,-16.3])sandwich_delrinwheel();
//translate([0,0,-16.3-3.3-6])mirror([1,0,0])gantryhead_back_slider_x4();
//translate([0,0,-25.6+25.6-5])mirror([1,0,0])gantryhead_back_slider_x4();
//slider_x4();
}


module sandwich_sliderwheel_assy_iverntech(){
/*
translate([-40,3.5,4])rotate([0,90,0])tslot20(200);
*/
//slider_x4();
translate([0,-3,-10.3-6])sandwich_delrinwheel();
translate([-25-1,-3+42,-16.3])sandwich_delrinwheel();
translate([25+1,-3+42,-16.3])sandwich_delrinwheel();
//translate([0,0,-16.3-3.3-6])mirror([1,0,0])gantryhead_back_slider_x4();
//translate([0,0,-25.6+25.6-5])mirror([1,0,0])gantryhead_back_slider_x4();
//slider_x4();
}



module conveyer_sliderwheel_assy(){
//translate([-40,3.5,4])rotate([0,90,0])tslot20(200);
translate([10,0,0])union(){
conveyer_slider_x4();
//slider_x4();
translate([0-24.5,-3,-20])color("")delrinwheel();
translate([0+24.5,-3,-20])color("")delrinwheel();
translate([-24.5,-3+42,-20])color("")delrinwheel();
translate([24.5,-3+42,-20])color("")delrinwheel();
}
}




module slide_conveyer_motormount(){

translate([-21,-40,19])motormountthin();
translate([-60,-10,0.5])difference(){
//color("lightgrey")
cube([40,25,5]);
translate([10,4,0]){translate([0,0,1])cylinder(r=4.7/2,h=10);translate([0,0,-2])cylinder(r=9.7/2,h=3);}
translate([10,21,0]){translate([0,0,1])cylinder(r=4.7/2,h=10);translate([0,0,-2])cylinder(r=9.7/2,h=3);}
}
}

//conveyer_slider_x4();


/*
difference(){
translate([175/2-8-12,240/2-13,0])cube([40,40,3]);
translate([175/2-8,240/2,0])cylinder(r=6.2/2,h=8);
translate([175/2,240/2+10,0])cylinder(r=6.2/2,h=8);
translate([175/2+8,240/2,0])cylinder(r=6.2/2,h=8);
}
*/

//lasermount_assy();
//total gantry view
tcl = [155/255,155/255,155/255];
thcl = [155/255,155/255,155/255];
//tcl = [200,200,200,0.8];
//thcl = [200,200,200,0.8];
//gantry_assy(20,-30,-45+50+100-50-100+150,-55,0,267,tcl,thcl);

//bottom_simple_m8_smoothrodholder_for_z();

//module gantry_assy(x,y,z,xx,xp,sph){


// just the conveyer part to show assembly
/*
z = -5;
translate([-45,0,z]){
zbed_smz();
wash_and_strobparts();
translate([145+25+25,315-65,172])rotate([90,90,0])tslot20(200);
}
 xx = 200-248+246-0;
 xp = 1;
 sph = 267;
 i = 1;
translate([145+30+25-50,560,-65])tslot20(400);
 slide_conveyer(xx-255,117+(i*50),0,z,sph);
*/


//working on this right now
module slide_conveyer(xx,zh,fl,z,sph){
translate([177.5+33+5,315+231+35,zh-15])rotate([90,0,0]){
color("lightgrey")translate([-36.25+0.5,5+36,16+14])rotate([90,0,-90])endstop_for_conveyer();
translate([0,0,-10]){
color("black")shorternema17();
color("lightgrey")slide_conveyer_motormount();
}
color("lightgrey")cylinder(r=8.7/2,h=263+50);
translate([0,0,-4])color("lightgrey")cylinder(r=18/2,h=25);
color("lightgrey")
translate([0,0,260+66])rotate([0,180,0])conveyer_verticallinearpulleybearingbottom();
}
echo(zh);
translate([145+5,315+201+50,zh]){
translate([5+20,-40+40,-5-20])rotate([-90,90,90])color("lightgrey")adafruit_lplate_1259();
//adafruit_lplate_1218();
rotate([90,90,0])tslot20(315);
}
translate([177.5+30+5,315+231+35+xx+25,zh-15])rotate([90,0,0]){
//color("pink")
translate([-38.15+3,-22.5-0,-130+65+0+7])mirror([1,0,0])rotate([-90,0,0])conveyer_stepper_linear_m8nut_coupler();
}
translate([0,xx,0]){
if (fl==1){
translate([177.5+5,315+101+10,sph-160+160])rotate([0,0,90])color("lightgrey")conveyer_sliderwheel_assy();
}
else {
translate([177.5+5,315+101+10,zh])rotate([0,0,90])color("")conveyer_sliderwheel_assy();
}
if (fl==1){
translate([0,0,sph-0.2-160+160]){
 slidedeck(3);
}
}
else{
translate([0,0,0.2])slidedeck(zh+3);
}
}
}

module openmv_camera_mnt_zbed(){
difference(){
union(){
translate([110-45-15,103.5+16.5-16,110+37])cube([115,22,5]);
translate([110,103.5+16.5,110])cube([30,6,40]);
}
translate([60,109,80])cylinder(r=3.8/2,h=200);
translate([60+100,109,80])cylinder(r=3.8/2,h=200);
for(i=[-3:14]){
translate([60+60+i,159,80+35])rotate([90,0,0])cylinder(r=4.7/2,h=200);
}
for(i=[0:4]){
translate([60+16+i,109+7-3,80])cylinder(r=4.7/2,h=200);
translate([60+16+i+13,109+7-3,80])cylinder(r=4.7/2,h=200);
translate([60+16+i+26,109+7-3,80])cylinder(r=4.7/2,h=200);
translate([60+16+i+39,109+7-3,80])cylinder(r=4.7/2,h=200);
translate([60+16+i+52,109+7-3,80])cylinder(r=4.7/2,h=200);
}
}
}


module wash_and_strobparts(){
color("grey")openmv_camera_mnt_zbed();
color("silver"){
laser_zbed_support_strobend();
translate([219,-0,282])rotate([0,180,0])laser_zbed_support_strobend();
translate([8,387,282])rotate([0,180,180])laser_zbed_support_strobend();
translate([219-50+263,387,0])rotate([0,0,180])laser_zbed_support_strobend();
}
translate([370,50,155])rotate([0,0,-90]){
//translate([220-5-200-70-5-5+37+1,25+1.5+5-330+9,-10-2-12])rotate([0,0,90])color([230/255,230/255,230/255])stroboscope_assy();
translate([0,-360,-95])rotate([90,-0,-90])openmv_nice_assy_stroboscope();
translate([160-285,20-35,-3])rotate([0,180,90])
//color("pink")
washbowl_assy();
translate([52-22-60-5,67-140+10,-10])rotate([0,0,90])color("grey")import("96_microwell_plate.STL.stl");
color("darkgrey")
microwell_plate_guide();
}
}

//washbowl_assy();

module washbowl_assy(){
//washbowl_shim();
color("darkgrey")washbowl_watervacinput();
color("darkgrey")translate([0,0,1])rotate([0,0,180])drypad();
color("darkgrey")translate([0,3,0])washbowl_1tip();
}


//washbowl_drypad();

module XY_motor_x2(){
translate([-50,0,400])scale([0.65,0.66,1])difference(){
union(){
color("silver")cube([63.84,94.32,3.3]);
}
translate([40,0,-0.2])rotate([0,0,-30])cube([63.84-20,94.32,13.5]);
translate([62.8/2,64.32,-0.1])cylinder(r=34.8/2,h=30);
translate([7.38,40.82,-0.1])cylinder(r=4.92/2,h=30);
translate([54.88,87.52,-0.1])cylinder(r=4.92/2,h=30);
translate([7.68,15.2,-0.1])cylinder(r=6.36/2,h=30);
translate([41.04,15.2,-0.1])cylinder(r=6.36/2,h=30);
}
translate([-32+3-0.6,35+2+5.5-0.2,400])nema17();
}


module XY_motor_x2higher(){

//bearings stuff
translate([-50,0,400])translate([(62.8/2*0.65),(64.32*0.65),-15]){
  color("silver")translate([0,0,15])cylinder(r=(5.7)/2,h=25);
  color("silver")translate([0,0,30])cylinder(r=(13)/2,h=5);
  translate([0,0,30])color("black")cylinder(r=(13+8)/2,h=5);
  color("silver")translate([0,0,30])cylinder(r=(17)/2,h=1);
  color("silver")translate([0,0,35])cylinder(r=(17)/2,h=1);
}
/*
*/
translate([-50,0,400])scale([0.65,0.66,1])difference(){
union(){
color("silver")cube([63.84,94.32,3.3+5-3.3]);
}
translate([40,0,-0.2])rotate([0,0,-30])cube([63.84-20,94.32,13.5]);
translate([62.8/2,64.32,-0.1])cylinder(r=35.8/2,h=30);
translate([7.38,40.82,-0.1])cylinder(r=4.92/2,h=30);
//translate([7.38,40.82,3.3])cylinder(r=11/2,h=5);


translate([54.88,87.52,-0.1])cylinder(r=4.92/2,h=30);
//translate([54.88,87.52,3.3])cylinder(r=11/2,h=5);
translate([7.68,15.2,-0.1])cylinder(r=6.36/2,h=30);
//translate([7.68,15.2,3.3])cylinder(r=13.84/2,h=5);
translate([41.04,15.2,-0.1])cylinder(r=6.36/2,h=30);
//translate([41.04,15.2,3.3])cylinder(r=13.84/2,h=5);
}
//nema motor for display xy
translate([-32+3-0.6,35+2+5.5-0.2,400])nema17();
}


module XY_motor_x2higher_3dprint(){
//bearings stuff
/*
translate([-50,0,400])translate([(62.8/2*0.65),(64.32*0.65),-15]){
  color("silver")translate([0,0,15])cylinder(r=(5.7)/2,h=25);
  color("silver")translate([0,0,30])cylinder(r=(13)/2,h=5);
  translate([0,0,30])color("black")cylinder(r=(13+8)/2,h=5);
  color("silver")translate([0,0,30])cylinder(r=(17)/2,h=1);
  color("silver")translate([0,0,35])cylinder(r=(17)/2,h=1);
}
*/
translate([-50,0,400])scale([0.65,0.66,1])difference(){
union(){
color("silver")cube([63.84,94.32,3.3+5]);
//color("silver")cube([63.84,94.32,3.3+5-3.3]);
}
translate([40,0,-0.2])rotate([0,0,-30])cube([63.84-20,94.32,13.5]);
translate([62.8/2,64.32,-0.1])cylinder(r=35.8/2,h=30);
translate([7.38,40.82,-0.1])cylinder(r=4.92/2,h=30);
translate([7.38,40.82,3.3])cylinder(r=11/2,h=5);
translate([54.88,87.52,-0.1])cylinder(r=4.92/2,h=30);
translate([54.88,87.52,3.3])cylinder(r=11/2,h=5);
translate([7.68,15.2,-0.1])cylinder(r=6.36/2,h=30);
translate([7.68,15.2,3.3])cylinder(r=13.84/2,h=5);
translate([41.04,15.2,-0.1])cylinder(r=6.36/2,h=30);
translate([41.04,15.2,3.3])cylinder(r=13.84/2,h=5);
}
//nema motor for display xy
//translate([-32+3-0.6,35+2+5.5-0.2,400])nema17();
}











module y_encoder_support_wider(sh){
translate([0,410,330])rotate([180,0,0]){
//LLYENC it has 2 screws commented out below
//This needs to be updated fixed
//HFS5-2020-484-TPW-Z5-XA135.5-XB230-XC353.5
//HFS5-2020-484-TPW-Z5-XA134-XB352-YA230
translate([-50,400+sh-20+45,16])rotate([90,0,0]){
//tslot20(444.5);
tslot20_2060(444.5+45);
//translate([15,0,134])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15-200,15,230])rotate([0,90,0])cylinder(r=5.7/2,h=2000);
//translate([15,0,352])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
//translate([30-65,324.5,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
//translate([30-65,324.5-218,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
}
}





module y_encoder_support_wider_deeper(sh){
translate([0,410,330])rotate([180,0,0]){
//LLYENC it has 2 screws commented out below
//This needs to be updated fixed
//HFS5-2020-484-TPW-Z5-XA135.5-XB230-XC353.5
//HFS5-2020-484-TPW-Z5-XA134-XB352-YA230
translate([-50,400+sh-20+45,16])rotate([90,0,0]){
//tslot20(444.5);
tslot20_2060(444.5+45+60);
//translate([15,0,134])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15-200,15,230])rotate([0,90,0])cylinder(r=5.7/2,h=2000);
//translate([15,0,352])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
//translate([30-65,324.5,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
//translate([30-65,324.5-218,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
}
}








module y_encoder_support(sh){
translate([0,410,330])rotate([180,0,0]){
translate([30-10-15,60-30-26,15+205])rotate([0,90,0])color("")tslot20innerbracketlonger_smfrnz_back();
translate([30-10-15,60-30-26+380,15+205])rotate([0,90,0])color("")tslot20innerbracketlonger_smfrnz_back();
//LLYENC it has 2 screws commented out below
//This needs to be updated fixed
//HFS5-2020-484-TPW-Z5-XA135.5-XB230-XC353.5
//HFS5-2020-484-TPW-Z5-XA134-XB352-YA230
translate([-50,400+sh,16])rotate([90,0,0]){
tslot20(484);
//translate([15,0,134])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15-200,15,230])rotate([0,90,0])cylinder(r=5.7/2,h=2000);
//translate([15,0,352])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
//translate([30-65,324.5,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
//translate([30-65,324.5-218,15-50])rotate([0,0,90])color("")cylinder(r=5.7/2,h=130);
}
}




module right_y_encoder_support_wider(sh){
translate([0,410,330])rotate([180,0,0]){
//o5 = "HFS5-2020-480.5-TPW-Z5-XA96.5-XB195-XC314.5";
//RRYENC it has 2 screws commented out below
translate([-50,400+sh-20,16])rotate([90,0,0]){
tslot20_2060(444.5);
//module tslot40_2060(length,nut){
}
}
}


module right_y_encoder_support(sh){
translate([0,410,330])rotate([180,0,0]){
translate([30-10-15,60-30-26,15+205])rotate([0,90,0])color("")tslot20innerbracketlonger_smfrnz_back();
translate([30-10-15,60-30-26+380,15+205])rotate([0,90,0])color("")tslot20innerbracketlonger_smfrnz_back();
//o5 = "HFS5-2020-480.5-TPW-Z5-XA96.5-XB195-XC314.5";
//RRYENC it has 2 screws commented out below
translate([-50,400+sh,16])rotate([90,0,0]){
tslot20(484);
}
}
}







module x_encoder_support(){
translate([30-10,30,15])rotate([0,0,90])color("")backextruder_clamp();
translate([30-10,350,15])rotate([0,0,90])color("")backextruder_clamp();
translate([-50+5,52,16+25])
//color("")
color("")
cube([18,300,3]);
translate([-50,400,16])rotate([90,0,0])tslot20(385);
}

module x_encoder_support_wider(){
translate([30-10,30,15])rotate([0,0,90])color("")backextruder_clamp();
translate([30-10,350+190,15])rotate([0,0,90])color("")backextruder_clamp();
translate([-50+5,40,16+25])
//color("")
color("")
cube([18,500,3]);
translate([-50,400+165,16])rotate([90,0,0])tslot20(385+165);
}









module top_outside_frame(){

//TOTL1
//translate([-5-50+1,30-85,505])rotate([0,90,0])tslot20(548);
//TOTL2
translate([-5-50+1,30+165-1,505])rotate([0,90,0])tslot20(548);
//TOTL3
//translate([-5-50+1,30+165+130+85-0.5,505])rotate([0,90,0])tslot20(548);

}



module left_outside_frame_wider_zbed(){
translate([-29,0,0])y_encoder_support_wider(60);
//translate([-80,330,450])rotate([-90,0,90])
//yringepump_tube_panel();
//left side
translate([0,0,0]){
//begin 3d printed stuff
//end 3d printed stuff
//LFTL1
//HFS5-2020-484-TPW-Z5-XA94.5-XB312.5 now change to ...
//HFS5-2020-484-TPW-Z5-XA96-XB314
translate([-50-29,460-26-20+0.5,16-25])rotate([90,0,0]){
//tslot20(484-40+0.5);
tslot20(489.5);
/*
translate([15,0,35.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,112.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,205.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,264.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,385.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
*/
}
}
translate([360,250-260-33-1-85,10])rotate([180,180,-90]){
//this one I remove just for the noconveyer configuration
//translate([75,-55+464,-50-125+165])tslot20(500);
//LFTL2 - HOLES
//translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-1-45,-55+464,9.5-23.5-60]){
tslot20(564);
/*
translate([15,400,554])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400,363])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15-30,400-400,363])rotate([90,0,90])cylinder(r=5.7/2,h=800);
translate([15,400,70])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400-400,70])rotate([90,0,90])cylinder(r=5.7/2,h=800);
*/
}



/*
*/
}
translate([360,250+85,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([-100,405,-15])rotate([90,0,0])tslot20innerbracket();
//translate([75,-55+464,0-50-125+165])tslot20(500);
//LFTL3 - HOLES
//"HFS5-2020-480.5-TPW-Z5-XA470.5";
//translate([75-0.5,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-0.5,-55+464,9.5-23.5-60]){
tslot20(564);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
//z axis
translate([360,250-130,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
//middle z support


/*
translate([180,0,0]){
translate([75-1-180+205,-55+464+2.5,6])rotate([0,180,0])tslot20innerbracket();
translate([75-1-355,-55+464+2.5,6+272])rotate([0,0,0])tslot20innerbracket();
}

translate([75-1,-55+464,6]){
tslot20(273);
//z encoder strip
//color("")translate([7,0,76])cube([18,2,150]);
//translate([75,-55+464,15]){
//tslot20(273);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
*/
translate([75-1-180,-55+464,6])tslot20(273);
translate([75-1-180+205,-55+464+2.5,6])rotate([0,180,0])tslot20innerbracket();
translate([75-1-355,-55+464+2.5,6+272])rotate([0,0,0])tslot20innerbracket();
translate([-60,0,0]){
translate([75-1+170,-55+464,6])tslot20(273);
translate([350,0,0]){
translate([75-1-180+205,-55+464+2.5,6])rotate([0,180,0])tslot20innerbracket();
translate([75-1-355,-55+464+2.5,6+272])rotate([0,0,0])tslot20innerbracket();
}
}
//translate([75,-55+464,0-50-125+165])tslot20(500);
}

//moving_zbed_parts();


/*
*/
}

































module moving_zbed_parts(){
translate([-54,169,90-20])rotate([0,0,90]){
//begin 3d printed stuff
translate([50,80-30,180+20])rotate([0,180,180])color("")bearing_mount_smz();
translate([50-0,40+10,0])mirror([0,1,0])motormount_smz();
//end 3d printed stuff
}
translate([10-39-35,102+107+35,75]){color("silver")cylinder(r=8/2,h=208);}
translate([-45,1.5,0]){
translate([10+509-509-29,102-1.5+142-76,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5+142-76,130]){
translate([40+44,-40,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,-90-4,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
translate([-45,-0.-0.5,0]){
translate([10-29,322-1.5,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5,130]){
translate([40+44,180,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,180-54,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
}






module left_outside_frame_wider(){
translate([-29,0,0])y_encoder_support_wider(60);
//translate([-80,330,450])rotate([-90,0,90])
//yringepump_tube_panel();
//left side
translate([0,0,0]){
//begin 3d printed stuff
//end 3d printed stuff
//LFTL1
//HFS5-2020-484-TPW-Z5-XA94.5-XB312.5 now change to ...
//HFS5-2020-484-TPW-Z5-XA96-XB314
translate([-50-29,460-26-20+0.5,16-25])rotate([90,0,0]){
//tslot20(484-40+0.5);
tslot20(489.5);
/*
translate([15,0,35.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,112.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,205.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,264.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,385.5])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
*/
}
}
translate([360,250-260-33-1-85,10])rotate([180,180,-90]){
//this one I remove just for the noconveyer configuration
//translate([75,-55+464,-50-125+165])tslot20(500);
//LFTL2 - HOLES
//translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-1-45,-55+464,9.5-23.5-60]){
tslot20(564);
/*
translate([15,400,554])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400,363])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15-30,400-400,363])rotate([90,0,90])cylinder(r=5.7/2,h=800);
translate([15,400,70])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400-400,70])rotate([90,0,90])cylinder(r=5.7/2,h=800);
*/
}
/*
*/
}
translate([360,250+85,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([-100,405,-15])rotate([90,0,0])tslot20innerbracket();
//translate([75,-55+464,0-50-125+165])tslot20(500);
//LFTL3 - HOLES
//"HFS5-2020-480.5-TPW-Z5-XA470.5";
//translate([75-0.5,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-0.5,-55+464,9.5-23.5-60]){
tslot20(564);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
//z axis
translate([360,250-130,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
//middle z support
translate([75-1,-55+464,6]){
tslot20(273);
//translate([75,-55+464,15]){
//tslot20(273);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
translate([75-1-180,-55+464,6])tslot20(273);
translate([75-1+170,-55+464,6])tslot20(273);
//translate([75,-55+464,0-50-125+165])tslot20(500);
}
/*
translate([-54,169,90-20])rotate([0,0,90]){
//begin 3d printed stuff
translate([50,80-30,180+20])rotate([0,180,180])color("")bearing_mount_smz();
translate([50-0,40+10,0])mirror([0,1,0])motormount_smz();
//end 3d printed stuff
}
*/
//translate([10-39-35,102+107+35,75]){color("silver")cylinder(r=8/2,h=208);}
/*
translate([-45,1.5,0]){
translate([10+509-509-29,102-1.5+142-76,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5+142-76,130]){
translate([40+44,-40,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,-90-4,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
translate([-45,-0.-0.5,0]){
translate([10-29,322-1.5,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5,130]){
translate([40+44,180,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,180-54,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
*/
}






module left_outside_frame_wider_deeper(){
translate([-29,0,0])y_encoder_support_wider_deeper(60);
//translate([-80,330,450])rotate([-90,0,90])
//yringepump_tube_panel();
//left side
translate([0,0,0]){
//begin 3d printed stuff
//end 3d printed stuff
//LFTL1
//HFS5-2020-484-TPW-Z5-XA94.5-XB312.5 now change to ...
//HFS5-2020-484-TPW-Z5-XA96-XB314
translate([-50-29,460-26-20+0.5+60,16-25])rotate([90,0,0]){
//tslot20(484-40+0.5);
tslot20(489.5+60);
/*
translate([15,0,35.5+30])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,112.5+30])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,205.5+30])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,264.5+30])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
translate([15,0,385.5+30])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
*/
}
}
translate([360,250-260-33-1-85,10])rotate([180,180,-90]){
//this one I remove just for the noconveyer configuration
//translate([75,-55+464,-50-125+165])tslot20(500);
//LFTL2 - HOLES
//translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-1-45,-55+464,9.5-23.5-60]){
tslot20(564);
/*
translate([15,400,554])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400,363])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15-30,400-400,363])rotate([90,0,90])cylinder(r=5.7/2,h=800);
translate([15,400,70])rotate([90,0,0])cylinder(r=5.7/2,h=800);
translate([15,400-400,70])rotate([90,0,90])cylinder(r=5.7/2,h=800);
*/
}
/*
*/
}
translate([360,250+85,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([-100,405,-15])rotate([90,0,0])tslot20innerbracket();
//translate([75,-55+464,0-50-125+165])tslot20(500);
//LFTL3 - HOLES
//"HFS5-2020-480.5-TPW-Z5-XA470.5";
//translate([75-0.5,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
translate([75-0.5+60,-55+464,9.5-23.5-60]){
tslot20(564);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
//z axis
translate([360,250-130,10])rotate([180,180,-90]){
//begin 3d printed stuff
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
//middle z support
translate([75-1+30,-55+464,6]){
tslot20(273);
//translate([75,-55+464,15]){
//tslot20(273);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
translate([75-1-180,-55+464,6])tslot20(273);
translate([75-1+170,-55+464,6])tslot20(273);
//translate([75,-55+464,0-50-125+165])tslot20(500);
}
translate([-54,169,90-20])rotate([0,0,90]){
//begin 3d printed stuff
/*
translate([50,80-30,180+20])rotate([0,180,180])color("")bearing_mount_smz();
translate([50-0,40+10,0])mirror([0,1,0])motormount_smz();
*/
//end 3d printed stuff
}
//translate([10-39-35,102+107+35,75]){color("silver")cylinder(r=8/2,h=208);}
/*
translate([-45,1.5,0]){
translate([10+509-509-29,102-1.5+142-76,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5+142-76,130]){
translate([40+44,-40,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,-90-4,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
translate([-45,-0.-0.5,0]){
translate([10-29,322-1.5,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54-29,169-1.5,130]){
translate([40+44,180,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,180-54,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
*/
}

























module left_outside_frame(){
y_encoder_support(60);
//translate([-80,330,450])rotate([-90,0,90])
//yringepump_tube_panel();
//left side
translate([0,0,0]){
//begin 3d printed stuff
translate([-0,27,-184])color("silver")rotate([-0,-90,180])tslot20innerbracketlonger_smfrnz_back();
translate([-0,27+380,-184])color("silver")rotate([-0,-90,180])tslot20innerbracketlonger_smfrnz_back();
//end 3d printed stuff
//LFTL1
//HFS5-2020-484-TPW-Z5-XA94.5-XB312.5 now change to ...
//HFS5-2020-484-TPW-Z5-XA96-XB314
translate([-50,460-26,16-25])rotate([90,0,0]){
tslot20(484);
//translate([15,0,96])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15,0,314])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
}
translate([360,250-260-33-1-85,10])rotate([180,180,-90]){
//this one I remove just for the noconveyer configuration
// translate([280,405,33-25+290])rotate([90,180,0])color("")tslot20innerbracket();
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
//translate([75,-55+464,-50-125+165])tslot20(500);
/*
//LFTL2 - HOLES
translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
tslot20(480.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
*/
}
translate([360,250+85,10])rotate([180,180,-90]){
//begin 3d printed stuff
translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([-100,405,-15])rotate([90,0,0])tslot20innerbracket();
//translate([75,-55+464,0-50-125+165])tslot20(500);
//LFTL3 - HOLES
//"HFS5-2020-480.5-TPW-Z5-XA470.5";
translate([75-0.5,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
tslot20(480.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
//z axis
translate([360,250-130,10])rotate([180,180,-90]){
//begin 3d printed stuff
translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//end 3d printed stuff
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10]){
tslot20(480.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
//translate([75,-55+464,0-50-125+165])tslot20(500);
}
translate([-54,169,90-20]){
//begin 3d printed stuff
translate([0,80,180+20])rotate([0,180,180])color("")bearing_mount_smz();
motormount_smz();
//end 3d printed stuff
/* this stuff I should delete
difference(){union(){
translate([0+4,0,0])motormountthin();
translate([0,32,-18])cube([5,22,30]);
translate([-17,32+19,-18])cube([22,5,20]);
translate([21+4,40,-18])shorternema17();
}
translate([0,32+9,-5+10])rotate([0,90,0]){cylinder(r=5.7/2,h=20);translate([0,0,5-2])cylinder(r=9.7/2,h=2);}
translate([-10,32+9,-5])rotate([0,-90,-90]){cylinder(r=5.7/2,h=200);translate([0,0,13])cylinder(r=9.7/2,h=2);}
}
*/
}
/*
translate([10-39,102+107,75]){color("silver")cylinder(r=8/2,h=208);}
translate([-45,1.5,0]){
translate([10+509-509,102-1.5,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54,169-1.5,130]){
translate([40+44,-40,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,-90-4,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
translate([-45,-0.-0.5,0]){
translate([10,322-1.5,0]){color("silver")cylinder(r=8.7/2,h=290);}
translate([-54,169-1.5,130]){
translate([40+44,180,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84,180-54,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
}
*/
}












module bearing_mount_smz(){
translate([5,13,-18])basic_bearingholder();
difference(){union(){
translate([0,32,-18])cube([5,22,30]);
translate([-17,32+19,-18])cube([22,5,20]);
}
translate([0,32+9,-5+10])rotate([0,90,0]){cylinder(r=5.7/2,h=20);translate([0,0,5-2+2])cylinder(r=9.7/2,h=2);}
translate([-10,32+9,-5])rotate([0,-90,-90]){cylinder(r=5.7/2,h=200);translate([0,0,13+2])cylinder(r=9.7/2,h=2);}
}
}


module motormount_centered(){
 translate([0.1,0,0])difference(){union(){
 translate([-3,5,-17.5-1])cube([20,14,5]);
 translate([-3,5+56,-17.5-1])cube([20,14,5]);
 motormountthin();
 }
 translate([6-0.5,12+12.4,-17])cylinder(r=8/2,h=3.5);
 translate([6-0.5,12+12.4+31,-17])cylinder(r=8/2,h=3.5);
 translate([6,12,-50])cylinder(r=4.7/2,h=120);
 translate([6,12+56,-50])cylinder(r=4.7/2,h=120);
 }
}

module motormount_smz(){
difference(){union(){
translate([0+4,0,0])color("")motormountthin();
translate([0,32,-18])color("")cube([5,22,30]);
translate([-17,32+19,-18])color("")cube([22,5,20]);
translate([21+4,40,-18])shorternema17();
}
translate([0,32+9,-5+10])rotate([0,90,0]){cylinder(r=5.7/2,h=20);translate([0,0,5-2])cylinder(r=9.7/2,h=2);}
translate([-10,32+9,-5])rotate([0,-90,-90]){cylinder(r=5.7/2,h=200);translate([0,0,13])cylinder(r=9.7/2,h=2);}
}
}

module motormount_smz_justcad(){
difference(){union(){
translate([0+4,0,0])
//color("")
translate([0,0,0.5])motormountthin();
translate([0,32,-18])
//color("")
cube([5,22,30]);
translate([-17,32+19,-18])
//color("")
cube([22,5,20]);
//translate([21+4,40,-18])shorternema17();
}
translate([0,32+9,-5+10])rotate([0,90,0]){cylinder(r=5.7/2,h=20);translate([0,0,5-2+2])cylinder(r=9.7/2,h=2);}
translate([-10,32+9,-5])rotate([0,-90,-90]){cylinder(r=5.7/2,h=200);translate([0,0,13+2])cylinder(r=9.7/2,h=2);}
}
}




module right_outside_frame_wider(){
translate([440+29,410,0])rotate([180,180,0])right_y_encoder_support_wider(34);
//translate([530,130,300])rotate([90,0,90])wash_waste_panel();
//right side
translate([-54+100+403+29,169+75,130-1])rotate([0,0,180]){
translate([40-45,-40-10+1,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84-45-45,-90-13,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([40-45,169,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84-45-45,180-50-15,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}

translate([10-39+450+3+45+35,102+102+6+34.5,60+14]){color("silver")cylinder(r=8.7/2,h=208);}

translate([10+418+1+45+29,102,0]){color("silver")cylinder(r=8.7/2,h=300);}
translate([10+418+1+45+29,102+218,0]){color("silver")cylinder(r=8.7/2,h=300);}
//translate([440,410,0])rotate([180,180,0]){
translate([340+100,410-0,-1])rotate([0,0,180]){
//RFTL1
translate([-50-29,460-20,16-25])rotate([90,0,0]){
tslot20(444.5);
//translate([15+1,0,170])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15+1,0,388])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
}

translate([100-55,0,0]){


translate([-54+503+50,169+75+5.5-30,90-20])rotate([0,0,180-90]){
translate([0,80,180+20])rotate([0,180,180])color("")bearing_mount_smz();
motormount_smz();
}

translate([0,0,0]){
translate([35,450+65,0])rotate([0,0,-90]){
translate([280+220,405-0,313])rotate([90,180,0])color("")tslot20innerbracket();
//translate([280,405,17])rotate([90,180,0])color("")tslot20innerbracket();
//translate([75,-55+464,-50-125+165+10])tslot20(500);
//RFTL2 - HOLES


translate([75.5,-55+464,9.5-23.5-60]){
tslot20(480.5+23.5+60);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
/*
*/
}
translate([35,135-85,0])rotate([0,0,-90]){
//translate([75,-55+464,0])tslot20(400);
//RFTL3 - HOLES

//translate([75-1,-55+464,9.5-23.5-60]){
//tslot20(480.5+23.5+60);

translate([75,-55+464,9.5-23.5-60]){
tslot20(480.5+23.5+60);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
/*
*/
}
translate([35,450-200+45+4,0])rotate([0,0,-90]){
//translate([-100,405,313-25])rotate([90,0,0])color("")tslot20innerbracket();
//translate([75,-55+464,-50-125+165+10])tslot20(500);
//RFTL4 - HOLES

//translate([75-1,-55+464,-50-125+165+10+24.5-9.5+4.5-10-3.5]){
//tslot20(480.5+3.5-211);

translate([75,-55+464,15]){
tslot20(273);

//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
}
}
}









module right_outside_frame(){
//translate([530,130,300])rotate([90,0,90])wash_waste_panel();
//right side
translate([-54+100+403,169+75,130-1])rotate([0,0,180]){
translate([40-45,-40-10+1,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84-45-45,-90-13,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([40-45,169,-114])rotate([0,0,180])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
translate([84-45-45,180-50-15,-114+275])rotate([0,180,0])color("")clamp_bottom_simple_m8_smoothrodholder_for_z();
}
translate([10-39+450+3+45,102+102+6,60+14]){color("silver")cylinder(r=8.7/2,h=208);}
translate([10+418+1+45,102,0]){color("silver")cylinder(r=8.7/2,h=300);}
translate([10+418+1+45,102+218,0]){color("silver")cylinder(r=8.7/2,h=300);}
//translate([440,410,0])rotate([180,180,0]){
translate([340+100,410-0,-1])rotate([0,0,180]){
translate([-0,27,-184])rotate([-0,-90,180])color("silver")tslot20innerbracketlonger_smfrnz_back();
translate([-0,27+380,-184])rotate([-0,-90,180])color("silver")tslot20innerbracketlonger_smfrnz_back();
//RFTL1
translate([-50,460,16-25])rotate([90,0,0]){
tslot20(484);
//translate([15+1,0,170])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
//translate([15+1,0,388])rotate([-90,0,0])cylinder(r=5.7/2,h=2000);
}
}
translate([440-0,410,0])rotate([180,180,0])right_y_encoder_support(34);
translate([100-55,0,0]){
translate([-54+503,169+75+5.5,90-20])rotate([0,0,180]){
translate([0,80,180+20])rotate([0,180,180])color("")bearing_mount_smz();
motormount_smz();
}
translate([0,0,0]){
translate([35,450+65,0])rotate([0,0,-90]){
translate([280+220,405-0,313])rotate([90,180,0])color("")tslot20innerbracket();
//translate([280,405,17])rotate([90,180,0])color("")tslot20innerbracket();
//translate([75,-55+464,-50-125+165+10])tslot20(500);
/*
//RFTL2 - HOLES
translate([75.5,-55+464,-50-125+165+10+24.5-9.5+4.5]){
tslot20(480.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
*/
}
translate([35,135-85,0])rotate([0,0,-90]){
//translate([75,-55+464,0])tslot20(400);
/*
//RFTL3 - HOLES
translate([75,-55+464,-50-125+165+10+24.5-9.5+4.5]){
tslot20(480.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
*/
}
translate([35,450-200+45+4,0])rotate([0,0,-90]){
//translate([-100,405,313-25])rotate([90,0,0])color("")tslot20innerbracket();
//translate([75,-55+464,-50-125+165+10])tslot20(500);
//RFTL4 - HOLES
translate([75,-55+464,-50-125+165+10+24.5-9.5+4.5]){
tslot20(500-15-4.5);
//translate([15,400,480.5-10])rotate([90,0,0])cylinder(r=5.7/2,h=800);
}
}
}
}
}































module abs_3mm_constraint(){
difference(){union(){
translate([25,6,0])cube([5,18,18]);
translate([25,6,0])cube([5+59-25,18,5]);
translate([25+59-25,6,0])cube([5,18,18]);
}
translate([25-1,6+9,12])rotate([0,90,0])cylinder(r=4/2,h=20);
translate([25-1+59-25,6+9,12])rotate([0,90,0])cylinder(r=5.7/2,h=20);
translate([25-1+59-25-13,6+9,-2])rotate([0,0,0])cylinder(r=5.7/2,h=20);
}
}








module z_encoder_inbetween(){
difference(){union(){
translate([25,6,0])cube([5,18,18]);
translate([25,6,0])cube([5+59-25,18,5]);
translate([25+59-25,6,0])cube([5,18,18]);
}
translate([25-1,6+9,12])rotate([0,90,0])cylinder(r=4/2,h=20);
translate([25-1+59-25,6+9,12])rotate([0,90,0])cylinder(r=5.7/2,h=20);
translate([25-1+59-25-13,6+9,-2])rotate([0,0,0])cylinder(r=5.7/2,h=20);
}
}




module z_encoder(){
z_encoder_inbetween();
tslot20(300);
translate([84,25,150])rotate([-90,90,0])z_encoder_clamp();
translate([59,0,0])tslot20(300);
}


module z_encoder_clamp(){
difference(){
union(){
//translate([0,40-1,0])cube([15,6,20]);
cube([15,55+23,6]);
translate([11,7.5-0.765/2,-2])cube([4,5.765,5]);
translate([11,7.5-0.765/2+59,-2])cube([4,5.765,5]);
}
translate([7.5,10,-6])cylinder(r=4.7/2,h=12);
translate([7.5,10+59,-6])cylinder(r=4.7/2,h=12);
translate([7.5,50,22-6])rotate([90,0,0])cylinder(r=4.7/2,h=30);
}
}

module z_encoder_clamp_wiper(){

mv = 32-12;
/*
//to edge is 32mm
//for display
//surface
translate([-10,-10,55+32])rotate([0,0,0])cube([50,50,3]);
translate([23.5,23,80])wiper_tip_m5(6);
translate([7.5+6+10,40/2+3,64])cylinder(r=4.7/2,h=20);
*/

//translate([7.5+6+10,40/2,30])color([75/255,75/255,75/255])cylinder(r=5.9/2,h=40);

//color("")
difference(){
union(){
//translate([0,0,-18])cube([6,40,18]);
translate([0,20-6.5,10])rotate([-5,0,0])cube([8,11,50]);
translate([0,20-6.5,0-10])rotate([0,0,0])cube([6,11,20]);
translate([0,20-6.5-10,0-10])rotate([0,0,0])cube([6,13+5,15]);

//translate([7.5,52,-10+5])rotate([0,180,0])

translate([0,0,mv]){
translate([0,11+3,50-10])cube([6+15+10,13+6,15]);
translate([5,11+3,50-20])rotate([0,-50,0])cube([6+15,13+6,15]);
}


}
translate([-20,20,-3.25])rotate([0,90,0])cylinder(r=3.8/2,h=80);
translate([-20,20-10,-3.25])rotate([0,90,0])cylinder(r=3.8/2,h=80);

translate([-0,-0,mv]){
translate([0,11,50-10+15])cube([6+15+10,13+6+10,15]);
translate([-9,20-6.5-5,0])cube([9,13+10+10,65-10]);
translate([7.5+6+10,40/2+3,30])cylinder(r=4.3/2,h=120);
translate([7.5+6+10,40/2+3,30+4])cylinder(r=12/2,h=10);
}


//translate([7.5-20,5,-10])rotate([0,90,0])cylinder(r=3.8/2,h=80);
//translate([7.5-20,40-5,-10])rotate([0,90,0])cylinder(r=3.8/2,h=80);
}
}






module backside_frame(){
//backside
translate([-48,0,0]){
//translate([-100,405,313])rotate([90,180,0])tslot20innerbracket();
translate([280,405,343-5])rotate([90,180,0])color("grey")tslot20innerbracket();

//BFTL1
translate([75-20,-55+464.5,-50-125+165+29.5])tslot20_2060(460.5);
}
translate([230+70,0,0]){
translate([-100,405,313])rotate([90,0,0])color("grey")tslot20innerbracket();
//translate([280,405,17])rotate([90,180,0])tslot20innerbracket();

//BFTL2
translate([75,-55+464.5,-50-125+165+29.5])tslot20_2060(460.5);
}

}

//blah
module slide_conveyer_frame(){
//supports
//SCTL1
translate([20.4+31.5-25,360+25+51-31,15+320+5])rotate([-90,0,0])tslot20(223+31);
//SCTL2
translate([20.4+31.5-25+278+70,360+25+51-31,15+320+5])rotate([-90,0,0])tslot20(223+31);
translate([0,-31,-270-50]){
//SCTL3
translate([20.4+31.5-25,360+25+51,15+320+5])rotate([-90,0,0])tslot20(254);
//SCTL4
translate([20.4+31.5-25+278+70,360+25+51,15+320+5])rotate([-90,0,0])tslot20(254);
}

}


module slide_conveyer_panel(cl,bcl){
//SCP1 changed
//panel 1
color(bcl)difference(){
translate([20.4+31.5-20+0.5,360+25,15+320])cube([297+70,274.25,4.5]);
translate([20.4+31.5-20,360+25,15+320])cube([20.5,50,4.5]);
translate([20.4+31.5-20+277.5+70,360+25,15+320])cube([20.5,50,4.5]);
translate([20.4+31.5-20+10,360+25+300-50,15+320-50])cylinder(r=5.7/2,h=100);
translate([20.4+31.5-20+10,360+25+300-200,15+320-50])cylinder(r=5.7/2,h=100);
translate([278+70,0,0])
translate([20.4+31.5-20+10,360+25+300-50,15+320-50])cylinder(r=5.7/2,h=100);
translate([278+70,0,0])
translate([20.4+31.5-20+10,360+25+300-200,15+320-50])cylinder(r=5.7/2,h=100);
translate([278+70,0,0])
translate([20.4+31.5-20+10-160-70+30+25-5,360+25+300-50-60,15+320-50])cylinder(r=5.7/2,h=100);
translate([0,-240,0])
translate([20.4+31.5-20+10+80,360+25+300-50,15+320-50])cylinder(r=5.7/2,h=100);
translate([0,-240,0])
translate([20.4+31.5-20+10+200,360+25+300-50,15+320-50])cylinder(r=5.7/2,h=100);
}
//SCP2 changed
//panel 2
color(bcl)difference(){
translate([20.4+31.5-20,360+25+50-0.5-50,15])cube([298+70,224.25+50,4.5]);
translate([20.4+31.5-20+118+50-1,360+25+50-0.5+130.5-1,-15])cube([22,22,500]);
translate([20.4+31.5-20+10,360+25+50-0.5+200,-10])cylinder(r=5.7/2,h=300);
translate([20.4+31.5-20+10,360+25+50-0.5+200-120,-10])cylinder(r=5.7/2,h=300);
translate([20.4+31.5-20+10,360+25+50-0.5+200-120-119.5,-10])cylinder(r=5.7/2,h=300);
translate([20.4+31.5-20+10+360/2,360+25+50-0.5+200-120-119.5,-10])cylinder(r=5.7/2,h=300);
translate([20.4+31.5-20+10+360,360+25+50-0.5+200-120-119.5,-10])cylinder(r=5.7/2,h=300);
translate([278+70,0,0])
translate([20.4+31.5-20+10,360+25+50-0.5+200,-10])cylinder(r=5.7/2,h=300);
translate([278+70,0,0])
translate([20.4+31.5-20+10,360+25+50-0.5+200-120,-10])cylinder(r=5.7/2,h=300);
}
//SCP3 - not changed
//panel 3
color(cl)difference(){
translate([20.4+31.5-20-3,360+25+50-0.5,15-20])cube([3,224.5,344.5]);
translate([20.4+31.5-20-3-100,360+25+50-0.5+250-50,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([20.4+31.5-20-3-100,360+25+50-0.5+40,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,0,320])
translate([20.4+31.5-20-3-100,360+25+50-0.5+250-50,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,0,320])
translate([20.4+31.5-20-3-100,360+25+50-0.5+40,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}
//SCP4 - not changed
//panel 4
color(cl)difference(){
translate([20.4+31.5-20-3+301+70,360+25+50-0.5,15-20])cube([3,224.5,344.5]);
translate([20.4+31.5-20-3-100+300,360+25+50-0.5+250-50,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([20.4+31.5-20-3-100+300,360+25+50-0.5+40,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,0,320])
translate([20.4+31.5-20-3-100+300,360+25+50-0.5+250-50,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,0,320])
translate([20.4+31.5-20-3-100+300,360+25+50-0.5+40,15-20+10])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}


//SCP5
//panel 5
color(cl)difference(){
translate([20.4+31.5-20-3+0.5,360+25+50-0.5+300-75.5,15-20])cube([304-1+70,3,344.5]);
translate([20.4+31.5-20-3+12.5+0.5,360+25+50-0.5+300-75.5+100,15-20+10])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([20.4+31.5-20-3+12.5+0.5,360+25+50-0.5+300-75.5+100,15-20+10+320])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([70,0,0])
translate([20.4+31.5-20-3+12.5+0.5+278,360+25+50-0.5+300-75.5+100,15-20+10+320])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([70,0,0])
translate([20.4+31.5-20-3+12.5+0.5+278,360+25+50-0.5+300-75.5+100,15-20+10])rotate([90,0,0])cylinder(r=5.7/2,h=300);
}
}

module backside_panel(cl,bcl){
//BSP1
//panel 1
color(bcl)difference(){
translate([20.4,360+25,15])cube([329,49.25,4.5]);
translate([20.4+16+5.6,360+25+39.5,-10.2])cylinder(r=5.7/2,h=300);
translate([20.4+16+5.6+280-2,360+25+39.5,-10.2])cylinder(r=5.7/2,h=300);
translate([20.4+16+5.6+50,360+25+39-29,-10.2])cylinder(r=5.7/2,h=3000);
translate([20.4+16+5.6+50+150,360+25+39-29,-10.2])cylinder(r=5.7/2,h=3000);
translate([20.4+16+5.6+50+290,360+25+39-29,-10.2])cylinder(r=5.7/2,h=3000);
}

//BSP2
//panel2 changed
color(cl)translate([70,0,0])difference(){
translate([320.4+14,360+25+50,15-20])cube([108.5,3,504.5]);
translate([320.4+14+30,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-24.5,360+25+50+100,15-20+500-5-80])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-24.5,360+25+50+100,15-20+500-5-80-200])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-24.5,360+25+50+100,15-20+500-5-80-380])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([140+320.4+14+30,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([140+320.4+14+30,360+25+50+100,15-20+500-105])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([140+320.4+14+30,360+25+50+100,15-20+500-305])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([140+320.4+14+30,360+25+50+100,15-20+500-465])rotate([90,0,0])cylinder(r=5.7/2,h=200);
}

//BSP3
//panel3 changed
color(cl)difference(){
translate([320.4+14-408,360+25+50,15-20+344.6])cube([477.5,3,160.0]);
translate([70,0,0])
translate([320.4+14+30-60,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([70,0,0])
translate([320.4+14+30-60-185,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([70,0,0])
translate([320.4+14+30-24.5-20,360+25+50+100,15-20+500-5-80-50])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-185-80,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368,360+25+50+100,15-20+500-5])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368,360+25+50+100,15-20+500-5-130])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368+105,360+25+50+100,15-20+500-5-130])rotate([90,0,0])cylinder(r=5.7/2,h=200);
}

//BSP4
//panel4
color(cl)difference(){
translate([320.4+14-408,360+25+50,15-20+344.6-330-13])cube([101.5,3,342.6]);
translate([320.4+14+30-60-368,360+25+50+100,15-20+500-5-130-50])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368+85.3,360+25+50+100,15-20+500-5-130-50])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368+85.3,360+25+50+100,15-20+500-5-130-320])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368,360+25+50+100,15-20+500-5-130-330])rotate([90,0,0])cylinder(r=5.7/2,h=200);
}

}

module noconveyer_backside_panel(){
//NSCP1
translate([102,0,0])difference(){
translate([320.4+14-408,360+25+50,15-20+344.6-330-13])cube([305.5,3,342.6]);
translate([320.4+14+30-60-368+3.6,360+25+50+100,15-20+500-5-130-50])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368+3.6,360+25+50+100,15-20+500-5-130-50-250])rotate([90,0,0])cylinder(r=5.7/2,h=200);


translate([278,0,0]){
translate([320.4+14+30-60-368+3.6,360+25+50+100,15-20+500-5-130-50])rotate([90,0,0])cylinder(r=5.7/2,h=200);
translate([320.4+14+30-60-368+3.6,360+25+50+100,15-20+500-5-130-50-250])rotate([90,0,0])cylinder(r=5.7/2,h=200);
}
}
}
module frontside_panel(bcl){

translate([-50,-100,160])rotate([90,0,0])translate([7,0,-20])nextgen_syringe10ml_assy();

color("silver")translate([-50,-100,160])rotate([90,0,0])translate([-25,43,-45])import("stls/extrusion_lid_coupler.stl");
color("silver")translate([-50,-100,160])rotate([90,0,0])translate([-25,253,-45])import("stls/extrusion_lid_coupler.stl");

//translate([-50,-100,160])rotate([90,0,0])translate([-25,43,-45])extrusion_lid_coupler();
//translate([-50,-100,160])rotate([90,0,0])translate([-25,253,-45])extrusion_lid_coupler();

translate([-210,-30,60])rotate([0,0,180])pressure_compensation_bottle();

color("lightgrey")translate([-73.5+300-4,-50+0.5-20,270])
rotate([90,0,0])
import("files/HRUA5-AC-500-302.stl");

//FP1
//panel 1
color(bcl)difference(){
translate([-73.5-3,-50+0.5-5,15])cube([295.8,4.5,485]);
translate([-73.5-3+67,-50+0.5-5-70,15+135])cube([593-128,80,250]);
translate([-22.5,0,50])translate([-73.5-3+67-8,-50+0.5-5-70+100,15+135])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-22.5,0,50])translate([-73.5-3+67-8,-50+0.5-5-70+100,15+250])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5,-50+0.5-5-70+100,15+250])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5,-50+0.5-5-70+100,15+380+80])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5,-50+0.5-5-70+100,15+135-80])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8,-50+0.5-5-70+100,15+135])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8,-50+0.5-5-70+100,15+250])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8,-50+0.5-5-70+100,15+380])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30,-50+0.5-5-70+100,15+114])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30+210-50,-50+0.5-5-70+100,15+114])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30+210-50,-50+0.5-5-70+100,15+114+282])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+200,-50+0.5-5-70+100-46.5+50,15+380+80+15])rotate([90,0,0])cylinder(r=5.7/2,h=300);
}
//FP2
//panel 2
color(bcl)difference(){
translate([-73.5-3+593/2,-50+0.5-5,15])cube([296,4.5,485]);
translate([-73.5-3+67,-50+0.5-5-70,15+135])cube([593-128,80,250]);
translate([-73.5-3+67-8+30+210+50,-50+0.5-5-70+100,15+114])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30+420,-50+0.5-5-70+100,15+114])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+480,-50+0.5-5-70+100,15+135])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+480,-50+0.5-5-70+100,15+250])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+480,-50+0.5-5-70+100,15+380])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30,-50+0.5-5-70+100,15+114+282])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30+210+50,-50+0.5-5-70+100,15+114+282])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+30+420,-50+0.5-5-70+100,15+114+282])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5+568,-50+0.5-5-70+100,15+135-80])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5+568,-50+0.5-5-70+100,15+250])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-46.5+568,0,0]){
translate([-73.5-3+67-8,-50+0.5-5-70+100-46.5+568,15+380+80])rotate([90,0,0])cylinder(r=5.7/2,h=300);
}
translate([-73.5-3+67-8-46.5+548,-50+0.5-5-70+100,15+135+50])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8-46.5+548,-50+0.5-5-70+100,15+250+50])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+300-46.5+50,-50+0.5-5-70+100,15+380+80+15])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([-73.5-3+67-8+480-46.5+50,-50+0.5-5-70+100,15+380+80+15])rotate([90,0,0])cylinder(r=5.7/2,h=300);
}
//FP3
//panel 3
color(bcl)translate([-73.5,-50+0.5,15])
difference()
{
translate([-0.5,-0.5,0])cube([588,75.25,4.5]);
translate([73.25,54.25,-0.2])cube([20.5,20.5,6]);
translate([73.25+420,54.25,-0.2])cube([20.5,20.5,6]);
translate([9.5,9.5,-50])cylinder(r=5.7/2,h=200);
translate([10+173.5,9.5,-50])cylinder(r=5.7/2,h=200);
translate([10+173.5+225,9.5,-50])cylinder(r=5.7/2,h=200);
translate([10+173.5+225+173.5-4.5,9.5,-50])cylinder(r=5.7/2,h=200);
translate([10+173.5+225+173.5-4.5-29,9.5+5,-50])cylinder(r=5.7/2,h=200);
translate([10+173.5+225+173.5-4.5-29,9.5+50,-50])cylinder(r=5.7/2,h=200);
translate([9.5+29,9.5+5,-50])cylinder(r=5.7/2,h=200);
translate([9.5+29,9.5+50,-50])cylinder(r=5.7/2,h=200);
translate([9.5+66+60,9.5+55,-50])cylinder(r=5.7/2,h=200);
translate([9.5+66+220,9.5+55,-50])cylinder(r=5.7/2,h=200);
translate([9.5+66+380,9.5+55,-50])cylinder(r=5.7/2,h=200);
}
}


module rightside_underneath_plate_x1(){

color(bcl)difference(){
translate([437.75-17-1,-0.5+26.-0.2,15])cube([94.25,409,4.5]);

translate([437.75-17-1+90,-0.5+26.-0.2-16,15])rotate([0,0,45])cube([30,10,4.5]);
translate([437.75-17-1+90-90-10,-0.5+26.-0.2-16+15,15])rotate([0,0,-45])cube([30,10,4.5]);

translate([437.75-17-1+90,-0.5+26.-0.2-10+420,15])rotate([0,0,-45])cube([30,10,4.5]);

translate([437.75-17-1+90-90,-0.5+26.-0.2-10+415,15])rotate([0,0,45])cube([30,10,4.5]);


translate([437.75-17-1,-0.5+26.-0.2+359.5,15])cube([20.5,20.5,6]);
translate([437.75-17+54.25-80+71.5,-0.5+26.-0.2-15.4+40+25+218,0])cube([68+30-8-72.8,54,100]);
translate([437.75-17+54.25-80+71.5,-0.5+26.-0.2-15.4+40+25,0])cube([68+30-8-72.8,54,100]);
translate([437.75-17+54.25,-0.5+26.-0.2-15.4+40,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40+155,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40+155+115+50,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25,-0.5+26.-0.2-15.4+40+155+195,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45+74,-0.5+26.-0.2-15.4+40+155+4,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45+74,-0.5+26.-0.2-15.4+40+155+4+215.5,0])cylinder(r=5.7/2,h=200);
}

}

module rightside_panel(cl,bcl){
//RSP1
//panel 1
color(bcl)rightside_underneath_plate_x1();


//RSP2
//panel 2
/*
color(cl)difference(){ 
translate([514.0,-50,20-5])cube([3,500-11,242.25]);
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}
*/
/*
//RSP3
//panel 3
color(cl)translate([0,0,242.26])difference(){ 
translate([514.0,-50,20-5])cube([3,500-11,242.25]);
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}
*/
}





















module leftside_underneath_plate_x1(){

//LFSP1
//panel 1
color(bcl)translate([440,0,0])mirror(0,1,0)difference(){
translate([437.75-17-1,-0.5+26.-0.2,15])cube([94.25,409,4.5]);

translate([437.75-17-1+90,-0.5+26.-0.2-16,15])rotate([0,0,45])cube([30,10,4.5]);
translate([437.75-17-1+90-90-10,-0.5+26.-0.2-16+15,15])rotate([0,0,-45])cube([30,10,4.5]);

translate([437.75-17-1+90,-0.5+26.-0.2-10+420,15])rotate([0,0,-45])cube([30,10,4.5]);
translate([437.75-17-1+90,-0.5+26.-0.2-10+420,15])rotate([0,0,-45])cube([30,10,4.5]);

translate([437.75-17-1+90-90,-0.5+26.-0.2-10+415,15])rotate([0,0,45])cube([30,10,4.5]);

translate([437.75-17-1,-0.5+26.-0.2+359.5,15])cube([20.5,20.5,6]);
translate([437.75-17+54.25-80+71.5,-0.5+26.-0.2-15.4+40+25+218,0])cube([68+30-8-72.8,54,100]);
translate([437.75-17+54.25-80+71.5,-0.5+26.-0.2-15.4+40+25,0])cube([68+30-8-72.8,54,100]);
translate([437.75-17+54.25,-0.5+26.-0.2-15.4+40,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40+155,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45,-0.5+26.-0.2-15.4+40+155+115+50,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25,-0.5+26.-0.2-15.4+40+155+195,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45+74,-0.5+26.-0.2-15.4+40+155+4,0])cylinder(r=5.7/2,h=200);
translate([437.75-17+54.25-45+74,-0.5+26.-0.2-15.4+40+155+4+215.5,0])cylinder(r=5.7/2,h=200);
translate([-70+6,270,0])cylinder(r=5.7/2,h=2000);
}

}


module leftside_panel(cl,bcl){

//LFSP1
//panel 1
leftside_underneath_plate_x1();

/*
//LFSP2
//panel 2
color(cl)translate([440,0,0])mirror(0,1,0)difference(){ 
translate([514.0,-50,20-5])cube([3,489,242.25]);
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}
//LFSP3
//panel 3
color(cl)translate([440,0,0])mirror(0,1,0)translate([0,0,242.26])difference(){ 
translate([514.0,-50,20-5])cube([3,500-11,242.25]);
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,240])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,130])rotate([0,90,0])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([514.0-100,-50+10,30])rotate([0,90,0])cylinder(r=5.7/2,h=200);
}
*/

}

module topside_panel(cl){
//TSP1
//panel 1
color(cl)difference(){
translate([-76.5,-30-20,500])cube([197.66,488,3]);
translate([-76.5+12.5+25,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5+25,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5+25,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
}

//TSP2
//panel 2
color(cl)translate([197.68,0,0])difference(){
translate([-76.5,-30-20,500])cube([197.66,488,3]);
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5+170,-30-10,500-100])cylinder(r=5.7/2,h=200);
}
//TSP3
//panel 3
color(cl)translate([(197.68*2),0,0])difference(){
translate([-76.5,-30-20,500])cube([197.66,488,3]);
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([-76.5+12.5+145,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249,0])
translate([-76.5+12.5+145,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5,-30-10,500-100])cylinder(r=5.7/2,h=200);
translate([0,249+215.5,0])
translate([-76.5+12.5+145,-30-10,500-100])cylinder(r=5.7/2,h=200);
}
}

module frontside_frame(){

//This are guides for attaching the syringe pump and pressure compensation vessel
translate([0,-30,0]){
//FFTL1
translate([-55,-55,-50-125+165-10+15+24.5+50])tslot20(400);
//FFTL2
translate([-55+525,-55,-50-125+165-10+15+24.5+50])tslot20(400);
}

//FFTL3
translate([95,-55,-50-125+165-10+15+24.5])tslot20(115.5);
//FFTL4
translate([95+225,-55,-50-125+165-10+15+24.5])tslot20(115.5);
//FFTL5 - HOLES
translate([-54,-55,160]){
rotate([0,90,0])tslot20(548);
//translate([164,15,-400])cylinder(r=5.7/2,h=800);
//translate([389,15,-400])cylinder(r=5.7/2,h=800);
}
//FFTL6 
translate([95+225,-55,-50-125+165-10+15+24.5+370+15])tslot20(75.5);
//FFTL7 
translate([95,-55,-50-125+165-10+15+24.5+370+15])tslot20(75.5);
//FFTL8 - HOLES
translate([-54,-55,-50-125+165-10+15+24.5+145.5+230-0.65+15]){
rotate([0,90,0])tslot20(548);
//translate([164,15,-400])cylinder(r=5.7/2,h=800);
//translate([389,15,-400])cylinder(r=5.7/2,h=800);
}
}




module lm8uu_smz_glider_wider(){
 translate([-19+35,40,42])difference(){
  union(){
  translate([20-4-6,-35+51,-20])cube([10,18,40]);
  translate([20-10,-35+60,-10+6])cube([10,63-60,8]);
  translate([-10,50,-4.7])cube([30,20,10]); 
  for(i=[0:4]){
  translate([15.,50+i,-9-3])cylinder(r=10/2,h=19+5);
  translate([-5.,50+i,-9-3])cylinder(r=10/2,h=19+5);
  }
  difference(){
   translate([20-10,-35+50+7,-10+0])cube([10,18-4.5,20]);
  }
  translate([20-10-10-28+14,-35+30+5+45,-0])rotate([0,90,0])cylinder(r=25/2,h=48-14);
  }
  translate([0-28,45,0]){
   translate([0,0,0])rotate([0,90,-0])cylinder(r=8.7/2,h=60);
   rotate([0,90,0])cylinder(r=15.4/2,h=60);
   translate([0,0,-4.7])cube([50,50,10+0]); 
  }
  translate([15.-20,55,-15])cylinder(r=3/2,h=30);
  translate([15.-0,55,-15])cylinder(r=3/2,h=30);
  translate([10-5-60,-25-0+50,12.5])rotate([0,90,0]){translate([0,0,0])cylinder(r=4.7/2,h=240);}
  translate([10-5-5-60,-25+50,-12.5])rotate([0,90,0]){cylinder(r=4.7/2,h=240);}
 }
}





















module lm8uu_smz_glider(){
 //translate([-34,0,0])tslot20(100);
 //translate([-19+35,40,42])translate([0-28,45,0])
 //rotate([0,90,0])cylinder(r=15.4/2,h=60);
 //translate([-19+35,40,42])translate([0-28,45,0])
 //rotate([0,90,0])cylinder(r=8.7/2,h=60);
/*
translate([24.4,74.35,42])rotate([-90,0,0]){
difference(){ LM8UU_holder(bearing_dia = LM8UU_dia,bearing_len = LM8UU_length,shaft_dia = rod_dia, border = body_wall_thickness, zip_width = 3.5, zip_height = 1.5, tab_length = 0, tab_width = 0, tab_screw_dia = 0);
translate([-16.3,0,5])rotate([0,90,0])cylinder(r=30/2,h=4);
translate([11.6,0,5])rotate([0,90,0])cylinder(r=30/2,h=4);
}
translate([-23+16,0,0])difference(){ color("pink")LM8UU_holder(bearing_dia = LM8UU_dia,bearing_len = LM8UU_length,shaft_dia = rod_dia, border = body_wall_thickness, zip_width = 3.5, zip_height = 1.5, tab_length = 0, tab_width = 0, tab_screw_dia = 0);
translate([-16.3,0,5])rotate([0,90,0])cylinder(r=30/2,h=4);
translate([11.6,0,5])rotate([0,90,0])cylinder(r=30/2,h=4);
}
}
*/
 translate([-19+35,40,42])difference(){
  union(){
  translate([20-4-6,-35,-20])cube([10,18,40]);
  translate([20-10,-35,-10+0])cube([10,18+5,20]);
  translate([20-10,-35,-10+6])cube([10,18+5+45-5,8]);
  translate([-10,50,-4.7])cube([30,20,10]); 
  for(i=[0:4]){
  translate([15.,50+i,-9-3])cylinder(r=10/2,h=19+5);
  translate([-5.,50+i,-9-3])cylinder(r=10/2,h=19+5);
  }
  difference(){
   translate([20-10,-35+50+7,-10+0])cube([10,18-4.5,20]);
   //translate([20-10,-35+50+7+10,-10+0+3.5])cube([10,5,13]);
  }
  translate([20-10-10-28+14,-35+30+5+45,-0])rotate([0,90,0])cylinder(r=25/2,h=48-14);
  }
  translate([0-28,45,0]){
   translate([0,0,0])rotate([0,90,-0])cylinder(r=8.7/2,h=60);
   rotate([0,90,0])cylinder(r=15.4/2,h=60);
   translate([0,0,-4.7])cube([50,50,10+0]); 
  }
  translate([15.-20,55,-15])cylinder(r=3/2,h=30);
  translate([15.-0,55,-15])cylinder(r=3/2,h=30);
  translate([10-5,-25-0,12.5])rotate([0,90,0]){translate([0,0,0])cylinder(r=4.7/2,h=40);}
  translate([10-5-5,-25,-12.5])rotate([0,90,0]){cylinder(r=4.7/2,h=40);}
 }
}



















module zbed_smz_components_wider(shim,modshim){
if (modshim == 0){
 /* the bed levelers */
 translate([0,0+50,7]){
 translate([25-30-6,7.5+7,16.5+17+68])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 translate([25-30-6,7.5+7,16.5+17+218])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 }
 /*
 */
 translate([25-30-6+12,7.5+7+50,16.5+17+7])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 translate([25-30-6+12,7.5+7+50,16.5+17+218+7])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 color(""){
 //right here
 translate([30,0,298])rotate([0,180,0]){
 translate([0+30-60+61,0+0,shim-5+modshim+85-85-0.5+83+2.5])rotate([180,0,180])color("")lm8uu_smz_glider_wider();
 translate([0+30-60+61,0,214.5+shim+modshim+83-85+83+2.5-66])rotate([180,0,180])color("")lm8uu_smz_glider_wider();
 }
 translate([25,7.5+50,27-2.5+67])rotate([0,-90,0])bed_leveler_better_lm8uu_for_metalversion();
 translate([25,7.5+50,26.5+218+35.5-2.5])rotate([0,-90,0])mirror([1,0,0])bed_leveler_better_lm8uu_for_metalversion();
 //translate([-230+2+486-10-400-46,75.5+7.5,135+28-28+35])rotate([0,90,0])color("")zbedslot_516_smz_zbed();
 translate([-230+2+486-10-400-46,75.5+7.5,135+28-28+35])rotate([0,90,0])color("")zbedslot_516_smz_zbed_wider();
 translate([25+10,7+15.5+50,55+187.8])rotate([180,0,0])color("silver") left_zbed_connector_bar_metal();
 }
}
}




























module zbed_smz_components(shim,modshim){
 //tslot20(300);
 //translate([5,0,0])cube([5,25,300]);
//translate([26.5,7.5,-24])
if (modshim == 10){
 /* the bed levelers */
 translate([25-30-6,7.5+7,16.5+17])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 translate([25-30-6,7.5+7,16.5+17+218])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 translate([25-30-6+12,7.5+7,16.5+17])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 translate([25-30-6+12,7.5+7,16.5+17+218])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 color(""){
 translate([30,0,298+1.5])rotate([0,180,0]){
 color("")translate([0+30-60+61,0+0,shim-5+modshim+85-85-0.5+83+2.5])rotate([180,0,180])color("")import("lm8uu_smz_glider.stl");
 //color("")translate([0+30-60+61,0+0,shim-5+modshim+85-85-0.5+83+2.5])rotate([180,0,180])color("")lm8uu_smz_glider();
 //translate([0+30-60+61,0,214.5+shim+modshim+83-85+83+2.5])rotate([180,0,180])color("")lm8uu_smz_glider();
 translate([0+30-60+61,0,214.5+shim+modshim+83-85+83+2.5])rotate([180,0,180])color("")import("lm8uu_smz_glider.stl");
 }
 /*
 */
 translate([25,7.5,17-1])rotate([0,-90,0])bed_leveler_better_lm8uu_for_metalversion();
 translate([25,7.5,16.5+218+35.5-1])rotate([0,-90,0])mirror([1,0,0])bed_leveler_better_lm8uu_for_metalversion();
 translate([-230+2+486-10-400-46,75.5+1,135+28-33.5])rotate([0,90,0])color("")zbedslot_516_smz_zbed();
 //right here
 //translate([25,7,56.25]) zbed_connector_bar();
 translate([25+10,7,56.25]) color("silver") right_zbed_connector_bar_metal();
/*
 translate([25,7,55])difference(){
  translate([0,0,12.5+1])cube([5,15,150]);
  translate([-35,7.5,17.5])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([-35,8,17.5+69])rotate([0,90,0])cylinder(r=2.8/2,h=80);
  translate([-35,8,17.5+69+16])rotate([0,90,0])cylinder(r=2.8/2,h=80);
  translate([-35,7.5,160])rotate([0,90,0])cylinder(r=2.8/2,h=70);
 }
*/
 }
 /*
  translate([15.5,15-30,110])rotate([-90,0,0])cylinder(r=5.7/2,h=100);
  translate([15.5,15-30,230])rotate([-90,0,0])cylinder(r=5.7/2,h=100);
  translate([0,15,21.5])rotate([90,0,90])cylinder(r=5.7/2,h=100);
  translate([0,15,141])rotate([90,0,90])cylinder(r=5.7/2,h=100);
  translate([0,15,239])rotate([90,0,90])cylinder(r=5.7/2,h=100);
 */
}
if (modshim == 0){
 /* the bed levelers */
 translate([0,0,7]){
 translate([25-30-6,7.5+7,16.5+17])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 translate([25-30-6,7.5+7,16.5+17+218])rotate([0,90,0])color("")slidedeck_adjust_wheel();
 }
 /*
 */
 translate([25-30-6+12,7.5+7,16.5+17+7])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 translate([25-30-6+12,7.5+7,16.5+17+218+7])rotate([0,90,0])color("")slidedeck_adjust_wheel_larger();
 color(""){
 //right here
 //translate([25,7+14+1.5,55+187.8])rotate([180,0,0]) zbed_connector_bar();
 translate([30,0,298])rotate([0,180,0]){
 //translate([0+30-60+61,0+0,shim-5+modshim+85-85-0.5+83+2.5])rotate([180,0,180])color("")lm8uu_smz_glider();
 translate([0+30-60+61,0+0,shim-5+modshim+85-85-0.5+83+2.5])rotate([180,0,180])color("")import("lm8uu_smz_glider.stl");
 //translate([0+30-60+61,0,214.5+shim+modshim+83-85+83+2.5])rotate([180,0,180])color("")lm8uu_smz_glider();
 translate([0+30-60+61,0,214.5+shim+modshim+83-85+83+2.5])rotate([180,0,180])color("")import("lm8uu_smz_glider.stl");
 }
 translate([25,7.5,27-2.5])rotate([0,-90,0])bed_leveler_better_lm8uu_for_metalversion();
 translate([25,7.5,26.5+218+35.5-2.5])rotate([0,-90,0])mirror([1,0,0])bed_leveler_better_lm8uu_for_metalversion();
 translate([-230+2+486-10-400-46,75.5,135+28-28])rotate([0,90,0])color("")zbedslot_516_smz_zbed();
 /*
 */
 translate([25+10,7+15.5,55+187.8])rotate([180,0,0])color("silver") left_zbed_connector_bar_metal();

 }
  /*
  translate([15,15-30,63])rotate([-90,0,0])cylinder(r=5.7/2,h=400);
  translate([15,15-30,183])rotate([-90,0,0])cylinder(r=5.7/2,h=400);
  translate([0,15,31.5])rotate([90,0,90])cylinder(r=5.7/2,h=100);
  translate([0,15,141])rotate([90,0,90])cylinder(r=5.7/2,h=100);
  translate([0,15,249+10])rotate([90,0,90])cylinder(r=5.7/2,h=100);
  */
}
}























module left_zbed_connector_bar_metal(){
  difference(){
  union(){
  translate([0,-2,-77.])cube([5,15+4,350]);
  //translate([0,-6,9.5])cube([5,18,20]);
  //translate([0,-6,156-10.5])cube([5,18,20]);
  }
  //translate([-35,7.5,17.5+1.4])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([0+0,0+2.5,5.8-35]){ 
  for(i=[-2:1]){
  translate([-35,7.5+i,9.5+156/2-8])rotate([0,90,0])cylinder(r=3.8/2,h=180);
  translate([-35,7.5+i,9.5+156/2+8])rotate([0,90,0])cylinder(r=3.8/2,h=180);
  }
  }
  translate([-35-2,7.5,9.5+6.75+50+101.5])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75+50+101.5+50])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75+50+101.5+50-185])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75+50+101.5+50-185+54])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  translate([0,0,2.5]){
  for(i=[-2:2]){
   translate([-35-2,7.5+i,9.5+6.75-23.5])rotate([0,90,0])cylinder(r=3.8/2,h=170);
   translate([-35-2,7.5+i,9.5+6.75-23.5-25])rotate([0,90,0])cylinder(r=3.8/2,h=170);
  }
  translate([0,0,218-66]){
  for(i=[-2:2]){
   translate([-35-2,7.5+i,9.5+6.75-23.5])rotate([0,90,0])cylinder(r=3.8/2,h=170);
   translate([-35-2,7.5+i,9.5+6.75-23.5-25])rotate([0,90,0])cylinder(r=3.8/2,h=170);
  }
 }
 }
 }
}

module right_zbed_connector_bar_metal(){
  difference(){
  union(){
  translate([0,0,-82.5])cube([5,15,350]);
  //translate([0,-6,9.5])cube([5,18,20]);
  //translate([0,-6,156-10.5])cube([5,18,20]);
  }

  translate([0,0,-5.5]){
  translate([-35-2,7.5,9.5+6.75+50.5])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75+50+101.5])rotate([0,90,0])cylinder(r=3.8/2,h=70);
  } 

  //translate([-35,7.5,17.5+1.4])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([0,1.5,0.25]){ 
  translate([-35,7.5,9.5+156/2-8])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  translate([-35,7.5,9.5+156/2+8])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  }
  //translate([-35,7.5-1,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5-0,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5+1,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,9.5+156/2-8-52.5])rotate([0,90,0])cylinder(r=2.8/2,h=180);

  
  translate([-35,7.5,9.5+156/2-8-52.5+4.5])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  translate([-35,7.5,9.5+156/2-8-52.5+4.5+10])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,9.5+156-6.75])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75])rotate([0,90,0])cylinder(r=2.8/2,h=70);


  //translate([-35,7.5,17.5+67.75])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,17.5+69+14.75])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,160])rotate([0,90,0])cylinder(r=2.8/2,h=70);

  translate([0,0.5,-2-1]){
  translate([-35-2,7.5,9.5+6.75-23.5])rotate([0,90,0])cylinder(r=2.8/2,h=170);
  translate([-35-2,7.5,9.5+6.75-23.5-25])rotate([0,90,0])cylinder(r=2.8/2,h=170);
  translate([0,0,218]){
  translate([-35-2,7.5,9.5+6.75-23.5])rotate([0,90,0])cylinder(r=2.8/2,h=170);
  translate([-35-2,7.5,9.5+6.75-23.5-25])rotate([0,90,0])cylinder(r=2.8/2,h=170);
 }
 }
 }
}









module zbed_connector_bar(){
  difference(){
  union(){
  translate([0,0,9.5])cube([5,15,156]);
  //translate([0,-6,9.5])cube([5,18,20]);
  //translate([0,-6,156-10.5])cube([5,18,20]);
  }
  //translate([-35,7.5,17.5+1.4])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([-35,7.5,9.5+156/2-8])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5-1,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5-0,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5+1,9.5+156/2-8-56])rotate([0,90,0])cylinder(r=2.8/2,h=180);

  //translate([-35,7.5,9.5+156/2-8-52.5])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  translate([-35,7.5,9.5+156/2-8-52.5+4.5])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  translate([-35,7.5,9.5+156/2-8-52.5+4.5+10])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  translate([-35,7.5,9.5+156/2+8])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,17.5+67.75])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,17.5+69+14.75])rotate([0,90,0])cylinder(r=2.8/2,h=180);
  //translate([-35,7.5,160])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([-35,7.5,9.5+156-6.75])rotate([0,90,0])cylinder(r=2.8/2,h=70);
  translate([-35-2,7.5,9.5+6.75])rotate([0,90,0])cylinder(r=2.8/2,h=70);
 }
}






module laser_zbed_support_strobend(){
difference(){
union(){
translate([46,70-14+82,144-5])cube([40,8,5]);
translate([46,70-14,144-5])cube([10,90,5]);
}
translate([46+5,70-14+20,144-5])cube([5,50,5]);
translate([46+5,70-14+10,144-5-25])cylinder(r=2.8/2,h=50);
translate([46+5,70-14+80,144-5-25])cylinder(r=2.8/2,h=50);
translate([46+5+25,70-14+86,144-5-25])cylinder(r=2.8/2,h=50);
}
}




/*
module multichannel_laser_zbed_wider_deeper(zz){
translate([30-79,30,zz+3])
difference(){
//translate([-8,0,0])color("lightgray")cube([397,350,3]);
translate([-8+6.5-0.25,0+20-45,0])color("lightgray")cube([383.5+158+42,350-20+60,3]);
//translate([227,100,-0.1])cube([100+6,100-10,5]);
translate([45-8,285-65+60,-0.1])cube([180+100+20+8+158+42,160,5]);
translate([45-8,285-65-340+9,-0.1])cube([180+100+20+8+158+42,160,5]);
//translate([45-5,65-65-0.1,-0.1])cube([84,100,5]);
lzd = 3.2;
for(i=[-3:3]){
translate([5,74.5+i-3.5+67,-40])cylinder(r=(lzd+1)/2,h=200);
translate([5,74.5+218+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
translate([369+158+42,0,0]){
translate([5,74.5+i-3.5+67,-40])cylinder(r=(lzd+1)/2,h=200);
translate([5,74.5+218+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
}
}
}
}

*/









module multichannel_laser_zbed(zz){

translate([30,30,zz])
difference(){
//translate([-8,0,0])color("lightgray")cube([397,350,3]);
translate([-8+6.5-0.25,0+20,0])color("lightgray")cube([383.5,350-20,3]);
//translate([227,100,-0.1])cube([100+6,100-10,5]);
translate([45-8,285-65,-0.1])cube([180+100+20+8,160,5]);
translate([45-8,285-65-340+9,-0.1])cube([180+100+20+8,160,5]);
//translate([45-5,65-65-0.1,-0.1])cube([84,100,5]);
lzd = 3.2;
for(i=[-3:3]){
translate([5,74.5+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
translate([5,74.5+218+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
translate([369,0,0]){
translate([5,74.5+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
translate([5,74.5+218+i-3.5,-40])cylinder(r=(lzd+1)/2,h=200);
}
}
/*
translate([5,10,-40]){
for(i=[0]){
translate([i*25,0,0])cylinder(r=lzd/2,h=200);
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
*/
/*
translate([5,80,-40]){
for(i=[0:14]){
if(i==1){
for(j=[-7:30]){
translate([i*25,-30+j+10,0])cylinder(r=lzd/2,h=200);
translate([5*25,-30+j+10,0])cylinder(r=lzd/2,h=200);
translate([5*25,-30+j+10-3,0])cylinder(r=lzd/2,h=200);
}
}else{
translate([i*25,-30,0])cylinder(r=lzd/2,h=200);
}
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
*/

/*
translate([5,80+25,-40]){
for(i=[0:8]){
if(i==7){
translate([i*25,15,0])cylinder(r=(lzd+1)/2,h=200);
}else{
translate([i*25,15,0])cylinder(r=lzd/2,h=200);
}
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
*/

/*
translate([5,80+25+50,-40]){
for(i=[1:8]){
if(i==7){
translate([i*25,15,0])cylinder(r=(lzd+1)/2,h=200);
}else{
translate([i*25,15,0])cylinder(r=lzd/2,h=200);
}
}
for(i=[-0.5,0,0.5]){
translate([15*25-5-370,16.5-97.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+120.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+120.5+i+12,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i+54,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i+54+30,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+16+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5-5.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5+16-5.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5-97.5-2.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5+120.5-2.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
}
//translate([15*25-5-1,16.5-97.5-14.5+25,0])cylinder(r=(lzd+1.5)/2,h=200);
//translate([15*25-5-1,16.5+16-6.,0])cylinder(r=(lzd+1.5)/2,h=200);
//translate([15*25-5-1,16.5+16-6.-16,0])cylinder(r=(lzd+1.5)/2,h=200);

}
*/
/*
translate([5,80+193,-40]){
for(i=[0]){
//translate([i*25+10,-30,0])cylinder(r=lzd/2,h=200);
translate([i*25+25-10,60-0,0])cylinder(r=lzd/2,h=200);
translate([i*25+25-10,60-50,0])cylinder(r=lzd/2,h=200);
}
translate([15*25-30+10,60,0])cylinder(r=lzd/2,h=200);
translate([15*25-30+10,60-50,0])cylinder(r=lzd/2,h=200);
//translate([15*25-5,0-50,0])cylinder(r=lzd/2,h=200);
//translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
translate([5-15.9,80+193-56.5,-40]){
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
translate([15*25-5-35,-10,0])cylinder(r=lzd/2,h=200);
translate([15*25-5-125,-10,0])cylinder(r=lzd/2,h=200);
}
*/
/*
translate([14*25-7,130-4,0])cylinder(r=lzd/2,h=200);
translate([14*25-7,130-17,0])cylinder(r=lzd/2,h=200);
translate([14*25,130+40,0])cylinder(r=lzd/2,h=200);
translate([14*25-3,130-17-30,0])cylinder(r=(lzd)/2,h=200);
translate([14*25-3,130-17-80,0])cylinder(r=lzd/2,h=200);
translate([14*25-3,130-17-105,0])cylinder(r=(lzd)/2,h=200);
translate([14*25-3-30,130-17-105,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-30-80,130-17-105,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-80,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-35,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-12,0])cylinder(r=lzd/2,h=200);
*/
/*
translate([-30,-30,0]){
translate([46+5,70-14+10,-200])cylinder(r=2.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=2.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=2.8/2,h=500);
translate([219,-0,282])rotate([0,180,0]){
translate([46+5,70-14+10,144-5-25])cylinder(r=2.8/2,h=500);
translate([46+5,70-14+80,144-5-25])cylinder(r=2.8/2,h=500);
translate([46+5+25,70-14+86,144-5-25])cylinder(r=2.8/2,h=500);
}
}
*/
/*
translate([8-30,357,282])rotate([0,180,180]){
translate([46+5,70-14+10,-200])cylinder(r=3.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=3.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=3.8/2,h=500);
}
translate([219-50+263-30,357,0])rotate([0,0,180]){
translate([46+5,70-14+10,-200])cylinder(r=3.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=3.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=3.8/2,h=500);
}
*/
}
}







//laser_zbed(0);
//LASER_ZBED CHANGED
module laser_zbed(zz){

//translate([0,0,zz-144])import("laser_zbed_144.stl");


translate([30,30,zz])
difference(){
//translate([-8,0,0])color("lightgray")cube([397,350,3]);
translate([-8+6.5-0.25,0,0])color("lightgray")cube([383.5,350,3]);
translate([227,100,-0.1])cube([100+6,100-10,5]);
translate([45-8,285-65,-0.1])cube([180+100+20+8,160,5]);
translate([45-5,65-65-0.1,-0.1])cube([84,100,5]);

lzd = 3.8;

translate([5,10,-40]){
for(i=[0]){
translate([i*25,0,0])cylinder(r=lzd/2,h=200);
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
translate([5,80,-40]){
for(i=[0:14]){
if(i==1){
for(j=[-7:30]){
translate([i*25,-30+j+10,0])cylinder(r=lzd/2,h=200);
translate([5*25,-30+j+10,0])cylinder(r=lzd/2,h=200);
translate([5*25,-30+j+10-3,0])cylinder(r=lzd/2,h=200);
}
}else{
translate([i*25,-30,0])cylinder(r=lzd/2,h=200);
}
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
translate([5,80+25,-40]){
for(i=[0:8]){
if(i==7){
translate([i*25,15,0])cylinder(r=(lzd+1)/2,h=200);
}else{
translate([i*25,15,0])cylinder(r=lzd/2,h=200);
}
}
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
translate([5,80+25+50,-40]){
for(i=[1:8]){
if(i==7){
translate([i*25,15,0])cylinder(r=(lzd+1)/2,h=200);
}else{
translate([i*25,15,0])cylinder(r=lzd/2,h=200);
}
}

for(i=[-0.5,0,0.5]){
translate([15*25-5-370,16.5-97.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+120.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+120.5+i+12,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i+54,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i+54+30,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-370,16.5+16+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5-5.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5+16-5.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5-97.5-2.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
translate([15*25-5-1,16.5+120.5-2.5+i,0])cylinder(r=(lzd+1.5)/2,h=200);
}
//translate([15*25-5-1,16.5-97.5-14.5+25,0])cylinder(r=(lzd+1.5)/2,h=200);
//translate([15*25-5-1,16.5+16-6.,0])cylinder(r=(lzd+1.5)/2,h=200);
//translate([15*25-5-1,16.5+16-6.-16,0])cylinder(r=(lzd+1.5)/2,h=200);

}
translate([5,80+193,-40]){
for(i=[0]){
//translate([i*25+10,-30,0])cylinder(r=lzd/2,h=200);
translate([i*25+25-10,60-0,0])cylinder(r=lzd/2,h=200);
translate([i*25+25-10,60-50,0])cylinder(r=lzd/2,h=200);
}
translate([15*25-30+10,60,0])cylinder(r=lzd/2,h=200);
translate([15*25-30+10,60-50,0])cylinder(r=lzd/2,h=200);
//translate([15*25-5,0-50,0])cylinder(r=lzd/2,h=200);
//translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
}
translate([5-15.9,80+193-56.5,-40]){
translate([15*25-5,0,0])cylinder(r=lzd/2,h=200);
translate([15*25-5-35,-10,0])cylinder(r=lzd/2,h=200);
translate([15*25-5-125,-10,0])cylinder(r=lzd/2,h=200);
}
translate([14*25-7,130-4,0])cylinder(r=lzd/2,h=200);
translate([14*25-7,130-17,0])cylinder(r=lzd/2,h=200);
translate([14*25,130+40,0])cylinder(r=lzd/2,h=200);

translate([14*25-3,130-17-30,0])cylinder(r=(lzd)/2,h=200);
translate([14*25-3,130-17-80,0])cylinder(r=lzd/2,h=200);
translate([14*25-3,130-17-105,0])cylinder(r=(lzd)/2,h=200);
translate([14*25-3-30,130-17-105,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-30-80,130-17-105,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-80,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-35,0])cylinder(r=lzd/2,h=200);
translate([14*25-3-141-2,130-17-12,0])cylinder(r=lzd/2,h=200);


translate([-30,-30,0]){
translate([46+5,70-14+10,-200])cylinder(r=2.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=2.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=2.8/2,h=500);
translate([219,-0,282])rotate([0,180,0]){
translate([46+5,70-14+10,144-5-25])cylinder(r=2.8/2,h=500);
translate([46+5,70-14+80,144-5-25])cylinder(r=2.8/2,h=500);
translate([46+5+25,70-14+86,144-5-25])cylinder(r=2.8/2,h=500);
}
}
translate([8-30,357,282])rotate([0,180,180]){
translate([46+5,70-14+10,-200])cylinder(r=3.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=3.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=3.8/2,h=500);
}
translate([219-50+263-30,357,0])rotate([0,0,180]){
translate([46+5,70-14+10,-200])cylinder(r=3.8/2,h=500);
translate([46+5,70-14+80,-200])cylinder(r=3.8/2,h=500);
translate([46+5+25,70-14+86,-200])cylinder(r=3.8/2,h=500);
}
}

/*
*/
}





























module microwell_plate_guide(){
difference(){union(){
translate([7+1-2,-30-4,-5])cube([15,44,5]);
translate([7-32,2,-5])cube([38+6+2,15,5]);
}
for(i=[-5:5]){
translate([12,-23+i,-10])cylinder(r=4.7/2,h=40);
translate([12,7+i,-10])cylinder(r=4.7/2,h=40);
translate([12+i,7,-10])cylinder(r=4.7/2,h=40);
translate([-13+i,7,-10])cylinder(r=4.7/2,h=40);
}
translate([12,7,0])cylinder(r=4.7/2,h=40);
}
}



//this is where I need to modify
module zbed_smz_wider_nomove(){
translate([0,0,-15]){
translate([0,0,15]){
translate([15-65,120-50-54,141.5+42])rotate([0,90,0])tslot20(582);
translate([75-1-355+817,-55+464+2.5-191-180,6+272-300])rotate([180,-90,0])tslot20innerbracket();
translate([75-1-355+817-590,-55+464+2.5-191-180,6+272-300])rotate([180,-90,0])mirror([0,0,1])tslot20innerbracket();
}
translate([15-65,120+100+35-54-7+110,141.5+42+14])rotate([0,90,0])tslot20(582);
translate([75-1-355+817,-55+464+2.5-191+110,6+272-300+20-5])rotate([180,-90,0])tslot20innerbracket();
translate([75-1-355+817-590,-55+464+2.5-191+110,6+272-300+20-5])rotate([180,-90,0])mirror([0,0,1])tslot20innerbracket();
}
}





//this is where I need to modify
module zbed_smz_wider(){
 translate([15-65,120-50,141.5])rotate([0,90,0])tslot20(582);
 translate([15-65,120+100+35-54,141.5])rotate([0,90,0])tslot20(582);
 //translate([15,120,141.5])rotate([0,90,0])tslot20(400);
 translate([35-65-14,134-49,105])color("")extrusion_riser();
 translate([35+370+120,134-49,105])color("")extrusion_riser();
 translate([0,100,0]){
 //translate([15,120,141.5])rotate([0,90,0])tslot20(400);
 translate([35-65-14,134-18,105])color("")extrusion_riser();
 translate([35+370+120,134-18,105])color("")extrusion_riser();
 }
 translate([50,60,140])rotate([-90,90,0]){
 translate([0,0+29,0])zbed_smz_components_wider(0,0);
 translate([0,-340+1-29-42,0])mirror([0,1,0])zbed_smz_components_wider(0,0);
 }
}





//this is where I need to modify
module zbed_smz(){
 translate([15,120,141.5])rotate([0,90,0])tslot20(400);
 translate([35,134,105])color("")extrusion_riser();
 translate([35+370,134,105])color("")extrusion_riser();
 translate([0,100,0]){
 translate([15,120,141.5])rotate([0,90,0])tslot20(400);
 translate([35,134,105])color("")extrusion_riser();
 translate([35+370,134,105])color("")extrusion_riser();
 }
 translate([50,60,140])rotate([-90,90,0]){
 zbed_smz_components(0,0);
 translate([0,-340+1,293.5])rotate([180,0,0])zbed_smz_components(0,10);
 }
 //right here also this is part of zbed modules
 //color("lightblue")translate([0,0,-10])multichannel_laser_zbed(144);
 color("")translate([25,130+120,118+10-23])rotate([0,-90,0])z_encoder_clamp_wiper();
 color("")translate([25+380,130+120+25,118+10-23+3])rotate([0,-90,180])z_encoder_clamp_wiper();
 //translate([27,-175,40])rotate([0,0,90])tslot20innerbracket();
 translate([0,18-5,0]){
 //translate([48-2+178,95+192.5+5-200,140-4])rotate([-90,0,0])mirror([1,0,0])color("")tslot20innerbracket();
 //translate([48-2+160,95+192.5+5-172.5,140-4])rotate([-90,0,0])mirror([0,0,1])color("")tslot20innerbracket();
 //To reduce the weight I remove this
 //translate([48-2,95,140])rotate([0,90,0])tslot20(348.5);
 }
 translate([0,-60,0]){
 //translate([48-2+160,95+192.5+5,140-4])rotate([-90,0,0])color("")tslot20innerbracket();
 //translate([48-2+180,95+192.5+5,140-4])rotate([-90,0,0])mirror([1,0,0])color("")tslot20innerbracket();
 //To reduce the weight I remove this
 //translate([48-2,95+192.5,140])rotate([0,90,0])tslot20(348.5);
 }
 /*
 translate([-65,-25,135])rotate([0,0,0])color("gray")import("bed_leveler_foot.STL");
 translate([-65+370,-25,135])rotate([0,0,0])color("gray")import("bed_leveler_foot.STL");
 translate([200-265.5,10+193,135])rotate([0,0,0])color("gray")import("bed_leveler_foot.STL");
 translate([200+105,10+193,135])rotate([0,0,0])color("gray")import("bed_leveler_foot.STL");
 */
}










/*
projection(cut = false){
 //translate([15,16.5+380,-60])rotate([0,0,0])color(bcl)back_plate_x1();
 //translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();
 //translate([-4+12.5+420,19,-60])rotate([0,0,0])color(bcl)right_plate_x1();
 translate([-4+12.5,19,-60])rotate([0,0,0])color(bcl)left_plate_x1();
 //translate([15,16.5,-60-3])rotate([0,0,0])color(bcl)front_plate_x1();
}
*/





module conduit_tubes(){
 translate([-74,198,550-150])rotate([0,90,0])tslot20innerbracket();
 translate([-74,198+215,550-150])rotate([0,90,0])tslot20innerbracket();
 //conduit
 translate([172,410,260]){
  translate([-5,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=150);
  translate([-5-210,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=190);
  translate([-5-210+40,-10,210-178])rotate([0,-10,0])color("black")cylinder(r=25/2,h=190);
  translate([145,-12,210])color("black")sphere(r=12.5);
  translate([145,-20,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")rotate([90,0,-10])cylinder(r=12.5,h=300);
  //one
  translate([105+5,-30-255,210-3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=72);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14,0])cylinder(r=3/2,h=90);
  //two
  translate([-9,0,0]){
  translate([105+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+4,-30-255-48,55+88])color("lightblue")rotate([0,21+4.5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+2,0])cylinder(r=3/2,h=90);
  }
  //three
  translate([-18,0,0]){
  translate([105+15,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+8,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+5,0])cylinder(r=3/2,h=90);
  }
  //four
  translate([-27,0,0]){
  translate([105+20,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=76);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+8,0])cylinder(r=3/2,h=90);
 }
  //five
  translate([-36,0,0]){
  translate([105+29,-30-255,210+3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=80);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+12,0])cylinder(r=3/2,h=90);
 }
  //six
  translate([-45,0,0]){
  translate([105+29+4,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=77);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,2,0])cylinder(r=3/2,h=90);
 }
  //seven
  translate([-54,0,0]){
  translate([105+29+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=76);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,6,0])cylinder(r=3/2,h=90);
 }
  //eight
  translate([-63,0,0]){
  translate([105+29+22,-30-255,210+5])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+10,-30-255-48,55+88])color("lightblue")rotate([0,21+9,0])cylinder(r=3/2,h=85);
  translate([105-14,-30-255-48,55])color("lightblue")rotate([0,9,0])cylinder(r=3/2,h=90);
 }
 }
 translate([172,410,260])color(""){
 translate([-50,6,240])cable_support_extrusion();
 translate([-30,-55,0])rotate([0,0,-90])cable_support_lid();
 rotate([0,0,90])cable_support();
 }
translate([-54,410,505])rotate([0,90,0])tslot20(200);
translate([140,410,505-105])rotate([0,0,0])tslot20(100);
}





































module conduit_tubes_notubes(){
 
 //translate([-74,198,550-150])rotate([0,90,0])tslot20innerbracket();
 //translate([-74,198+215,550-150])rotate([0,90,0])tslot20innerbracket();

 //conduit
 translate([172,410,260]){
  translate([-5,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=150);
  translate([-5-210,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=190);
  translate([-5-210+40,-10,210-178])rotate([0,-10,0])color("black")cylinder(r=25/2,h=190);
  translate([145,-12,210])color("black")sphere(r=12.5);
  translate([145,-20,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")rotate([90,0,-10])cylinder(r=12.5,h=300);
 /*
  //one
  translate([105+5,-30-255,210-3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=72);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14,0])cylinder(r=3/2,h=90);
  //two
  translate([-9,0,0]){
  translate([105+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+4,-30-255-48,55+88])color("lightblue")rotate([0,21+4.5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+2,0])cylinder(r=3/2,h=90);
  }
  //three
  translate([-18,0,0]){
  translate([105+15,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+8,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+5,0])cylinder(r=3/2,h=90);
  }
  //four
  translate([-27,0,0]){
  translate([105+20,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=76);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+8,0])cylinder(r=3/2,h=90);
 }
  //five
  translate([-36,0,0]){
  translate([105+29,-30-255,210+3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=80);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+12,0])cylinder(r=3/2,h=90);
 }
  //six
  translate([-45,0,0]){
  translate([105+29+4,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=77);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,2,0])cylinder(r=3/2,h=90);
 }
  //seven
  translate([-54,0,0]){
  translate([105+29+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=76);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,6,0])cylinder(r=3/2,h=90);
 }
  //eight
  translate([-63,0,0]){
  translate([105+29+22,-30-255,210+5])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+10,-30-255-48,55+88])color("lightblue")rotate([0,21+9,0])cylinder(r=3/2,h=85);
  translate([105-14,-30-255-48,55])color("lightblue")rotate([0,9,0])cylinder(r=3/2,h=90);
 }
 */
 }
 translate([172,410,260])color(""){
 translate([-50,6,240])cable_support_extrusion();
 translate([-30,-55,0])rotate([0,0,-90])cable_support_lid();
 rotate([0,0,90])cable_support();
 }
translate([-54,410,505])rotate([0,90,0])tslot20(200);
translate([140,410,505-105])rotate([0,0,0])tslot20(100);
}














































































module conduit_tubes_3wayvalve(){
 //translate([-74,198,550-150])rotate([0,90,0])tslot20innerbracket();
 //translate([-74,198+215,550-150])rotate([0,90,0])tslot20innerbracket();
 //conduit
 translate([172,410,260]){
 /*
  translate([-5,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=150);
  translate([-5-210,-10,210])rotate([0,90,0])color("black")cylinder(r=25/2,h=190);
  translate([-5-210+40,-10,210-178])rotate([0,-10,0])color("black")cylinder(r=25/2,h=190);
  translate([145,-12,210])color("black")sphere(r=12.5);
  translate([145,-20,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")sphere(r=12.5);
  translate([145,-30,210])color("black")rotate([90,0,-10])cylinder(r=12.5,h=300);

  //one
  translate([105+5,-30-255,210-3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=72);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14,0])cylinder(r=3/2,h=90);
  //two
  translate([-9,0,0]){
  translate([105+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+4,-30-255-48,55+88])color("lightblue")rotate([0,21+4.5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+2,0])cylinder(r=3/2,h=90);
  }
  //three
  translate([-18,0,0]){
  translate([105+15,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+8,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=75);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+5,0])cylinder(r=3/2,h=90);
  }
*/
/*
  //four
  translate([-27,0,0]){
  translate([105+20,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13,-30-255-48,55+88])color("lightblue")rotate([0,21+5,0])cylinder(r=3/2,h=76);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+8,0])cylinder(r=3/2,h=90);
 }

  //five
  translate([-36,0,0]){
  translate([105+29,-30-255,210+3])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=80);
  translate([105-13.5+1,-30-255-48,55])color("lightblue")rotate([0,-14+12,0])cylinder(r=3/2,h=90);
 }
  //six
  translate([-45,0,0]){
  translate([105+29+4,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=77);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,2,0])cylinder(r=3/2,h=90);
 }
  //seven
  translate([-54,0,0]){
  translate([105+29+10,-30-255,210])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+6,-30-255-48,55+88])color("lightblue")rotate([0,21+6,0])cylinder(r=3/2,h=76);
  translate([105-13.5,-30-255-48,55])color("lightblue")rotate([0,6,0])cylinder(r=3/2,h=90);
 }
  //eight
  translate([-63,0,0]){
  translate([105+29+22,-30-255,210+5])color("lightblue")rotate([90,0,-10])cylinder(r=3/2,h=50);
  translate([105-13.5+1-22+13+11+10,-30-255-48,55+88])color("lightblue")rotate([0,21+9,0])cylinder(r=3/2,h=85);
  translate([105-14,-30-255-48,55])color("lightblue")rotate([0,9,0])cylinder(r=3/2,h=90);
 }
*/

 }
 translate([172,410,260])color(""){
 translate([-50,6,240])cable_support_extrusion();
 translate([-30,-55,0])rotate([0,0,-90])cable_support_lid();
 rotate([0,0,90])cable_support();
 }
translate([-54,410,505])rotate([0,90,0])tslot20(200);
translate([140,410,505-105])rotate([0,0,0])tslot20(100);
}









module outside_frame_wider(bcl,cl,x,y){
// xshuttle_assy_wider(x,y);
//outside_frame(tcl,thcl);
 //bcl,tcl is thick
 //cl,thcl is thin
//backside_frame();
color(""){
translate([-100+15-70-3,103+380+30,-73+0.7])import("files/foot_big.stl");
translate([-100+15+420+74+45,103+380+30,-73])import("files/foot_big.stl");
translate([-100+15-70-3,103-55-50+4,-73+0.7])import("files/foot_big.stl");
translate([-100+15+420+74+45,103-55-50+4,-73])import("files/foot_big.stl");
}
/*
*/
/*
*/
//START ASSEMBLING FROM HERE
// translate([43-50,-10+75,0])rotate([0,0,0])
//translate([])syringepump_tube_panel();
left_outside_frame_wider_zbed();
translate([440+42,0,0])mirror([1,0,0])left_outside_frame_wider_zbed();
//cross tslots
translate([-54,-55-45,21])rotate([0,90,0])tslot20(590);
translate([-54,-55-45,21+293])rotate([0,90,0])tslot20(590);
//translate([-54+10,-55-45+50,21+293-15])rotate([90,90,0])cylinder(r=5.7/2,h=300);
//translate([-54+580,-55-45+50,21+293-15])rotate([90,90,0])cylinder(r=5.7/2,h=300);
translate([-54,-55+464.5,21])rotate([0,90,0])tslot20(590);
translate([-54,-55+464.5,21+293])rotate([0,90,0])tslot20(590);
//right_outside_frame_wider();
/*
top_outside_frame();
*/
/*
// frontside_panel(bcl);
frontside_frame();
top_outside_frame();
*/
// leftside_panel(cl,bcl);
 //cl = [0.5,0.5,0,0.8];
//translate([77.5,20+3,5])rotate([0,0,90])justusb_otherend();
 //select this
 //translate([14+(708.8*0.58)-1,19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1_wider();
 translate([14+(708.8*0.58)-1+60,19+(638.4*0.58)-44-4,13-7-5])color(bcl)rotate([0,0,180])bottom_x1_wider_a();
 translate([14+(708.8*0.58)-1+60,19+(638.4*0.58)-44-4,13-7-5])color(bcl)rotate([0,0,180])bottom_x1_wider_b();
 translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1_wider();
 translate([15,16.5+380,-60])rotate([90,0,0])color(bcl)back_plate_x1_wider();
 translate([-4+12.5+420+42,19,-60])rotate([90,0,90])color(bcl)right_plate_x1_wider();
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1_wider();
/*
*/
/*
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
 tcl = [155/255,155/255,155/255];
 thcl = [155/255,155/255,155/255];
 color(tcl)leftside_panel(cl,bcl);
 rightside_panel(cl,bcl);
*/
}















module outside_frame_wider_deeper(bcl,cl){
//outside_frame(tcl,thcl);
 //bcl,tcl is thick
 //cl,thcl is thin
//backside_frame();
/*
color("silver"){
translate([-100+15-70-3,103-55,-73+0.7])import("files/foot_big.stl");
translate([-100+15-70-3,103+380+30,-73+0.7])import("files/foot_big.stl");
translate([-100+15+420+74,103+380+30,-73])import("files/foot_big.stl");
translate([-100+15+420+74,103-55,-73])import("files/foot_big.stl");
}
*/
/*
*/
// translate([43-50,-10+75,0])rotate([0,0,0])
//translate([])syringepump_tube_panel();
//left_outside_frame();
left_outside_frame_wider_deeper();
translate([440+42,0,0])mirror([1,0,0])left_outside_frame_wider_deeper();
//cross tslots
translate([-54,-55-45,21])rotate([0,90,0])tslot20(590);
translate([-54,-55-45,21+293])rotate([0,90,0])tslot20(590);
//translate([-54+10,-55-45+50,21+293-15])rotate([90,90,0])cylinder(r=5.7/2,h=300);
//translate([-54+580,-55-45+50,21+293-15])rotate([90,90,0])cylinder(r=5.7/2,h=300);
translate([-54,-55+464.5+60,21])rotate([0,90,0])tslot20(590);
translate([-54,-55+464.5+60,21+293])rotate([0,90,0])tslot20(590);
//right_outside_frame_wider();
/*
top_outside_frame();
*/
/*
// frontside_panel(bcl);
frontside_frame();
top_outside_frame();
*/
// leftside_panel(cl,bcl);
 //cl = [0.5,0.5,0,0.8];
//translate([77.5,20+3,5])rotate([0,0,90])justusb_otherend();
 //select this
 translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1_wider_deeper();
 translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1_wider();
 translate([15,16.5+380+60,-60])rotate([90,0,0])color(bcl)back_plate_x1_wider();
 translate([-4+12.5+420+42,19,-60])rotate([90,0,90])color(bcl)right_plate_x1_wider_deeper();
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1_wider_deeper();
/*
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
 tcl = [155/255,155/255,155/255];
 thcl = [155/255,155/255,155/255];
 color(tcl)leftside_panel(cl,bcl);
 rightside_panel(cl,bcl);
*/
}








































































































module outside_frame(bcl,cl){
//outside_frame(tcl,thcl);
 //bcl,tcl is thick
 //cl,thcl is thin
//backside_frame();
color("silver"){
translate([-100+15,103,-73])import("files/foot_big.stl");
translate([-100+15,103+380,-73])import("files/foot_big.stl");
translate([-100+15+420,103+380,-73])import("files/foot_big.stl");
translate([-100+15+420,103,-73])import("files/foot_big.stl");
}
// translate([43-50,-10+75,0])rotate([0,0,0])
//translate([])syringepump_tube_panel();
left_outside_frame();
right_outside_frame();
/*
top_outside_frame();
*/
/*
// frontside_panel(bcl);
frontside_frame();
top_outside_frame();
*/
// leftside_panel(cl,bcl);
 //cl = [0.5,0.5,0,0.8];
//translate([77.5,20+3,5])rotate([0,0,90])justusb_otherend();
 //select this
 translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
 translate([15,16.5+380,-60])rotate([90,0,0])color(bcl)back_plate_x1();
 translate([14+(708.8*0.58),19+(638.4*0.58),13-7])color(bcl)rotate([0,0,180])bottom_x1();
 translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)right_plate_x1();
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
 tcl = [155/255,155/255,155/255];
 thcl = [155/255,155/255,155/255];
 color(tcl)leftside_panel(cl,bcl);
 rightside_panel(cl,bcl);
 /*
 backside_panel(cl,bcl);
 topside_panel(cl);
 leftside_panel(cl,bcl);
 rightside_panel(cl,bcl);
 slide_conveyer_panel(cl,bcl);
 backside_panel(cl,bcl);
 topside_panel(cl);
 //frontside_panel(bcl);
 translate([15,16.5,-60-3])rotate([90,0,0])color(bcl)front_plate_x1();
 translate([-4+12.5+420,19,-60])rotate([90,0,90])color(bcl)right_plate_x1();
 translate([-4+12.5,19,-60])rotate([90,0,90])color(bcl)left_plate_x1();
 */
}










module sandwich_delrinwheel(){
 tbg = 0.9;color([tbg,tbg,tbg]){
 translate([0,0,-14])cylinder(r=5.7/2,h=40); 
} 
 bg = 0.2;color([bg,bg,bg]){
 cylinder(r=23.9/2,h=10.23);
 }
}






module delrinwheel(){
 color("silver")cylinder(r=5.7/2,h=25); 
 color("black")cylinder(r=23.9/2,h=10.23);
}

//bottom_x1();


//scale([1, 1, 0.1])
//surface(file = "custom_pcbs/kill_switch_mosfet_pcb.png", center = true);
//zbedslot_516_smz_zbed();
//x_axis(10);
//gantry();
//arduino(MEGA);

module adafruit_lplate_1218(){
//This needs tobe be modified and cut
color("silver")difference(){
cube([60,60,4]);
translate([0,40,-0.10])cube([60,60,14]);
translate([0,20,-0.10])rotate([0,0,45])cube([160,60,5]);
translate([10,10,-0.1])cylinder(r=5.7/2,h=10);
translate([30,10,-0.1])cylinder(r=5.7/2,h=10);
translate([50,10,-0.1])cylinder(r=5.7/2,h=10);
translate([50,30,-0.1])cylinder(r=5.7/2,h=10);
translate([50,50,-0.1])cylinder(r=5.7/2,h=10);
}
}

//adafruit_lplate_1259();
module adafruit_lplate_1259(){
difference(){
union(){
difference(){
cube([38,38,5]);
translate([43,0,-0.1])rotate([0,0,45])cube([38,38+50,6]);
}
cube([38,5,18]);
cube([5,38,18]);
}
translate([30,0,-0.1])cube([38-20,38,19]);
translate([20,50,10])rotate([90,90,0])cylinder(r=4.7/2,h=200);
translate([-11,20,10])rotate([0,90,0])cylinder(r=4.7/2,h=200);
}
}

module corexy_beltsetup(x,y){
px = 0;
py = -30;
dx = x - px;
dy = y - py;
translate([7+11,-25,355])color("black")rotate([-0.2,0,0.5+1.8])cube([2,427,5]);
translate([7,-25+425,355-1])color("black")rotate([0,1.5,-3])cube([415,3,5]);
translate([7+420,-25+412,355+3])color("black")rotate([0,-180-0.5,0.85])cube([405,3,5]);
translate([7+415,-25,355])color("black")rotate([-0.2,0,-2])cube([2,413,5]);

//x left
translate([20,-25+180,350])color("black")cube([200-20,3,5]);
translate([7+20,-25+218,350])color("black")rotate([-0,0,-180+1.5+90])cube([2,183,5]);

//x right
translate([7+415-15,-25+218,350])color("black")rotate([-0,0,-180-0.5-90])cube([2,163+dx-30,5]);
translate([417-2.5,-25+181-2,355])color("black")rotate([0,180,0+1.5])cube([215+dx-60,3,5]);

//y front side
translate([7+18+11,-25,355])color("black")rotate([-1.5,0,5.5])cube([2,180,5]);
translate([7+415-17,-25,355])color("black")rotate([-2,0,-4])cube([2,180,5]);

//y back side
translate([7+415,-25+218+188,342])color("black")rotate([2,0,-180-0.5])cube([2,180+2,5]);
translate([7+13,-25+218+183,342])color("black")rotate([2,0,-180+0.5])cube([2,180+1,5]);
}



module corexy_beltsetup_wider(x,y){
px = 0;
py = -30;
dx = x - px;
dy = y - py;
translate([0,0,-5]){

translate([7+11-66,-72-45,355])color("black")rotate([-0.2,0,0.5])cube([2,500+45,5]);
translate([7-50,-25+457,355-1])color("black")rotate([0,1,-2.5])cube([510+42,3,5]);
translate([7+475+42,-25+442,355+3])color("black")rotate([0,-180-0.5,0.4])cube([510+42,3,5]);
translate([7+415-11+76+42,-25-50-45,355])color("black")rotate([-0.2,0,-0.4])cube([2,490+45,5]);
/*
*/
//x left
translate([20-50+7,-25+180-37+dy+19,350])color("black")rotate([0,0,-1])cube([200-20+dx+24,3,5]);
translate([7+20-50,-25+218-40+dy+19,350])color("black")rotate([-0,0,-180+1+90])cube([2,183+dx+28,5]);

//x right
translate([7+415-2.5+43+42,-25+218+dy-41+19,350])color("black")rotate([-0,0,-180-0.5-90])cube([2,163-dx+12+80,5]);
translate([417-2.5+47+42,-25+181-2+dy-40+19,355])color("black")rotate([0,180,0+0.5])cube([215-dx-28+80,3,5]);

//y front side
translate([7+18-52,-78-45,355])color("black")rotate([0,0,0.5])cube([2,184+dy+25+45,5]);
translate([7+415-17+62+42,-78-45,355])color("black")rotate([0,0,-0.5])cube([2,184+dy+25+45,5]);

//y back side
translate([7+415+55+42,-25+218+210,342])color("black")rotate([0,0,-180-2])cube([2,180+60-dy-12,5]);
translate([7-43,-25+218+183+28,342])color("black")rotate([0,0,-180+2])cube([2,180+65-dy-12,5]);
}
}








module filament_driver_assy(){

//PTFE assembly
//this is the filament driver assy
translate([-48,280,100])rotate([-90,0,-90])linearactuator_endstop_encoder();
translate([-48,364-75,330])rotate([0,-90,0])color("")encoder_ribboncable();
//translate([-6.5,364,316])rotate([90,0,90])color("")cables_wall();
translate([57,400+9,200])rotate([0,0,90]){
translate([0,0,100])tslot20(100);
color("")
cable_support();
translate([20,31,0])mirror([0,1,0])
color("")
cable_support_lid();
translate([-5,-175,130])
color("")
rotate([-90,0,90])tslot20innerbracket();
}
}


/*
module zbed_assy(z){
color("")cable_support();
translate([20,31,0])mirror([0,1,0])color("")cable_support_lid();
}
*/


module ivernetech_slider_module(){
translate([-9+23+2,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
iverntech_slider();
}

module ivernetech_slider_module_wider(y){
//translate([-9+23+2,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
translate([0,-19,0])iverntech_slider_wider(y);
}



module linearencoder_set(x,y){

translate([0,0,-28]){
color("")translate([-27/2+12/2-48+6,-10-0,310-6+5+28])
cube([12,400,2]);
color("")translate([-27/2+12/2-48+6+570,-10-y,310-6+5+28])
cube([12,400,2]);
}

translate([0,y,0]){
translate([20-70,217-23,400-78])rotate([0,0,-90])x_encoder_support_wider();
}

translate([0,0,-3]){
translate([208+24-64+70,188+40-6.5-60+11.5+26-54,343+46+25-23])rotate([0,0,0])color("")wiper_clamp();
}

}


module iverntech_railsystem(){
translate([-20+5-220-3+0.5,200+5-231.8,678.8])rotate([0,180,-90])slider_front_assy_multichannel_iverntech();
translate([-20+5-3,200+5,340])rotate([-90,0,-90])shuttle_back();
/*
*/
translate([-25.5,20,320-3])rotate([0,180,0])iverntech_slider_xshuttle_connect();
translate([-15.5,-10,0]){
translate([0-30,250,269-5])rotate([90,0,0])tslot20(100);
translate([0-30-20,250,269-5])rotate([90,0,0])tslot20(100);
}
/*
*/

translate([-27/2+12/2-48+6+12,55-60-30-60,310-6+5])color("black")cube([12,450,8]);
translate([-27/2+12/2-42-7.5+12,150+20,310-6+5-6])difference(){
 color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2-10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2-10,45/2+10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2+10,-5-20])cylinder(r=3.7/2,h=60);
}
}




module xshuttle_assy_wider(x,y){
translate([0,y,0]){
//translate([20-70,217-23,400-78])rotate([0,0,-90])x_encoder_support_wider();
translate([0,-28,0]){
translate([43-25-55,206.5-15-41.5+28+19,-60+430-28])rotate([-90,90,-90])tslot20(552);
}
/*
*/
translate([0,0,-28]){
//translate([-27/2+12/2-48+6,55-y-65,310-6+5])cube([12,400,8]);
translate([0,-60,0]){
translate([1,0-20,284+28])rotate([90,0,90])color("")iverntech_connector();
translate([1,0+170,284+28])rotate([90,0,90])color("")iverntech_connector();
translate([1,0+350,284+28])rotate([90,0,90])color("")iverntech_connector();
}
translate([-27/2+12/2-48+6+12,55-60-30-60,310-6+5])color("black")cube([12,450,8]);
translate([-27/2+12/2-42-7.5+12,150+20,310-6+5-6])difference(){
 color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2-10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2-10,45/2+10,-5-20])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2+10,-5-20])cylinder(r=3.7/2,h=60);
}
}
translate([-49.5+12,345,300-11])rotate([0,180,180])ivernetech_slider_module_wider();
translate([440.5+42,0,-28])mirror([1,0,0]){
translate([0,-60,0]){
translate([1,0-20,284+28])rotate([90,0,90])color("")iverntech_connector();
translate([1,0+170,284+28])rotate([90,0,90])color("")iverntech_connector();
translate([1,0+350,284+28])rotate([90,0,90])color("")iverntech_connector();
}
//color("")translate([-27/2+12/2-48+6,-10-y,310-6+5+28])
//cube([12,400,2]);
translate([-27/2+12/2-48+6+12,55-y-65-50,310-6+5])color("black")cube([12,450,8]);
translate([-27/2+12/2-42-7.5+12,150+20,310-6+5-6])difference(){
 color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5-30])cylinder(r=3.7/2,h=80);
 translate([27/2+10,45/2-10,-5-30])cylinder(r=3.7/2,h=80);
 translate([27/2-10,45/2+10,-5-30])cylinder(r=3.7/2,h=80);
 translate([27/2+10,45/2+10,-5-30])cylinder(r=3.7/2,h=80);
}
translate([-49.5+12,345,300-11+28])rotate([0,180,180])ivernetech_slider_module_wider();
}
/*
*/
}
}



module iverntech_model_300(){
translate([0,0,0])difference(){
color("silver")cube([12,300,8]);
translate([6,12.5,-12])
for(i=[0:11]){
translate([0,i*25,0])cylinder(r=2.8/2,h=40);
}
}
translate([-27/2+12/2,8,2-3+6])difference(){
 color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2-10,-5])cylinder(r=3.7/2,h=60);
 translate([27/2-10,45/2+10,-5])cylinder(r=3.7/2,h=60);
 translate([27/2+10,45/2+10,-5])cylinder(r=3.7/2,h=60);
}
}




module xshuttle_assy(x,y){

//x shuttle
corexy_beltsetup(x,y);

translate([5,70,307]){
color("silver")cube([12,300,8]);
color("")translate([-1,0,28.5])difference(){
 cube([12,300,1]);
}
}

translate([5+420,70,307]){
color("silver")
cube([12,300,8]);
color("")translate([-1,0,28.5])cube([12,300,1]);
}

/*
*/

translate([0,y,0]){
translate([0,0,-3.5])x_axis(x);


translate([20,217,400-50])rotate([0,0,-90])x_encoder_support();
translate([5,385,307+8])rotate([0,180,180]){
//here is iverntech shuttle
translate([-27/2+12/2,150,2-3+6])difference(){
color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2-10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2+10,-5])cylinder(r=3.7/2,h=20);
}
translate([-9+23+2,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
iverntech_slider();
}
translate([5+420,385,307+8])rotate([0,180,180]){
translate([-27/2+12/2,150,2-3+6])difference(){
color("silver")cube([27,45,9]);
 translate([27/2-10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2-10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2-10,45/2+10,-5])cylinder(r=3.7/2,h=20);
 translate([27/2+10,45/2+10,-5])cylinder(r=3.7/2,h=20);
}
translate([-9+23+2-51,350-125,-25+4.5+12.5-12.5])rotate([90,0,0])tslot20(100);
translate([11,0,0])mirror([1,0,0])iverntech_slider();
}
/*
*/


}
}

module zencoder_assy(){
translate([-100+50,405-210,277-70])rotate([0,0,90])color("")z_encoder_inbetween();
translate([-100+50,405-210,77])rotate([0,0,90])color("")z_encoder_inbetween();
//z encoder
translate([360,250-130+70-70+60,10])rotate([180,180,-90]){
//translate([-100,405,277])rotate([90,0,0])color("")tslot20innerbracket();
//translate([280,405,33-25])rotate([90,180,0])tslot20innerbracket();
translate([75,-55+464,9.5])tslot20(400);
translate([75+5,-55+464+2,96])color("")cube([18,1,150]);
}
}

//right here base zbed modules
module zbed_assy(z){
translate([0,0,z]){
zbed_smz();
//translate([0,0,-10])wash_and_strobparts();
//translate([145+25+25,315-65,172-10])rotate([90,90,0])tslot20(200);
//laser_zbed(144);
//translate([0,0,-10])laser_zbed(144);
//translate([25,130+120,118+10])rotate([0,-90,0])z_encoder_clamp_wiper();
}
}

//right here base zbed modules
module zbed_assy_wider(z){
moving_zbed_parts();
translate([480,0,0])mirror([1,0,0])moving_zbed_parts();
translate([0,0,z]){
zbed_smz_wider();
//translate([0,0,-10])wash_and_strobparts();
//translate([145+25+25,315-65,172-10])rotate([90,90,0])tslot20(200);
//laser_zbed(144);
//translate([0,0,-10])laser_zbed(144);
//translate([25,130+120,118+10])rotate([0,-90,0])z_encoder_clamp_wiper();
}
}



module xymotor_assy_wider(){
//XY motor assembly
translate([440+54+42,405+30,338.3])rotate([0,0,180])XY_bearings_Right_x1();
translate([0-40-14,405+30,338.3])rotate([0,0,0])XY_bearings_Left_x1();
translate([10-23+70+0+450+42,25-55-45,-65])rotate([0,180,180])mirror([0,0,1])XY_motor_x2higher();
translate([-60-7,25-55-45,-60])rotate([0,0,180])XY_motor_x2higher();
}






module xymotor_assy(){
//XY motor assembly
translate([440,405,333.3])rotate([0,0,180])XY_bearings_Right_x1();
translate([0,405,338.3])rotate([0,0,0])XY_bearings_Left_x1();
translate([10-23+70,25,-65])rotate([0,180,180])mirror([0,0,1])XY_motor_x2higher();
translate([360+25,25,-60])rotate([0,0,180])XY_motor_x2higher();
}



//washbowl_assy();
//gantry_assy(140,-30,-45+50+100,-55,1,267);

//conveyer_connector_tslots();

module gantry_assy(x,y,z,xx,xp,sph,tcl,thcl){
 zencoder_assy();
 filament_driver_assy();
 xshuttle_assy(x,y);
 zbed_assy(z);
 gantry();
 outside_frame(tcl,thcl);
 y_encoder_support(60);
 xymotor_assy();

 conveyer_connector_tslots();
 slide_conveyer_caller(z,xx,xp,sph);

 /*
 noconveyer_backside_panel();
 //electronics_configuration();
 //slide_conveyer_caller(z,xx,xp,sph);
 //slide_conveyer_frame();
 //translate([-36.25+0.5-60+30+215,-33+580-4,90])rotate([-90,0,90])conveyer_solenoid_pcb();
 //outside_frame(tcl,thcl);
 //slide_conveyer_caller(z,xx,xp,sph);
 */
}


module gantry_shelves(){
translate([20,0,20+150])rotate([0,90,0])tslot20(400);
translate([20,0,20+220])rotate([0,90,0])tslot20(400);
color(""){
translate([240,5,20+150-25])tslot20innerbracket();
translate([240,5,20+220-25])tslot20innerbracket();
translate([200,5+20,20+220-25])rotate([0,0,180])tslot20innerbracket();
translate([200,5+20,20+150-25])rotate([0,0,180])tslot20innerbracket();
translate([420,-164,90])rotate([0,180,90])multichannel_drypad();
translate([330,30,15])difference(){
cylinder(r=60,130);
translate([0,0,3])cylinder(r=55,130);
}
}
}


module gantry_shelves_wider(){

translate([0,0-45,0]){

/*
translate([240+75+42,5-55+110,20+150-25-3])tslot20innerbracket();
translate([20-75,-55+110+4,20+150-3])rotate([0,90,0])tslot20(592);
translate([200-75,5+20-55+116,20+150-25])rotate([0,0,180])tslot20innerbracket();
translate([240+75+42,5-55+290,20+150-25-3])tslot20innerbracket();
translate([20-75,-55+290+4,20+150-3])rotate([0,90,0])tslot20(592);
translate([200-75,5+20-55+296,20+150-25])rotate([0,0,180])tslot20innerbracket();
*/
translate([20-75,-55,20+150])rotate([0,90,0])tslot20(592);
translate([20-75,-55,20+220])rotate([0,90,0])tslot20(592);
color(""){
translate([240+75+42,5-55,20+150-25])tslot20innerbracket();
translate([240+75+42,5-55,20+220-25])tslot20innerbracket();
translate([200-75,5+20-55,20+220-25])rotate([0,0,180])tslot20innerbracket();
translate([200-75,5+20-55,20+150-25])rotate([0,0,180])tslot20innerbracket();
translate([420+50,-164-55,90])rotate([0,180,90])multichannel_drypad();
translate([330+50,30-55-22,15])difference(){
cylinder(r=60,130);
translate([0,0,3])cylinder(r=55,130);
}
}
/*
*/
}
}















//noconveyer_gantry_assy(20,-30,-45+50+100-50-100+150,-55,0,267,tcl,thcl);
module noconveyer_gantry_assy(x,y,z,xx,xp,sph,tcl,thcl){
/*
*/
x = x -203+197-9+7;
y = y-117+180+60-60-180-10;
/*
x = x -203+197-9+7-40;
y = y-117+180+60-60-180-10;
*/
//x = x -203+197-9+7+150;
//y = y-117+180+60-60-180-10-120-12;

/*
z = z+3;
x = x -193-8+20+380-0;
y = y+0-120+285;
*/
 /*
 translate([-74,-35,465])rotate([0,-90,0])multichannel_syringe_module();
 gantry_shelves();
 pcb_panels();
 xshuttle_assy(x,y);
 */

 //translate([0,0,120-100])zbed_multichannel_setup();
 //gantry();
 //outside_frame(tcl,thcl);
 //zbed_assy(z);

 //translate([-80,110,230])rotate([0,-90,0])nextgen_syringe10ml_assy();
 //pcb_panels_wider_deeper();
 //conduit_tubes();
 //translate([-115,-50,0])cube([630,570,1]);
 //translate([0,0-55+55+29-29,0])gantry();
 //translate([0-80,0,120-100])zbed_multichannel_setup();
// xshuttle_assy_wider(x,y);
 //translate([-70,-25+50,z])zbed_multichannel_setup_wider_deeper(z);


 //zbed_assy_wider(z);
 //conduit_tubes_3wayvalve();
 outside_frame_wider(tcl,thcl,x,y);
 //microfluidics_set();
 zbed_smz_wider_nomove();
 //translate([-70,-25+50,z])zbed_multichannel_setup_wider(z);
 //conduit_tubes();
 ///conduit_tubes_notubes();
 pcb_panels_wider();
 translate([0,0,-29.5])xymotor_assy_wider();
 gantry_shelves_wider();
 /*
 //linearencoder_set(x,y);
 */
translate([0,-14+19,-26])slider_assy(x,y);
 //translate([0,0,-24])corexy_beltsetup_wider(x,y);
 //translate([-75-8,-35,465-140])rotate([0,-90,0])multichannel_syringe_module();
 //outside_frame_wider_deeper(tcl,thcl);
 ///labbot3d_electronics_configuration();
 //zencoder_assy();
 //translate([570-2-130,0,0])rotate([0,0,180])mirror([0,1,0])zencoder_assy();
 //filament_driver_assy();
 //y_encoder_support(60);
 //electronics_configuration();
}




//47,63,23
//SSR-25 DA DC-AC 25A/250V 3-32VDC/24-380VAC SSR Single Phase




module fotek_solidstate_relay(){
color("white")cube([47,58.5,23]);
}





module arduino_softpot_linearencoder_plate_washdry(){
difference(){union(){
translate([-60,53,0])rotate([0,180,0])highcurrent_power_mosfet_wash_dry_pcv_fan(95,32);
translate([0,53,0])rotate([0,180,0])9pinconnector_for_softpot(42,37);
translate([0,0,10])rotate([0,180,0])softpot_linearencoder_16bitadc_brd_assy();
translate([-150,-14,0])rotate([0,180,-90])arduino_base_template();
translate([4-83-43,13+28,-3])cube([12+20,17-9,3]);
translate([4-83+23,13+30,-3])cube([12+2,17+14,3]);
translate([4-83,13,-3])cube([12+4,17,3]);
translate([4-83-92,13,-3])cube([12+4+3,17,3]);
translate([4-83-92,13+38,-3])cube([12+4+3,17,3]);
translate([4,13,-3])cube([12,15,3]);
translate([4,13+50,-3])cube([12,15,3]);
}
translate([4-83-43-20,13+28-45,-3+0.1])cube([12+35,17-9+24,3]);
translate([25.1,334.25,0])rotate([0,0,180]){
translate([10+180,13.5+300,-100])cylinder(r=3.7/2,h=300);
translate([10-93+180,13.5+300,-100])cylinder(r=3.7/2,h=200);
translate([10-176+180,13.5+300,-100])cylinder(r=3.7/2,h=200);
translate([10-176+180,13.5-50+300,-100])cylinder(r=3.7/2,h=200);
translate([10+180,13.5-40+300,-100])cylinder(r=3.7/2,h=200);
}
}
}

module azteeg_raspi_plate(){

translate([20-4,-40-2,0])difference(){
union(){
translate([110+10,405,-0])rotate([0,180,90])azteeg_x5_mini_plate();
//translate([110+10,405,-0])rotate([0,180,90])azteeg_x5_mini();
translate([55,300,-0])rotate([0,0,0])cube([150,110,3]);
//translate([180+10,310,-0])rotate([0,180,0])raspib_model();
translate([180+10,310+90,2])rotate([0,180,90])raspi_plate();
}
translate([55+10,300+15,-10])rotate([0,0,0])cube([65,80,13]);
translate([55+10+60+18,300+15+5-10,-10])rotate([0,0,0])cube([40,85,13]);
translate([-150,279,0]){
translate([170+180,13.5-185+300,-100])cylinder(r=3.7/2,h=200);
translate([170+180,13.5-290+300,-100])cylinder(r=3.7/2,h=200);
translate([30+180,13.5-185+300,-100])cylinder(r=3.7/2,h=200);
translate([30+180,13.5-290+300,-100])cylinder(r=3.7/2,h=200);
}
}

}


module steppermotordriver_4setplate(){

translate([-230+7,75-10,0])rotate([0,180,0])steppermotordriver_brd();
translate([-290+7,75-10,0])rotate([0,180,0])steppermotordriver_brd();
translate([-290+7,130,0])rotate([0,180,0])steppermotordriver_brd();
translate([-230+7,130,0])rotate([0,180,0])steppermotordriver_brd();
translate([-230,75-14,0])rotate([0,180,0])difference(){cube([15,10,3]);
translate([7,3,-0.2])cylinder(r=3.2/2,h=20);
}
translate([-230-47-60,75-14+20+60,0])rotate([0,180,0])difference(){cube([13,20,3]);
translate([8,9.7,-40])cylinder(r=3.2/2,h=200);
}
translate([-230-47-60,75-14+20,0])rotate([0,180,0])difference(){cube([13,20,3]);
translate([8,9.7,-40])cylinder(r=3.2/2,h=200);
}
translate([-230-47,75-14+20+60,0])rotate([0,180,0])cube([7,20,3]);
translate([-230-47,75-14+20,0])rotate([0,180,0])cube([7,20,3]);
translate([-230-70,75-14+60,0])rotate([0,180,0])cube([15,4,3]);
translate([-230,75-14+60,0])rotate([0,180,0])cube([15,4,3]);
translate([-230,75-14,0])rotate([0,180,0])difference(){cube([15,10,3]);
translate([7,3,-0.2])cylinder(r=3.2/2,h=20);
}
translate([-230,75-14+115,0])rotate([0,180,0])difference(){cube([15,10,3]);
translate([7,3+4,-0.2])cylinder(r=3.2/2,h=20);
}
}


module steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids(){
translate([-170+13,140-45,0])rotate([0,180,0])steppermotordriver_brd();
//translate([-170,75,0])rotate([0,180,0])steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids(47,53);
//translate([-170+25-5-30,129.5,0])rotate([0,180,0])cube([24,5,3]);
/*
translate([-170+25-5,140-46.5,0])rotate([0,180,0])difference(){cube([14,15,3]);
translate([5,7.3,0])cylinder(r=3.2/2,h=20);
}
*/

translate([-170+25-5,153,0])rotate([0,180,0])difference(){cube([14,15,3]);
translate([5,7.3,0])cylinder(r=3.2/2,h=20);
}
}

module electronics_configuration(){

translate([130,3+7,-50])rotate([-90,180,0])kill_button_leds_panelmount();

translate([400,55,0]){
azteeg_raspi_plate();
}
/*
translate([400,55,0]){
arduino_softpot_linearencoder_plate_washdry();
translate([-200,54,0])rotate([0,180,90])arduino_mega_base_template_bottomattach();
steppermotordriver_4setplate();
steppermotordriver_steppermotor_shields_5v_gnd_limit_pins_5endstops_4solenoids();


translate([-130,280-70,0])rotate([0,180,0])kill_signal_mosfet_brd(33,28);
translate([-105-8,180+75,0])rotate([0,180,0])fotek_solidstate_relay();
}
translate([20,-40,0]){
translate([-5,300,-45])rotate([0,0,0])color("")cube([45,70,35]);
}
azteeg_raspi_plate();

//power supply
//S-360-12 12V 30A power supply
translate([300,160,-40]){
 color("blue")cube([115,216,40]);
}

*/

}

//translate([15-25+229.5,206.5-11,-63+400])rotate([90,0,0])sandwich_sliderwheel_assy();
//slider_front_assy();

//filament_linearactuator();




module slider_front_assy(){
translate([0,3,0]){
//filament model
//pagg = 0.88; color([pagg,pagg,pagg])
//color("lime")
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80+45])rotate([-0,0,0])cylinder(r=6/1,h=300);
//ptagg = 0.38; color([ptagg,ptagg,ptagg])
//color("")
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80+53])rotate([-0,0,0])cylinder(r=10/1,h=10,$fn=6);
//agg = 0.2; color([agg,agg,agg])
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80])rotate([-0,0,0])cylinder(r=2/1,h=1000);
sgg = 0.6; color([sgg,sgg,sgg])
translate([208-16+16,188-16+16,342-35+30])rotate([90,0,0])inductivesensorcap();

sgg = 0.6; color([sgg,sgg,sgg])
translate([208-16+33.5,188-16+16-70+0+11.5,342-35+30+150-70])rotate([-90,0,0])linearactuator_filament_encodershuttle_filamentclamp();
translate([0,0,-3]){
translate([208,188,342])rotate([90,0,0])filament_linearactuator();
//inductive sensor
cgg = 0.5;color([cgg,cgg,cgg])
translate([208-16,188-16,342-35])cylinder(r=12/2,h=55);
}
/*
*/
}
translate([15-25+229.5,206.5-11,-63+400])rotate([90,0,0])sandwich_sliderwheel_assy();
//shuttle_front();
//translate([-100,-100,0])rotate([90,-90,0])linearactuator_cordglide();
//translate([15-25+460/2,206.5-15,-60+400])rotate([90,0,0])slider_x4();
}


module slider_front_assy_vertical_adjust_nema17(){
translate([0,3,0]){
//filament model
//pagg = 0.88; color([pagg,pagg,pagg])
//color("lime")
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80+45])rotate([-0,0,0])cylinder(r=6/1,h=300);
//ptagg = 0.38; color([ptagg,ptagg,ptagg])
//color("")
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80+53])rotate([-0,0,0])cylinder(r=10/1,h=10,$fn=6);
//agg = 0.2; color([agg,agg,agg])
//translate([208-16+33.5-7,188-16+16-70+0+11.5+31.5,342-35+30+150-70-80])rotate([-0,0,0])cylinder(r=2/1,h=1000);
sgg = 0.6; color([sgg,sgg,sgg])
translate([208-16+16,188-16+16,342-35+30])rotate([90,0,0])inductivesensorcap();

sgg = 0.6; color([sgg,sgg,sgg])
translate([208-16+33.5,188-16+16-70+0+11.5,342-35+30+150-70])rotate([-90,0,0])linearactuator_filament_encodershuttle_filamentclamp();
translate([0,0,-3]){
//translate([208,188,342])rotate([90,0,0])filament_linearactuator();
translate([208,188,342])rotate([90,0,0])filament_linearactuator_smaller_igus_slidermount_vertical_adjust_nema17();
//inductive sensor
cgg = 0.5;color([cgg,cgg,cgg])
translate([208-16,188-16,342-35])cylinder(r=12/2,h=55);
}
/*
*/
}
translate([15-25+229.5,206.5-11,-63+400])rotate([90,0,0])sandwich_sliderwheel_assy();
//shuttle_front();
//translate([-100,-100,0])rotate([90,-90,0])linearactuator_cordglide();
//translate([15-25+460/2,206.5-15,-60+400])rotate([90,0,0])slider_x4();
}







module inductivesensorcap(){
//import("files/inductive_attach.stl");
inductivesensorcap_aligner();

}


module inductivesensorcap_aligner(){
shm = 3.65;
psh = 6;
translate([-29,-4,10+psh])difference(){
cube([30-3.05,10,10]);
translate([shm,5,-0.5])cylinder(r=3.7/2,h=30);
translate([shm+17.3,5,-0.5])cylinder(r=3.7/2,h=30);
translate([12.3,10,6-psh])rotate([90,0,0])cylinder(r=11.5/2,h=40);
}
}


























module slider_back_assy(){
translate([0,0,-3]){
translate([208+24,188+40-6.5,342])color("")rotate([-90,180,0])shuttle_back();
translate([208+24-64,188+40-6.5-60+11.5,343+46])rotate([90,0,90])tslot20_2060(100);

//translate([0,0,-3]){
//translate([208+24-64+70,188+40-6.5-60+11.5+26,343+46+25])rotate([0,0,0])color("")wiper_clamp();

translate([15-25+460/2,206.5+15,-60+400])rotate([90,0,0]){
//color("")translate([-25-12,5+4,41-12])rotate([-90,0,0])import("files/gt2belt_holder.stl");
//color("")translate([-25-12-50,5+4,41-12])rotate([-90,0,0])import("files/gt2belt_holder.stl");

translate([0,0,4])rotate([0,180,0])gantryhead_back_slider_x4();
//slider_x4();
/*
difference(){
translate([-32,45,0.0])color("silver")cube([54,30-3.5,3.3]);
translate([10.5,64.,-10])cylinder(r=(5.7)/2,h=20);
translate([-19.5,64,-10])cylinder(r=(5.7)/2,h=20);
}
*/
}
}
}

module slider_assy(x,y){
translate([0,y,0]){
translate([0,-28,0]){
translate([x,0,0]){
//translate([190,52,420])rotate([180,0,90])color([160/255,160/255,160/255])camera_assy();
//translate([190+80,52+70+5.8,420-22-20])rotate([180,0,90])color([220/255,220/255,200/225])rotate([180,0,90])lasermount_assy();
//translate([15-25-150,206.5,-60+400])sandwich_sliderwheel_assy();

slider_front_assy_multichannel();
slider_back_assy();
}
}
}
}


module x_axis(x){

slider_assy(x);
translate([43-25,206.5-15,-60+430])rotate([-90,90,-90])tslot20(400);

//translate([43-25+303,206.5-15-400+108-0,-60+161.5-20])color("")rotate([0,180,90])multichannel_drypad();
//translate([4,206.5-15-400+270-0,-60+312-20])rotate([0,90,0])tslot20(400);

//iverntech_slider();


//translate([15-25,206.5,-60+400])rotate([0,0,-90])sliderwheel_assy();
//translate([15-25,206.5,-60+400])color("")wiper_clamp_yaxis();
//translate([15-25+460,206.5,-60+400])rotate([0,0,90])sliderwheel_assy();
}

module zdrive_assay(){
translate([220-1,362,15]){
nema17();
translate([0-100,0+10,-10])cylinder(r=12.7/2,h=320);
//translate([526.8-346.8,603.6,-0.1])cylinder(r=34.8/2,h=30);
translate([0,0,30])cylinder(r=8.7/2,h=320);
}
}



//color("")translate([0,60,0])back_plate_x1();
//front_plate_x1();
//back_plate_x1();
//slider_x4();
//based on DWG files
//m10 diam = 10.44
//m8 diam = 8.4
//slider_x4();
//XY_bearings_Right_x1();
//XY_bearings_Left_x1();

/*
projection(cut = false){
bottom_x1();
}
*/









module bottom_x1(){
translate([0,0,0])difference(){
cube([411.103,370.27,3]);

//translate([265+8-110,150+46-48-75,-100])cylinder(r=3.7/2,h=200);
translate([265+8-210,150-48-75+20,-100])cylinder(r=2.8/2,h=200);

//BOM_atxpowerconnect begin
translate([127.4,149.5,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.25-8,95,-20])cylinder(r=2.8/2,h=80);
translate([58.512-13.0,46.738-5,-20])cylinder(r=2.8/2,h=80);
translate([94.155-5.3,3.484+3.8,-20])cylinder(r=2.8/2,h=80);
}
//BOM_atxpowerconnect end

//BOM_conveyer_solenoids begin
translate([127.4+100-2,149.5-60,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.386,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([74.037,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([58.584,4.277,-50.1])cylinder(r=2.8/2,h=200);
}
//BOM_conveyer_solenoids end

//BOM_amplifier_brd begin
translate([127.4+20-2,135.5-60,-40])mirror([0,0,0])rotate([0,0,0]){
translate([4.2,29.2,-0.1])cylinder(r=2.8/2,h=200);
translate([59.8,31.2,-0.1])cylinder(r=2.8/2,h=200);
translate([8.422-4.3,80.4,-0.1])cylinder(r=2.8/2,h=200);
translate([59.7,84.30,-0.1])cylinder(r=2.8/2,h=200);
}
//BOM_amplifier_brd end

//BOM_washdrypcv_kill begin
translate([127.4-22.3,239.3,-40])mirror([0,0,0])rotate([0,180,-90]){
translate([28.235,90.424,-50])cylinder(r=2.8/2,h=200);
translate([72.286,92.913,-50])cylinder(r=2.8/2,h=200);
translate([5.587,4,-50])cylinder(r=2.8/2,h=200);
translate([91.698,4,-50])cylinder(r=2.8/2,h=200);
}
//BOM_washdrypcv_kill end
//BOM_azteeg begin
translate([351.1,220.3,0])rotate([0,0,90]){
translate([7,13,-50])cylinder(r=2.8/2,h=200);
translate([7,13+48,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13+48,-50])cylinder(r=2.8/2,h=200);
}
//BOM_azteeg end
//BOM_conveyer_pcb begin
translate([249,75.3,0])rotate([180,0,90]){
translate([25.334,93.131,-20.1])cylinder(r=2.8/2,h=60);
translate([114.619,92.881,-20.1])cylinder(r=2.8/2,h=60);
translate([7.577,6.348,-20.1])cylinder(r=2.8/2,h=60);
translate([114.369,6.348,-20.1])cylinder(r=2.8/2,h=60);
}
//BOM_conveyer_pcb end
//solidstate relay holes
//translate([-105-8,180+75,0])rotate([0,180,0])fotek_solidstate_relay();
translate([265+8-210,150-48-75+20,-100])cylinder(r=3.7/2,h=200);
for(i=[0:3]){
for(j=[0:3]){
translate([265+8-210+j*90,150-48-75+20+90*i,-100])cylinder(r=3.7/2,h=200);
}
}
//46
//translate([265+8-110,150+46-48-75+0,-100])cylinder(r=3.7/2,h=200);
translate([411.103-10,370.27-10,-100])cube([20,20,200]);
translate([-10,-10,-100])cube([20,20,200]);
translate([-10,370.27-10,-100])cube([20,20,200]);
translate([400,5,-100])cylinder(r=60/2,h=200);
translate([390+10,355+10,-100])cylinder(r=35/2,h=200);
translate([20-15,355+10,-100])cylinder(r=35/2,h=200);
translate([20-13,355-345,-100])cylinder(r=35/2,h=200);
}
}



module bottom_x1_wider(){
translate([-70-42,-28,0])difference(){
//cube([411.103+142+42,370.27+80+45,3]);
translate([-3,-2,0])cube([595+3,495+5,3]);

//translate([265+8-110,150+46-48-75,-100])cylinder(r=3.7/2,h=200);
//translate([265+8-210,150-48-75+20,-100])cylinder(r=2.8/2,h=200);

/*
//BOM_atxpowerconnect begin
translate([127.4,149.5,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.25-8,95,-20])cylinder(r=2.8/2,h=80);
translate([58.512-13.0,46.738-5,-20])cylinder(r=2.8/2,h=80);
translate([94.155-5.3,3.484+3.8,-20])cylinder(r=2.8/2,h=80);
}
//BOM_atxpowerconnect end

//BOM_conveyer_solenoids begin
translate([127.4+100-2,149.5-60,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.386,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([74.037,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([58.584,4.277,-50.1])cylinder(r=2.8/2,h=200);
}
//BOM_conveyer_solenoids end

//BOM_amplifier_brd begin
translate([127.4+20-2,135.5-60,-40])mirror([0,0,0])rotate([0,0,0]){
translate([4.2,29.2,-0.1])cylinder(r=2.8/2,h=200);
translate([59.8,31.2,-0.1])cylinder(r=2.8/2,h=200);
translate([8.422-4.3,80.4,-0.1])cylinder(r=2.8/2,h=200);
translate([59.7,84.30,-0.1])cylinder(r=2.8/2,h=200);
}
//BOM_amplifier_brd end

//BOM_washdrypcv_kill begin
translate([127.4-22.3,239.3,-40])mirror([0,0,0])rotate([0,180,-90]){
translate([28.235,90.424,-50])cylinder(r=2.8/2,h=200);
translate([72.286,92.913,-50])cylinder(r=2.8/2,h=200);
translate([5.587,4,-50])cylinder(r=2.8/2,h=200);
translate([91.698,4,-50])cylinder(r=2.8/2,h=200);
}
//BOM_washdrypcv_kill end
//BOM_azteeg begin
translate([351.1,220.3,0])rotate([0,0,90]){
translate([7,13,-50])cylinder(r=2.8/2,h=200);
translate([7,13+48,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13+48,-50])cylinder(r=2.8/2,h=200);
}
//BOM_azteeg end
//BOM_conveyer_pcb begin
translate([249,75.3,0])rotate([180,0,90]){
translate([25.334,93.131,-20.1])cylinder(r=2.8/2,h=60);
translate([114.619,92.881,-20.1])cylinder(r=2.8/2,h=60);
translate([7.577,6.348,-20.1])cylinder(r=2.8/2,h=60);
translate([114.369,6.348,-20.1])cylinder(r=2.8/2,h=60);
}
//BOM_conveyer_pcb end
//solidstate relay holes
//translate([-105-8,180+75,0])rotate([0,180,0])fotek_solidstate_relay();
translate([265+8-210,150-48-75+20,-100])cylinder(r=3.7/2,h=200);
for(i=[0:3]){
for(j=[0:3]){
translate([265+8-210+j*90,150-48-75+20+90*i,-100])cylinder(r=3.7/2,h=200);
}
}
*/

//46
//translate([265+8-110,150+46-48-75+0,-100])cylinder(r=3.7/2,h=200);
translate([411.103-10+142+42,370.27-10+80+42,-100])cube([20,20,200]);
translate([-10,-10,-100])cube([20,20,200]);
translate([-10,370.27-10+80+45,-100])cube([20,20,200]);
translate([400+142+42,5,-100])cylinder(r=60/2,h=200);
translate([390+142+10+42,355+80+10
+45,-100])cylinder(r=35/2,h=200);
translate([20-15,355+80+10+45,-100])cylinder(r=35/2,h=200);
translate([20-13,355-345,-100])cylinder(r=35/2,h=200);
}
}



module bottom_x1_wider_deeper(){
translate([-70-42,-28-60,0])difference(){
//cube([411.103+142+42,370.27+80+45,3]);
cube([595,495+60,3]);

//translate([265+8-110,150+46-48-75,-100])cylinder(r=3.7/2,h=200);
//translate([265+8-210,150-48-75+20,-100])cylinder(r=2.8/2,h=200);

/*
//BOM_atxpowerconnect begin
translate([127.4,149.5,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.25-8,95,-20])cylinder(r=2.8/2,h=80);
translate([58.512-13.0,46.738-5,-20])cylinder(r=2.8/2,h=80);
translate([94.155-5.3,3.484+3.8,-20])cylinder(r=2.8/2,h=80);
}
//BOM_atxpowerconnect end

//BOM_conveyer_solenoids begin
translate([127.4+100-2,149.5-60,-40])mirror([0,0,0])rotate([0,0,180]){
translate([5.386,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([74.037,34.422,-50.1])cylinder(r=2.8/2,h=200);
translate([58.584,4.277,-50.1])cylinder(r=2.8/2,h=200);
}
//BOM_conveyer_solenoids end

//BOM_amplifier_brd begin
translate([127.4+20-2,135.5-60,-40])mirror([0,0,0])rotate([0,0,0]){
translate([4.2,29.2,-0.1])cylinder(r=2.8/2,h=200);
translate([59.8,31.2,-0.1])cylinder(r=2.8/2,h=200);
translate([8.422-4.3,80.4,-0.1])cylinder(r=2.8/2,h=200);
translate([59.7,84.30,-0.1])cylinder(r=2.8/2,h=200);
}
//BOM_amplifier_brd end

//BOM_washdrypcv_kill begin
translate([127.4-22.3,239.3,-40])mirror([0,0,0])rotate([0,180,-90]){
translate([28.235,90.424,-50])cylinder(r=2.8/2,h=200);
translate([72.286,92.913,-50])cylinder(r=2.8/2,h=200);
translate([5.587,4,-50])cylinder(r=2.8/2,h=200);
translate([91.698,4,-50])cylinder(r=2.8/2,h=200);
}
//BOM_washdrypcv_kill end
//BOM_azteeg begin
translate([351.1,220.3,0])rotate([0,0,90]){
translate([7,13,-50])cylinder(r=2.8/2,h=200);
translate([7,13+48,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13,-50])cylinder(r=2.8/2,h=200);
translate([7+92,13+48,-50])cylinder(r=2.8/2,h=200);
}
//BOM_azteeg end
//BOM_conveyer_pcb begin
translate([249,75.3,0])rotate([180,0,90]){
translate([25.334,93.131,-20.1])cylinder(r=2.8/2,h=60);
translate([114.619,92.881,-20.1])cylinder(r=2.8/2,h=60);
translate([7.577,6.348,-20.1])cylinder(r=2.8/2,h=60);
translate([114.369,6.348,-20.1])cylinder(r=2.8/2,h=60);
}
//BOM_conveyer_pcb end
//solidstate relay holes
//translate([-105-8,180+75,0])rotate([0,180,0])fotek_solidstate_relay();
translate([265+8-210,150-48-75+20,-100])cylinder(r=3.7/2,h=200);
for(i=[0:3]){
for(j=[0:3]){
translate([265+8-210+j*90,150-48-75+20+90*i,-100])cylinder(r=3.7/2,h=200);
}
}
*/

//46
//translate([265+8-110,150+46-48-75+0,-100])cylinder(r=3.7/2,h=200);
translate([411.103-10+142+42,370.27-10+80+42,-100])cube([20,20,200]);
translate([-10,-10,-100])cube([20,20,200]);
translate([-10,370.27-10+80+45,-100])cube([20,20,200]);
translate([400+142+42,5,-100])cylinder(r=60/2,h=200);
translate([390+142+10+42,355+80+10+60
+45,-100])cylinder(r=35/2,h=200);
translate([20-15,355+80+10+45+60,-100])cylinder(r=35/2,h=200);
translate([20-13,355-345,-100])cylinder(r=35/2,h=200);
}
}











































module left_plate_x1_wider(){
//length = 370.736
//width = 62.81
translate([-52-45,0,-75])difference(){
//cube([370.2,62.814,3]);
translate([0,4,0])cube([495.2+5,60.51,3]);
translate([37.12,33.408,-0.1])cylinder(r=37.584/2,h=30);
//translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,49.65,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,48.65,-0.1])cylinder(r=5.365/2,h=30);
x = 58;
y = 35;
translate([62+120+60-180+180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0,2]){
translate([62+120+50+i*50-180+180,14-3,-50])cylinder(r=2.7/2,h=200);
translate([62+120+50+i*50-180+180,14-3+35,-50])cylinder(r=2.7/2,h=200);
}
translate([40,0,0]){

//right here
//translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);

translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7-9-6,-7+7-4,-3.1])cube([11+75+14,13+8,700]);
translate([-7-9-6+5,-7+7-4-14,-3.1])cube([11+75+14-10,13+8+28,700]);
}
}
translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}

translate([62+120+60-180+2+17,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*2),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*3),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
}
for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=2.8/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=2.8/2,h=200);
}
}
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([450,57.6-30,-0.1]){
//cube([78,45.6,5]);
cube([83,48,5]);
translate([83/2,48/2-(39/0.58)/2,0])cylinder(r=7/2,h=5);
translate([83/2,48/2+(39/0.58)/2,0])cylinder(r=7/2,h=5);
}
*/
//translate([142.2,17.2,-0.1])
//translate([142.2,79.6,-0.1])
//cylinder(r=7/2,h=5);
space = (29.2+20);
translate([230*0.58,55*0.58,0])rotate([0,0,90]){
/*
for(j=[2:4]){
for(i=[0:6]){translate([0,(-90-12.5-i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,(-90+12.5+i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2*0.58,-90-17/2-space*j*0.58,-1])rotate([0,0,0])cube([17*0.58,17*0.58,13]);
}
*/
/*
for(i=[0:4]){translate([(-17/2-25)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([(-17/2-14+50)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}

translate([(-17/2-14)*0.58,(-90-17/2-10)*0.58,-1])rotate([0,0,0])cube([(17+24)*0.58,170*0.58,13]);
*/
}
}
}
















module left_plate_x1_wider_deeper(){
//length = 370.736
//width = 62.81
translate([-52-45,0,-75])difference(){
//cube([370.2,62.814,3]);
cube([495.2+60,60.51,3]);
translate([37.12,33.408,-0.1])cylinder(r=37.584/2,h=30);
translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,49.65,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,48.65,-0.1])cylinder(r=5.365/2,h=30);
x = 58;
y = 35;
translate([62+120+60-180+180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50-180+180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180+180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([40,0,0]){

//right here
//translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);

translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7-9-6,-7+7-4,-3.1])cube([11+75+14,13+8,700]);
translate([-7-9-6+5,-7+7-4-14,-3.1])cube([11+75+14-10,13+8+28,700]);
}
}
translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}

translate([62+120+60-180+2+17,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*2),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*3),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
}
for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([450,57.6-30,-0.1]){
//cube([78,45.6,5]);
cube([83,48,5]);
translate([83/2,48/2-(39/0.58)/2,0])cylinder(r=7/2,h=5);
translate([83/2,48/2+(39/0.58)/2,0])cylinder(r=7/2,h=5);
}
*/
//translate([142.2,17.2,-0.1])
//translate([142.2,79.6,-0.1])
//cylinder(r=7/2,h=5);
space = (29.2+20);
translate([230*0.58,55*0.58,0])rotate([0,0,90]){
/*
for(j=[2:4]){
for(i=[0:6]){translate([0,(-90-12.5-i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,(-90+12.5+i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2*0.58,-90-17/2-space*j*0.58,-1])rotate([0,0,0])cube([17*0.58,17*0.58,13]);
}
*/
/*
for(i=[0:4]){translate([(-17/2-25)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([(-17/2-14+50)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}

translate([(-17/2-14)*0.58,(-90-17/2-10)*0.58,-1])rotate([0,0,0])cube([(17+24)*0.58,170*0.58,13]);
*/
}
}
}





















































module left_plate_x1(){
//length = 370.736
//width = 62.81
scale([1,1,1])difference(){
//cube([370.2,62.814,3]);
cube([370.2,60.51,3]);
translate([37.12,33.408,-0.1])cylinder(r=37.584/2,h=30);
translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,16.704,-0.1])cylinder(r=5.365/2,h=30);
translate([20.88,49.65,-0.1])cylinder(r=5.365/2,h=30);
translate([54.29,48.65,-0.1])cylinder(r=5.365/2,h=30);
x = 58;
y = 35;
translate([62+120+60-180+180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50-180+180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180+180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([40,0,0]){

//right here
//translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);

translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7-9-6,-7+7-4,-3.1])cube([11+75+14,13+8,700]);
}
}
translate([10,0,0]){
translate([62+120+60-180+2,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}

translate([62+120+60-180+2+17,14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*2),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
translate([62+120+60-180+2+(17*3),14+10,-50])rotate([0,0,0]){
translate([-7,-7+7,-3.1])cube([11,13,700]);
translate([-7+11/2,-7+7-8,-3.1])cylinder(r=4/2,h=200);
translate([-7+11/2,-7+7+21,-3.1])cylinder(r=4/2,h=200);
}
}
for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([450,57.6-30,-0.1]){
//cube([78,45.6,5]);
cube([83,48,5]);
translate([83/2,48/2-(39/0.58)/2,0])cylinder(r=7/2,h=5);
translate([83/2,48/2+(39/0.58)/2,0])cylinder(r=7/2,h=5);
}
*/
//translate([142.2,17.2,-0.1])
//translate([142.2,79.6,-0.1])
//cylinder(r=7/2,h=5);
space = (29.2+20);
translate([230*0.58,55*0.58,0])rotate([0,0,90]){
/*
for(j=[2:4]){
for(i=[0:6]){translate([0,(-90-12.5-i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,(-90+12.5+i/2-space*j)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2*0.58,-90-17/2-space*j*0.58,-1])rotate([0,0,0])cube([17*0.58,17*0.58,13]);
}
*/
/*
for(i=[0:4]){translate([(-17/2-25)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([(-17/2-14+50)*0.58,(-90+12.5+i/2-45+50*i)*0.58,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}

translate([(-17/2-14)*0.58,(-90-17/2-10)*0.58,-1])rotate([0,0,0])cube([(17+24)*0.58,170*0.58,13]);
*/
}
}
}












































//binding post
module binding_post_connector(){
difference(){
cube([49,95,2]);
translate([0,0,0]){
translate([5.5,12,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25*2,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25*3,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25*3,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25*2,-12])cylinder(r=2.8/2,h=20);
}
for(i=[0:4]){
translate([5.5+18,24+i*20,-12])cylinder(r=4.5/2,h=20);
//translate([2+14+8+2,24+5+i*20,-12])cylinder(r=4.5/2,h=20);
}
}
}


module cover_connector(){
difference(){
translate([0,95.5,0])cube([49,95-20,2]);
translate([0,0,0]){
translate([5.5,12,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25*2,-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+25*3,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25*3,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25,-12])cylinder(r=2.8/2,h=20);
translate([5.5+36,12+25*2,-12])cylinder(r=2.8/2,h=20);
for(i=[0:6]){
translate([5.5+36,12+(25*i),-12])cylinder(r=2.8/2,h=20);
translate([5.5,12+(25*i),-12])cylinder(r=2.8/2,h=20);
}

}
for(i=[0:5]){
translate([5.5+18,24+i*20,-12])cylinder(r=4.5/2,h=20);
//translate([2+14+8+2,24+5+i*20,-12])cylinder(r=4.5/2,h=20);
}
}
}


module right_plate_x1(){
//length = 370.736
//width = 62.81
space = (29.2+20);
difference(){
union(){
color("gray")cube([370.74,60.51,3]);
//translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb_otherend();
//translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])
//atx_power_sockets();
/*
translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])atx_power_socket_24pin();
translate([77.5+30-50+28,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
translate([77.5+30-50+28+35,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
*/
//atx_power_sockets();
/*
//atx_power_sockets();
//atx_power_socket_24pin();
//translate([38,19,0])atx_power_socket_8pin();
translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+29.2+20,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+(29.2+20)*4,20+3+0,5])rotate([0,0,90])rj45jack();
translate([77.5+30-50+(29.2+20)*2,20+3+0,5])rotate([0,0,90])justuniversal();
*/
}
translate([77.5+30-50,20+3+0,5-6])rotate([0,0,90])translate([15/2,20,0]){
j = 0.7;
//here is the orginal which I want to replace this is just a temp 
/*
translate([-17/2+3,-90-17/2-space*j,-1])cube([17,17+120,13]);
for(j=[-4:2]){
for(i=[0]){translate([0+20,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
for(i=[0]){translate([0+20-36,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
}
*/
//end tmp part

//translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
//translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
//usb
/*
for(j=[3:4]){
for(i=[0:6]){translate([0,-90-12.5-i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,-90+12.5+i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
translate([-17/2,-90-17/2-space*j,-1])cube([17,17,13]);
}
*/
}
x = 58;
y = 35;
translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([62+120+60-18,14+10,-50])rotate([0,0,0])translate([-7,-7-2,-3.1])cube([x+8+30,y+8-20+4,700]);
for(i=[0:2]){
translate([62+120+50+i*50-18,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-18,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
}




module right_plate_x1_wider(){
//length = 370.736
//width = 62.81
space = (29.2+20);
translate([-52-45,0,74])difference(){
union(){
translate([0,4,0])color("gray")cube([495.74+5,60.51,3]);
//translate([0,4,0])cube([495.2+5,60.51,3]);
//translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb_otherend();
//translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])
//atx_power_sockets();
/*
translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])atx_power_socket_24pin();
translate([77.5+30-50+28,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
translate([77.5+30-50+28+35,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
*/
//atx_power_sockets();
/*
//atx_power_sockets();
//atx_power_socket_24pin();
//translate([38,19,0])atx_power_socket_8pin();
translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+29.2+20,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+(29.2+20)*4,20+3+0,5])rotate([0,0,90])rj45jack();
translate([77.5+30-50+(29.2+20)*2,20+3+0,5])rotate([0,0,90])justuniversal();
*/
}
translate([77.5+30-50,20+3+0,5-6])rotate([0,0,90])translate([15/2,20,0]){
j = 0.7;
//here is the orginal which I want to replace this is just a temp 
/*
translate([-17/2+3,-90-17/2-space*j,-1])cube([17,17+120,13]);
for(j=[-4:2]){
for(i=[0]){translate([0+20,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
for(i=[0]){translate([0+20-36,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
}
*/
//end tmp part
//translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
//translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
//usb
/*
for(j=[3:4]){
for(i=[0:6]){translate([0,-90-12.5-i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,-90+12.5+i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
translate([-17/2,-90-17/2-space*j,-1])cube([17,17,13]);
}
*/
}
x = 58;
y = 35;
translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0,2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=2.8/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=2.8/2,h=200);
}
translate([62+120+60-18,14+10,-50])rotate([0,0,0])translate([-7,-7-2,-3.1])cube([x+8+30,y+8-20+4,700]);
for(i=[0,2]){
translate([62+120+50+i*50-18,14-3,-50])cylinder(r=2.8/2,h=200);
translate([62+120+50+i*50-18,14-3+35,-50])cylinder(r=2.8/2,h=200);
}
}
}



















module right_plate_x1_wider_deeper(){
//length = 370.736
//width = 62.81
space = (29.2+20);
translate([-52-45,0,74])difference(){
union(){
color("gray")cube([495.74+60,60.51,3]);
//translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb_otherend();
//translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])
//atx_power_sockets();
/*
translate([77.5+30-50-10,20+3+0-10,5])rotate([0,0,0])atx_power_socket_24pin();
translate([77.5+30-50+28,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
translate([77.5+30-50+28+35,20+3+0-10+19,5])rotate([0,0,0])atx_power_socket_8pin();
*/
//atx_power_sockets();
/*
//atx_power_sockets();
//atx_power_socket_24pin();
//translate([38,19,0])atx_power_socket_8pin();
translate([77.5+30-50,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+29.2+20,20+3+0,5])rotate([0,0,90])justusb();
translate([77.5+30-50+(29.2+20)*4,20+3+0,5])rotate([0,0,90])rj45jack();
translate([77.5+30-50+(29.2+20)*2,20+3+0,5])rotate([0,0,90])justuniversal();
*/
}
translate([77.5+30-50,20+3+0,5-6])rotate([0,0,90])translate([15/2,20,0]){
j = 0.7;
//here is the orginal which I want to replace this is just a temp 
/*
translate([-17/2+3,-90-17/2-space*j,-1])cube([17,17+120,13]);
for(j=[-4:2]){
for(i=[0]){translate([0+20,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
for(i=[0]){translate([0+20-36,-90-12.5-i/2-(25)*j+12,-1])cylinder(r=3.7/2,h=10);}
}
*/
//end tmp part
//translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
//translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
//usb
/*
for(j=[3:4]){
for(i=[0:6]){translate([0,-90-12.5-i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,-90+12.5+i/2-space*j,-1])cylinder(r=3.7/2,h=10);}
translate([-17/2,-90-17/2-space*j,-1])cube([17,17,13]);
}
*/
}
x = 58;
y = 35;
translate([62+120+60-180,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50-180,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-180,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([62+120+60-18,14+10,-50])rotate([0,0,0])translate([-7,-7-2,-3.1])cube([x+8+30,y+8-20+4,700]);
for(i=[0:2]){
translate([62+120+50+i*50-18,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50-18,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
}

































































module back_plate_plug_rise(){


//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([320,15,-0.1-29])difference(){
union(){
translate([-3,-3,0])cube([(48+6),(28+6),29]);
translate([-3+54/2-4,-3-7,0])cube([(8),(8),29]);
translate([-3+54/2-4,-3+34-2,0])cube([(8),(8),29]);
}
cube([(48),(28),35]);
translate([(48)/2,(28)/2-(39)/2,0])cylinder(r=4.2/2,h=35);
translate([(48)/2,(28)/2+(39)/2,0])cylinder(r=4.2/2,h=35);
}


}








module back_plate_x1_wider(){
x = 58;
y = 35;
//length = 410.3
//height = 60.5
//back_plate_plug_rise();

translate([-75,0,-30])difference(){
cube([599.3,60.5,3]);
translate([62+120+60,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50,14-3,-50])cylinder(r=2.8/2,h=200);
translate([62+120+50+i*50,14-3+35,-50])cylinder(r=2.8/2,h=200);
}
/*
translate([62+120+60-170,14+10-2,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20+1,700]);
for(i=[0:2]){
if(i==1){
 translate([62+120+50+(i*52)-170-2,14-3+35,-50])cylinder(r=3.7/2,h=200);
 translate([62+120+0+(i*52)-120-2,14-3,-50])cylinder(r=3.7/2,h=200);
}
}
*/
/*
 translate([62+120+0+(2*52)-120-2,14-3,-50])cylinder(r=3.7/2,h=200);

//conveyer_panel holes begin
translate([162,8-0.4,0])rotate([0,180,0]){
 //translate([23.158,9.088,-50.1])cylinder(r=4.2/2,h=200);
 translate([94.245,4.060,-50.1])cylinder(r=4.2/2,h=200);
 translate([5.346,36.9,-50.1])cylinder(r=4.2/2,h=200);
 translate([96.802,39.532,-50.1])cylinder(r=4.2/2,h=200);
}
*/
//conveyer_panel holes end
/*
translate([0,30,0])rotate([0,0,90]){
for(i=[0:4]){translate([-17/2-25,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([-17/2-14+50,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2-14,-90-17/2-10,-1])rotate([0,0,0])cube([17+24,170,13]);
}
translate([230,55,0])rotate([0,0,90]){
for(j=[2:4]){
for(i=[0:6]){translate([0,-90-12.5-i/2-space*j,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,-90+12.5+i/2-space*j,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2,-90-17/2-space*j,-1])rotate([0,0,0])cube([17,17,13]);
}
for(i=[0:4]){translate([-17/2-25,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([-17/2-14+50,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2-14,-90-17/2-10,-1])rotate([0,0,0])cube([17+24,170,13]);
}
*/
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([320,15,-0.1]){
cube([(48),(28),5]);
translate([(48)/2,(28)/2-(39)/2,0])cylinder(r=4.2/2,h=5);
translate([(48)/2,(28)/2+(39)/2,0])cylinder(r=4.2/2,h=5);
}
translate([70,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.5/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.5/2,h=15);
}
*/
/*
//usb for azteeg x5 mini
translate([70+70,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for head camera
translate([70+70+120,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for microcontroller 1
translate([70+70+60,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for microcontroller 2
translate([70+70-60,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
*/
/*
translate([105.0,24,-0.1])cube([78,45.6,5]);
translate([142.2,17.2,-0.1])cylinder(r=7/2,h=5);
translate([142.2,79.6,-0.1])cylinder(r=7/2,h=5);
*/
}
}


















module back_plate_x1(){
x = 58;
y = 35;
//length = 410.3
//height = 60.5
//back_plate_plug_rise();
scale([1,1,1])difference(){
cube([410.3,60.5,3]);
translate([62+120+60,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
translate([62+120+60-170,14+10-2,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20+1,700]);
for(i=[0:2]){
if(i==1){
 translate([62+120+50+(i*52)-170-2,14-3+35,-50])cylinder(r=3.7/2,h=200);
 translate([62+120+0+(i*52)-120-2,14-3,-50])cylinder(r=3.7/2,h=200);
}
}
 translate([62+120+0+(2*52)-120-2,14-3,-50])cylinder(r=3.7/2,h=200);

//conveyer_panel holes begin
translate([162,8-0.4,0])rotate([0,180,0]){
 //translate([23.158,9.088,-50.1])cylinder(r=4.2/2,h=200);
 translate([94.245,4.060,-50.1])cylinder(r=4.2/2,h=200);
 translate([5.346,36.9,-50.1])cylinder(r=4.2/2,h=200);
 translate([96.802,39.532,-50.1])cylinder(r=4.2/2,h=200);
}
//conveyer_panel holes end
/*
translate([0,30,0])rotate([0,0,90]){
for(i=[0:4]){translate([-17/2-25,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([-17/2-14+50,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2-14,-90-17/2-10,-1])rotate([0,0,0])cube([17+24,170,13]);
}
translate([230,55,0])rotate([0,0,90]){
for(j=[2:4]){
for(i=[0:6]){translate([0,-90-12.5-i/2-space*j,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:6]){translate([0,-90+12.5+i/2-space*j,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2,-90-17/2-space*j,-1])rotate([0,0,0])cube([17,17,13]);
}
for(i=[0:4]){translate([-17/2-25,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
for(i=[0:4]){translate([-17/2-14+50,-90+12.5+i/2-45+50*i,-1])rotate([0,0,0])cylinder(r=3.7/2,h=10);}
translate([-17/2-14,-90-17/2-10,-1])rotate([0,0,0])cube([17+24,170,13]);
}
*/
/*
//URBEST�Inlet Module Plug Fuse Switch Male Power Socket 10A 250V 3 Pin IEC320 C14
translate([320,15,-0.1]){
cube([(48),(28),5]);
translate([(48)/2,(28)/2-(39)/2,0])cylinder(r=4.2/2,h=5);
translate([(48)/2,(28)/2+(39)/2,0])cylinder(r=4.2/2,h=5);
}
translate([70,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.5/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.5/2,h=15);
}
*/
/*
//usb for azteeg x5 mini
translate([70+70,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for head camera
translate([70+70+120,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for microcontroller 1
translate([70+70+60,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
//usb for microcontroller 2
translate([70+70-60,20,-0.1]){
cube([(13),(12),5]);
translate([(13)/2-28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
translate([(13)/2+28.5/2,(12)/2,-0.1])cylinder(r=3.7/2,h=15);
}
*/
/*
translate([105.0,24,-0.1])cube([78,45.6,5]);
translate([142.2,17.2,-0.1])cylinder(r=7/2,h=5);
translate([142.2,79.6,-0.1])cylinder(r=7/2,h=5);
*/
}
}















module front_plate_x1_wider(){
//length = 410.33
//width = 60.516
x = 58;
y = 35;
translate([-75,4,54+45])difference(){
//cube([410.3+147+42,60.51,3]);
cube([599.3,60.51,3]);
translate([62,14+14,-50])rotate([0,0,0])translate([-7,-7.5,-2.9])cube([58,18+3,700]);
//translate([62,14,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8,y+8,700]);
translate([-1,2.8,0]){
translate([62+120+60,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
ff = 60;
translate([ff,19+10-15+2,-50])cylinder(r=4.2/2,h=200);
translate([ff+52.2,19+10-15+3,-50])cylinder(r=4.2/2,h=200);
translate([ff,19+10+15.3,-50])cylinder(r=4.2/2,h=200);
translate([ff+50.8,19+10+15.3,-50])cylinder(r=4.2/2,h=200);
}
}









module front_plate_x1(){
//length = 410.33
//width = 60.516
x = 58;
y = 35;
difference(){
cube([410.3,60.51,3]);
translate([62,14+14,-50])rotate([0,0,0])translate([-7,-7.5,-2.9])cube([58,18+3,700]);
//translate([62,14,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8,y+8,700]);
translate([-1,2.8,0]){
translate([62+120+60,14+10,-50])rotate([0,0,0])translate([-7,-7,-3.1])cube([x+8+30,y+8-20,700]);
for(i=[0:2]){
translate([62+120+50+i*50,14-3,-50])cylinder(r=3.7/2,h=200);
translate([62+120+50+i*50,14-3+35,-50])cylinder(r=3.7/2,h=200);
}
}
ff = 60;
translate([ff,19+10-15+2,-50])cylinder(r=4.2/2,h=200);
translate([ff+52.2,19+10-15+3,-50])cylinder(r=4.2/2,h=200);
translate([ff,19+10+15.3,-50])cylinder(r=4.2/2,h=200);
translate([ff+50.8,19+10+15.3,-50])cylinder(r=4.2/2,h=200);
}
}











module XY_bearings_Left_x1(){
//translate([0,-4.5,5])rotate([0,90,0])tslot20(200);
translate([0,15,-5])mirror([0,1,0]){
translate([(20.28*0.508),(48.24*0.508),5.3])color("silver")cylinder(r=(21.22*0.508)/2,h=5);
translate([(20.28*0.508),(48.24*0.508),-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=30);
color("silver")translate([0,0,20])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,20])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,20])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,25])cylinder(r=(17)/2,h=1);
}
translate([(52.8*0.508),(62.52*0.508)+12,-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=20);
color("silver")translate([0,0,10])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,10])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,10])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,15])cylinder(r=(17)/2,h=1);
}
}

scale([0.508,0.508,1])mirror([0,1,0])difference(){
union(){
color("silver")cube([61,63.60,3.3]);
translate([52.80,62.24,0])color("silver")cylinder(r=13,h=3.3);
}
translate([20.16,20.64,-0.1])cylinder(r=11.22/2,h=30);
translate([20.16,20.64,8.3-5])cylinder(r=21.22/2,h=5);
translate([53.28,20.32,-0.1-6])cylinder(r=9.25/2,h=12);
translate([53.28,20.32,5.5])cylinder(r=19.25/2,h=3);
translate([52.80,62.24,-0.1])cylinder(r=11.22/2,h=30);
}
}


module XY_bearings_Left_x1_3dprint(){
/*
//translate([0,-4.5,5])rotate([0,90,0])tslot20(200);
translate([0,15,-5])mirror([0,1,0]){
translate([(20.28*0.508),(48.24*0.508),5.3])color("silver")cylinder(r=(21.22*0.508)/2,h=5);
translate([(20.28*0.508),(48.24*0.508),-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=30);
color("silver")translate([0,0,20])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,20])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,20])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,25])cylinder(r=(17)/2,h=1);
}
translate([(52.8*0.508),(62.52*0.508)+12,-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=20);
color("silver")translate([0,0,10])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,10])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,10])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,15])cylinder(r=(17)/2,h=1);
}
}
*/
scale([0.508,0.508,1])mirror([0,1,0])difference(){
union(){
color("silver")cube([61+4+10,63.60+8+10,4.5+3]);
translate([52.80,62.24,0])color("silver")cylinder(r=13+3,h=4.5+3);
}
translate([20.16,20.64,-0.1])cylinder(r=11.22/2,h=30);
//translate([20.16,20.64,8.3-5])cylinder(r=21.22/2,h=5);
translate([53.28,20.32,-0.1-6])cylinder(r=9.25/2,h=12+5);
translate([53.28,20.32,5.5+2])cylinder(r=19.25/2,h=3);
translate([52.80,62.24,-0.1])cylinder(r=11.22/2,h=30);
}
}

















module XY_bearings_Right_x1(){
mirror([0,0,0]){
translate([(20.28*0.508),(48.24*0.508),5.3])color("silver")cylinder(r=(21.22*0.508)/2,h=5);
translate([(20.28*0.508),(48.24*0.508),-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=30);
color("silver")translate([0,0,20])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,20])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,20])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,25])cylinder(r=(17)/2,h=1);
}
translate([(52.8*0.508),(62.52*0.508),-0.1]){
cylinder(r=(11.22*0.508)/2,h=20);
color("silver")translate([0,0,10])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,10])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,10])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,15])cylinder(r=(17)/2,h=1);
}
}
scale([0.508,0.508,1])mirror([0,0,0])difference(){
union(){
color("silver")cube([61,63.60,3.3]);
translate([52.8,62.52,-0.0])color("silver")cylinder(r=13,h=3.3);
}
translate([53.16,20.28,-0.1])cylinder(r=9.25/2,h=20);
translate([53.16,20.28,5.5])cylinder(r=19.25/2,h=3);
translate([20.28,48.24,-0.1])cylinder(r=11.22/2,h=20);
translate([20.28,48.24,8.3-5])cylinder(r=21.22/2,h=5);
translate([52.8,62.52,-0.1])cylinder(r=11.22/2,h=20);
}
}

module XY_bearings_Right_x1_3dprint(){
/*
mirror([0,0,0]){
translate([(20.28*0.508),(48.24*0.508),5.3])color("silver")cylinder(r=(21.22*0.508)/2,h=5);
translate([(20.28*0.508),(48.24*0.508),-0.1]){
color("silver")cylinder(r=(11.22*0.508)/2,h=30);
color("silver")translate([0,0,20])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,20])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,20])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,25])cylinder(r=(17)/2,h=1);
}
translate([(52.8*0.508),(62.52*0.508),-0.1]){
cylinder(r=(11.22*0.508)/2,h=20);
color("silver")translate([0,0,10])cylinder(r=(13)/2,h=5);
color("black")translate([0,0,10])cylinder(r=(18)/2,h=5);
color("silver")translate([0,0,10])cylinder(r=(17)/2,h=1);
color("silver")translate([0,0,15])cylinder(r=(17)/2,h=1);
}
}
*/
scale([0.508,0.508,1])mirror([0,0,0])difference(){
union(){
translate([0,0,0])color("silver")cube([61+10,63.60+12,3.3+6]);
translate([52.8,62.52,-0.0])color("silver")cylinder(r=13,h=3.3+6);
}
translate([53.16,20.28,-0.1])cylinder(r=9.25/2,h=30);
translate([53.16,20.28,5.5+6])cylinder(r=19.25/2,h=3);
translate([20.28,48.24,-0.1])cylinder(r=11.22/2,h=30);
translate([20.28,48.24,8.3-5+6])cylinder(r=21.22/2,h=5);
translate([52.8,62.52,-0.1])cylinder(r=11.22/2,h=30);
}
}











module conveyer_slider_x4(){
th = 5;
color("lightgrey")
difference(){union(){

translate([-25,0,0])difference(){translate([0,-3,0])cylinder(r=20/2,h=th);}
translate([25,0,0])difference(){translate([0,-3,0])cylinder(r=20/2,h=th);}

translate([-15,29-20-5,0])
rotate([0,0,0]){
difference(){
union(){
translate([0,-17,0])cube([28,57.5+4,5+3]);
translate([0-15,-17+61.5/2-14,0])cube([28+32,28,5+3]);
//translate([14,5,0])cylinder(r=6.2/2,8);
//translate([14,5+16,0])cylinder(r=6.2/2,8);
translate([-106-4,102.5,0])rotate([0,0,-90]){
translate([175/2-8,240/2,0])cylinder(r=6.1/2,h=8+2.3+0.5);
translate([175/2,240/2+10,0])cylinder(r=6.1/2,h=8+2.3+0.5);
translate([175/2+8,240/2,0])cylinder(r=6.1/2,h=8+2.3+0.5);
}
}
translate([-15+15,22-4,0])translate([0,-3.115,-0.1])cylinder(r=(2.8)/2,h=36);
}
}
translate([10,-6,0])rotate([0,0,63])cube([47,20,th]);
translate([-32,36,0])rotate([0,0,-63])cube([47,20,th]);
difference(){union(){
translate([-24,29-42,0])rotate([0,0,0])cube([48,20,th]);
translate([-24,29,0])rotate([0,0,0])cube([48,20,th]);
translate([-24,-10,0])rotate([0,0,0])cube([48,50,th]);
translate([10-15,-6+40,0])rotate([0,0,-63])cube([47,20,th]);
translate([-32+19,36-40,0])rotate([0,0,63])cube([47,20,th]);
}

translate([-15,22,0])translate([0,-3.115,-0.1])cylinder(r=(6.7)/2,h=36);
translate([-25,0,0])translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);
translate([25,0,0])translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);
}


//translate([0,38.94,0])difference(){cylinder(r=7.68+2., h=th);}
translate([-25,38.94,0])difference(){cylinder(r=10, h=th);}//translate([-1+1.5,0,-0.1])cylinder(r=(5.7)/2,h=36);}
translate([25,38.94,0])difference(){cylinder(r=10, h=th);}//translate([1-1.5,0,-0.1])cylinder(r=(5.7)/2,h=36);}
}
//translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=7);
translate([-25+1.5-0.5,38.94,0])translate([-1,0,-6.1]){cylinder(r=(5.7)/2,h=36);translate([0,0,10])cylinder(r=(10.2)/2,h=10);}
translate([25-1.5+0.5,38.94,0])translate([1,0,-6.1]){cylinder(r=(5.7)/2,h=36);translate([0,0,10])cylinder(r=(10.2)/2,h=10);}

translate([-25+1.5-0.5,0-3.2,0])translate([-1,0,-6.1]){cylinder(r=(5.7)/2,h=36);translate([0,0,10])cylinder(r=(10.2)/2,h=10);}
translate([25-1.5+0.5,0-3.2,0])translate([1,0,-6.1]){cylinder(r=(5.7)/2,h=36);translate([0,0,10])cylinder(r=(10.2)/2,h=10);}
translate([-15,22,0])translate([0,-3.115,-0.5])cylinder(r=(2.8)/2,h=36);
translate([-15,22,0])translate([0,-3.115,-0.5])cylinder(r=(6.8)/2,h=5.5);
translate([-15,22,0])translate([0+20,-3.115+8,-0.5])cylinder(r=(6.8)/2,h=5.5);
translate([-15,22,0])translate([0+20,-3.115-8,-0.5])cylinder(r=(6.8)/2,h=5.5);

/*
translate([175/2-8,240/2-10+20,-4])cylinder(r=6.8/2,h=58.5);
translate([175/2+8,240/2-10+20,-4])cylinder(r=6.8/2,h=58.5);
*/


translate([25-1.5+0.5-15,0-3.2-3,0])translate([1,0,-6.1]){cylinder(r=(2.8)/2,h=36);}
translate([25-1.5+0.5-37,0-3.2-3,0])translate([1,0,-6.1]){cylinder(r=(2.8)/2,h=36);}

translate([25-1.5+0.5-15,0-3.2-3+49,0])translate([1,0,-6.1]){cylinder(r=(2.8)/2,h=36);}
translate([25-1.5+0.5-37,0-3.2-3+49,0])translate([1,0,-6.1]){cylinder(r=(2.8)/2,h=36);}

translate([-106-4-15,102.5+4,0])rotate([0,0,-90]){
translate([175/2-8,240/2,0])cylinder(r=2.8/2,h=128+2.3+0.5);
translate([175/2,240/2+10,0])cylinder(r=2.8/2,h=128+2.3+0.5);
translate([175/2+8,240/2,0])cylinder(r=2.8/2,h=8+122.3+0.5);
translate([175/2-8,240/2-10+20,-4])cylinder(r=2.8/2,h=20);
translate([175/2+8,240/2-10+20,-4])cylinder(r=2.8/2,h=20);

}




}
}

module conveyer_slider_x4_orig(){
color("silver")difference(){union(){
translate([-25,0,0])difference(){translate([0,-3,0])cylinder(r=20/2,h=3);translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);}
translate([25,0,0])difference(){translate([0,-3,0])cylinder(r=20/2,h=3);translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);}
translate([-15,29-20-5,0])rotate([0,0,0]){
translate([0,-17,0])cube([28,57.5+4,5+3]);
//translate([14,5,0])cylinder(r=6.2/2,8);
//translate([14,5+16,0])cylinder(r=6.2/2,8);
translate([-106-4,102.5,0])rotate([0,0,-90]){
translate([175/2-8,240/2,0])cylinder(r=6.1/2,h=8+3);
translate([175/2,240/2+10,0])cylinder(r=6.1/2,h=8+3);
translate([175/2+8,240/2,0])cylinder(r=6.1/2,h=8+3);
}
}
translate([10,-6,0])rotate([0,0,63])cube([47,20,3]);
translate([-32,36,0])rotate([0,0,-63])cube([47,20,3]);
difference(){union(){
translate([-24,29-42,0])rotate([0,0,0])cube([48,20,3]);
translate([-24,29,0])rotate([0,0,0])cube([48,20,3]);
translate([-24,-10,0])rotate([0,0,0])cube([48,50,3]);
translate([10-15,-6+40,0])rotate([0,0,-63])cube([47,20,3]);
translate([-32+19,36-40,0])rotate([0,0,63])cube([47,20,3]);
}
translate([-25,0,0])translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);
translate([25,0,0])translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=36);
}
translate([0,38.94,0])difference(){cylinder(r=7.68+2., h=3);
}
translate([-25,38.94,0])difference(){cylinder(r=10, h=3);translate([-1+1.5,0,-0.1])cylinder(r=(5.7)/2,h=36);}
translate([25,38.94,0])difference(){cylinder(r=10, h=3);translate([1-1.5,0,-0.1])cylinder(r=(5.7)/2,h=36);}
}
//translate([0,-3.115,-0.1])cylinder(r=(5.7)/2,h=7);
translate([-25+1.5,38.94,0])translate([-1,0,-6.1])cylinder(r=(5.7)/2,h=36);
translate([25-1.5,38.94,0])translate([1,0,-6.1])cylinder(r=(5.7)/2,h=36);
}
}













//projection(cut = false)slider_x4();
//slider_x4();
module slider_x4(){
color("silver")difference(){union(){
//translate([-34-0.65,39-0.5,0])cube([69.3,1,25]);
//translate([-2+2,-12+0.065,0])cube([1,60.94+26,25]);

difference(){cylinder(r=24/2,h=4.5);translate([0,-3.115,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
translate([-14,29-20,0])rotate([0,0,0])cube([28,40,4.5]);
translate([-24,29,0])rotate([0,0,0])cube([48,20,4.5]);
translate([10,-6,0])rotate([0,0,63])cube([47,20,4.5]);
translate([-32,36,0])rotate([0,0,-63])cube([47,20,4.5]);
translate([0,38.94,0])difference(){cylinder(r=7.68+2., h=4.5);
for(i=[-3,-2,-1,0,1,2,3]){
translate([0,i,-0.1])cylinder(r=(5.5+0.8)/2,h=6);//translate([0,1,-0.1])cylinder(r=(5+0.8)/2,h=6);
}
translate([0,-42,-0.1])cylinder(r=(5.5+0.8)/2,h=6);//translate([0,1,-0.1])cylinder(r=(5.5+0.8)/2,h=6);
}

//translate([-23.56,38.94,0])difference(){cylinder(r=10, h=3.3);translate([-1,0,-0.1])cylinder(r=(5.7+0.8)/2,h=6);}
//translate([23.56,38.94,0])difference(){cylinder(r=10, h=3.3);translate([1,0,-0.1])cylinder(r=(5.7+0.8)/2,h=6);}
//For 3D printing I like this
//translate([-23.56-0.5,38.94,0])difference(){cylinder(r=10, h=3.3);translate([-1,0,-0.1])cylinder(r=(5.7+0.8)/2,h=6);}
//translate([23.56+0.5,38.94,0])difference(){cylinder(r=10, h=3.3);translate([1,0,-0.1])cylinder(r=(5.7+0.8)/2,h=6);}
//For milling
translate([-25,38.94,0])difference(){cylinder(r=10, h=4.5);translate([-1,0,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
translate([25,38.94,0])difference(){cylinder(r=10, h=4.5);translate([1,0,-0.1])cylinder(r=(5.9+0.8)/2,h=36);}
}
translate([0,-3.115,-0.1])cylinder(r=(5.7+0.8)/2,h=6);
translate([0,38.94,0]){
for(i=[-1,0,1]){
translate([0,i,-0.1])cylinder(r=5.5/2,h=6);//translate([0,1,-0.1])cylinder(r=(5+0.8)/2,h=6);
}
}
//For 3D printing I like this
//translate([-23.56-0.5,38.94,0])translate([-1,0,-6.1])cylinder(r=(5.7+0.8)/2,h=16);
//translate([23.56+0.5,38.94,0])translate([1,0,-6.1])cylinder(r=(5.7+0.8)/2,h=16);
//For milling
translate([-25,38.94,0])translate([-1,0,-6.1])cylinder(r=(5.9+0.8)/2,h=36);
translate([25,38.94,0])translate([1,0,-6.1])cylinder(r=(5.9+0.8)/2,h=36);
}
}



module conveyer_connector_tslots(){

translate([0,0,20]){
//1.5 -- HFS5-2020-56-TPW-Z5-XA28 //we got to add this one so this one needs to be changed
translate([20+175,400-20,-5]){
rotate([0,0,0])tslot20(63.5);
//translate([15,0,63.5/2-1.75])rotate([-90,0,0])cylinder(r=5.7/2,h=400);
}

//3.1 This one is for supportng the back conveyer rail
//this one needs to be changed 
//HFS5-2020-160-TPW
translate([20+200-25,400-20+186-1,320])rotate([90,90,0]){
tslot20(160);
}
//3.2
translate([20+200-25,400-20+186-1,320-280])rotate([90,90,0]){
tslot20(160);
}
}

//SCTL1
//this one needs to be changed
//HFS5-2020-400-TPW-Z5-XA108-XB173.5-XC224.5-XE275.5-XE326.5-XF390
//This is the correct one
//HFS5-2020-400-TPW-Z5-XA108.5-XB159.5-XC210.5-XE261.5-XE312.5-XF390
translate([195,560,-65])tslot20(400);
//translate([195+15,760,325])rotate([90,0,0])cylinder(r=5.7/2,h=400);
for(i=[0:3]){
echo(108.5+(i*56)+65-20);
//translate([195+15,760,-65+108.5+(i*56)+65-20])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
}
//translate([195+15,760,-65+110])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
//HFS5-2020-400-TPW-Z5-XA110-XB173.5-XC224.5-XD275.5-XE326.5-XF390

//SCTL1

translate([20,380,105-3.5]){
translate([0,0,-6]){
//SCTL2 will be moved to conveyer_caller_tslots
//SCTL2 -- this one needs to be changed

//remove 190
//HFS5-2020-400-TPW-Z5-XA190 
//rotate([0,90,0])tslot20(400);
//translate([190,15,-400])rotate([0,0,0])cylinder(r=5.7/2,h=1000);
}
}
}



//gantry();
//import("pngfiles/bottom.stl");

module gantry(){
translate([0,0,20]){
//1 -- HFS5-2020-400-TPW-XA22-XB370-YA190 //this one needs to be changed
//blah
translate([20,400-20,0]){
rotate([0,90,0])tslot20(400);
//translate([22,400,-15])rotate([90,0,0])cylinder(r=5.7/2,h=500);
//translate([300+70,400,-15])rotate([90,0,0])cylinder(r=5.7/2,h=500);
//translate([190,400-385,-15-200])rotate([0,0,0])cylinder(r=5.7/2,h=500);
}


//3 -- 400 threaded profiles
//HFS5-2020-400-TPW.stl
translate([20,0,0])rotate([0,90,0])tslot20(400);
translate([20,400-20,320])rotate([0,90,0]){
//******** this hole needs to be added *****************
// so this one needs to be changed

//3.1 
//HFS5-2020-400-TPW-Z5-XA22-XB190-XC370
tslot20(400);
/*
translate([15-10+10,70+200,190])rotate([90,0,0])cylinder(r=5.7/2,h=300);
translate([15-10+10,70+200+40,370])rotate([90,0,0])cylinder(r=5.2/2,h=400);
translate([15-10+10,70+200+40,22])rotate([90,0,0])cylinder(r=5.2/2,h=400);
*/
}
//temporary remove for display
translate([20,0,320])rotate([0,90,0])tslot20(400);

//2 -- 400 drilled profiles at 10mm
//top 400mm rail
//HFS5-2020-400-TPW-XA10-XB390-YA10-YB390
translate([-5,400-15+20,320])rotate([90,90,0])tslot20(400);
translate([-5+420,400-15+20,320])rotate([90,90,0])tslot20(400);

translate([-5+20,400-15+20,320-200])rotate([90,90,0])tslot20(400);
translate([-5+200,400-15+20,320-220])rotate([0,0,180])tslot20innerbracket();
translate([-5+200,400-15+20-380,320-220])rotate([0,0,180])tslot20innerbracket();
translate([-5+200+45,400-15+20-380-23,320-220])rotate([0,0,0])tslot20innerbracket();
translate([-5+200+45,400-15+20-380-23+380,320-220])rotate([0,0,0])tslot20innerbracket();
translate([-5+20+370,400-15+20,320-200])rotate([90,90,0])tslot20(400);
//translate([-5,400-15+20,320-200])tslot20innerbracket();




//3.01 -- 360 threaded profiles
//HFS5-2020-360-TPW
translate([-5,400-15,0])rotate([90,90,0])tslot20(360);
translate([-5+420,400-15,0])rotate([90,90,0])tslot20(360);

//3.5 
//HFS5-2020-380-TPW-Z5-XA70-YA70
translate([-5,400-20,-25-60])rotate([0,0,0])tslot20(380);
//translate([-5+15,400-20+15+100,-15-70+70])rotate([90,0,0])cylinder(r=5.7/2,h=600);

//3.6 
//HFS5-2020-380-TPW-Z5-XA70-YA70
translate([-5+420,400-20,-25-60])rotate([0,0,0])tslot20(380);

//4 -- 380 threaded profiles at 70mm
//HFS5-2020-380-TPW-XA70-YA70
translate([-5+420,0,-25-60])rotate([0,0,0])tslot20(380);
translate([-5,0,-25-60])rotate([0,0,0])tslot20(380);

}
}




module linearactuator_filament_encodershuttle_filamentclamp(){
translate([-30+11.5,64,28])difference(){
cube([22,15+5-4+3-5,6-1.75-1+0.5]);
translate([18,6-1.2,-2])cylinder(r=3.7/2,h=20);
translate([18-13/2,6+10,3.75])rotate([90,90,0])cylinder(r=1.8/2,h=20);
translate([18-13,6-1.2,-2])cylinder(r=3.7/2,h=20);
}
}
//filament_linearactuator();
//rotate([0,180,0])filament_clamp();

//linearactuator_endstop_encoder();
//translate([-43+5.5+0.5+5,11-84,-3.6+10])translate([5-14+17.5-3,20+6-50,-5+14-2.75+2-3])cube([23+3-5,134,3]);

module motorclamp_filament_driver(){
//shorternema17();
cc = 0.8;color([cc,cc,cc])translate([-21+5,-40,20-1.5])color("grey")thinnermotormount();
difference(){
union(){
difference(){
color([cc,cc,cc])translate([-21-29+0.5,-21,3-48])cube([5,42,48]);
translate([-21-29+0.5-2,-21+9,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
translate([-21-29+0.5-2,-21+32,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
}
color([cc,cc,cc])translate([0,0,0])translate([-21-29+0.5,-21,3-20])cube([20+8+5,42,20+6-5]);
color([cc,cc,cc])translate([0,0,0])translate([-21-29+0.5,-21,0])cube([28+2+5,42,9-5]);
}
rotate([0,0,0])cylinder(r=20/2,h=30);
}
}
module linearactuator_endstop_encoder(){
translate([-100+15,18-170,20]){
translate([-4+12.5,-1,0])shorternema17();
difference(){
union(){
//compact extruder
color("")translate([-21+20-3,-21+20,3+6-5])compact_extruder();
//biqu extruder
/*
difference(){
translate([-21,-21,3+6])color("grey")cube([42,42,15]);
translate([-21+35,-21+5.5,3+6-20])cylinder(r=3.7/2,h=200);
translate([-21+35-30,-21+5.5,3+6-20])cylinder(r=3.7/2,h=200);
translate([-21+35,-21+5.5+30,3+6-20])cylinder(r=3.7/2,h=200);
translate([-21+35-30,-21+5.5+30,3+6-20])cylinder(r=3.7/2,h=200);
}
*/
//begin Other motor mount
//filament driver motor mount here it is
translate([-21-29+0.5+49.5+12.5,-21-1+23,3-48+45])filament_driver_assy_motormount();

/*
color("")difference(){
//color([cc,cc,cc])
translate([-21-29+0.5,-21-1,3-48])cube([5,42,48]);
translate([-21-29+0.5-2,-21+9,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
translate([-21-29+0.5-2,-21+32,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
}
cc = 0.8;color([cc,cc,cc])translate([0,0-1,0])translate([-21-29+0.5,-21,3-20])cube([20+8+5,42,20+6-5]);
cc = 0.8;color([cc,cc,cc])translate([0,0-1,0])translate([-21-29+0.5,-21,0])cube([28+2+5+32,42,9-5]);
//end Other motor mount
*/
/*
//translate([0,31,10.5+6])rotate([90,0,0])color("lightgrey")cylinder(r=10/2,h=30);
translate([0,31+20,10.5+6])rotate([90,0,0])color("white")cylinder(r=6/2,h=35);
translate([0,31+100,10.5+6])rotate([90,0,0])color("black")cylinder(r=2/2,h=250);
//translate([0,31-31,10.5+6])rotate([90,0,0])color("lightgrey")cylinder(r=10/2,h=30);
translate([0,31+20-82+1,10.5+6])rotate([90,0,0])color("white")cylinder(r=6/2,h=90);
translate([0,31+20-170,10.5+6])rotate([90-45,0,-45])color("white")cylinder(r=6/2,h=90);
*/
}
//rotate([0,0,0])cylinder(r=20/2,h=30);
}
}

//this right here for annotation
translate([-99,0,-1.5])rotate([0,90,0]){
translate([-53,-114,-13])linearactuator_filament_encodershuttle();
translate([-55-2.5,30-1,7])rotate([0,0,180])endstop_for_linearactuator();
translate([0,-0,0])color("lightgrey")linearactuator_igus_slidermount_encoder();
translate([-43+5.5+0.5,11-84,-3.6])color("lightgrey")linearactuator_igus_slidermount_encoder_part();
ed = 0.4; color([ed,ed,ed])
//color("pink")
translate([-43+5.5+0.5,11-84-5,-3.6+3])cube([28,100,3]);
translate([-38,-6,3])color("grey")igus_lowprofile_assy();
}

//spectra encoder
//translate([-43+5.5+0.5+5,11-84,-3.6+10])translate([5-14+17.5-3,20+6-50,-5+14-2.75+2-3])cube([23+3-5,134,3]);
}



module endstop_for_linearactuator(){
//ee = 0; color([ee,ee,ee])translate([-5,0,0])cube([5,10,20]);

ed = 0.5;color([ed,ed,ed])difference(){
union(){
translate([4,0,0])cube([5,10,30]);
translate([-0+4,0,-10])cube([5,10,10]);
translate([-4-1.25,-9,-10])cube([15,28,5]);
}
translate([2.5,-4.9,-20])cylinder(r=4.7/2,h=20);
translate([2.5,-4.9+20,-20])cylinder(r=4.7/2,h=20);
translate([-2,5,6+19])rotate([0,90,0]){cylinder(r=2.8/2,h=40);}//translate([0,0,4])cylinder(r=5.2/2,h=3+4,$fn=6);}
translate([-2,5,6])rotate([0,90,0]){cylinder(r=2.8/2,h=40);}//translate([0,0,4])cylinder(r=5.2/2,h=3+4,$fn=6);}
}
}



module endstop_for_conveyer(){

//for graphical purposes
//color("black")translate([5,-2.5,0])cube([10,15,30]);

/*
color([185/255,185/255,185/255])difference(){
union(){
cube([5,10,20]);
translate([2.5-17-5.6/2,-9.1,-10])cube([5.6,10,9]);
translate([-0,0,-10])cube([5,10,10]);
translate([-4-1.25-5-10,-9+9,-10])cube([10+15,28-9,5]);
}
//translate([2.5-17,-4.9+4,-20])cylinder(r=4.7/2,h=20);
translate([2.5-17,-4.9+15,-20])cylinder(r=4.7/2,h=20);
translate([-2,5,16])rotate([0,90,0]){cylinder(r=3/2,h=40);}
translate([-2,5,6])rotate([0,90,0]){cylinder(r=3/2,h=40);}
}
*/
difference(){
mirror([0,1,0])import("files/endstop_y.stl");
translate([62.5,-30,-0.1])cube([20,30,15]);
}
}





module filament_clamp(){
translate([-0.5,3,34.3])
difference(){
cube([22,10,3]);
translate([4.5,5,-10])cylinder(r=3.7/2,h=20);
translate([4.5+13,5,-10])cylinder(r=3.7/2,h=20);
translate([11,5+10,0])rotate([90,90,0])cylinder(r=1.75/2,h=20);
}
}
/*
//filament_linearactuator();
x = 8;
y = -30;
corexy_beltsetup(x,y);
translate([0,y,0]){
x_axis(x);
translate([20,217,400-50])rotate([0,0,-90])x_encoder_support();
}
*/


module filament_linearactuator(){
//translate([-40+2,-25+18.8,3])import("igus_sliders/TS_04_09_50_3.stl");
//translate([0,-10,3]){translate([-38,-40+18,4.5])import("igus_sliders/TW_04_09_4.stl");}
//translate([-49,-30-8,6])syringeplunger_formed_modular_linearactuator_igus_TW_04_07();
//translate([-38,-6,0])igus_lowprofile_assy();
sgg = 0.6; color([sgg,sgg,sgg])
//color("")
shuttle_front();
ssgg = 0.8; color([ssgg,ssgg,ssgg])
//color("lime")
translate([-25,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
//this is the linear actuator part
translate([48.47-80+4,92+3-130-2,16.0])rotate([0,0,180])smaller_igus_slidermount();
translate([48.5,-4.8,10]){
translate([-40+2,-25+18.8,3])
color("silver")
import("igus_sliders/TS_04_09_50_3.stl");
translate([0,-10,3]){translate([-38,-40+18,4.5])
color("silver")
import("igus_sliders/TW_04_09_4.stl");}
}
shh = 0.9;color([shh,shh,shh])
color("")
translate([-0.5,-37,22])filament_linearactuator_shuttle();
}








module filament_linearactuator_smaller_igus_slidermount_vertical_adjust_nema17(){
//translate([-40+2,-25+18.8,3])import("igus_sliders/TS_04_09_50_3.stl");
//translate([0,-10,3]){translate([-38,-40+18,4.5])import("igus_sliders/TW_04_09_4.stl");}
//translate([-49,-30-8,6])syringeplunger_formed_modular_linearactuator_igus_TW_04_07();
//translate([-38,-6,0])igus_lowprofile_assy();

sgg = 0.6; color([sgg,sgg,sgg])
//color("")
shuttle_front_vertical_adjust();
ssgg = 0.8; color([ssgg,ssgg,ssgg])
//color("lime")
translate([-25,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");


//this is the linear actuator part
translate([48.47-80+4,92+3-130-2,16.0+7])rotate([0,0,180])smaller_igus_slidermount_vertical_adjust_nema17();
translate([48.5,-4.8,10+7]){
translate([-40+2,-25+18.8,3])
color("silver")
import("igus_sliders/TS_04_09_50_3.stl");
translate([0,-10,3]){translate([-38,-40+18,4.5])
color("silver")
import("igus_sliders/TW_04_09_4.stl");}
}
shh = 0.9;color([shh,shh,shh])color("")translate([-0.5,-37,22+7])filament_linearactuator_shuttle();
}












module linearactuator_cordglide(){

difference(){union(){
//rotate([0,90,0])tslot20(200);
translate([0,-0,-25])cube([16,5,20+0]);
translate([0,-15-5-20,-35+25])cube([16,25+20,5]);
//translate([11+3,7.5-0.765/2,-4])
translate([-0,4,-18+0.1])cube([4,6,5.765]);
}
translate([8,-13-20,-15-0])rotate([0,0,0])cylinder(r=10/2,h=20);
translate([8+3,10,-15])rotate([90,0,0])cylinder(r=4.7/2,h=20);
}
}



module cordclamp(){
//rotate([0,90,0])tslot20(200);
difference(){
cube([50,18,3]);
translate([25,18,5])rotate([90,0,0])cylinder(r=7,h=18);
translate([7,9,-3])cylinder(r=4.7/2,h=20);
translate([50-7,9,-3])cylinder(r=4.7/2,h=20);
}
difference(){
translate([25,18,5])rotate([90,0,0])cylinder(r=10,h=18);
translate([25,18,5])rotate([90,0,0])cylinder(r=7,h=18);
translate([0,0,-30])cube([50,18,30]);
}
}



module raspi_azteeg_baseplate(){
difference(){union(){
translate([40-4,27,-7])raspi_plate();
raspi_smoothie_base_plate();
translate([-25,0,0])azteeg_controller();
}
translate([97.5,30.2+48,-10])cylinder(r=3.7/2,h=60);
}
}
//import("raspi_smartfriendz.stl");

module azteeg_controller(){
//to show PCB just this
//color("pink")
translate([51,-43,0])cube([108,70,4]);
translate([70,-30,10])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_azteeg",h=8);


difference(){
union(){
//import("raspi_smartfriendz.stl");
translate([51,-43,-7])cube([108,70,4]);
translate([51,-43,-7]){
translate([7,13,0])cylinder(r=6.7/2,h=8);
translate([7,13+48,0])cylinder(r=6.7/2,h=8);
translate([7+92,13,0])cylinder(r=6.7/2,h=8);
translate([7+92,13+48,0])cylinder(r=6.7/2,h=8);
}
}
translate([51+10,-43+10,-9])cube([108-25,70-20,14]);
translate([51,-43,-17]){
translate([7,13,0])cylinder(r=4.2/2,h=40);
translate([7,13+48,0])cylinder(r=4.2/2,h=40);
translate([7+92,13,0])cylinder(r=4.2/2,h=40);
translate([7+92,13+48,0])cylinder(r=4.2/2,h=40);
}
}
} 


module raspi_smoothie_base_plate(){
 translate([108-5-30+8-20+60,10,-7])cube([30,25,4]);
difference(){
union(){
 translate([108-5-30+8-20,-50,-7])cube([90,145,4]);
}
 translate([108-5-30,-30,-10])cube([70,105,14]);
 translate([108-5-30-4,-30-15,-10])cylinder(r=3.7/2,h=20);
 translate([108-5-30-4+76,-30-15,-10])cylinder(r=3.7/2,h=20);
 translate([0,135,0]){ 
 translate([108-5-30-4,-30-15,-10])cylinder(r=3.7/2,h=20);
 translate([108-5-30-4+76,-30-15,-10])cylinder(r=3.7/2,h=20);
 }
}
}
module raspi_plate(){
difference(){
union(){
cube([85,56,4]);
translate([3.5,3.5,3]){
cylinder(r=7/2,h=3);
translate([58,0,0])cylinder(r=7/2,h=3);
translate([0,48,0])cylinder(r=7/2,h=3);
translate([58,48,0])cylinder(r=7/2,h=3);
}
}
translate([10,10,0])cube([85-20,56-20,4]);
translate([3.5,3.5,0]){
cylinder(r=3/2,h=20);
translate([58,0,0])cylinder(r=3/2,h=20);
translate([0,48,0])cylinder(r=3/2,h=20);
translate([58,48,0])cylinder(r=3/2,h=20);
}
}
}


module azteeg_x5_mini_plate(){
translate([51,22,0])rotate([0,0,90])azteegx5_case();
}

//translate([-0.235,-20.2,0])cube([6,10,20]);


module smoothie_raspi(){
import("files/v1.STL");
}



module wiper_clamp(){
//for display
//surface
/*
translate([-25,25,-9.38-13])cube([50,50,3]);
translate([0,0,-4-2.5]){
translate([7.5,10+37.5+2+2.5,10])cylinder(r=6.5/2,h=5);
translate([7.5,52,-10+5])rotate([0,180,0])wiper_tip_m5(6);
color("pink")translate([7.5,10+37.5+2+2.5,-10])cylinder(r=4.7/2,h=20);
}
*/

difference(){
union(){
cube([15+9,55,6]);
translate([0,40+2,-6])cube([15,15+2.5,6+6]);
//5.765
translate([11+3,7.5-0.765/2,-4])cube([4+6-2,5.765,6]);
}
translate([20-6,20,-10.1])cube([15+9,55,17]);
translate([7.5,10,-6])cylinder(r=5.7/2,h=12);
translate([7.5,10+37.5+2+2.5,-10])cylinder(r=4.8/2,h=22);
translate([7.5,10+37.5+2+2.5,3])cylinder(r=11/2,h=5);
}
}



module wiper_clamp_yaxis(){

/*
//9mm from surface
//translate([7.5,52,-10+5])rotate([0,180,0])
translate([-26,0,-23])rotate([0,180,0])wiper_tip_m5(6);
translate([-26,0,-23+20-4])rotate([0,180,0])color("silver")cylinder(r=5/2,h=20);
color("pink")translate([-50,-30,-26-9])cube([50,50,4]);
*/
ll = 7;

translate([27.5,-7.5,0])rotate([0,0,90])difference(){
union(){
translate([0,3,0])cube([15+9-9,55-3,6]);
translate([0,40+2+2+1,-6-12-4+2])cube([15,15+2.5,6+6+12+8-4-2]);
//5.765
//translate([11+3,7.5-0.765/2,-4])cube([4+6,5.765,6]);
}
//translate([20-6,20,-10.1])cube([15+9,55,17]);
translate([7.5,30,-6])cylinder(r=5.7/2,h=12+7);
translate([7.5,10+37.5+2+2.5+1.5,-35])cylinder(r=4.5/2,h=122);
translate([7.5,10+37.5+2+2.5+1.5,-35+28])cylinder(r=12/2,h=30);
}
}









module shuttle_back(){
//translate([-30,39-7+15,28-26])rotate([0,90,0])tslot20(100);
//translate([24.8,0,3])rotate([0,180,0])color("")import("head_back.stl");
translate([-28.52,-10,0])difference(){
union(){
translate([9,-4,0])cube([73,53+4,5]);
//translate([9+22,-4,0])#cube([73-30,53+4-42,8]);
translate([19-10,20,0])cube([53,60,5]);
translate([19-10+6,66,0])cube([13,13,3.6]);
translate([19-10+36,66,0])cube([13,13,3.6]);
 translate([-25+8-30+14-5.2+35,22.5+10,0])rotate([90,0,0])cube([24+10,7,18]);
 translate([-25+8-30+14-5.2+35+64,22.5+10,0])rotate([90,0,0])cube([24+10,7,18]);
//translate([25-2,15+9,0])cube([25+6,13+16,3+7]);
}
 translate([-25+8-30+14-5.2+42+4,22.5-4+11-10,0-20])rotate([0,0,0])cube([4,8,30]);
 translate([-25+8-30+14-5.2+42+4+70,22.5-4+11-10,0-20])rotate([0,0,0])cube([4,8,30]);
 translate([3.8,29.5,-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([3.8,29.5-12,-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([-25+8-30+14-5.2+42+84,22.5-4+11,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([-25+8-30+14-5.2+42+84,22.5-4-12+11,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
translate([0,-16,-0.3])cube([33,23,10]);
translate([50,-9,-0.3])cube([33,23,10]);
//bearings screws
//here is the bearing screws adjustment
translate([60-8.5,72.35-1.3,-4-4.4])cylinder(r=5.7/2,h=42, $fn=30);
translate([30-8.6,72.35-1.3,-4-4.4])cylinder(r=5.7/2,h=42, $fn=30);
//translate([42-1.1,5.15-3.5,-4])cylinder(r=4.7/2,h=30, $fn=30);
//translate([42-1.1,5.15-3,-4])cylinder(r=4.7/2,h=30, $fn=30);
for(i=[0:12]){
translate([42-1.1,5.15+2.5-i/2,-4])cylinder(r=4.7/2,h=30, $fn=30);
}
translate([42-1.1,5.15+2.5,-4+7])rotate([90,0,0])#cylinder(r=2/2,h=300, $fn=30);
translate([42-1.1+25+1,5.15+42,-4])cylinder(r=4.7/2,h=30, $fn=30);
translate([42-1.1-25-1,5.15+42,-4])cylinder(r=4.7/2,h=30, $fn=30);
}
//belt clamp left side
translate([5,0,0])union(){
//translate([25,17.32+1.38,0])cube([15.6+7,3.62,10]);
translate([19.5,12.7,0])difference(){{translate([-1,0,0])cube([6+2,6,10]);translate([3.2,3,0]){cylinder(r=2.8/2,h=20);
translate([0,0,0])cylinder(r=6.8/2,h=10-7,$fn=6);
}}}
translate([25,17.32+1.38-14,0])difference(){cube([5.5+1,13.62+1,10]);translate([-10,5,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);
//translate([0,0,9-9])cylinder(r=6.8/2,h=13,$fn=6);
}}
}
//translate([24,12.8,0])difference(){cube([6,6,10]);translate([3.2,3,0]){cylinder(r=2.8/2,h=20);cylinder(r=6.8/2,h=13,$fn=6);}}
//belt clamp right side
translate([5,0,0]){
//translate([25-45.84-7.3+7.4,17.32+1.38,0])cube([15.6+2,3.62,10]);
translate([25-35.73,17.32+1.38-14-4,0])difference(){translate([0.6,4.1,0])cube([4.64+0.2+2,13.62+6-4,10]);translate([-10,5+4,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);
//translate([0,0,13])cylinder(r=6.8/2,h=3,$fn=6);
}}}
}

















module backextruder_clamp(){
difference(){
union(){
translate([0,40-1,0])cube([15,6,20]);
cube([15,55,6]);
translate([11,7.5-0.765/2,-2])cube([4,5.765,5]);
}
translate([7.5,10,-6])cylinder(r=4.7/2,h=12);
translate([7.5,50,22-6])rotate([90,0,0])cylinder(r=4.7/2,h=30);
}
}


module shuttle_front_vertical_adjust_wider_slider_wall(){
 difference(){
  union(){
  translate([49.7,31,25])slider_wall();
  //shuttle_front_vertical_adjust_wider();
  }
  translate([-6.5,-20,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,36,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([35,0,0]){
  translate([-6.5,-20,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,36,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  }
 }
}


module shuttle_front_vertical_adjust_wider_slider_wall_beltfix(){
 difference(){
  union(){
  //translate([49.7,31,25])slider_wall();
  shuttle_front_vertical_adjust_wider_iverntech();
 //color("")translate([-25+8,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
 translate([-25+8-30+14-5.2,22.5+2,0])rotate([90,0,0])cube([24+10,7,20]);
 translate([-25+8-30+14-5.2+60,22.5+2,0])rotate([90,0,0])cube([24+10,7,20]);
  }
 translate([-25+8-30+14-5.2+42+4-32,22.5-4+11-10-9,0-20])rotate([0,0,0])cube([4,8,30]);
 translate([-25+8-30+14-5.2+42+4+70-38,22.5-4+11-9-10,0-20])rotate([0,0,0])cube([4,8,30]);
 translate([-25+8-30+14-5.2+88,22.5-2,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([-25+8-30+14-5.2+88,22.5-2-12,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([-25+8-30+14-5.2+6,22.5-2,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
 translate([-25+8-30+14-5.2+6,22.5-2-12,0-50])rotate([0,0,0])cylinder(r=2.7/2,h=400,$fn=20);
  translate([-6.5,-20,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,-20+12.5,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17+12.5,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,36,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([35,0,0]){
  translate([-6.5,-20,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,-20+12.5,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,17+12.5,20]){translate([0,0,4.5])#cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  translate([-6.5,36,20]){translate([0,0,4.5])cylinder(r=3.7/2,h=30);translate([0,0,-20])cylinder(r=2.7/2,h=40);}
  }
 }
}










module slider_wall(){
translate([-90,0,-0.5])difference(){
translate([0-7.5-10-32+56+3,-40+20+10+3-8+22+3,0])cube([10+15+10+10+32-48,10,6+3-5+14]);
translate([13,-36+(0*10)+48+3,0]){cylinder(r=2.8/2,h=1000);}
translate([13+19,-36+(0*10)+48+3,0]){cylinder(r=2.8/2,h=1000);}
}
difference(){
union(){
translate([25-47.5,17.32+1.38-14-87,-13.5+13]){
translate([-2,-35,0])cube([4.64+2,13.62+1+22+58.5+35,10]);
translate([-2-35,-35,0])cube([4.64+2,13.62+1+22+55+37,10]);
translate([-2-35,4-40,0])cube([4.64+2+35,10,10]);
translate([-2-35,85,0])cube([4.64+2+30,10,10]);
}
}
translate([25-47.5-16.5-0.20+0.5,17.32+1.38-14-117-0.65,-13.5+13-20])cylinder(r=1.8/2,h=200);
translate([25-47.5-16.5-0.20+0.5,17.32+1.38-14-117-0.65+120,-13.5+13-20])cylinder(r=1.8/2,h=200);
translate([25-47.5-16.5-0.20+0.5,17.32+1.38-14-117-0.65+120+20,-13.5+13-20+18])rotate([90,0,0])cylinder(r=12/2,h=40);
translate([25-47.5-16.5-0.20+1,17.32+1.38-14-117-0.65+120+20,-13.5+13-20+18])rotate([90,0,0])cylinder(r=12/2,h=40);
translate([25-47.5-16.5-0.20,17.32+1.38-14-117-0.65+120+20,-13.5+13-20+18])rotate([90,0,0])cylinder(r=12/2,h=40);
}
}









module shuttle_front_vertical_adjust_wider(){
//color("")import("head_front.stl");

translate([-28.5,-10,0])difference(){
union(){
cube([73,53,3]);
//translate([25-2,15+9,0])cube([25+6,13+16,3+7+7]);
//translate([25-2,15+9,0])cube([25+6,13+16,3+7+7]);
//translate([25-2,15+9,0])cube([25+6,13,3+7+7]);
//translate([25-2+5,15+9,0])cube([25+6-10,13+16,3+7+7]);
}
///translate([25-2,15+9+10,3])rotate([0,0,60])cube([25+6,13+16,3+7+8+9]);
//translate([25-2+16,15+9+10+26,3])rotate([0,0,-60])cube([25+6,13+16,3+7]);
translate([0-3,-16-4,-0.3])cube([33+3,23,10]);
translate([47,-9,-0.3])cube([33,23,10]);
translate([32,32,-3]){
//translate([0,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
//translate([14,0-4,0]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([7,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
/*
//this is the middle hole going to try this out
translate([7,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
*/
//this is the first side I think its not necessary
translate([7-8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7-8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
//this is the other side I think its not necessary
translate([7+8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7+8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
}
//bearings screws
translate([42-1.1,5.15-0.15,-4])cylinder(r=6.2/2,h=30, $fn=30);
translate([42-1.1+25+1,5.15+42,-4])cylinder(r=6.2/2,h=30, $fn=30);
translate([42-1.1-25-1.,5.15+42,-4])cylinder(r=6.2/2,h=30, $fn=30);
}
/*
*/
//belt clamp left side
translate([+2,0,0])union(){
//translate([25,17.32+1.38,0])cube([15.6,3.62,10]);
translate([25,17.32+1.38-14,0])difference(){
translate([-4,0-30,0])cube([4.64+2+2,13.62+1+52,24.5]);translate([-10,5,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //  translate([0,0,9])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//end belt clamp
//belt clamp right side
translate([-1,0,0]){
//translate([25-45.84-7.3,17.32+1.38,0])cube([15.6+7.3,3.62,10]);
translate([25-35.73+2,17.32+1.38-14-4,0])difference(){translate([0,4.1-30,0])cube([4.64+2+2,13.62+6-4+22+29,24.5]);translate([-10,5+4,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //translate([0,0,13])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//inductor mount
translate([25-45.84-7.3-8,17.32+1.38-21.61-2,0])difference(){
translate([-2,-4,0])cube([15.6+7.3+4,7.8+4,10+6-0.5]);
translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);}
translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);}
translate([11.45,20,16])rotate([90,0,0])cylinder(r=11.5/2,h=40);
}
}




module shuttle_front_vertical_adjust_wider_iverntech(){
//color("")import("head_front.stl");

translate([-28.5,-10,0])difference(){
union(){
translate([0,-1.75-4,0])cube([73,53+4,5]);
//translate([25-2,15+9,0])cube([25+6,13+16,3+7+7]);
//translate([25-2,15+9,0])cube([25+6,13+16,3+7+7]);
//translate([25-2,15+9,0])cube([25+6,13,3+7+7]);
//translate([25-2+5,15+9,0])cube([25+6-10,13+16,3+7+7]);
}
///translate([25-2,15+9+10,3])rotate([0,0,60])cube([25+6,13+16,3+7+8+9]);
//translate([25-2+16,15+9+10+26,3])rotate([0,0,-60])cube([25+6,13+16,3+7]);
translate([0-3,-16-4,-0.3])cube([33+3,23,10]);
translate([47,-9-8,-0.3])cube([33,23,10]);
translate([32,32,-3]){
//translate([0,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
//translate([14,0-4,0]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([7,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
/*
//this is the middle hole going to try this out
translate([7,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
*/
//this is the first side I think its not necessary
translate([7-8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7-8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
//this is the other side I think its not necessary
translate([7+8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7+8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
}
//bearings screws
translate([42-1.1,5.15-0.15-3.5,-4])cylinder(r=5.7/2,h=30, $fn=30);
translate([42-1.1,5.15-0.15-3,-4])#cylinder(r=5.7/2,h=30, $fn=30);
translate([42-1.1,5.15-0.15-2.5,-4])#cylinder(r=5.7/2,h=30, $fn=30);
for(i=[0:12]){
#translate([42-1.1,5.15+2.5-i/2,-4])cylinder(r=5.7/2,h=30, $fn=30);
}
translate([42-1.1,5.15+2.5,-4+7])rotate([90,0,0])#cylinder(r=2/2,h=300, $fn=30);
/*
*/
translate([42-1.1+25+1,5.15+42,-4])cylinder(r=5.7/2,h=30, $fn=30);
translate([42-1.1-25-1.,5.15+42,-4])cylinder(r=5.7/2,h=30, $fn=30);
}
/*
*/
//belt clamp left side
translate([+2,0,0])union(){
//translate([25,17.32+1.38,0])cube([15.6,3.62,10]);
translate([25,17.32+1.38-14,0])difference(){
translate([-4,0-30-0.1,0])cube([4.64+2+2,13.62+1+52,24.5+0.5]);translate([-10,5,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([0.25,100,7])rotate([90,0,0])cylinder(r=2.8/2,h=300);
} //  translate([0,0,9])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//end belt clamp
//belt clamp right side
translate([-1,0,0]){
//translate([25-45.84-7.3,17.32+1.38,0])cube([15.6+7.3,3.62,10]);
translate([25-35.73+2,17.32+1.38-14-4-0.2,0])difference(){translate([0,4.1-30,0])cube([4.64+2+2,13.62+6-4+22+29,24.5+0.5]);translate([-10,5+4,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([4,100,7])rotate([90,0,0])cylinder(r=2.8/2,h=300);
} //translate([0,0,13])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//inductor mount
translate([25-45.84-7.3-8,17.32+1.38-21.61-2,0])difference(){
translate([-2,-4,0])cube([15.6+7.3+4,7.8+4,10+6-0.5]);
translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);}
translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);}
translate([11.45,20,16])rotate([90,0,0])cylinder(r=11.5/2,h=40);
}
}



















































module shuttle_front_vertical_adjust(){
//color("")import("head_front.stl");

translate([-28.5,-10,0])difference(){
union(){
cube([73,53,3]);
translate([25-2,15+9,0])cube([25+6,13+16,3+7+7]);
//translate([25-2,15+9,0])cube([25+6,13,3+7+7]);
//translate([25-2+5,15+9,0])cube([25+6-10,13+16,3+7+7]);
}
///translate([25-2,15+9+10,3])rotate([0,0,60])cube([25+6,13+16,3+7+8+9]);
//translate([25-2+16,15+9+10+26,3])rotate([0,0,-60])cube([25+6,13+16,3+7]);
translate([0-3,-16-4,-0.3])cube([33+3,23,10]);
translate([47,-9,-0.3])cube([33,23,10]);
translate([32,32,-3]){
//translate([0,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
//translate([14,0-4,0]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([7,-4,0])cylinder(r=2.8/2,h=30,$fn=30);
/*
//this is the middle hole going to try this out
translate([7,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
*/
//this is the first side I think its not necessary
translate([7-8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7-8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
//this is the other side I think its not necessary
translate([7+8,14-4,2.9]){cylinder(r=2.8/2,h=30,$fn=30);}//cylinder(r=6.8/2,h=5.5,$fn=6);}
translate([7+8,14-4,2.9+3+9]){difference(){
cylinder(r=10/2,h=30,$fn=30);
//cylinder(r=5/2,h=30,$fn=30);
}
}
}
//bearings screws
translate([42-1.1,5.15-0.15,-4])cylinder(r=6.2/2,h=30, $fn=30);
translate([42-1.1+25+1,5.15+42,-4])cylinder(r=6.2/2,h=30, $fn=30);
translate([42-1.1-25-1.,5.15+42,-4])cylinder(r=6.2/2,h=30, $fn=30);
translate([3.2,9,9-40])cylinder(r=7/2,h=130,$fn=6);
translate([3.2+17,9,9-40])cylinder(r=7/2,h=130,$fn=6);
}
//belt clamp left side
union(){
translate([25,17.32+1.38,0])cube([15.6,3.62,10]);
translate([25,17.32+1.38-14,0])difference(){
translate([-2,0,0])cube([4.64+2,13.62+1,10]);translate([-10,5,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //  translate([0,0,9])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//end belt clamp
//belt clamp right side
translate([25-45.84-7.3,17.32+1.38,0])cube([15.6+7.3,3.62,10]);translate([25-35.73,17.32+1.38-14-4,0])difference(){translate([0,4.1,0])cube([4.64+0.8+2,13.62+6-4,10]);translate([-10,5+4,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //translate([0,0,13])cylinder(r=6.6/2,h=3,$fn=6);}}
//inductor mount
translate([25-45.84-7.3,17.32+1.38-21.61,0])difference(){
translate([-2,-4,0])cube([15.6+7.3+4,7.8+4,10+6-0.5]);
//translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,10]){cylinder(r=6.8/2,h=3,$fn=6);translate([0-5.5,-2.94,0])cube([6.8,5.88,3.2]);}}
translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,-1]){cylinder(r=7/2,h=13,$fn=6);}}
//translate([0-5.5,-2.94,0])cube([6.8,5.88,3.2]);}}
//translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,10]){cylinder(r=6.8/2,h=3,$fn=6);translate([0.5,-2.94,0])cube([6.8,5.88,3.2]);}}
translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,-1]){cylinder(r=7/2,h=13,$fn=6);}}
translate([11.45,20,16])rotate([90,0,0])cylinder(r=11.5/2,h=40);
}
}














































module shuttle_front(){
//color("")import("head_front.stl");
translate([-28.5,-10,0])difference(){
union(){
cube([73,53,3]);
translate([25-2,15+9,0])cube([25+6,13+16,3+7]);
}
translate([25-2,15+9+10,3])rotate([0,0,60])cube([25+6,13+16,3+7]);
translate([25-2+16,15+9+10+26,3])rotate([0,0,-60])cube([25+6,13+16,3+7]);
translate([0-3,-16-4,-0.3])cube([33+3,23,10]);
translate([47,-9,-0.3])cube([33,23,10]);
translate([32,32,-3]){
cylinder(r=2.8/2,h=30,$fn=30);
translate([14,0,0]){cylinder(r=2.8/2,h=30,$fn=30);}
translate([7,14,0]){cylinder(r=2.8/2,h=30,$fn=30);}
}
//bearings screws
translate([42-1.1,5.15,-4])cylinder(r=5.7/2,h=30, $fn=30);
translate([42-1.1+25+1,5.15+42,-4])cylinder(r=5.7/2,h=30, $fn=30);
translate([42-1.1-25-1.,5.15+42,-4])cylinder(r=5.7/2,h=30, $fn=30);
translate([3.2,9,9-40])cylinder(r=7/2,h=130,$fn=6);
translate([3.2+17,9,9-40])cylinder(r=7/2,h=130,$fn=6);
}
//belt clamp left side
union(){
translate([25,17.32+1.38,0])cube([15.6,3.62,10]);
translate([25,17.32+1.38-14,0])difference(){
translate([-2,0,0])cube([4.64+2,13.62+1,10]);translate([-10,5,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //  translate([0,0,9])cylinder(r=6.6/2,h=3,$fn=6);}}
}
//end belt clamp
//belt clamp right side
translate([25-45.84-7.3,17.32+1.38,0])cube([15.6+7.3,3.62,10]);translate([25-35.73,17.32+1.38-14-4,0])difference(){translate([0,4.1,0])cube([4.64+0.8+2,13.62+6-4,10]);translate([-10,5+4,6.5])rotate([90,0,90]){cylinder(r=2.8/2,h=30,$fn=30);}} //translate([0,0,13])cylinder(r=6.6/2,h=3,$fn=6);}}
//inductor mount
translate([25-45.84-7.3,17.32+1.38-21.61,0])difference(){
translate([-2,-4,0])cube([15.6+7.3+4,7.8+4,10+6-0.5]);
//translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,10]){cylinder(r=6.8/2,h=3,$fn=6);translate([0-5.5,-2.94,0])cube([6.8,5.88,3.2]);}}
translate([2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,-1]){cylinder(r=7/2,h=13,$fn=6);}}
//translate([0-5.5,-2.94,0])cube([6.8,5.88,3.2]);}}
//translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,10]){cylinder(r=6.8/2,h=3,$fn=6);translate([0.5,-2.94,0])cube([6.8,5.88,3.2]);}}
translate([2.8+20-2.8,4-.08-2,0]){translate([0,0,-10])cylinder(r=3/2,h=40,$fn=30);translate([0,0,-1]){cylinder(r=7/2,h=13,$fn=6);}}
translate([11.45,20,16])rotate([90,0,0])cylinder(r=11.5/2,h=40);
}
}




























module slide_conveyer_caller(z,xx,xp,sph){
//translate([-36.25+0.5-60+30+215,-33+580-4,90])rotate([-90,0,90])conveyer_solenoid_pcb();

//SCTL1 will be moved to conveyer_caller_tslots
//SCTL1
//this one needs to be changed
//HFS5-2020-400-TPW-Z5-XA108-XB173.5-XC224.5-XE275.5-XE326.5-XF390
translate([145+30+25-5,560,-65])tslot20(400);
/*
translate([145+30+25-5+15,560+200,-65+327+63])rotate([90,0,0])cylinder(r=5.7/2,h=400);
translate([145+30+25-5+15,560+200,-65+327-.5])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
translate([145+30+25-5+15,560+200,-65+277-1.5])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
translate([145+30+25-5+15,560+200,-65+227-2.5])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
translate([145+30+25-5+15,560+200,-65+177-3.5])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
translate([145+30+25-5+15,560+200,-65+108])rotate([90,0,0])cylinder(r=5.7/2,h=1000);
*/


translate([20,380,105-3.5]){
translate([0,0,-6]){
//SCTL2 will be moved to conveyer_caller_tslots
//SCTL2 -- this one needs to be changed

/* should be no longer
//HFS5-2020-400-TPW-Z5-XA190 
rotate([0,90,0])tslot20(400);
//translate([40+150,15-0,-100])cylinder(r=5.7/2,h=3000); //we need this screw
translate([0,3,-205])rotate([0,-90,0])color("")tslot20innerbracket();
translate([220,3,-25])rotate([0,0,0])color("")tslot20innerbracket();
*/

}
/* also should be no longer
translate([150-22+30+20,203+5-3,-3])rotate([0,0,-90])color("pink")tslot20innerbracket_conveyer();
translate([150+30+22-0,-203+30-2,-3])rotate([0,0,90])color("")tslot20innerbracket_conveyer();
*/
}
//SCTL3,4,5,6
translate([0+25+25-5,0,10-3.5-8-12]){
for(i=[0:4]){
if(i==xp){
 translate([0,0,0])slide_conveyer(xx-255,117+(i*56),1,z,sph);
}
else {
 slide_conveyer(xx,117+(i*56),0,z,sph);
}
}
}
}




//color("silver")pressurecompensation_bottle();
//wash_waste_panel();
//washdry_pcv_pump_enclosure();
module pressure_compensation_bottle(){
translate([-695,120,210])rotate([0,0,90]){
//translate([-93,0,-170])tslot20(380);
translate([45-45,-45+45,96])rotate([0,0,90])
{
color("silver")nalgene_liquidsensor();
color("silver")nalgene_liquidsensor_cap();
}
translate([-45,45,-100])rotate([90,0,0]){
color("lightblue")import("/Users/richard/Documents/009Reprapcatcube010715/bottle.STL");
color("lightblue")translate([6.5,0,6.5])translate([0,180,0])import("/Users/richard/Documents/009Reprapcatcube010715/cap.STL");
}
//import("/Users/richard/Documents/009Reprapcatcube010715/3dprinting/pressurecompensation_bottle.stl");
//color("silver")import("/Users/richard/Documents/009Reprapcatcube010715/3dprinting/pressurecompensation_bottle.stl");
color("silver")pressurecompensation_bottle();
}
}


module pressurecompensation_bottle(){
difference(){
union(){
cylinder(r=55,10);
translate([-10,38,0])cube([20,25,25]);
translate([-70,-1,0])cube([30,20,30]);
translate([-70,-1-55,0])cube([10,75,30]);
translate([-70,-1-55,0])cube([10,18,40]);
}
translate([0,0,-1])cylinder(r=93/2,40);
translate([-5,30,-3])cube([10,40,29]);
translate([-80,-47,10])rotate([90,0,90]){cylinder(r=5.6/2,h=50);translate([0,0,15.1])cylinder(r=10.2/2,h=5);}
translate([-80,-47,30])rotate([90,0,90]){cylinder(r=5.6/2,h=50);translate([0,0,15.1])cylinder(r=10.2/2,h=5);}
//translate([-80,0,20])rotate([90,0,90])cylinder(r=5.6/2,h=50);
//translate([-65,0,20])rotate([90,0,90])cylinder(r=11.6/2,h=50);
translate([-30,55,15])rotate([90,0,90])cylinder(r=4.6/2,h=50);
}
}


/*
*/

module wash_waste_panel(){
color("white"){
translate([20,15,-0.1])cylinder(r=11.5/2,h=13);
translate([38,15,-0.1])cylinder(r=11.5/2,h=13);
}
difference(){
color("gray")cube([60,30,3]);
translate([7,15,-0.1])cylinder(r=3.7/2,h=4);
translate([60-7,15,-0.1])cylinder(r=3.7/2,h=4);
translate([20,15,-0.1])cylinder(r=6.5/2,h=20);
translate([38,15,-0.1])cylinder(r=6.5/2,h=20);
}
}

module syringepump_tube_panel(){
/*
color("white"){
translate([30,15,-0.1-10])cylinder(r=11.5/2,h=23);
//translate([38,15,-0.1])cylinder(r=11.5/2,h=13);
}
*/
difference(){
//color("gray")
cube([60,30,3]);
translate([7,15,-0.1])cylinder(r=3.7/2,h=4);
translate([60-7,15,-0.1])cylinder(r=3.7/2,h=4);
translate([30,15,-0.1])cylinder(r=6.5/2,h=20);
//translate([38,15,-0.1])cylinder(r=6.5/2,h=20);
}
}


module light_connector(){
union(){
difference(){

union(){
//translate([-36,40-2,13])rotate([-90,0,0])import("stls/mirrorball.stl"); //mirrorball();
translate([-36+5,42-4,13])cube([20,12,17]);
translate([-36+5-0,42-4,-2])cube([20,12,17+2]);
translate([-36+5-10,42-4,-8+5])cube([20+20,12,10]);
}

/*
for(i=[-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6]){
translate([-36+5+10,42-4+17,-2+i])rotate([90,90,0])cylinder(r=4.7/2,h=100);
}
*/
for(i=[-2:2]){
translate([-36+5+10+(i*8),42-4+17,2])rotate([90,90,0])cylinder(r=2.8/2,h=60);
}
translate([-36+5+10,42-4+17,13+10])rotate([90,90,0])cylinder(r=4.7/2,h=10);
translate([-36+5+10,42-4+8,13+10])rotate([90,90,0])cylinder(r=10/2,h=10);
}
}
}


module lasermount_connector(){
union(){
difference(){
union(){
translate([-36,40-2,13])rotate([-90,0,0])import("stls/mirrorball.stl"); //mirrorball();
translate([-36+5,42-4,13])cube([20,12,17]);
}
for(i=[-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6]){
translate([-36+5+10,42-4+17,-2+i])rotate([90,90,0])cylinder(r=4.7/2,h=100);
}
translate([-36+5+10,42-4+17,13+10])rotate([90,90,0])cylinder(r=4.7/2,h=10);
translate([-36+5+10,42-4+8,13+10])rotate([90,90,0])cylinder(r=10/2,h=10);
}
}
}


module lasermount_connector_two(){
union(){
difference(){
union(){
translate([-36+9,40-2,13])rotate([-90,0,0])import("stls/mirrorball.stl"); //mirrorball();
translate([-36+5+5,42-4,13])cube([15,12,15]);
}
for(i=[-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6]){
translate([-36+5+10+9,42-4+17,-2+i])rotate([90,90,0])cylinder(r=4.7/2,h=100);
}

/*
translate([-36+5+10,42-4+17,13+10])rotate([90,90,0])cylinder(r=4.7/2,h=10);
translate([-36+5+10,42-4+8,13+10])rotate([90,90,0])cylinder(r=10/2,h=10);
*/
}
}
}








module lasermount_assy(){
//translate([-62.5,24,-10])rotate([90,0,0])import("stls/cap.stl"); //cap();
//translate([10,40,-11])translate([10,-10,-10])rotate([0,0,0])lasermodule();

//lasermount_connector();
//rotate([0,180,0])import("stls/ballpart.stl");//ballpart();
difference(){union(){
translate([-20,30,-2])sphere(r=11);
//translate([-15-5,27.5,-11+5])cube([30,5,10]);
translate([-15-5,27.5+2.5,-11+5+4])rotate([90,0,90])cylinder(r=10/2,h=20);
}
//for(i=[-6,-5,-4,-3,-2,-1,0,1,2,3,4]){
for(i=[-7,-6,-2,2,3]){
translate([-20,50,i])rotate([90,0,0])cylinder(r=3.7/2,h=200);
}
//translate([-15-5-10,27.5-10,-11-5])cube([20,25,5]);
}
//translate([-15-10,25,-11])cube([35,10,10]);
//translate([-15,25,-11])cube([25,10,10]);

//laser holding part
translate([-10,0,0])difference(){
translate([10,20,-11])cube([20,20,20]);
translate([10,20,-11])
translate([10,10,-10])rotate([0,0,0])lasermodule();
}

}


//www.dx.com
//http://www.dx.com/p/100mw-532nm-green-laser-module-3v-11-9mm-26890.WKXIfxIrKRs
//100mW 532nm Green Laser Module (3V 11.9mm)
module lasermodule(){

l = 2.44 * 24.5;
diam = 0.47 * 24.5;
diam = 13.4;
cylinder(r=diam/2,h=l);
}


//translate([100,-50,100])rotate([90,0,0])nextgen_syringe10ml_assy();
//TW_04_12_slider
//color("lightgrey")translate([-56.5,200,104.45])rotate([90,90,0])syringe10ml_clipmount();
//nbg = 0.4;color([nbg,nbg,nbg])translate([-22.85,1,2.5])rotate([0,180,0])stepper_linear_m8nut_coupler();
//cbg = 0.55;color([cbg,cbg,cbg])translate([-25.75,123,-30])rotate([90,-90,0])syringeshuttle_clipbracket();



//translate([28,21,5])syringe_pcb_holder_back();

module syringe_pcb_holder_for_syringemodule(){
color("")difference(){
union(){
translate([-0,0,20])solenoid_endstop_brd(49.5,29);
translate([-25,6,20])cube([20,20,4]);
}
translate([-16.5,16,20-1])cylinder(r=5.4/2,h=20);
}
//translate([-0,0,20])cube([36+12,31,1.5]);

}


module nextgen_syringe10ml_assy(){
//board mount here
//color("pink")syringe_pcb_holder_for_syringemodule();
/*
*/
color("")
translate([0,98,0])syringe10mlmount_plungerfix_assy();

color(""){
//here is the luer lock
color("white")translate([-70+8+27-6,178-3,30-5+10])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6,178,30-5+10])rotate([90,0,0])cylinder(r=12/2,h=3);
//end luer lock
//tubing from valve to syringe
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:44]){translate([0,i/8-5,0])sphere(r=3.175/2,$fn=30);}
for(i=[0:232]){translate([-i/30,i/8+12/8,i/7.75])sphere(r=3.175/2,$fn=30);}
for(i=[0:80]){translate([-7.75,i/8+12/8+232/8,232/8+1])sphere(r=3.175/2,$fn=30);}
}
}
/*
*/
//end tubing
color("white")translate([-70+8+27-6,178-3+7,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6-3,178+4,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8+20,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11+23,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);

color(""){
//valve 1 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:200]){translate([-18-i/2,50,30-i/2])rotate([0,0,0])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
for(i=[0:450]){
translate([-18-200/2+i/2,50+i/8.5,30-200/2-i/10])rotate([0,0,0])sphere(r=3.175/2,$fn=30);
}

//end valve 1 direction tubing
//valve 2 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:800]){translate([-7.75,i/8+12/8+232/8+30,232/8+1])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-7.75-41,12/8+232/8+30+281,232/8+37-0.6])rotate([-0,90,0])cylinder(r=3.175/2,h=270); 
color("lightblue")translate([-7.75-41+270,12/8+232/8+30+281,232/8+37-0.6])rotate([60,90-24,0])cylinder(r=3.175/2,h=69); 

//end valve 2 direction tubing
}

translate([-41,-20+100,35])color("")rotate([0,90,90])syringe_10ml();
color("")translate([-56.5,200,104.45])rotate([90,90,0])syringe10ml_clipmount();

color("")translate([-70+8,-80+40-50,30-5])rotate([-90,0,0])cylinder(r=8.7/2,h=250);
color("")translate([-70+8,-80,30-5])rotate([-90,0,0])cylinder(r=16/2,h=18);
translate([-70+8,-80,30-5])rotate([-90,0,0])nema17();
color("")translate([-34+5-9-3,20-3.5,3])igus_TW_04_12_slider();
igus_slidermount_encoder_TW_04_12_motormount_assy_m8();
translate([-25-6.5,320,-4.6])rotate([90,0,0])tslot20(400);

translate([0,12,0]){
//sbg = 0.9;color([sbg,sbg,sbg])
color("")
translate([0,-4,0])igus_TW_04_12_slider_plate();
color("")translate([-25.75,123,-30])rotate([90,-90,0])syringeshuttle_clipbracket();
color("")translate([-22.85,1,2.5])stepper_linear_m8nut_coupler();
/*
//cbg = 0.55;color([cbg,cbg,cbg])
//nbg = 0.4;color([nbg,nbg,nbg])
*/
}
translate([-50,0,-13])valve_assy();
}






module iverntech_nextgen_syringe10ml_assy(){
//board mount here
//color("pink")syringe_pcb_holder_for_syringemodule();
/*
*/
color("")
translate([0,98,0])syringe10mlmount_plungerfix_assy();

/*
color(""){
//here is the luer lock
color("white")translate([-70+8+27-6,178-3,30-5+10])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6,178,30-5+10])rotate([90,0,0])cylinder(r=12/2,h=3);
//end luer lock
//tubing from valve to syringe
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:44]){translate([0,i/8-5,0])sphere(r=3.175/2,$fn=30);}
for(i=[0:232]){translate([-i/30,i/8+12/8,i/7.75])sphere(r=3.175/2,$fn=30);}
for(i=[0:80]){translate([-7.75,i/8+12/8+232/8,232/8+1])sphere(r=3.175/2,$fn=30);}
}
}
*/
//end tubing
color("white")translate([-70+8+27-6,178-3+7,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6-3,178+4,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8+20,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11+23,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);

color(""){
//valve 1 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:200]){translate([-18-i/2,50,30-i/2])rotate([0,0,0])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
for(i=[0:450]){
translate([-18-200/2+i/2,50+i/8.5,30-200/2-i/10])rotate([0,0,0])sphere(r=3.175/2,$fn=30);
}

//end valve 1 direction tubing
//valve 2 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:800]){translate([-7.75,i/8+12/8+232/8+30,232/8+1])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-7.75-41,12/8+232/8+30+281,232/8+37-0.6])rotate([-0,90,0])cylinder(r=3.175/2,h=270); 
color("lightblue")translate([-7.75-41+270,12/8+232/8+30+281,232/8+37-0.6])rotate([60,90-24,0])cylinder(r=3.175/2,h=69); 

//end valve 2 direction tubing
}

translate([-41,-20+100,35])color("")rotate([0,90,90])syringe_10ml();
color("")translate([-56.5,200,104.45])rotate([90,90,0])syringe10ml_clipmount();

color("")translate([-70+8,-80+40-50,30-5])rotate([-90,0,0])cylinder(r=8.7/2,h=250);
color("")translate([-70+8,-80,30-5])rotate([-90,0,0])cylinder(r=16/2,h=18);
translate([-70+8,-80,30-5])rotate([-90,0,0])nema17();
color("")translate([-34+5-9-3,20-3.5,3])igus_TW_04_12_slider();
igus_slidermount_encoder_TW_04_12_motormount_assy_m8();
translate([-25-6.5,320,-4.6])rotate([90,0,0])tslot20(400);

translate([0,12,0]){
//sbg = 0.9;color([sbg,sbg,sbg])
color("")
translate([0,-4,0])igus_TW_04_12_slider_plate();
color("")translate([-25.75,123,-30])rotate([90,-90,0])syringeshuttle_clipbracket();
color("")translate([-22.85,1,2.5])stepper_linear_m8nut_coupler();
/*
//cbg = 0.55;color([cbg,cbg,cbg])
//nbg = 0.4;color([nbg,nbg,nbg])
*/
}
translate([-50,0,-13])valve_assy();
}










module nextgen_syringe30ml_assy(){
//board mount here
//color("pink")syringe_pcb_holder_for_syringemodule();
/*
*/
color("")
translate([0,98,0])syringe30mlmount_plungerfix_assy();

/*
color(""){
//here is the luer lock
color("white")translate([-70+8+27-6,178-3,30-5+10])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6,178,30-5+10])rotate([90,0,0])cylinder(r=12/2,h=3);
//end luer lock
//tubing from valve to syringe
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:44]){translate([0,i/8-5,0])sphere(r=3.175/2,$fn=30);}
for(i=[0:232]){translate([-i/30,i/8+12/8,i/7.75])sphere(r=3.175/2,$fn=30);}
for(i=[0:80]){translate([-7.75,i/8+12/8+232/8,232/8+1])sphere(r=3.175/2,$fn=30);}
}
}
*/


/*
//end tubing
color("white")translate([-70+8+27-6,178-3+7,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27-6-3,178+4,30-5+10])translate([-18,50,30])rotate([90,0,90])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);
color("white")translate([-70+8+27+4,178-3+7-8+20,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=8/2,h=3);
color("white")translate([-70+8+27+4,178+4-11+23,30-5+10])translate([-18,50,30])rotate([90,0,0])cylinder(r=12/2,h=3);

color(""){
//valve 1 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:200]){translate([-18-i/2,50,30-i/2])rotate([0,0,0])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
for(i=[0:450]){
translate([-18-200/2+i/2,50+i/8.5,30-200/2-i/10])rotate([0,0,0])sphere(r=3.175/2,$fn=30);
}

//end valve 1 direction tubing
//valve 2 direction tubing
color("lightblue")translate([-70+8+27-6,178+4,30-5+10])
{
for(i=[0:800]){translate([-7.75,i/8+12/8+232/8+30,232/8+1])sphere(r=3.175/2,$fn=30);}
}
color("lightblue")translate([-7.75-41,12/8+232/8+30+281,232/8+37-0.6])rotate([-0,90,0])cylinder(r=3.175/2,h=270); 
color("lightblue")translate([-7.75-41+270,12/8+232/8+30+281,232/8+37-0.6])rotate([60,90-24,0])cylinder(r=3.175/2,h=69); 
//end valve 2 direction tubing
}
end microfluidics
*/

/*
translate([-41,-20+100,35])color("")rotate([0,90,90])syringe_10ml();

color("")translate([-70+8,-80+40-50,30-5])rotate([-90,0,0])cylinder(r=8.7/2,h=250);
color("")translate([-70+8,-80,30-5])rotate([-90,0,0])cylinder(r=16/2,h=18);
translate([-70+8,-80,30-5])rotate([-90,0,0])nema17();
*/

color("")translate([-56.5,200+30,104.45])rotate([90,90,0])syringe30ml_clipmount();

color("")translate([-34+5-9-3,20-3.5,3])igus_TW_04_12_slider();
igus_slidermount_encoder_TW_04_12_motormount_assy_m8();

translate([-25-6.5,320,-4.6])rotate([90,0,0])tslot20(400);
translate([0,12,0]){
//sbg = 0.9;color([sbg,sbg,sbg])
color("")
translate([0,-4,0])igus_TW_04_12_slider_plate();
color("")translate([-25.75,123-10,-30])rotate([90,-90,0])syringe30mlshuttle_clipbracket();
//color("")translate([-25.75,123,-30])rotate([90,-90,0])syringeshuttle_clipbracket();
color("")translate([-22.85,1,2.5])stepper_linear_m8nut_coupler();

/*
//cbg = 0.55;color([cbg,cbg,cbg])
//nbg = 0.4;color([nbg,nbg,nbg])
*/
}
//translate([-50,0,-13])valve_assy();
}



















































module openmv_connector(w=2.5) {
  translate([1.5, w, 5])
  difference() {
    rotate([90])
      scale([1.7,1])
      cylinder(r=5, h=w);
    rotate([90])
      translate([4,0,-2])
      cylinder(r=1.6, h=w+10, $fn=7);
    translate([-11.5, -3, -5])
    cube([10,4,10]);
  }
}
module openmv_connectors() {
  connector();
  translate([0, 5]) openmv_connector();
  translate([0, 10]) openmv_connector();
}


module md_justclip(){
translate([0, 15]) rotate([90]) difference() {
  //color("blue")
  translate([-10,0,0])cube([15+10, 10, 15]);
  //translate([0,4.5])
  //cube([10, 6.2, 15]);
}


module base() {
  cube([10,2,3]);
  translate([8,0])
    cube([2,2,5]);
}
translate([15, 1.5]) {
  difference(){
  union(){
  base();
  translate([0,5]) base();
  translate([0,10]) base();
  connectors();
  }
  }
}
}


module smd_justclip(){
translate([0, 15]) rotate([90]) difference() {
  //color("blue")
  translate([0,0,0])cube([15, 10, 15]);
  //translate([0,4.5])
  //cube([10, 6.2, 15]);
}
module base() {
  cube([10,2,3]);
  translate([8,0])
    cube([2,2,5]);
}
translate([15, 1.5]) {
  difference(){
  union(){
  base();
  translate([0,5]) base();
  translate([0,10]) base();
  connectors();
  }
  }
}
}














module mnt_md_justclip(dd){
  difference(){
  md_justclip();
  translate([-7+13-11,5+2,-5])cylinder(r=4/2,h=50);
  translate([-7+13-11,5+2,10-5])cylinder(r=9/2,h=5);
  }
}

module tslot_breadboard(){
difference(){
translate([-45,0,0])cube([30,20,4]);
translate([-38,10,0])cylinder(r=6.7/2,h=20);
}
difference(){
union(){
translate([-20,0,0])cube([17,20,20]);
}
translate([-40,0,15])rotate([0,45,0])cube([20,30,40]);
translate([-20,10,10])rotate([0,90,0])cylinder(r=5.7/2,h=300);
for(i=[0:30]){
translate([-20,10,10+i*0.5])rotate([0,90,0])cylinder(r=9.7/2,h=9);
}
}
}

//got to finish this here for the spacer
module filament_driver_assy_motormount_spacer(){
//color("pink")translate([-21-29+0.5,-21-1,3-48])
translate([-55+1.5-12,-22-18,-45])
difference(){
union(){
translate([4,19,0])cube([12,40,18]);
translate([4,19-14,0])cube([4,70,18]);
}
translate([-20,12,9])rotate([0,90,0])cylinder(r=6/2,h=76);
translate([-20,68.5,9])rotate([0,90,0])cylinder(r=6/2,h=76);
translate([30,0,0]){
translate([-20,28,9])rotate([0,90,0])cylinder(r=6/2,h=16);
translate([-20-4-20,28,9])rotate([0,90,0])cylinder(r=12/2,h=24);
translate([-20,28+23,9])rotate([0,90,0])cylinder(r=6/2,h=16);
translate([-20-4-20,28+23,9])rotate([0,90,0])cylinder(r=12/2,h=24);
}
}
}





module filament_driver_assy_motormount(){
difference(){
color([cc,cc,cc])translate([-21-29+0.5,-21-1,3-48])cube([5,42,48]);
translate([-21-29+0.5-2,-21+9,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
translate([-21-29+0.5-2,-21+32,3-48+9])rotate([0,90,0])cylinder(r=4.7/2,h=30);
}
cc = 0.8;color([cc,cc,cc])translate([0,0-1,0])translate([-21-29+0.5,-21,3-20])cube([20+8+5-7.5,42,20+6-5]);
difference(){
cc = 0.8;color([cc,cc,cc])translate([0,0-1,0])translate([-21-29+0.5,-21,0])cube([28+2+5+32,42,9-5]);
translate([-1,-1,-1])rotate([0,0,0])cylinder(r=26/2,h=30);
translate([-21+35,-21+5.5-1.1,3+6-20])cylinder(r=4.7/2,h=200);
translate([-21+35-30-1.1,-21+5.5-1.15,3+6-20])cylinder(r=4.7/2,h=200);
translate([-21+35,-21+5.5+30-0.2,3+6-20])cylinder(r=4.7/2,h=200);
translate([-21+35-30-1.2,-21+5.5+30,3+6-20])cylinder(r=4.7/2,h=200);
}
}


module electronics_setup(){
translate([320,150,-3])rotate([0,180,90])BOM_washdrypcv_kill();
translate([176-0,190+130-6,5])rotate([0,180,90])BOM_conveyer_pcb();
translate([176-0+100-88,190+35,-4])rotate([0,180,-90])BOM_amplifier_brd();
translate([200,300,-5])BOM_conveyer_solenoids();
translate([105,220,0])rotate([0,180,90])azteeg_controller();
translate([390,340,0])rotate([0,180,90])BOM_atxpowerconnect();
translate([69.2,14,-52])rotate([90,0,0])BOM_controlpanel();
translate([440-7,200-0.8+162,-63])rotate([90,0,-90]){
translate([40,17,-2])BOM_liquidlevel_pumps();
}
}



module electronics_stl(){
 //pcb_panels();
 translate([-100,50,55])rotate([0,0,-90])coverpanel_screw();
 translate([0,60,3])kill_button_leds_panelmount();
 translate([0,-70,0])syringe_pcb_holder_back();
 translate([-0,-30,0])syringe_pcb_holder();
 translate([60,-30,0])syringe_pcb_holder_cover();
translate([-50,-7,0])rotate([0,0,90])conveyer_pcb_holder_front();
translate([-50,-150,0])rotate([0,0,90])conveyer_pcb_holder_backsupport();
//translate([28,21,5])

/*
a = 1;
 translate([0*40,0,0])electronics_connectormod();
 translate([1*40,28,0])electronics_connectormod();
 translate([2*40,00,0])electronics_connectormod();
 translate([3*40,28,0])electronics_connectormod();

translate([0,-28,0]){
 translate([0*40,-28,0])electronics_connectormod();
 translate([1*40,0,0])electronics_connectormod();
 translate([2*40,-28,0])electronics_connectormod();
 translate([3*40,0,0])electronics_connectormod();
}
translate([0,-83,0]){
 translate([0*40,-28,0])electronics_connectormod();
 translate([1*40,0,0])electronics_connectormod();
 translate([2*40,-28,0])electronics_connectormod();
 translate([3*40,0,0])electronics_connectormod();
}
translate([240,-83,0])amplifier_brd_holder();
translate([433,-103,0])rotate([0,0,90])5stepper_brd_holder();
translate([610,100,7])rotate([0,180,90])atzeeg_mount_to_plate();
*/
}





module BOM_conveyer_solenoids(){
translate([-20,20,-5])color("black")rotate([0,0,0])mirror([0,1,0])write("BOM_conveyer_solenoids",h=8);

color("")difference(){
cube([83,39.5,3]);
translate([5.386,34.422,-5.1])cylinder(r=3.7/2,h=90);
translate([74.037,34.422,-5.1])cylinder(r=3.7/2,h=90);
translate([58.584,4.277,-5.1])cylinder(r=3.7/2,h=90);
}
}


module BOM_washdrypcv_kill(){
translate([-10,30,6])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_washdrypcv_kill",h=8);

color("")
difference(){
cube([99.3,95.7,3]);
translate([28.235,90.424,-30])cylinder(r=3.7/2,h=50);
translate([72.286,92.913,-30])cylinder(r=3.7/2,h=50);
translate([5.587,4,-30])cylinder(r=3.7/2,h=50);
translate([91.698,4,-30])cylinder(r=3.7/2,h=50);
}
}

module BOM_conveyer_pcb(){
translate([10,30,6])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_conveyer_pcb",h=8);
color("")
difference(){
cube([121,96.2,3]);
translate([25.334,93.131,-20.1])cylinder(r=3.7/2,h=60);
translate([114.619,92.881,-20.1])cylinder(r=3.7/2,h=60);
translate([7.577,6.348,-20.1])cylinder(r=3.7/2,h=60);
translate([114.369,6.348,-20.1])cylinder(r=3.7/2,h=60);
}
}


module BOM_atxpowerconnect(){
translate([0,30,6])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_atxpowerconnect",h=8);
color("")difference(){
cube([99,99.4,3]);
translate([5.25,95,-20])cylinder(r=4/2,h=80);
translate([58.512,46.738,-20])cylinder(r=4/2,h=80);
translate([94.155,3.484,-20])cylinder(r=4/2,h=80);
}
}

module BOM_amplifier_brd(){
translate([70,40,6])color("black")rotate([0,0,180])mirror([0,0,0])write("BOM_amplifier_brd",h=8);
color("")difference(){
cube([65.3,94.1,3]);
translate([4.5,31.88,-0.1])cylinder(r=3.5/2,h=20);
translate([57.577,31.88,-0.1])cylinder(r=3.5/2,h=20);
translate([8.422,87.643,-0.1])cylinder(r=3.5/2,h=20);
translate([59.533,87.643,-0.1])cylinder(r=3.5/2,h=20);
}
}

/*
module BOM_controlpanel(){
translate([0,40,6])color("black")rotate([0,0,0])mirror([0,0,0])write("BOM_controlpanel",h=8);
difference(){
cube([61.9,39.3,3]);
translate([5.772,33.154,-50.1])cylinder(r=3.5/2,h=200);
translate([56.627,33.256,-50.1])cylinder(r=3.5/2,h=200);
translate([5.772,5.117,-50.1])cylinder(r=3.5/2,h=200);
translate([57.957,6.038,-50.1])cylinder(r=3.5/2,h=200);
translate([15.186,20.875,-50.1])rotate([0,0,45])cylinder(r=9/2,h=200);
//translate([34.627,21.591,-50.1])rotate([0,0,45])cylinder(r=5.5/2,h=200);
translate([52.329,21.591,-50.1])rotate([0,0,45])cylinder(r=5.5/2,h=200);
}
}
*/
module BOM_liquidlevel_pumps(){
translate([100,30,-0])color("black")rotate([0,180,0])mirror([0,0,0])write("BOM_liquidlevel_pumps",h=8);
translate([81.7-4,0,0])rotate([0,180,0])translate([0,3,0])difference(){
cube([81.7,23.1,3]);
translate([4.2,10.721,-50.1])cylinder(r=3.5/2,h=200);
translate([12.8,11.8,-50.1])cube([10.4,2.7,200]);
translate([12.8,1.1,-50.1])cube([10.4,2.7,52]);
translate([77.892,10.721,-50.1])cylinder(r=3.5/2,h=200);
translate([54.1,11.8,-50.1])cube([15.5,2.7,200]);
translate([54.1,1.1,-50.1])cube([15.5,2.7,52]);
}
}

module BOM_conveyer_panel(){
translate([100,30,-0])color("black")rotate([0,180,0])mirror([0,0,0])write("BOM_conveyer_panel",h=8);
rotate([0,180,0])difference(){
cube([99.3,43.4,3]);
translate([23.158,9.088,-50.1])cylinder(r=4.2/2,h=200);
translate([94.245,4.060,-50.1])cylinder(r=3.5/2,h=200);
translate([5.346,36.9,-50.1])cylinder(r=3.5/2,h=200);
translate([96.802,39.532,-50.1])cylinder(r=3.5/2,h=200);
translate([9.4-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([32.25-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([57.7-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
translate([80.6-0.5,9.15-0.5,-50.1])cube([9.5+1,20.5+1,200]);
}
}

module boxcouplers(){
difference(){
union(){
translate([0,-10+71,-30+3.1])cube([10,14,18-3.1-3]);
translate([5,-10+71,-30+3.1])cube([10,14,8]);
}
translate([5,-5+10+71,-30-0.1+6])rotate([90,0,0])cylinder(r=2.8/2,h=50);
translate([-5-10,-5+10-8+71,-30-0.1+12])rotate([90,0,90])cylinder(r=2.8/2,h=50);
translate([10,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=2.8/2,h=50);
}
}

module boxcouplers_panelside(){
difference(){
union(){
translate([0,-10+71,-30+3.1])cube([10,14,18-3.1-3]);
translate([5,-10+71,-30+3.1])cube([10,14,8]);
}
translate([5,-5+10+71,-30-0.1+6])rotate([90,0,0])cylinder(r=2.8/2,h=50);
translate([-5-10,-5+10-8+71,-30-0.1+12-3])rotate([90,0,90])cylinder(r=2.8/2,h=50);
translate([10,-5+10-8+71,-40])rotate([0,0,0])cylinder(r=2.8/2,h=50);
}
}



module boxstandoff(){

difference(){
translate([0+20,-5+10,0])cube([20,20,3]);
translate([0+30,-5+20,-0.1])cylinder(r=5.7/2,h=10);
}
}


module linearactuator_igus_slidermount_encoder_assy(){
translate([-60,0,6]){
linearactuator_igus_slidermount_encoder();
translate([-43+5.5+0.5,11-84,-3.6])color("lightgrey")linearactuator_igus_slidermount_encoder_part();
}
}

module linearactuator_igus_slidermount_encoder_smoothpart(){
cube([22,135,2]);

}

module raspizerobase_extrusion(){
translate([-32,-14,-2-3])difference(){
union(){
cube([64,29,2]);
translate([3,2.5,0])cylinder(r=8/2,h=12);
translate([3,2.5+23,0])cylinder(r=8/2,h=12);
translate([3+58,2.5,0])cylinder(r=8/2,h=12);
translate([3+58,2.5+23,0])cylinder(r=8/2,h=12);
}
translate([3,2.5,-5])cylinder(r=2.5/2,h=30);
translate([3,2.5+23,-5])cylinder(r=2.5/2,h=30);
translate([3+58,2.5,-5])cylinder(r=2.5/2,h=30);
translate([3+58,2.5+23,-5])cylinder(r=2.5/2,h=30);

translate([3+20-3,2.5+10.6,-5-120])cylinder(r=4.5/2,h=300);
for(i=[-3:3]){
translate([3+20-3-i,2.5+10.6,-5-120])cylinder(r=4.5/2,h=300);
translate([3+20-3+20-i,2.5+10.6,-5-120])cylinder(r=4.5/2,h=300);
}
}
}

module raspizero_ribbon_cable(){
translate([31,-7.5,4])cube([20,15,1]);
translate([31+20,-7.5+15,4])rotate([0,-25,180])cube([20,15,1]);
translate([31+2-65,-7.5+15,4+9-6])rotate([0,0,180])cube([120-34-70-12-2,15,1]);
translate([31+2-120+34+5+12+2,-7.5+15-15,4+9-5])rotate([0,90,0])cube([40,15,1]);
translate([31+2-120+34+5+12+2,-7.5+15-15-48,4+9-5-40+15])rotate([0,90,0])cube([15,15+40,1]);
translate([31+2-120+34+5+12+2-33,-7.5+15-15-48,4+9-5-40+15])rotate([0,90,0])cube([15,1,33]);
translate([31+2-120+34+5+12+2-33,-7.5+15-15-48,4+9-5-40+15])rotate([0,90,0])cube([15,5,1]);
/*
translate([34,0,0])for(i=[0:25]){
translate([31+2-120+i*0.2+17,-7.5+15,4+9-55-5+45])rotate([1-i*2,0,180])cube([1,15,1]);
}
*/

/*
translate([31+2-120-50+3-1.5+34+55,-7.5+15-15+15-18-40+6+33,4+9-70+10+53-8])rotate([90,0,90])cube([20,15,1]);
translate([31+2-120-50+3-1.5+34+64.5,-7.5+15-15+15-18-40+6+33-44,4+9-70+10+53-15-23])rotate([90,-30,90+10])cube([60,15,1]);
*/
//translate([31+2-120-50+3-1.5-35+35,-7.5+15-15+15-18+9,4+9-70+10])rotate([90,0,90-15])cube([1,15,36]);
}


module bottom_bed_fix(){
translate([0,-93,16]){
difference(){
union(){
cube([30,30,4]);
translate([0,20,-8])cube([30,10,5+7]);
}
translate([5,10,0])cylinder(r=4.7/2,h=20);
translate([30-5,10,0])cylinder(r=4.7/2,h=20);
translate([5,30-4,-14])cylinder(r=2.8/2,h=20);
translate([30-5,30-4,-14])cylinder(r=2.8/2,h=20);
}
}
}


module iverntech_connector(){
translate([0,0,-30])rotate([0,0,0])translate([0,6,-5]){
difference(){
union(){
cube([60,18,4]);
translate([0,20-8+8-21,-4+4])cube([60,6,4+4]);
}
translate([10,9,-2])cylinder(r=5/2,h=10);
translate([10,9,-2+6])cylinder(r=11/2,h=10);
translate([10+40,9,-2])cylinder(r=5/2,h=10);
translate([10+40,9,-2+6])cylinder(r=11/2,h=10);
translate([5,9+14-5,-12+14.5])rotate([90,0,0])cylinder(r=2.7/2,h=60);
translate([5+25,9+14-5,-12+14.5])rotate([90,0,0])cylinder(r=2.7/2,h=60);
translate([5+50,9+14-5,-12+14.5])rotate([90,0,0])cylinder(r=2.7/2,h=60);
}
}
//rotate([0,90,0])tslot20(500);
}

module washplate_mount(){

 translate([129.75+(94*4)-1.5-103-332-70+32.5,276.5-4+25-50,11+3+24+3+165-7])difference(){
  translate([-2,0,0])cube([45,17,12+6]);
  translate([4.5,9,3])cylinder(r=8/2,h=30);
  translate([4.5+30,9,3])cylinder(r=8/2,h=30);
  translate([4.5,9,-0.2])cylinder(r=4/2,h=30);
  translate([4.5+30,9,-0.2])cylinder(r=4/2,h=30);
  translate([4.5+13-4,9,-0.2])cylinder(r=3.6/2,h=30);
  translate([4.5+13+13-4,9,-0.2])cylinder(r=3.6/2,h=30);
 }




}


module microfluidics_set(){
 washplate_mount();
 translate([129.75+(94*4)-1.5-103-332-70,276.5-4+25,11+3+24+3])color("")mirror([0,0,0])rotate([0,0,0]){microwell_plate_riser(144);} 

 translate([-70-4,-25+50,0+23]) color("lime")translate([129.75+(94*0)-1.5-103+75,276.5-4-60-10+10,11+187])rotate([0,180,90])import("wash_assy_for_show.stl");

/*
*/
translate([-480,200,-20]){
waterbottle();
waterbottle_tubes();
}
translate([-580,200,-20]){
waterbottle();
wastebottle_tubes();
}
translate([-99,340,300-60])rotate([0,0,180])nalgene_bottle_assy_electrocaloric();
translate([-300,200,-36])diaphragmpump_boxassy();

}



module zdrive_corexy(){
translate([120,0,0])
difference(){
union(){
translate([20.8,9.5,0])cube([41.3,80-0.79,5]);
difference(){union(){
translate([20.77,9.55,0])cube([8.64,66.5,22+4.5-2]);
translate([20.77+32.73,9.55,0])cube([8.64,66.5,22+4.5-2]);
}
translate([25.5+4-10,83.7-29+6,5])rotate([90,0,90])cylinder(r=10,h=39+30);
}
}
translate([25.5,83.7+0,-24])cylinder(r=3.7/2,h=40,$fn=20);
translate([25.5+32,83.7,-24])cylinder(r=3.7/2,h=40,$fn=20);
translate([25.5+32/2,83.7-44,0])cylinder(r=3.7/2,h=40,$fn=20);
translate([25.5+4,83.7-29,-2])cube([4,12,30]);
translate([25.5+4+20,83.7-29,-2])cube([4,12,30]);
translate([25.5-1.5,83.7-13,0])cylinder(r=2.7/2,h=40,$fn=20);
translate([25.5-1.5,83.7-13-19,0])cylinder(r=2.7/2,h=40,$fn=20);
translate([25.5-1.5,83.7-13-56,0])cylinder(r=2.7/2,h=40,$fn=20);
translate([25.5-1.5+35.0,83.7-13,0])cylinder(r=2.7/2,h=40,$fn=20);
translate([25.5-1.5+35,83.7-13-19,0])cylinder(r=2.7/2,h=40,$fn=20);
translate([25.5-1.5+35,83.7-13-56,0])cylinder(r=2.7/2,h=40,$fn=20);
}
}


module zdrive_corexy_beltplate_tslotconnect(){
difference(){
union(){
translate([141.55-0.5-10,79+0.71+9,17+12.7-1-13.1+9.05])cube([35+6+20,9+10,25+14-0.9-24-2]);
//translate([141.55-0.5,79+0.71+4.25,17+12.7-1-13.1+14])rotate([0,90,0])tslot20(100);
}
translate([-52,0,0]){
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
}
translate([-26,0,0]){
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
}
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
translate([141.55+4+6+20+4,79+4.7+20+30,21-0.25+10])rotate([90,0,0])cylinder(r=2.7/2,h=60,$fn=20);
//translate([141.55+4+6+20+4,79+4.7+20+30-49.5,21-0.25+10])rotate([90,0,0])cylinder(r=8.5/2,h=4.5,$fn=20);



translate([-28,0,0]){
translate([141.55+4+6+20+4,79+4.7+20+30,21-0.25+10])rotate([90,0,0])cylinder(r=2.7/2,h=60,$fn=20);
//translate([141.55+4+6+20+4,79+4.7+20+30-49.5,21-0.25+10])rotate([90,0,0])cylinder(r=8.5/2,h=4.5,$fn=20);
}




}


}

module zdrive_corexy_beltplate(){
//import("ToolChanger_-_Schlitten_Deckel-1.STL");
difference(){
union(){
//translate([0,0,-1.06])color("pink")import("ToolChanger_-_Schlitten-1.stl");
//translate([141.55-0.5,79+0.71+4.25,17+12.7-1-13.1+14])rotate([0,90,0])tslot20(100);
//translate([141.55-0.5-10,79+0.71+9,17+12.7-1-13.1+9.05])cube([35+6+20,9+10,25+14-0.9-24-2]);

translate([141.55-0.5,79+0.71,17+12.7-1-13.1])cube([35+6,9,25+14-0.9]);
translate([141.55+0.5-1,79+0.71-60.02,17+12.7+15+1])cube([35+6,9+56,9-1]);
translate([141.55+0.5-12.4,79+0.71-60.02,17+12.7+15+1])cube([64,24,9-1]);
translate([141.55+4-10+52/2,79+4.7-51+7,15.7])cylinder(r=10/2,h=35,$fn=20);
translate([141.55-12,79+0.71-20-10-30.017,17+12.7-1+2+1.55-1.55+0.5])cube([12,25,23-0.5]);
translate([141.55-12-5+6.05,79+0.71-20-10-30.017+22.5,17+12.7-1+2+1.55+20-20-1.55+0.5])rotate([90,0,0]){
for(i=[0:4]){
translate([i*2,0,0])cylinder(r=1.4/2,h=7,$fn=20);
translate([i*2,0,12])cylinder(r=1.4/2,h=7,$fn=20);
}
}
translate([52.2,0,0]){
translate([141.55-12,79+0.71-20-10-30.017,17+12.7-1+2+1.55-1.55+0.5])cube([12,25,23-0.5]);
translate([141.55-12-5+6.05+2,79+0.71-20-10-30.017+22.5,17+12.7-1+2+1.55+20-20-1.55+0.5])rotate([90,0,0]){
for(i=[0:4]){
translate([i*2,0,0])cylinder(r=1.4/2,h=7,$fn=20);
translate([i*2,0,12])cylinder(r=1.4/2,h=7,$fn=20);
}
}
}
}

translate([-52,0,0]){
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
}
translate([-26,0,0]){
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
}
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+5.9+4])rotate([0,0,90])cylinder(r=7.5/2,h=24,$fn=20);
translate([141.55+4+6+20+4+12,79+4.7+20+30-34.8,21-0.25+10-5-7+1])rotate([0,0,90])cylinder(r=3.5/2,h=10,$fn=20);
translate([141.55+4+6+20+4,79+4.7+20+30,21-0.25+10])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4+6+20+4,79+4.7+20+30-49.5,21-0.25+10])rotate([90,0,0])cylinder(r=8.5/2,h=4.5,$fn=20);


translate([-28,0,0]){
translate([141.55+4+6+20+4,79+4.7+20+30,21-0.25+10])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4+6+20+4,79+4.7+20+30-49.5,21-0.25+10])rotate([90,0,0])cylinder(r=8.5/2,h=4.5,$fn=20);
}


translate([141.55+4-10+52/2,79+4.7-51+7,15.7-30])cylinder(r=2.8/2,h=135,$fn=20);
translate([141.55+4+6,79+4.7+20+42.7-1.68,21-0.25])rotate([90,0,0])cylinder(r=6.5/2,h=60,$fn=20);
translate([141.55+4+6+20,79+4.7+20+42-0.95,21-0.25])rotate([90,0,0])cylinder(r=6.5/2,h=60,$fn=20);
translate([141.55+4+6,79+4.7+20+42-0.95,21-0.25+20])rotate([90,0,0])cylinder(r=6.5/2,h=60,$fn=20);
translate([141.55+4+6+20,79+4.7+20+42-0.95,21-0.25+20])rotate([90,0,0])cylinder(r=6.5/2,h=60,$fn=20);
translate([141.55+4+6,79+4.7+20,21-0.25])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4+6+20,79+4.7+20,21-0.25])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4+6,79+4.7+20,21-0.25+20])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4+6+20,79+4.7+20,21-0.25+20])rotate([90,0,0])cylinder(r=3.5/2,h=60,$fn=20);
translate([141.55+4,79+4.7,0])cylinder(r=2.8/2,h=60,$fn=20);
translate([141.55+4+32,79+4.7,0])cylinder(r=2.8/2,h=60,$fn=20);
translate([141.55+4-10,79+4.7-51,11])cylinder(r=3.7/2,h=48,$fn=20);
translate([141.55+4-10,79+4.7-51,51])cylinder(r=8.25/2,h=4,$fn=6);
translate([141.55+4-10+52,79+4.7-51,11])cylinder(r=3.7/2,h=49,$fn=20);
translate([141.55+4-10+52,79+4.7-51,51])cylinder(r=8.25/2,h=4,$fn=6);
translate([141.55+4-10+52-6.4,79+4.7-51+2,-0.2])cube([2.4,7.5,60]);
translate([141.55+4-10+52-6.4,79+4.7-51+2-12,-0.2])cube([2.4,7.5,60]);
translate([141.55+4-10+52-6.4-41.5,79+4.7-51+2,-0.2])cube([2.4,7.5,60]);
translate([141.55+4-10+52-6.4-41.5,79+4.7-51+2-12,-0.2])cube([2.4,7.5,60]);
}
}

































