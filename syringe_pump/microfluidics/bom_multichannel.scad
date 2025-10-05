include <modparts.scad> use<writescad/write.scad>





//multichannel_pipette_holder();
//import("pi_back.stl");

//pi_bottom_for_panel();

//pipette_p300_lts_model();
//multichannel_drypad();
//rotate([90,0,0])multichannel_solenoid_connect_part();
//remove_tip_solenoid_coupler();
//pipette_p200(5);
//zbed_washer_hold_plate_into_place();
//laser_zbed(144);
//filament_driver_assy_motormount();
//rotate([0,-90,0])filament_driver_assy_motormount_spacer();
//translate([208-16+16,188-16+16,342-35+30])rotate([90,0,0])inductivesensorcap();
//inductivesensorcap();
//translate([-36.25,-57,-4])
//slider_front_assy_multichannel();
//slider_assy(100);
//translate([-65,29,60])rotate([-90,0,0])multichannel_pipette_holder();
//p1000_model_eppendorf();
//shuttle_back();




module pipette_load_model(){
difference(){
cylinder(r1=4/2,r2=8/2,h=30, $fn=300);
//cylinder(r1=3/2,r2=8/2,h=49.5, $fn=300);
#translate([0,0,-0.1])cylinder(r1=2/2,r2=6.2/2,h=30.2, $fn=300);
}
}




module pipette_p300_lts_model(){
difference(){
cylinder(r1=0.5/2,r2=7/2,h=49.5, $fn=300);
//cylinder(r1=3/2,r2=8/2,h=49.5, $fn=300);
translate([0,0,1])cylinder(r1=0.5/2,r2=5.5/2,h=49.5, $fn=300);
}
}


//where the action is for the wider option
module multichannel_assy_wider(){
//color("")translate([-27.5,-38,-24])rotate([0,0,180])inductivesensorcap_aligner();
//color("")smaller_igus_slidermount_vertical_adjust_nema17();

translate([-38-1.5+1,-40+20+14-32+30-20,-2+15+3-5])rotate([0,0,0])color("silver")import("TS_04_09_150_2.stl");

translate([-70+33-1.5,-80-32-10,19-23])rotate([-90,0,0]){
translate([-40,21.1,23.5])color("")rotate([0,0,-90])motormount_centered();

translate([0,0,5])nema17();
translate([0,0,5])color("silver")cylinder(r=9/2,h=120+40);
}


translate([0-1.5,-22+55-45+32-50+50-20,0]){

//this is in actual design
translate([-31.8+33,53.5+5,-3-23-0.5])color("")stepper_linear_m8nut_coupler_vertical_adjust_nema17_wider();
translate([-38+1,-30-10,3+18-5])color("silver")rotate([0,0,0])import("igus_sliders/TW_04_09_4.stl");
color("")translate([-50+6,-115.5+7-4+130,1+56.5])rotate([180,0,180])stepper_linear_m8nut_endstopflag(6);
/* 
*/


translate([0-5.5,-35-4,13-11]){
//this one is the standard one 
//translate([0,0,-13.5])multichannel_pipette_holder_linear_actuator_connect();
//this one is the camera mount one
//This is envisioning the camera mount
//translate([-11.5+3.8+(9*5),80-1.5+0.5,-50+10-1.3])rotate([0,90,0])color("pink")miuzei_camera_breadboard_screwstub();


//This is in actual design
translate([0,0,-13.5])multichannel_pipette_holder_linear_actuator_connect_cameramount();


translate([-20,5,60])rotate([0,0,180])miuzei_camera_module();

/*
translate([-11.5+3.8+(9*5)-10+1+9,80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
translate([-11.5+3.8+(9*5)-10+1+9-(9*9),80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
translate([0-26-18,90-13.5-20+1,-50-13+5+120])rotate([-0,90,-0])miuzei_camera_breadboard();
translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5])rotate([0,0,90])connectionarms2(0);
translate([-18+2+3,100-21+10+1-49,-26.3+10-1.5])rotate([0,0,-90])connectionarms2(0);
translate([-35-10,90-50,64-37])rotate([90,0,0]){
translate([30,1,8])miuzei_cover();
//translate([30,0,0])miuzei_raspicam_base();
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
}
}
*/

}
/*
*/
/*
translate([0,-35,13]){
translate([-65,29,60])rotate([-90,0,0])multichannel_pipette_holder();
translate([-8,30-6.5,28.2])rotate([0,180,90])color("")tslot_clamp_filament_linearactuator_shuttle();
translate([-85,0,57])rotate([0,90,0])tslot20(100);
}
*/


/*
translate([-8,30-6.5,28.2])rotate([0,180,90])color("")tslot_clamp_filament_linearactuator_shuttle();
translate([-32,49.5,-11])rotate([0,0,0])color("")stepper_linear_m8nut_coupler_vertical_adjust_nema17_spacer(6);
translate([-31.8,53.5,-3])color("")stepper_linear_m8nut_coupler_vertical_adjust_nema17();
translate([-85,0,57])rotate([0,90,0])tslot20(100);
translate([-65,29,60])rotate([-90,0,0])multichannel_pipette_holder();
*/
}
/*
*/
}




module miuzei_camera_module(){
//translate([0-26-18,90-13.5,-50-13+5])rotate([-90,0,-90])
rotate([0,90,0])miuzei_camera_breadboard_a();
//import("BOM_inventory/build3/stls/miuzei_camera_breadboard_a.stl");
rotate([0,180,0])import("BOM_inventory/build3/stls/miuzei_camera_breadboard_b.stl");
//translate([0,0,11])rotate([0,90,0])miuzei_camera_breadboard_b();
/*
*/
translate([-212,-330-53,110+45])rotate([-90,0,0]){
translate([175-2+10,300-120,400])rotate([-90,0,90]){
translate([0,0,3+6])rotate([0,180,0])displayPiZero();
raspizerobase_extrusion();
color("white")raspizero_ribbon_cable();
}
}
/*
*/
translate([43,-57,-62]){
translate([-11.5+3.8+(9*5)-10+1+9+3,80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
translate([-11.5+3.8+(9*5)-10+1+9-(9*9),80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
}
/*
*/

/*
//translate([0-26-18,90-13.5-20+1,-50-13+5+120])rotate([-0,90,-0])miuzei_camera_breadboard();
rotate([0,90,0])miuzei_camera_breadboard_a();
translate([0,0,-4])rotate([0,180,0])import("BOM_inventory/build3/stls/miuzei_camera_breadboard_b.stl");
*/
translate([-17,40,-55])rotate([0,0,180]){
translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5])rotate([0,0,90])connectionarms2(40);
translate([-18+2+3,100-21+10+1-49,-26.3+10-1.5])rotate([0,0,-90])connectionarms2(40);
translate([-35-10,90-50,64-37])rotate([90,0,0]){
translate([30,1,8])miuzei_cover();
//translate([30,0,0])miuzei_raspicam_base();
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
}
}
}
/*
*/
}











module multichannel_pipette_holder_linear_actuator_connect(){
 difference(){union(){
 translate([-65,29,60])rotate([-90,0,0])multichannel_pipette_holder_noextrusion();
 translate([-8,30-6.5,28.2])rotate([0,180,90])color("")tslot_clamp_filament_linearactuator_shuttle_noextrusion();
 }
}
}

module multichannel_pipette_holder_linear_actuator_connect_cameramount(){
 difference(){union(){
 translate([-65,29,60])rotate([-90,0,0]) multichannel_pipette_holder_camera_example();
 translate([-8,30-6.5,28.2])rotate([0,180,90])color("")tslot_clamp_filament_linearactuator_shuttle_noextrusion();
 }
}
}




module multichannel_assy(){
color("")translate([-27.5,-38,-24])rotate([0,0,180])inductivesensorcap_aligner();
color("")smaller_igus_slidermount_vertical_adjust_nema17();
translate([-38,-40+20+14,-2])color("silver")import("TS_04_09_105_2.stl");
translate([-70,-80,19])rotate([-90,0,0]){
nema17();
color("silver")cylinder(r=9/2,h=120);
}
translate([0,-25,0]){
translate([-38,0,3])color("silver")import("igus_sliders/TW_04_09_4.stl");
translate([-27,29.5,8])rotate([0,0,180])color("")filament_linearactuator_shuttle();
translate([-8,30-6.5,28.2])rotate([0,180,90])color("")tslot_clamp_filament_linearactuator_shuttle();
translate([-32,49.5,-11])rotate([0,0,0])color("")stepper_linear_m8nut_coupler_vertical_adjust_nema17_spacer(6);
translate([-31.8,53.5,-3])color("")stepper_linear_m8nut_coupler_vertical_adjust_nema17();
translate([-85,0,57])rotate([0,90,0])tslot20(100);
translate([-65,29,60])rotate([-90,0,0])multichannel_pipette_holder();
}
/*
*/
}










//slider_front_assy();

//the_actual_remove_pipette_part();


/*
shh = 0.9;color([shh,shh,shh])color("")translate([-0.5,-37,22+7])filament_linearactuator_shuttle();
smaller_igus_slidermount_vertical_adjust_nema17();
shuttle_front_vertical_adjust();
rotate([0,0,0])stepper_linear_m8nut_coupler_vertical_adjust_nema17_spacer(6);
rotate([90,0,0])stepper_linear_m8nut_coupler_vertical_adjust_nema17();
*/

//slider_front_assy_vertical_adjust_nema17();
//translate([-27.5,-41,20+3])rotate([0,0,180])smaller_igus_slidermount_vertical_adjust_nema17();


//filament_linearactuator_smaller_igus_slidermount_vertical_adjust_nema17();

//rotate([0,0,0])stepper_linear_m8nut_coupler_vertical_adjust_nema17_spacer(5);
//best spacer is 6mm high (could even be 6.1mm )
//translate([0,0,-60])stepper_linear_m8nut_coupler_vertical_adjust_nema17_nut();

/*
x =10;
y = 100;
 xshuttle_assy(x,y);
*/
//multichannel_pipette_holder();
//multichannel_top_fix();

//smaller_igus_slidermount();
//translate([-0.5,-37,22])
//tslot_clamp_filament_linearactuator_shuttle();
//tslot_clamp_filament_linearactuator_shuttle_shim(2);

//filament_linearactuator_shuttle();
// multichannel_pipette_holder();

//multichannel_drypad();
//slidedeck_adjust_wheel();
//iverntech_slider_tslot_connector();
//rotate([0,0,0])import("files/gt2belt_holder.stl");

/*
rotate([0,180,0])
iverntech_slider();
*/
//multichannel_lockwasher();

//slider_x4();

//translate([5.7,110,0])sliderwheel_assy();

//9pinconnector_for_softpot(42,37);
//laser_zbed(144);

/*
translate([231.75,195-0,145+5])wash_holder_arm();
translate([230+125.25,195-0,145+5])wash_holder_arm();
*/

//washbowl_assy();
//multichannel_wash_assembly();
//color("darkgrey")washbowl_watervacinput();

//multichannel_drypad();
//translate([9,0,0])pipette_conical_part_p200(2.2);
//multichannel_pipette_holder();


//multichannel_pipette_holder();

//multichannel_lockwasher();
//translate([0,0,-37])multichannel_top_fix();

//multichannel_ejection_flap();

//rotate([90,0,0])multichannel_solenoid_connect_part();


//rotate([90,0,0])multichannel_solenoid_base();

//translate([63,-0,-28])rotate([90,0,0])multichannel_ejection_flap_top();
//the_actual_remove_pipette_part();

//translate([0,0,-24])multichannel_top_fix();


/*the evolving assembly design
*/

//multichannel_ejection_flap();
//multichannel_ejection_flap_top();

//rotate([90,0,0])solenoid_make_straight_connectorbar();
//multichannel_pipette_remove_assay();
module multichannel_pipette_remove_assay(){
translate([5.5,0,0])multichannel_remove_pipette_assy();
translate([100.5,0,0])multichannel_remove_pipette_assy();

translate([-17.5,-2,2])rotate([0,90,0])tslot20(400);
translate([-11+185,-150+3,-150])rotate([180,0,-90])multichannel_drypad();
solenoid_make_straight_connectorbar();


}


/*
//multichannel_remove_pipette_assy();
//the_actual_remove_pipette_part();
//multichannel_pipette_holder();
translate([0,-5,0])mirror([0,1,0])multichannel_remove_pipette_assy();
translate([-17.5,-28-5,1])rotate([0,90,0])tslot20(100);
//multichannel_lockwasher();
//translate([-17.5,-2+5,1])rotate([0,90,0])tslot20(100);
//multichannel_pipette_holder();
//translate([0,0,-24])multichannel_top_fix();
multichannel_pipette_holder();
*/


module filament_linearactuator_multichannel_wider(){
color("")translate([-1,0,0])shuttle_front_vertical_adjust_wider_slider_wall_beltfix();
//color("")translate([-25+8,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
//color("")translate([-25-53-8,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
}

module filament_linearactuator_multichannel_wider_iverntech(){
color("")translate([-1,0,0])shuttle_front_vertical_adjust_wider_slider_wall_beltfix();
//color("")translate([-25+8,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
//color("")translate([-25-53-8,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
}






module filament_linearactuator_multichannel(){
color("")translate([-1,0,0])shuttle_front_vertical_adjust();
color("")translate([-25,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
color("")translate([-25-53,5,41])rotate([-90,0,0])import("files/gt2belt_holder.stl");
}





module slider_front_assy_multichannel(){
translate([179.5,180-12.5+1.5,300-1])rotate([-90,0,180])multichannel_assy_wider();
translate([0,3,0]){
translate([0,0,-3]){
translate([208,188+1.5,342])rotate([90,0,0])filament_linearactuator_multichannel_wider();
//inductive sensor
//color("silver")translate([208-16,188-16,342-35])cylinder(r=12/2,h=55);
}
}
translate([15-25+229.5,206.5-11,-63+400])rotate([90,0,0])sandwich_sliderwheel_assy();
}

module slider_front_assy_multichannel_iverntech(){
//translate([179.5,180-12.5+1.5,300-1])rotate([-90,0,180])multichannel_assy_wider();
translate([0,3,0]){
translate([0,0,-3]){
//nested modules ...uhhhh
//this module filament_linearactuator_multichannel_wider_iverntech() is here
//which just calls this: color("")translate([-1,0,0])shuttle_front_vertical_adjust_wider_slider_wall_beltfix()
//which is in modparts.scad file frustratingly at line 11879
//which then calls module shuttle_front_vertical_adjust_wider_iverntech()  at line 12023 also at modparts.scad
translate([208,188+1.5,342])rotate([90,0,0])filament_linearactuator_multichannel_wider_iverntech();
//inductive sensor
//color("silver")translate([208-16,188-16,342-35])cylinder(r=12/2,h=55);
}
}
//translate([15-25+229.5,206.5-11,-63+400])rotate([90,0,0])sandwich_sliderwheel_assy_iverntech();
}







module solenoid_make_straight_connectorbar(){
translate([5.5+15,35-6,-50])difference(){
translate([8,0,0])color("lightblue")cube([110,2.5,8]);
translate([16,10,4])rotate([90,0,0])cylinder(r=4/2,h=20);
translate([16+95,10,4])rotate([90,0,0])cylinder(r=4/2,h=20);
}

}



module remove_tip_solenoid_coupler(){

difference(){
union(){
translate([0,0,0])rotate([0,0,45])cylinder(r=8/2,h=8+5,$fn=30);
translate([1.15+3,0,0])rotate([0,0,45])cylinder(r=8/2,h=8+5,$fn=4);
translate([-1.15-3,0,0])rotate([0,0,45])cylinder(r=8/2,h=8+5,$fn=4);
}
translate([-6-3,0,5+4.5])rotate([0,90,0])cylinder(r=2.8/2,h=20);
translate([0,0,-5])cylinder(r=3.9/2,h=20);
translate([0,0,8-3.4])cylinder(r=6.5/2,h=3.5+6);
}
}



module multichannel_top_fix(){
//multichannel_pipette_holder();
difference(){
union(){
for(i=[0:7]){
translate([i*9,0,0])
pipette_serological_1ml_for_top_fix(4.9);
}
}
sh = 32;
translate([-4+11,sh/2-3,-10])cylinder(r=5.5/2,h=80);
translate([-4+11,-sh/2+3,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+(7*10),sh/2-3,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+70,-sh/2+3,-10])cylinder(r=5.5/2,h=80);
//translate([-4+35,sh/2-3,-10])cylinder(r=4.7/2,h=80);
//translate([-4+35,-sh/2+3,-10])cylinder(r=4.7/2,h=80);
}
}








module multichannel_lockwasher(){
translate([-4.5+4.5,0,9-4])
for(i=[0:7]){
translate([i*9,0,-37])difference(){
cylinder(r=8/2,h=3);
cylinder(r=4/2,h=3);
}
}
}

module the_actual_remove_pipette_part(){


difference(){translate([-4.5,-10,9-4])
difference(){
union(){
translate([-2,2.5,0])cube([75,15,4]);
translate([-2+32.5,2.5-30-5,0])cube([12,75+10,4]);
}
translate([-2+32.5+6-0.5,2.5-30+6.4-5,-8])cylinder(r=3.8/2,h=20);
translate([-2+32.5+6-0.5,2.5-30+6.4+62+5,-8])cylinder(r=3.8/2,h=20);
translate([4.5,10,-12])
for(i=[0:7]){
translate([i*9,0,0])cylinder(r=7.5/2,h=30);
}
}
translate([-2-10,2.5-2.5,0])cube([75+10,15+30,40]);
}


}

module multichannel_remove_pipette_assy(){
ext = 0;
//translate([20-1.5+3,30-7+3-3,-50+12+2-4-4])rotate([0,-90,0])color("silver")multichannel_solenoid(ext);
translate([31,31,-26])rotate([180,0,90])remove_tip_solenoid_coupler();
translate([63,0,-32.1])rotate([0,180,0]){
translate([21.5+10,20+17-6,-4-20+15])rotate([0,180,0])multichannel_ejection_flap();
translate([63,-0,-28])rotate([0,180,0])multichannel_ejection_flap_top();
}
translate([63,50,0])rotate([180,180,0])multichannel_solenoid_base();
//translate([0,8,0])color("pink")multichannel_solenoid_connect_part();
}


/*
*/

ext = 0;
//translate([20-1.5+3,30-7+3-3,-50+12+2-4-4])rotate([0,-90,0])color("pink")multichannel_solenoid(ext);
/*
translate([0,0,4.3])remove_pipette_multichannel(ext);
*/

//translate([60,30,-50])rotate([0,-90,0])multichannel_solenoid(ext);

module multichannel_solenoid_connect_part(){
translate([3,0,0])difference(){
union(){
translate([62,23-4,-39])rotate([0,180,0])cube([12+55,4,19]);
translate([62-18,23-4,-39])rotate([0,180,0])cube([12+19,4,19+24]);
}
translate([33,23-4,-39])rotate([0,180,0])cube([10,4,13+8]);

translate([-6+62,50,-53])rotate([90,0,0])cylinder(r=2.8/2,h=120);
translate([-6+62,50,-43])rotate([90,0,0])cylinder(r=2.8/2,h=120);
translate([1,50,-53])rotate([90,0,0])cylinder(r=2.8/2,h=120);
translate([1,50,-43])rotate([90,0,0])cylinder(r=2.8/2,h=120);
translate([15.5,0+19,-45+1])rotate([0,90,0]){
translate([10-8+5,10,20-3+3])rotate([90,0,0])cylinder(r=5/2,h=20);
translate([39-5-2-8+5,10,3+3])rotate([90,0,0])cylinder(r=5/2,h=20);
}
}
}

module multichannel_solenoid_base(){

//this is part of multichannel_ejection_flap_top now
translate([3,0,0])difference(){
union(){
translate([7,23,-5])rotate([0,180,0])cube([12,4,17+40-3]);
translate([9-5,23,-5])rotate([0,180,0])cube([12+5,4,17]);
translate([62+8,23,-5])rotate([0,180,0])cube([12+6.5,4,17]);
translate([62,23,-5])rotate([0,180,0])cube([12,4,17+40-3]);
}
translate([4,50,-13.7])rotate([90,0,0])cylinder(r=4.7/2,h=120);
translate([-8+62,50,-13.7])rotate([90,0,0])cylinder(r=4.7/2,h=120);
translate([-6+62,50,-53])rotate([90,0,0])cylinder(r=3.7/2,h=120);
translate([-6+62,50,-43])rotate([90,0,0])cylinder(r=3.7/2,h=120);
translate([1,50,-53])rotate([90,0,0])cylinder(r=3.7/2,h=120);
translate([1,50,-43])rotate([90,0,0])cylinder(r=3.7/2,h=120);
}
translate([3,0,0]){
translate([-8,29,-13])rotate([90,45,0])cylinder(r=6.3/2,h=2,$fn=4);
translate([4+62,29,-13])rotate([90,45,0])cylinder(r=6.3/2,h=3,$fn=4);
}
}


module multichannel_ejection_flap_top(){

//translate([0,0,4])multichannel_solenoid_connect_part();
// multichannel_solenoid_base();

translate([21.5,20+4,-4])difference(){cube([20,17-2.5,4]);
//translate([10,24,-1])
translate([10,7,0])cylinder(r=4/2,h=20);
}
difference(){
union(){
translate([21.5-10,20+3,-4-10+2-4-3-2])cube([13,4,16+5]);
translate([21.5-10+27,20+3,-4-10+2-4-3-2])cube([13,4,16+5]);
translate([21.5-5-5,20+3,-4-10+2-4-3-2])cube([40,1.6,16+5]);
}
translate([21.5-5+2+3-4,20+3+10,-4-10+2-4+6.2])rotate([90,0,0])cylinder(r=5.9/2,h=30);
translate([21.5-5+2+23+4,20+3+10,-4-10+2-4+6.2])rotate([90,0,0])cylinder(r=5.9/2,h=30);

}
translate([21.5+10,20+17-6,-15]){
difference(){
rotate([0,0,45])cylinder(r=21/2,h=11,$fn=4);
rotate([0,0,45])cylinder(r=18/2,h=20.5,$fn=4);
}
}
}



module multichannel_ejection_flap(){
difference(){
union(){
translate([-12.5/2,-3.5-2.15,-3])cube([12.5,17,3]);
rotate([0,0,45])cylinder(r=16/2,h=15,$fn=4);
}
translate([0,0,4])rotate([0,0,45])cylinder(r=11.5/2,h=20.5,$fn=4);
translate([0,0,-10])rotate([0,0,45])cylinder(r=4/2,h=35);
}
/*
difference(){
rotate([0,0,0])cylinder(r=5/2,h=15+13);
rotate([0,0,0])cylinder(r=2.8/2,h=20.5+30);
}
*/
}

module multichannel_solenoid(ext){
//uxcell JF-1039B DC 12V 400mA 4800W 25N 10mm Pull Push 
translate([-42,8.5,-20])rotate([0,0,0]){difference(){
union(){
cube([39,26,20]);
translate([39,26/2,20/2])rotate([0,90,0])cylinder(r=9/2,h=65-39-ext-13);
translate([-10-ext,26/2,20/2])rotate([0,90,0])cylinder(r=3.7/2,h=65-39);
}
translate([10,10,20-3])rotate([90,0,0])cylinder(r=5/2,h=20);
translate([39-5,10,3])rotate([90,0,0])cylinder(r=5/2,h=20);
}
}
}


module p1000_model_eppendorf_modagain(){
//color("lightblue")
//translate([0,0,-190])cylinder(r=2/2,h=180);
rotate([0,0,0]){
difference(){
union(){
color("lightblue")
cylinder(r=8.5/2,h=17, $fn=300);
//translate([0,0,3])color("black")cylinder(r=8.6/2,h=1);
}
translate([0,0,-0.1])cylinder(r=(8.5-1.5)/2,h=5.12, $fn=300);
translate([0,0,2])cylinder(r=(8.5-1)/2,h=2, $fn=300);
translate([0,0,5])cylinder(r=(8.5-2)/2,h=2, $fn=300);
translate([0,0,6.9])cylinder(r=(8.5-1.5)/2,h=4.11+6.6);
}
color("lightblue")translate([0,0,11])
difference(){
cylinder(r1=7.5/2,r2=7.5/2,h=16.5, $fn=300);
translate([0,0,-0.1])cylinder(r1=(7.5-1)/2,r2=(7.5-1)/2,h=16.85+2);
}
color("lightblue")translate([0,0,11+16.5])
difference(){
cylinder(r1=7.25/2,r2=7/2,h=4, $fn=300);
translate([0,0,-0.1])cylinder(r1=(7.25-1)/2,r2=(7-1)/2,h=4.15);
}
color("lightblue")translate([0,0,11+16.5+4])
difference(){
union(){
cylinder(r1=7/2,r2=4/2,h=15, $fn=300);
#translate([0,0,15-2-12.5])cylinder(r2=6/2,r1=7/2,h=5, $fn=300);
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=6/2,h=9.5, $fn=300);
//need to put this back
//translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
/*
//this is for show
color("")translate([0,0,11+16.5+4])
difference(){
union(){
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=7/2,h=9.5);
translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
//end for show
*/
//translate([0,0,11+16.5+4+15-10])cylinder(r1=7/2,r2=6/2,h=8);
}
}





module p1000_model_eppendorf_mod(){
//color("lightblue")
//translate([0,0,-190])cylinder(r=2/2,h=180);
rotate([0,0,0]){
difference(){
union(){
color("lightblue")
cylinder(r=8.5/2,h=17, $fn=300);
//translate([0,0,3])color("black")cylinder(r=8.6/2,h=1);
}
translate([0,0,-0.1])cylinder(r=(8.5-1.5)/2,h=5.12, $fn=300);
translate([0,0,2])cylinder(r=(8.5-1)/2,h=2, $fn=300);
translate([0,0,5])cylinder(r=(8.5-2)/2,h=2, $fn=300);
translate([0,0,6.9])cylinder(r=(8.5-1.5)/2,h=4.11+6.6);
}
color("lightblue")translate([0,0,11])
difference(){
translate([0,0,5.5])cylinder(r1=8.5/2,r2=6/2,h=16.5-3, $fn=300);
translate([0,0,-0.1])cylinder(r1=(7.5-1)/2,r2=(5-1)/2,h=16.85+4);
}
color("lightblue")translate([0,0,11+16.5])
difference(){
cylinder(r1=6./2,r2=6/2,h=4, $fn=300);
#translate([0,0,-0.1])cylinder(r1=(6.25-1)/2,r2=(6-1)/2,h=4.15);
}
color("lightblue")translate([0,0,11+16.5+4])
difference(){
union(){
cylinder(r1=6./2,r2=3.3/2,h=18, $fn=300);
translate([0,0,15-2-12.5])cylinder(r2=5.5/2,r1=6/2,h=5, $fn=300);
translate([0,0,15-2-7.5])difference(){
cylinder(r2=3.3/2,r1=5.5/2,h=9.5, $fn=300);
//need to put this back
//translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-50.1])cylinder(r1=(5-1)/2,r2=(3.3-1)/2,h=115+.2, $fn=300);
}
/*
//this is for show
color("")translate([0,0,11+16.5+4])
difference(){
union(){
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=7/2,h=9.5);
translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
//end for show
*/
//translate([0,0,11+16.5+4+15-10])cylinder(r1=7/2,r2=6/2,h=8);
}
}





module p1000_model_eppendorf(){
//color("lightblue")
//translate([0,0,-190])cylinder(r=2/2,h=180);
rotate([0,0,0]){
difference(){
union(){
color("lightblue")
cylinder(r=8.5/2,h=17, $fn=300);
//translate([0,0,3])color("black")cylinder(r=8.6/2,h=1);
}
translate([0,0,-0.1])cylinder(r=(8.5-1.5)/2,h=5.12, $fn=300);
translate([0,0,2])cylinder(r=(8.5-1)/2,h=2, $fn=300);
translate([0,0,5])cylinder(r=(8.5-2)/2,h=2, $fn=300);
translate([0,0,6.9])cylinder(r=(8.5-1.5)/2,h=4.11+6.6);
}
color("lightblue")translate([0,0,11])
difference(){
cylinder(r1=7.5/2,r2=7.5/2,h=16.5, $fn=300);
translate([0,0,-0.1])cylinder(r1=(7.5-1)/2,r2=(7.5-1)/2,h=16.85+2);
}
color("lightblue")translate([0,0,11+16.5])
difference(){
cylinder(r1=7.25/2,r2=7/2,h=4, $fn=300);
translate([0,0,-0.1])cylinder(r1=(7.25-1)/2,r2=(7-1)/2,h=4.15);
}
color("lightblue")translate([0,0,11+16.5+4])
difference(){
union(){
cylinder(r1=7/2,r2=4/2,h=15, $fn=300);
translate([0,0,15-2-12.5])cylinder(r2=7/2,r1=7/2,h=5, $fn=300);
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=7/2,h=9.5, $fn=300);
//need to put this back 
//translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
/*
//this is for show
color("")translate([0,0,11+16.5+4])
difference(){
union(){
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=7/2,h=9.5);
translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
//end for show
*/
//translate([0,0,11+16.5+4+15-10])cylinder(r1=7/2,r2=6/2,h=8);
}
}



















module p1000_model_generic(){
rotate([0,0,0]){
color("lightblue")
difference(){
cylinder(r=8.5/2,h=17);
translate([0,0,-0.1])cylinder(r=(8.5-1.5)/2,h=5.12);
translate([0,0,2])cylinder(r=(8.5-1)/2,h=2);
translate([0,0,5])cylinder(r=(8.5-2)/2,h=2);
translate([0,0,6.9])cylinder(r=(8.5-1.5)/2,h=4.11+6.6);
}
color("lightblue")translate([0,0,11])
difference(){
cylinder(r1=7.5/2,r2=7.5/2,h=16.5);
translate([0,0,-0.1])cylinder(r1=(7.5-1)/2,r2=(7.5-1)/2,h=16.85+2);
}
color("lightblue")translate([0,0,11+16.5])
difference(){
cylinder(r1=7.25/2,r2=7/2,h=4);
translate([0,0,-0.1])cylinder(r1=(7.25-1)/2,r2=(7-1)/2,h=4.15);
}
color("lightblue")translate([0,0,11+16.5+4])
difference(){
union(){
cylinder(r1=7/2,r2=4/2,h=15);
translate([0,0,15-2-7.5])difference(){
cylinder(r2=4.5/2,r1=7/2,h=9.5);
translate([0,0,7.5-3])cylinder(r=7/2,h=0.6);
}
}
translate([0,0,-0.1])cylinder(r1=(7-1)/2,r2=(4-1)/2,h=15+.2);
}
/*
*/
//translate([0,0,11+16.5+4+15-10])cylinder(r1=7/2,r2=6/2,h=8);
}
}


















module multichannel_pipette_holder(){
color(""){
translate([-9,-6.6,-4])cube([6,13.2,12]);
translate([-9+76.5-0.3+1,-6.6,-4])cube([5,13.2,12]);
}
translate([1,0,0])difference(){
union(){
for(i=[0:7]){
if (i==0){
 translate([i*(9),0,0])
  ///pipette_serological_1ml(5);
  //pipette_serological_1ml(7.5);
  pipette_p1000(8.1);
  //pipette_p200(5); 
}
else if (i==7){
 translate([i*9,0,0])
 //pipette_p200(5); 
 //pipette_serological_1ml(5.2);
 //pipette_serological_1ml(7.7);
 pipette_p1000(8.1);
}
else {
translate([i*9,0,0])
 //pipette_serological_1ml(5.3);
 //pipette_serological_1ml(7.8);
 pipette_p1000(8.1);
 //pipette_p200(5); 
}
}
}
sh = 32;
translate([-4+11,sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+(7*10),sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
//translate([-4+35,sh/2-3,-10])cylinder(r=5.5/2,h=80);
//translate([-4+35,-sh/2+3,-10])cylinder(r=5.5/2,h=80);
translate([-4+11,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+70,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
}
}


//pipette part 
module multichannel_pipette_holder_camera_example(){
color(""){
//translate([-9,-6.6+8,-4])cube([6,13.2,12]);
//translate([-9+76.5-0.3+1,-6.6+8,-4])cube([5,13.2,12]);
translate([-9-9,-6.6+8,-4])cube([6,13.2,12]);
translate([-9+76.5-0.3+1+9,-6.6+8,-4])cube([5,13.2,12]);
}
translate([1,0+8,0])difference(){
union(){
for(i=[-1:8]){
if (i==-1){
 translate([i*(9),0,0])
  pipette_p1000_noextrusion(8.1,0);
 }
else if (i==8){
 translate([i*(9),0,0])
  pipette_p1000_noextrusion(8.1,0);
}
else if (i==1){
 translate([i*(9),0,0])
  pipette_p1000_noextrusion(8.1,0);
}
else {
 translate([i*(9),0,0])pipette_p1000_noextrusion(8.1,0);
}
/*
*/

/*
if (i==0){
 translate([i*(9),0,0])
  ///pipette_serological_1ml(5);
  //pipette_serological_1ml(7.5);
  pipette_p1000_noextrusion(8.1);
  //pipette_p200(5); 
}
else if (i==7){
 translate([i*9,0,0])
 //pipette_p200(5); 
 //pipette_serological_1ml(5.2);
 //pipette_serological_1ml(7.7);
 pipette_p1000_noextrusion(8.1);
}
else {
translate([i*9,0,0])
 //pipette_serological_1ml(5.3);
 //pipette_serological_1ml(7.8);
 pipette_p1000_noextrusion(8.1);
 //pipette_p200(5); 
}
*/
}
}
sh = 32;
//translate([-4+11,sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
//translate([-4-11+(7*10),sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
/*
translate([-4+11,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+70,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
*/
}
}












module multichannel_pipette_holder_noextrusion(){
color(""){
translate([-9,-6.6+8,-4])cube([6,13.2,12]);
translate([-9+76.5-0.3+1,-6.6+8,-4])cube([5,13.2,12]);
}
translate([1,0+8,0])difference(){
union(){
for(i=[0:7]){
if (i==3){
 translate([i*(9),0,0])
  pipette_p1000_noextrusion(8.1,1);
 }
else {
 translate([i*(9),0,0])
  pipette_p1000_noextrusion(8.1,1);
}
/*
if (i==0){
 translate([i*(9),0,0])
  ///pipette_serological_1ml(5);
  //pipette_serological_1ml(7.5);
  pipette_p1000_noextrusion(8.1);
  //pipette_p200(5); 
}
else if (i==7){
 translate([i*9,0,0])
 //pipette_p200(5); 
 //pipette_serological_1ml(5.2);
 //pipette_serological_1ml(7.7);
 pipette_p1000_noextrusion(8.1);
}
else {
translate([i*9,0,0])
 //pipette_serological_1ml(5.3);
 //pipette_serological_1ml(7.8);
 pipette_p1000_noextrusion(8.1);
 //pipette_p200(5); 
}
*/
}
}
sh = 32;
//translate([-4+11,sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
//translate([-4-11+(7*10),sh/2-3+5,-10])cylinder(r=5.5/2,h=80);
/*
translate([-4+11,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
translate([-4-11+70,-sh/2+3-5,-10])cylinder(r=5.5/2,h=80);
*/
}
}








































module remove_pipette_multichannel(ext){
translate([21.5,7,ext-4])difference(){
cube([20,30,4]);
translate([10,24,-1])cylinder(r=6/2,h=20);
}
translate([21.5,7-44,ext-4])difference(){
cube([20,30,4]);
translate([10,6,-1])cylinder(r=6/2,h=20);
}
color("silver")translate([0,0,ext])difference(){
for(i=[0:7]){
 translate([i*9,0,0])difference(){
 translate([-5,-10,-4])cube([10,20,4]);
 translate([0,0,-50.2])cylinder(r=6/2,h=100);
}
}
}
}


//this is the p50 multichannel
module pipette_conical_part_p50(){
difference(){
union(){
translate([0,0,11.5])cylinder(r2=3/2,r1=4.5/2,h=16);
translate([0,0,0])cylinder(r2=5/2,r1=5.5/2,h=11.5);
translate([-5,-40/2,-4])cube([10,40,4]);
}
translate([0,0,-50.2])cylinder(r=2.1/2,h=100);
}
}

module pipette_conical_part_p200(dia){
difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
translate([0,2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([0,-2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([0,0,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([-5,-40/2,-4])cube([10,40,4]);
}
translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
translate([0,0+50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=100);

//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}

//this is for show
//color("lightblue")translate([0,0,-50.2+46-33+8-6])cylinder(r=dia/2,h=50);
}



module pipette_serological_1ml_for_top_fix(dia){
difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
//translate([0,2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
//translate([0,-2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
//translate([0,0,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([-5,-40/2+13.4,-4])cube([10,30-3.4,4]);
}
translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
translate([0,0+50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=100);

//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}

//this is for show
//color("lightblue")translate([0,0,-50.2+46-33+8-6])cylinder(r=dia/2,h=50);
}

module pipette_p200(dia){
difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
translate([0,2,0])rotate([0,0,45])cylinder(r=13/2,h=7,$fn=4);
translate([0,-2,0])rotate([0,0,45])cylinder(r=13/2,h=7,$fn=4);
translate([0,0,0])rotate([0,0,45])cylinder(r=13/2,h=7,$fn=4);
translate([-5,-40/2+13.4,-4])cube([10,40-13,4]);
//the other side for solenoid
//translate([-5,-40/2,-4])cube([10,40-13,4]);
}
translate([0,0,-50.2+46+4.25-7])cylinder(r2=8/2,r1=8/2,h=7);
translate([0,0,-50.2+46+4.25])cylinder(r2=6.5/2,r1=8/2,h=7);
translate([0,0+50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=100);

//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}
/*
translate([0,0,-65+41]){
//this is for show
color("lightblue")translate([0,0,-36.7])cylinder(r=4.5/2,h=102-13-10);
color("lightblue")translate([0,0,62])cylinder(r=2.5/2,h=13);
color("lightblue")translate([0,0,52.3-10])cylinder(r2=2.5/2,r1=4.5/2,h=20);
color("lightblue")translate([0,0,-36.7])cylinder(r=7.5/2,h=20);

//here is the luer lock
color("white")translate([0,0,-36.7-5])cylinder(r=8/2,h=3);
color("white")translate([0,0,-36.7-3])cylinder(r=12/2,h=3);
//cylinder(r=12/2,h=3);
//end luer lock
}
*/

}



module pipette_p1000(dia){
color("")difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
translate([0,2,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([0,-2,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([0,0,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([-5,-40/2+13.4+12,-4])cube([10,40-13+4-12,4]);
//the other side for solenoid
//translate([-5,-40/2-4,-4])cube([10,40-13+4,4]);
}
translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
translate([0,0+50-50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=30);
//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}
translate([0,0,-65+41]){
//this is for show
translate([0,0,200-100])rotate([0,180,0])color("lightgreen")pipette_p300_lts_model();
translate([0,0,9])p1000_model_eppendorf();
color("lightblue")translate([0,0,-6.7])cylinder(r=5.5/2,h=102-13-40);
//color("lightblue")translate([0,0,62-400])cylinder(r=2.5/2,h=333);
color("lightblue")translate([0,0,62])cylinder(r=2.5/2,h=13);
color("lightblue")translate([0,0,52.3-10])cylinder(r2=2.5/2,r1=4.5/2,h=20);
color("lightblue")translate([0,0,-36.7])cylinder(r=7.5/2,h=20);
/*
*/
//here is the luer lock
color("white")translate([0,0,-6.7-5])cylinder(r=8/2,h=3);
color("white")translate([0,0,-6.7-3])cylinder(r=12/2,h=3);
//cylinder(r=12/2,h=3);
//end luer lock
}
/*
*/
}


module pipette_p1000_noextrusion(dia,fl){
color("")difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
translate([0,2,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([0,-2,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([0,0,-4])rotate([0,0,45])cylinder(r=13/2,h=12,$fn=4);
translate([-5,-40/2+13.4+12,-4+8-3])cube([10,40-13+4-12-4.5,4+3]);
//the other side for solenoid
//translate([-5,-40/2-4,-4])cube([10,40-13+4,4]);
}
translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
translate([0,0+50-50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=30);
//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}
translate([0,0,-65+41]){
if (fl == 1){
//this is for show
//translate([0,0,200-100+80])rotate([0,180,0])color("lightgreen")pipette_p300_lts_model();
translate([0,0,9])p1000_model_eppendorf();
color("lightblue")translate([0,0,-6.7])cylinder(r=5.5/2,h=102-13-40);
/*
*/
/*
//color("lightblue")translate([0,0,62-400])cylinder(r=2.5/2,h=333);
color("lightblue")translate([0,0,62])cylinder(r=2.5/2,h=13);
color("lightblue")translate([0,0,52.3-10])cylinder(r2=2.5/2,r1=4.5/2,h=20);
color("lightblue")translate([0,0,-36.7])cylinder(r=7.5/2,h=20);
*/
//here is the luer lock
color("white")translate([0,0,-6.7-5])cylinder(r=8/2,h=3);
color("white")translate([0,0,-6.7-3])cylinder(r=12/2,h=3);
//cylinder(r=12/2,h=3);
//end luer lock
/*
*/
}
}
}



















module pipette_serological_1ml(dia){
difference(){
union(){
//translate([0,0,4])cylinder(r2=4.5/2,r1=5.5/2,h=8);
translate([0,2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([0,-2,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([0,0,0])rotate([0,0,45])cylinder(r=13/2,h=8,$fn=4);
translate([-5,-40/2+13.4,-4])cube([10,40-13,4]);
//the other side for solenoid
//translate([-5,-40/2,-4])cube([10,40-13,4]);
}
translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
translate([0,0+50,-50.2+46+8])rotate([90,0,0])cylinder(r=1.7/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=dia/2,h=100);
//translate([0,0,-50.2+46])cylinder(r=(dia+0.2)/2,h=2);
}
/*
translate([0,0,-65+41]){
//this is for show
color("lightblue")translate([0,0,-36.7])cylinder(r=4.5/2,h=102-13-10);
color("lightblue")translate([0,0,62])cylinder(r=2.5/2,h=13);
color("lightblue")translate([0,0,52.3-10])cylinder(r2=2.5/2,r1=4.5/2,h=20);
color("lightblue")translate([0,0,-36.7])cylinder(r=7.5/2,h=20);
//here is the luer lock
color("white")translate([0,0,-36.7-5])cylinder(r=8/2,h=3);
color("white")translate([0,0,-36.7-3])cylinder(r=12/2,h=3);
//cylinder(r=12/2,h=3);
//end luer lock
}
*/
}






module multichannel_drypad_384(){
translate([-148,85,-150])difference(){
union(){
translate([-75.5-5+22-5-34+12-2,-40,0])cube([29+36-12,90,5]);
translate([-75.5-5+45,-40-10,0])cube([10,90+20,5]);
}
/*
translate([-30,33,-10]){
cylinder(r=3.7/2,h=30);translate([0,0,10])
cylinder(r=6.7/2,h=3.2);
}
translate([-30,33-66,-10]){
cylinder(r=3.7/2,h=30);
translate([0,0,10])cylinder(r=6.7/2,h=3.2);
}
*/
/*
translate([-30,0,0])for(a=[0:1]){
translate([-44-(a*10),-40+5,-1])cube([5,71+10,13]);
}
*/
translate([-30-30+6,-20,-20])
translate([-44-(a*10),-40+5,-1])cylinder(r=6/2,h=50);
translate([-30-30+6,20,-20])
translate([-44-(a*10),-40+5,-1])cylinder(r=6/2,h=50);
translate([-33,-66,-20])rotate([0,0,90]){
//actually c-to-c spacing on prusa is 8.723 not 9mm
translate([0,-31+65-12,0])
for(j=[0:7]){
for(k=[0:3]){
 //The is for the Rainin LTS tip without the filter
 //translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([7,25/2-8,-0.1])cylinder(r=7.8/2,h=40);
 //The is for the Rainin LTS tip with this is too tight
 //translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([6.5,25/2-8,-0.1])cylinder(r=6.5/2,h=40);
 #translate([19+7+(j*9)+5+2,2.5-10+33-(k*1)+2,2])translate([6.8,25/2-8,-0.1])cylinder(r=5/2,h=40);
}}

/*
translate([19+7,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7,2.5-10,2])translate([7.5,25/2-8,-0.1])cylinder(r=3.7/2,h=40);
translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,-0.1])cylinder(r=3.7/2,h=40);
translate([19+7+75,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7+75,2.5-10,2])translate([7.5,25/2-8,-0.1])cylinder(r=3.7/2,h=40);
*/
//translate([19+7,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7,2.5-10,2])translate([7.5-10,25/2-8,-0.1])cylinder(r=3.7/2,h=240);
//translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7+37,2.5-10,2])translate([7.5,25/2-8,-0.1])cylinder(r=3.7/2,h=40);
//translate([19+7+75,2.5-10,2])translate([7.5,25/2-8,18])cylinder(r=6.9/2,h=3.2);
translate([19+7+75,2.5-10,2])translate([7.5+10,25/2-8,-0.1])cylinder(r=3.7/2,h=240);
}
}
}
































module multichannel_drypad(){
translate([-148,85,-150])difference(){
union(){
translate([-75.5-5+22-5-34+12,-40,0])cube([29+36-12,90,5]);
translate([-75.5-5+45-7,-40-10,0])cube([20,90+20,5+5]);
translate([-75.5-5+45-7-20-10,-40-10-10+20,0])cube([30,90,5+5]);
}
//translate([-30-30+6,-20,-20])
//translate([-44-(a*10),-40+5,-1])cylinder(r=6/2,h=50);
//translate([-30-30+6,20,-20])
//translate([-44-(a*10),-40+5,-1])cylinder(r=6/2,h=50);
translate([-33,-66,-20])rotate([0,0,90]){
//actually c-to-c spacing on prusa is 8.723 not 9mm
translate([0,-31+65-12,0])
for(j=[0:7]){
for(k=[0:3]){
 //The is for the Rainin LTS tip without the filter
 //translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([7,25/2-8,-0.1])cylinder(r=7.8/2,h=40);
 //The is for the Rainin LTS tip with this is too tight
 //translate([19+7+(j*9)+5+2,2.5-10+33-(k*1),2])translate([6.5,25/2-8,-0.1])cylinder(r=6.5/2,h=40);
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









module multichannel_vacuum(){
wh = 20;
sh = 9;
difference(){
translate([26,2.5,2])color("lightgreen")cube([90,25+15,wh]);
translate([26+9,2.5+21,2+5])cube([90-14,12,50]);
for(i=[0:12]){
translate([26+9+i*5,2.5+7,2+5+(7-(i*1.2)/2)])cube([5,11,50]);
}
translate([26+70,2.5+7,2+5])cube([15,11,50]);
for(j=[112,85,55,30]){
translate([j,15+sh+15,4]){cylinder(r=2.8/2,h=200);}
translate([j,15-sh,4]){cylinder(r=2.8/2,h=200);}
}

translate([95,15,15])rotate([0,90,0])cylinder(r=5/2,h=30);
translate([95,30,10])rotate([0,90,0])cylinder(r=5/2,h=30);





}
}


module multichannel_wash_assembly(){

color("darkgrey")translate([220,350,0])rotate([0,180,-90])multichannel_drypad();

translate([20-13,185-10,-62.5+5]){
difference(){
union(){
translate([242-10,0,200])washstation_for_multichannel();
translate([242-10,0,200-25])multichannel_vacuum();
}
translate([270,15,200])multichannel_module();
}
}
}

module wash_holder_arm(){
l = 33.05;
difference(){
translate([0,-0.5,0])color("peru")cube([l,12,5]);
translate([3.3,10/2,-5])cylinder(r=2.8/2,h=20);
translate([l-3.3,10/2,-5])cylinder(r=2.8/2,h=20);
translate([l-8.3,10/2,-5])cylinder(r=2.8/2,h=20);
}
}



//mirror([0,0,0])import("files/endstop_y.stl");

//translate([0,35,0])pipette_plate();
//distributor_plate();
//pipetteboy_shaft();
//serological_1ml_shaft();

//multichannel_holder_assy();

module multichannel_module(){
ang = 20;
for(i=[0:14]){
translate([i*4.5,0+15,-1])rotate([0,0,45])cylinder(r=7/2,h=20,$fn=4);
translate([i*4.5,0,7])rotate([0,0,45])cylinder(r=11/2,h=20,$fn=4);
}
for(i=[0:7]){
translate([i*9,0,0])rotate([0,0,45])cylinder(r1=2/2,r2=7/2,h=7.1);
for(k=[0:15]){
translate([i*9,k,5-k/4])rotate([0,0,45])cylinder(r=3/2,h=20);
}
}
}



module washstation_for_multichannel(){
sh = 9;
h=9.5;
wh = 7;

translate([19+7,2.5-10,2])difference(){
color("lightblue")cube([15,10,3]);
translate([7.5,25/2-8,-0.1])cylinder(r=2.8/2,h=40);
}

translate([19+7+37,2.5-10,2])difference(){
color("lightblue")cube([15,10,3]);
translate([7.5,25/2-8,-0.1])cylinder(r=2.8/2,h=40);
}

translate([19+7+75,2.5-10,2])difference(){
color("lightblue")cube([15,10,3]);
translate([7.5,25/2-8,-0.1])cylinder(r=2.8/2,h=40);
}





translate([19,2.5+10,2])difference(){
translate([0,7,0])color("lime")cube([7,12,wh]);
translate([3.5,25/2,-0.1])cylinder(r=3.7/2,h=20);
translate([3.5,25/2,3.6])cylinder(r=9/2,h=3.5);
}
translate([97+19,2.5+10,2])difference(){
translate([0,7,0])color("lime")cube([7,12,wh]);
translate([3.5,25/2,-0.1])cylinder(r=3.7/2,h=20);
translate([3.5,25/2,3.6])cylinder(r=9/2,h=3.5);
}
difference(){
translate([26,2.5,2])color("pink")cube([90,25+15,wh]);
//translate([119,6+sh,-0.2+h-4]){cylinder(r=9/2,h=4);}
//translate([22,6+sh,-0.2+h-4]){cylinder(r=9/2,h=4);}


translate([114,15+sh+15,-0.2+h-4]){cylinder(r=9/2,h=4);}
translate([114,15-sh,-0.2+h-4]){cylinder(r=9/2,h=4);}
translate([28,15-sh,-0.2+h-4]){cylinder(r=9/2,h=4);}
translate([28,15+sh+15,-0.2+h-4]){cylinder(r=9/2,h=4);}

for(j=[112,85,55,30]){
translate([j,15+sh+15,-0.2]){cylinder(r=3.7/2,h=20);translate([0,0,h-4])cylinder(r=9/2,h=4);}
translate([j,15-sh,-0.2]){cylinder(r=3.7/2,h=20);translate([0,0,h-4])cylinder(r=9/2,h=4);}
}



}
}


module multichannel_holder_assy(){
 difference(){
  union(){
   translate([25,40,16])rotate([90,0,0])serological_1ml_shaft();
   translate([25,15,16])rotate([90,0,0])pipetteboy_shaft();
   translate([0,-5,0])base_for_pipetteboy();
  }
  translate([19,20.5,-10])cylinder(r=3.7/2,h=120);
  translate([19+12,20.5,-10])cylinder(r=3.7/2,h=120);
 }
}

module base_for_pipetteboy(){
 translate([25,25,2])rotate([0,0,45])cylinder(r=20,h=2,$fn=4);
 translate([25,15,2])rotate([0,0,45])cylinder(r=20,h=2,$fn=4);
 translate([25,35,2])rotate([0,0,45])cylinder(r=20,h=2,$fn=4);
}

module serological_1ml_shaft(){
 difference(){
  union(){
  translate([0,0,-0.1])cylinder(r=(4+8)/2,h=15);
  translate([-6,5,7.5])rotate([0,90,0])cylinder(r=(7)/2,h=12);
  translate([0,-5,-0.1])rotate([0,0,45])cylinder(r=(14)/2,h=15, $fn=4);
  translate([0,-7.5,-0.1])rotate([0,0,45])cylinder(r=(14)/2,h=15, $fn=4);
  }
  translate([-7,5,7.5])rotate([0,90,0])cylinder(r=(2.8)/2,h=14);
  translate([0,0,-5])cylinder(r=4.5/2,h=30);
  translate([0,3,-5])rotate([0,0,45])cylinder(r=6/2,h=30,$fn=4);
  translate([0,7,-5])rotate([0,0,45])cylinder(r=6/2,h=30,$fn=4);
 }
}

module pipetteboy_shaft(){
 difference(){
 union(){
 translate([0,0,-0.1])cylinder(r=(10+8)/2,h=15);
 translate([-8,7,7.5])rotate([0,90,0])cylinder(r=(7)/2,h=16.5);
 translate([0,-5,-0.1])rotate([0,0,45])cylinder(r=(16)/2,h=15, $fn=4);
 translate([0,-7.5,-0.1])rotate([0,0,45])cylinder(r=(16)/2,h=15, $fn=4);
 }
 translate([-11,7,7.5])rotate([0,90,0])cylinder(r=(2.8)/2,h=25);
 translate([0,0,-5])cylinder(r=10/2,h=30);
 translate([0,5,-5])rotate([0,0,45])cylinder(r=10/2,h=30,$fn=4);
 translate([0,7,-5])rotate([0,0,45])cylinder(r=10/2,h=30,$fn=4);
 }
}

module pipette_plate(){
difference(){
translate([12,-5+5,0])cube([78,15,3]);
translate([21,0,0])lower_microchannel_segment();
}
}


module distributor_plate(){
difference(){
translate([-15,-5,0])cube([125,27,3]);
upper_microchannel_segment();
}
}



module lower_microchannel_segment(){
//translate([-4,5,3])rotate([90,0,90])cylinder(r=4/2,h=68);
for (i=[-1:6]){
if(i==3){
//translate([0+i*(9),5,3])rotate([90,0,90])eldon_james_nyloncross();
translate([0+i*(9)+7.5,5,3])rotate([90,0,0])cylinder(r=4/2,h=30);
translate([0+i*(9)+7.5,5+10,3])rotate([90,0,0])cylinder(r=4/2,h=15);
}else{
//translate([0+i*(9),5,3])rotate([90,0,90])eldon_james_nylontee();
translate([0+i*(9)+7.5,5+10,3])rotate([90,0,0])cylinder(r=4/2,h=15);
}
}
}




module upper_microchannel_segment(){
translate([-11,5,3])rotate([90,0,90])cylinder(r=4/2,h=117);
for (i=[-1:6]){
if(i==3){
//translate([0+i*(16),5,3])rotate([90,0,90])eldon_james_nyloncross();
translate([0+i*(16)+7.5,5,3])rotate([90,0,0])cylinder(r=4/2,h=30);
translate([0+i*(16)+7.5,5+10+8,3])rotate([90,0,0])cylinder(r=4/2,h=18);
}else{
//translate([0+i*(16),5,3])rotate([90,0,90])eldon_james_nylontee();
translate([0+i*(16)+7.5,5+10+8,3])rotate([90,0,0])cylinder(r=4/2,h=18);
}
}
}


//multichannel_fluidicdesign();


module multichannel_fluidicdesign(){
for (i=[0:5]){
if(i==3){
translate([0+i*(16),5,3])rotate([90,0,90])eldon_james_nyloncross();
}else{
translate([0+i*(16),5,3])rotate([90,0,90])eldon_james_nylontee();
}
}
translate([6*16,5,3])rotate([90,0,90])eldon_james_nylonrtang();
translate([-0.0*16-1,5,3])rotate([-90,0,90])eldon_james_nylonrtang();
}




/*
difference(){
cube([14,12,3]);
translate([0,5,3])rotate([90,0,90])eldon_james_nylontee();
}
*/
//eldon_james_nyloncross();
//eldon_james_nylonrtang();





module eldon_james_nylonrtang(){
cylinder(r=3/2,h=15/2+1.5);
translate([0,0,7.5-0.75-2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
//translate([0,0,7.5-0.75+2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
translate([0,0,7.5])rotate([0,90,0])cylinder(r=3/2,h=7.5);
translate([1.75,0,7.5])rotate([0,90,0])cylinder(r=5/2,h=1.5);
}



module eldon_james_nylontee(){
cylinder(r=3/2,h=15);
translate([0,0,7.5-0.75-2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
translate([0,0,7.5-0.75+2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
translate([0,0,7.5])rotate([0,90,0])cylinder(r=3/2,h=7.5);
translate([1.75,0,7.5])rotate([0,90,0])cylinder(r=5/2,h=1.5);
}

module eldon_james_nyloncross(){
cylinder(r=3/2,h=15);
translate([0,0,7.5-0.75-2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
translate([0,0,7.5-0.75+2])rotate([0,0,0])cylinder(r=5/2,h=1.5);
translate([0,0,7.5])rotate([0,90,0])cylinder(r=3/2,h=7.5);
translate([0,0,7.5])rotate([0,-90,0])cylinder(r=3/2,h=7.5);
translate([1.75,0,7.5])rotate([0,90,0])cylinder(r=5/2,h=1.5);
translate([-1.75,0,7.5])rotate([0,-90,0])cylinder(r=5/2,h=1.5);
}




