/*
https://www.amazon.com/gp/product/B0CDXCTQP1/ref=ox_sc_act_title_2?smid=ATVPDKIKX0DER&psc=1
627.2 x 529.2 x 703.15
x = 410; //60
y = 520; //170
z = 500;



Misumi HFSB5-2020-750-LCP-RCP-AV610	4
Misumi HFSB5-2020-640-TPW	6
Misumi HFSB5-2020-580-LTP	1
Misumi HFSB5-2020-530-TPW	3
Misumi HFSB5-2020-530-AH265-TPW	1
Misumi HFSB5-2020-530-AH265	1
Misumi HFSB5-2020-502-LTP	1
Misumi HFSB5-2020-490	1
Misumi HFSB5-2020-400	1
DIN 3 Rails (35mm W) - 530mm	2
*/


include <tslot.inc.scad>

/*
width = 550; //570;
length = 660; //640;
height = 4;
margin = 0.75;
*/

//right_skirt_powercord();

//tools
/*

translate([-9,680,534])rotate([-90,0,0])color("red")import("../350/klicky_probe/ORIGKlickyDockMountVariablePart3.stl");

translate([470,724,365])rotate([0,0,180])color("blue")dock_assy();
translate([470-66.2,724,365])rotate([0,0,180])color("red")dock_assy();
translate([470-(66.2*2),724,365])rotate([0,0,180])color("green")dock_assy();
translate([470-(66.2*3),724,365])rotate([0,0,180])color("orange")dock_assy();
translate([470-(66.2*4),724,365])rotate([0,0,180])color("lightblue")dock_assy();
translate([470-(66.2*5),724,365])rotate([0,0,180])color("pink")dock_assy();

translate([600,715,0])rotate([0,0,180]){
translate([100,-110,384])color("lime")rotate([0,0,90])rotate([0,0,180]){
import("../../syringe_pump/microfluidics/singlechannel_tipremoval_base.stl");
import("../../syringe_pump/microfluidics/washstation/singlechannel_tipremoval.stl");
}
translate([260,-110+200,384-165])color("pink")rotate([0,-180,90])rotate([0,0,180]){
import("../../syringe_pump/microfluidics/washstation/washbowl_watervacinput.stl");
import("../../syringe_pump/microfluidics/washstation/drypad.stl");
import("../../syringe_pump/microfluidics/washstation/washbowl_1tip.stl");
}
}

*/

/* ignore this
difference(){
translate([10+15,30+15-20,20])bottom_left_sawtooth(width,length,margin);
translate([10+15-50,30+15-20+400-50,20-10])cube([100+400,350,50]);
translate([10+15-50+190,30+15-20+400-30-100,20-10])cube([100+400,350,50]);
}

difference(){
translate([10+15,30+15-20,20])bottom_right_sawtooth(width,length,margin);
translate([10+15-50-100,30+15-20+400-30-400,20-10])cube([100+400,350,50]);
translate([10+15-50+190-375+380,30+15-20+400-30-100-350+80,20-10])cube([100+400,350,50]);
}
*/


/*

back_motor_mount_corexy();
corners();
//translate([240,50,0])rotate([0,0,90])import("../350/power_inlet_filtered.stl");
translate([160,160,0])left_skirt();
//translate([160-200+470+10,160+400-10-390,0])mirror([0,1,0])rotate([0,0,180])right_skirt_powercord();
translate([160-200+470+10,160+400-10,0])mirror([0,0,0])rotate([0,0,180])right_skirt_powercord();
translate([0,550,0])front_side_skirt();
translate([0,160,0])back_side_skirt();
translate([10+15,30+15-20,20])sawtooth_base();



misumi_gantry_assy();
z_axis_assy_collection();
translate([10+15,30+15-20,20])sawtooth_base();

bed();
*/
//color("peru")pipettetip_box();
//pipettetip_box_clamp();
translate([0,540,0])
mirror([0,1,0])pipettetip_box_clamp();
/*
*/

//din_rail_connect();
module pipettetip_box_clamp(){
translate([140,210-30,230])difference(){
union(){

translate([-17-8,5,4])cube([5+4+110,16,5]);
translate([-17-8,-5-9,-42-20])cube([5,35,51+20]);
}

translate([0,-10,0]){
hull(){
#translate([0,3,-10])rotate([0,-90,0])cylinder(r=5.7/2,h=50,$fn=300);
#translate([0,3,-55])rotate([0,-90,0])cylinder(r=5.7/2,h=50,$fn=300);
}
translate([0,15,0])hull(){
#translate([0,8,-10])rotate([0,-90,0])cylinder(r=5.7/2,h=50,$fn=300);
#translate([0,8,-55])rotate([0,-90,0])cylinder(r=5.7/2,h=50,$fn=300);
}
}

#translate([-12+6,15,0])cylinder(r=4.2/2,h=30,$fn=300);
#translate([-12+95-5,15,0])cylinder(r=4.2/2,h=30,$fn=300);

}

}


module pipettetip_box(){

translate([140,210,230+0])difference(){
union(){
translate([-8-5,-8,0])cube([85+16,120+16,24]);
translate([-17-8+12,-20,0])cube([5+4+110-18,20,5]);
translate([-17-8+12,-20+140,0])cube([5+4+110-18,20,5]);
}
translate([0-5,0,-1])cube([85,120,30]);
translate([0,0-30,0]){
translate([-12+6,15,0])cylinder(r=2.8/2,h=30,$fn=300);
translate([-12+95-5,15,0])cylinder(r=2.8/2,h=30,$fn=300);
}

translate([0,120,0]){
#translate([-12+6,15,0])cylinder(r=2.8/2,h=30,$fn=300);
#translate([-12+95-5,15,0])cylinder(r=2.8/2,h=30,$fn=300);
}

}

}


module dock_assy(){
import("../../dock_trident_work/Dock/dock_parts/dock_assy_model_no_nozzle_blocker.stl");
import("../../dock_trident_work/Dock/dock_parts/nozzle_blocker_mount_r2_model.stl");
}


module voron_trident_350_buildplate(){

difference(){
color("silver")cube([355,355,8]);
translate([7,40,-50])cylinder(r=3.5/2,h=200,$fn=300);
translate([355-7,40,-50])cylinder(r=3.5/2,h=200,$fn=300);
translate([355/2,355-7,-50])cylinder(r=3.5/2,h=200,$fn=300);
}
}


module din_rail_connect(){

//translate([150,30+185/2,0])color("blue")cube([35,467,2]);

//translate([150+18,30+185/2-2,2])rotate([0,90,90])import("DIN_frame_mount_x4.stl");

difference(){
union(){
translate([150+18-30,30+185/2-2-20+10,-3])cube([60,10,12]);
translate([150+18-30,30+185/2-2-20-75.4,-3])cube([60,10,12]);
translate([150+18-30+15,30+185/2-2-20-75.4,-3])cube([30,90,12]);
}
translate([150+18-30+6,30+185/2-2-20,-3+6])rotate([-90,0,0])cylinder(r=4.8/2,h=200,$fn=300);
translate([150+18-30+6+48,30+185/2-2-20,-3+6])rotate([-90,0,0])cylinder(r=4.8/2,h=200,$fn=300);
translate([150+18-30+6,30+185/2-2-20-150+70,-3+6])rotate([-90,0,0])cylinder(r=5.7/2,h=20,$fn=300);
translate([150+18-30+6+48,30+185/2-2-20-150+70,-3+6])rotate([-90,0,0])cylinder(r=5.7/2,h=20,$fn=300);

translate([150+18-30+6,30+185/2-2-20-150+79,-3+6])rotate([-90,0,0])cylinder(r=9.7/2,h=20,$fn=300);
translate([150+18-30+6+48,30+185/2-2-20-150+79,-3+6])rotate([-90,0,0])cylinder(r=9.7/2,h=20,$fn=300);


}
}

module back_motor_mount_corexy(){
translate([440,550+160,-10+10-10])rotate([0,0,180]){
translate([41.8+4.6+346.4,50-2.8,348])rotate([0,0,0])color("lime")import("model_Motor_Mount_v2Motor_Mount_B_Top.stl");
translate([41.8+4.6-160,50-2.8,348])rotate([0,0,180])mirror([0,1,0])color("lime")import("model_Motor_Mount_v2Motor_Mount_B_Top.stl");
}
}


module z_axis_assy_collection(){
translate([-212.5+160,0,-2])z_axis_assy();
translate([-212.5+865,-550+550,-2])rotate([0,0,180])mirror([0,1,0])z_axis_assy();
translate([0,550,0])mirror([0,1,0]){
translate([-212.5+160,0-160,-2])z_axis_assy();
translate([-212.5+865,-550+550-160,-2])rotate([0,0,180])mirror([0,1,0])z_axis_assy();
}
}

/*
*/



module bed(){
translate([114.4-89.4+100.15-2.5,54.5+25+100,220-6])voron_trident_350_buildplate();
path = "/Users/richard/Documents/voron/Trident/Voron-Trident/STLs/Z_Assembly/";

translate([40+77-2.5-5+20,54.5+25,220-6-15])rotate([90,0,0])import("second_try_350_scratch/HFSB5-2020-550.stl");
//translate([40+77-2.5,54.5+25,220-6])rotate([-90,0,0])tslot20(550);

//translate([40+495-64-31+13+2.5,54.5+25,220-6])rotate([-90,0,0])tslot20(550);
#translate([40+495-64-31+13+2.5+15,54.5+25,220-6-15])rotate([90,0,0])import("second_try_350_scratch/HFSB5-2020-550.stl");

//HFSB5-2020-520-LCP-RCP-AV89.5-BV430.5
translate([560,108-38.5+570,200-1])rotate([0,90,0])rotate([0,0,0])import("350_misumi_parts/bed/HFSB5-2020-520-AV89.5-BV430.5.stl");
/*
translate([40,54.5,220-6])rotate([0,90,0]){
tslot20(520);
//translate([15,50,89.5])rotate([90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
//translate([15,50,430.5])rotate([90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
}
*/
//HFSB5-2020-520-LCP-RCP-AV89.5-BV430.5
translate([560,108-38.5,200-1])rotate([0,90,0])rotate([0,0,0])import("350_misumi_parts/bed/HFSB5-2020-520-AV89.5-BV430.5.stl");
/*
translate([40,54.5+570,220-6])rotate([0,90,0]){
tslot20(520);
translate([15,50,89.5])rotate([90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
translate([15,50,430.5])rotate([90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
}
*/

translate([183,-2,0])import(str(path, "z_bed_left.stl"));
translate([183-2.5,177,180])rotate([0,0,180])import(str(path, "z_bed_right.stl"));

translate([0,710,0])mirror([0,1,0]){
translate([183,-2,0])import(str(path, "z_bed_left.stl"));
translate([183-2.5,177,180])rotate([0,0,180])import(str(path, "z_bed_right.stl"));
}
//import(str(path, "z_carriage_left.stl"));
//import("/Users/richard/Documents/voron/Trident/Voron-Trident/STLs/Z_Assembly/z_bed_left.stl");
}




module tslot_connectors(){
difference(){
cube([20,38,4]);
translate([10,9,-5])cylinder(r=5.7/2,h=40,$fn=300);
translate([10,9+20,-5])cylinder(r=5.7/2,h=40,$fn=300);
}
}







//translate([0,0,0])back_skirt();

//translate([160,160,0])front_skirt();


/*
*/
module base(){
x = 570; //410+160;
y = 640; //480+160;
difference(){
translate([10+15,30+15-20,20])cube([x+10-30,y+10-30+40,4]);
translate([10,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
translate([10+360-5.8+163,30-12,20-3])cube([62+5.8,43+2.+8,38]);
translate([-1,450+170,0]){
translate([10,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
translate([10+360-5.8+163,30-12,20-3])cube([62+5.8,43+2.+8,38]);
}

/*
translate([-1,450,0]){
translate([10+1-2,30-4.5,20-3])cube([60+5+2,43+4.,38]);
translate([10+361-6,30-4,20-3])cube([60+5+2,43+4,38]);
}
*/

}
}

module gantry_assy(){

//x = 410; //60
//y = 520; //170

x = 570;  //510+60//410
y = 680; //520; // 510 + 170 = 680
z = 500;

//front_skirt();

//HF5N610-X10X448Y10Y448-TPW
tslot20(z); 
translate([0,y,0])tslot20(z);
translate([x,0,0])tslot20(z);
translate([x,y,0])tslot20(z);

translate([x,20+5,20+5])rotate([-90,0,0])tslot20(y-20); //500
translate([0,20+5,20+5])rotate([-90,0,0])tslot20(y-20); //500

//translate([25+45,20,20+5])rotate([0,90,0])tslot20(x-20-90); //300
translate([25,0,20+5])rotate([0,90,0])tslot20(x-20); //390

//translate([25+45,y-20,20+5])rotate([0,90,0])tslot20(x-20-90); //300
translate([25,y,20+5])rotate([0,90,0])tslot20(x-20); //390

translate([0,0,z-140]){
translate([25+35,0,20+5])rotate([0,90,0])tslot20(x-20-70);  //holds the motors 320
translate([25+35,y,20+5])rotate([0,90,0])tslot20(x-20-70); //390
}

translate([x,20+5,20+5+z])rotate([-90,0,0])tslot20(y-20); //500
translate([x,20+5,20+5+z-140])rotate([-90,0,0])tslot20(y-20); //500
translate([0,20+5,20+5+z-140])rotate([-90,0,0])tslot20(y-20); //500
translate([0,20+5,20+5+z])rotate([-90,0,0])tslot20(y-20); //500
//HF5N642-X10X632-TPW
translate([-20,0,z]){
translate([25,0,20+5])rotate([0,90,0])tslot20(x+20); //430
translate([25,y,20+5])rotate([0,90,0])tslot20(x+20); //430
}
/*
*/


}


module misumi_gantry_assy(){


translate([-30+4,300,400-21.8])color("silver")rotate([0,0,90])import("../../mgn12h_conversion/MGN12_rail_holes.stl");
translate([-30+4+41,170,400-21.8])color("pink")rotate([0,0,90])import("../../mgn12h_conversion/MGN12H_block.stl");
translate([-30+4+570,300,400-21.8])color("silver")rotate([0,0,90])import("../../mgn12h_conversion/MGN12_rail_holes.stl");
translate([-30+4+41+570,170,400-21.8])color("pink")rotate([0,0,90])import("../../mgn12h_conversion/MGN12H_block.stl");
translate([-30+4+10.8+570,196-11+1,400-39.8])color("lime")rotate([0,180,0])import("../../mgn12h_conversion/xy_joint_left_lower_MGN12HHHHHH.stl");
translate([-30+4+10.5+60.5,196-11+1,400-39.8])color("lime")rotate([0,0,0])import("../../mgn12h_conversion/xy_joint_right_lower_MGN12HHHHH.stl");
/*
*/

//x rail
//translate([-30+4+70+1,300-129,400-21.8-3])color("silver")rotate([0,90,0])tslot20(510);


translate([-30+4+70+1+50,300-129+15-128+118,400-21.8-3-15+8-138])rotate([90,0,0])color("silver")import("mgn9h/rail_300mm_200um_mgn9.stl");
translate([-30+4+70+1+250,300-129+15-128+118,400-21.8-3-15+8-138])rotate([90,0,0])color("silver")import("mgn9h/rail_300mm_200um_mgn9.stl");


translate([-30+4+70+1+250,300-129+15-128+116,400-21.8-3-15+10.5-140])color("silver")rotate([90,0,0])import("mgn9h/block_mgn9H_200um.stl");
translate([-30+4+70+1,300-129+15,400-21.8-3-15])color("")rotate([0,-90,0])import("second_try_350_scratch/HFSB5-2020-510.stl");

translate([0,-6,-9]){
translate([-30+4+70+1+382,300-129+15-128+77,400-21.8-3-15+10.5-20])import("../../carriage_trident_work/carriage_assay_model.stl");
translate([-30+4+70+1+382,300-129+15-128+77,400-21.8-3-15+10.5-20])import("../../carriage_trident_work/carriage_body_rear.stl");
}

x = 570;  //510+60//410
y = 680; //520; // 510 + 170 = 680
z = 500;


//x = 410;//+140;
//y = 520; //0+140;
z = 500;

//HFSB5-2020-550.stl
/*begin not needed */
#translate([15,15,0])rotate([0,180,0])import("350_misumi_parts/HFSB5-2020-500-LCP-RCP-AV360.stl");
translate([15,15+y,0])rotate([0,180,0])import("350_misumi_parts/HFSB5-2020-500-LCP-RCP-AV360.stl");
translate([x,0,0]){
translate([15,15,0])rotate([0,180,0])import("350_misumi_parts/HFSB5-2020-500-LCP-RCP-AV360.stl");
translate([15,15+y,0])rotate([0,180,0])import("350_misumi_parts/HFSB5-2020-500-LCP-RCP-AV360.stl");
}
/*end not needed */

/* needed */
translate([15,15+10,10])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660-AV335.stl");
//translate([15-200,15+10+335,10])rotate([0,90,0])cylinder(r=5.7/2,h=300,$fn=300);


//translate([15,15+10,10])rotate([90,90,0])import("350_misumi_parts/HFSB5-2020-500-TPW.stl");
translate([15,15+10,10+350])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");


//translate([15,15+10,10+480])rotate([90,90,0])import("350_misumi_parts/HFSB5-2020-500-TPW.stl");
translate([15,15+10,10+480])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");


//center base support
translate([15+x/2+5.15,15+10,10])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");
//translate([15+x/2+10+5.15,15+10+y/2-20,25])rotate([0,90,0])tslot20(260);
translate([15+x/2+10+5.15-20,15+10+y/2-20+15,25-15])rotate([0,90,0])import("second_try_350_scratch/HFSB5-2020-270.stl");
translate([15+x/2+10+5.15+260,15+10+y/2-20+15,25-15])rotate([0,90,0])import("second_try_350_scratch/HFSB5-2020-260.stl");
//translate([15+x/2+10-285,15+10+y/2-20,25])rotate([0,90,0])tslot20(270);

translate([x,0,0]){
translate([15,15+10,10])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660-AV335.stl");
translate([15,15+10,10+350])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");
translate([15,15+10,10+480])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");
}

translate([15,15+10,10])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660-AV335.stl");
translate([15,15+10,10+350])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");
translate([15,15+10,10+480])rotate([90,90,0])import("second_try_350_scratch/HFSB5-2020-660.stl");


translate([15+10+0,15,10])rotate([180,90,0])import("second_try_350_scratch/HFSB5-2020-550.stl");
translate([15+10,15,10+480])rotate([180,90,0])import("second_try_350_scratch/HFSB5-2020-550.stl");
translate([15+10,15+y,10])rotate([180,90,0])import("second_try_350_scratch/HFSB5-2020-550.stl");
translate([15+10,15+y,10+480])rotate([180,90,0])import("second_try_350_scratch/HFSB5-2020-550.stl");


/*
translate([15+10+45,15+y-20,10])rotate([180,90,0])import("350_misumi_parts/HFSB5-2020-300.stl");
translate([15+10+45,15+20,10])rotate([180,90,0])import("350_misumi_parts/HFSB5-2020-300.stl");
*/

/* I can cut */
translate([15+10+35,15+y,10+350])rotate([180,90,0])import("second_try_350_scratch/HFSB5-2020-480.stl");
//translate([15+10+35,15+y-15,10+365])rotate([0,90,0])tslot20(480);


/*


translate([15+10+35,15,10+600])rotate([180,90,0])import("misumi_parts/HFSB5-2020-460.stl");
*/

}

module corners(){

/*
*/
translate([-53+60-134,-68+0.5-50+774.5-652,122.5-310])rotate([0,-90,-90])import("../corner_a_x2.stl");
translate([-53+60-134,-68+0.5-50+774.5-652+800-15.5-111-133+160-0.5,122.5-310+310])rotate([0,90,270])import("../corner_b_x2.stl");
translate([652.5-210+160.5,-0.5,0.2])rotate([0,0,90]){
translate([-53+60-136.5+135,-68+0.5-50+774.5-651.5-130,122.5-00])rotate([0,90,0])import("../corner_b_x2.stl");
//translate([-53+60-136.5,-68+0.5-50+774.5-651.5,122.5-310])rotate([0,-90,-90])import("../corner_a_x2.stl");
translate([-53+60-134+780-107.5+160-0.5,-68+0.5-50+774.5-780-2,-188])rotate([0,-90,0])import("../corner_a_x2.stl");
}
/*
*/
}

module z_constrain(){
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+226+380])rotate([0,0,00])difference(){
union(){
cylinder(r=(22.2+6)/2,h=11,$fn=300);
translate([1.6+8,-40+5,0])cube([12,50-5,8]);
translate([1.6+8+8,-40.5,-18])cube([12-8,18,28]);
}
translate([5,-32,4])rotate([0,90,0])cylinder(r=(5.7)/2,h=18,$fn=300);
translate([5-1.4-4,-32,4])rotate([0,90,0])cylinder(r=(10.7)/2,h=18,$fn=300);
translate([5,-32,-14])rotate([0,90,0])cylinder(r=(5.7)/2,h=18,$fn=300);
translate([0,0,-1])cylinder(r=(8.7)/2,h=18,$fn=300);
translate([0,0,3.1])cylinder(r=(22.2)/2,h=8,$fn=300);
}
}

module z_axis_assy(){
translate([-53+60-134+564,-68+0.5-50+774.5-652+147.5,122.5-310+370])rotate([0,-180,90])import("../z_stepper_left.stl");
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+206])rotate([0,0,90])color("")import("../nema17.stl");
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+226])rotate([0,0,00])cylinder(r=8.7/2,h=300,$fn=300);
//z_constrain();
}

//module front_skirt(){
module left_skirt(){
translate([627-212,-30+0.5-2.5-160.3,-183.0])rotate([90,0,90])difference(){
import("../350/front_skirt_b_350.stl");
translate([229-1,85,0])cube([4,100,80]);
}
translate([627-212,-30+0.5+210-3-2.5-160,-183.0+121])rotate([90,0,90])
translate([-59+0+77,-20+24-4,-30+30])cube([10,57,8]);
translate([627-212,-30+0.5+210-3-2.5-160,-183.0+121])rotate([90,0,90])difference(){
import("../350/longer_custom_center_300.stl");
translate([-59+0,-20,-30])cube([80,100,80]);
translate([-59+341.5,-20,-30])cube([80,100,80]);
}
translate([627-212,-30+0.5+210-3-2.5-160+60-9,-183.0+121])rotate([90,0,90])difference(){
import("../350/longer_custom_center_300.stl");
translate([-59+0,-20,-30])cube([281,100,80]);
translate([-59+341.5+10,-20,-30])cube([80,100,80]);
}
difference(){
translate([627-212,-30+422-110,-183.0])rotate([90,0,90])import("../350/front_skirt_a_350.stl");
//translate([-59+341.5+110,-20+345,-70])cube([80-0,30,80]);
}
//translate([627,-30,-182])rotate([90,0,90])import("350/rear_center_skirt_350.stl");
}



module right_skirt_powercord(){
translate([627-212,-30+0.5-2.5-160.3,-183.0])rotate([90,0,90])difference(){
import("../350/front_skirt_b_350.stl");
//translate([240,50,0])rotate([0,0,90])
translate([229-1,85,0])cube([4,100,80]);
}
translate([627-212,-30+0.5+210-3-2.5-160,-183.0+121])rotate([90,0,90])
translate([-59+0+77,-20+24-4,-30+30])cube([10,57,8]);
translate([627-212,-30+0.5+210-3-2.5-160,-183.0+121])rotate([90,0,90])difference(){
import("../350/longer_custom_center_300.stl");
translate([-59+0,-20,-30])cube([80,100,80]);
translate([-59+341.5,-20,-30])cube([80,100,80]);
}
translate([627-212,-30+0.5+210-3-2.5-160+60-9,-183.0+121])rotate([90,0,90])difference(){
union(){
import("../350/longer_custom_center_300.stl");
translate([50,0,0])import("../350/longer_custom_center_300.stl");
}
translate([-59+0,-20,-30])cube([281,100,80]);
translate([-59+341.5+10+45-50,-20,-30])cube([14+52,100,80]);
//translate([-59+341.5+10,-20,-30])cube([80,100,80]);
}
difference(){
union(){
translate([627-212,-30+422-110,-183.0])rotate([90,0,90])import("../350/front_skirt_a_350.stl");
//translate([627-212,-30+422+155,-183+240])color("green")rotate([-90,0,-90])import("../350/power_inlet_filtered.stl");
}
translate([-59+341.5+110,-20+345,-70])cube([80-0,30+83,80]);
}


translate([0,-58,0])difference(){
union(){
//translate([627-212,-30+422-110,-183.0])rotate([90,0,90])import("../350/front_skirt_a_350.stl");
translate([627-212,-30+422+155,-183+240])color("green")rotate([-90,0,-90])import("../350/power_inlet_filtered.stl");
}
translate([-59+341.5+110,-20+345+5,-70])cube([80-0,30+48,80]);
translate([-59+341.5+110,-20+345+175,-70])cube([80-0,30+48,80]);
}
/*
*/



//translate([627,-30,-182])rotate([90,0,90])import("350/rear_center_skirt_350.stl");
}











module back_skirt(){
translate([440,550,0])rotate([0,0,180])front_skirt();
}

module front_side_skirt(){
mirror([0,1,0]){
translate([186.5+159.5,550-25,0-183])rotate([0,-90,-90])difference(){import("../350/side_skirt_a_350_x2.stl");
translate([110,80,-10])cube([90,20,60]);
}
translate([186.5-231.5,550-25,0-183])rotate([0,-90,-90])difference(){import("../350/side_skirt_b_350_x2.stl");
    translate([100-1+0,-10+140-2+71,-5])cube([90,50,50]);
}
translate([186.5+170+7+88,550-25,0-183+121])rotate([90,0,180])difference(){
import("../350/side_wall_298.stl");
//translate([0-3,-10,-5])cube([20,90,50]);
//translate([0-3+295,-10,-5])cube([10,90,50]);
}
}
}

module back_side_skirt(){


//translate([820,540,-90])color("blue")rotate([0,90,90])import("../350/rj45_jack/RJ45_v4.stl");

translate([186.5+159.5,550-25,0-183])rotate([0,-90,-90])difference(){import("../350/side_skirt_a_350_x2.stl");
translate([110,80,-10])cube([90,20,60]);
}
translate([186.5-231.5,550-25,0-183])rotate([0,-90,-90])difference(){import("../350/side_skirt_b_350_x2.stl");
    translate([100-1+0,-10+140-2+71,-5])cube([90,50,50]);
}
translate([186.5+170+7+88,550-25,0-183+121])rotate([90,0,180])difference(){
import("../350/side_wall_298.stl");
//translate([0-3,-10,-5])cube([20,90,50]);
//translate([0-3+295,-10,-5])cube([10,90,50]);
}
}









module top_left_sawtooth(width,length,margin){
difference(){
union(){
translate([width/2+margin/2+0,length/2+margin/2,0])difference(){
union(){
translate([width/4-1+40-10,length/2-1,0])cube([17+20,18,3]);
translate([width/4-1+40-150,length/2-1,0])cube([17+20,18,3]);
translate([width/2-1,length/3-10,0])cube([17,20+20,3]);
translate([width/2-1,50,0])cube([17,20+20,3]);
cube([width/2-margin/2,length/2-margin/2,3]);
}

translate([50,280,-50])#cylinder(r=18/2,h=100,$fn=300);

translate([210,315,-50])#cylinder(r=10/2,h=100,$fn=300);

for(i=[0,1,2,3]){
translate([0,length*i/8-margin,-1])cube([10-margin,640*1/16+margin,6]); 
if(i>0){
translate([width*i/8-margin/2,-margin/2,-1])cube([width/15+margin,10,6]);
}
}
translate([width/4-1+40+8,length/2-1+11,-20])cylinder(r=5.7/2,h=300,$fn=300);
translate([width/4-1+40-150+8,length/2-1+11,-20])cylinder(r=5.7/2,h=300,$fn=300);
translate([width/2-1+11,length/3+10,-20])cylinder(r=5.7/2,h=300,$fn=300);
translate([width/2-1+11,50+10,-20])cylinder(r=5.7/2,h=300,$fn=300);

translate([8-8+5,length/2-1+11-30,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5,length/2-1+11-30-130-120,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5+30,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5+30+225,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
}
}

translate([-22,-21,-30]){
translate([-1-5,450+170-7,0]){
translate([10+360-5.8+163,30-12,20-3])cube([62+5.8,43+2.+8,38]);
}
}
}
translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([16+73.5+412,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,3]);
}
}


}

module bottom_left_sawtooth(width,length,margin){

difference(){ 
union(){
color("lightblue")translate([0,length/2+margin/2+0,0])
difference(){
union(){
translate([width/4-1+100-20,length/2-1,0])cube([17+20,18,3]);
translate([width/4-1+80-150,length/2-1,0])cube([17+20,18,3]);
translate([-16,length/3-10,0])cube([17,20+20,3]);
translate([-16,50-10,0])cube([17,20+20,3]);

cube([width/2-margin/2,length/2-margin/2,3]);
for(i=[0,1,2,3]){
translate([width/2-margin/2,length*i/8,0])cube([10-margin,length*1/16-margin,3]); 
}
}
#translate([65,315,-50])cylinder(r=10/2,h=100,$fn=300);

for(j=[0,1,2,3]){
translate([width*j/8-margin/2,-margin/2,-2])cube([width*1/15+margin,10-margin,8]);
}
translate([width/4-1+100+8-10,length/2-1+11,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([width/4-1+80-150+8+10,length/2-1+11,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([-16+6,length/3+11,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([-16+6,50+11,-20])cylinder(r=5.7/2,h=200,$fn=300);
}
}
translate([-22,-21,-30]){
translate([-1-5,450+170-7,0]){
translate([16,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
}
}
translate([0,length/2,0]){
translate([8-8+5+30+18,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5+30+220,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([width/2,-40,0]){
translate([8-8+5,length/2-1+11-30,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5,length/2-1+11-30-130-120,-120])cylinder(r=5.7/2,h=300,$fn=300);
}
}
}
translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,3]);
}
}
}



module top_right_sawtooth(width,length,margin){

difference(){union(){
color("peru")translate([width/2+margin/2+0,0,0])difference(){
union(){
translate([width/4-1+40-10,-17,0])cube([17+20,18,3]);
translate([width/4-1+40-150,-17,0])cube([17+20,18,3]);
translate([width/2-1,length/3+40-10,0])cube([17,20+20,3]);
translate([width/2-1,80,0])cube([17,20+20,3]);

cube([width/2-margin/2,length/2-margin/2,3]);
for(i=[1,2,3]){
translate([width*i/8,length/2-margin/2,0])cube([width/15-margin,10-margin,3]);
}
}
for(i=[0,1,2,3]){
translate([0,length*i/8-margin,-1])cube([10-margin,length*1/16+margin,6]); 
//#translate([width*i/8,length/2-margin/2,0])cube([width/15-margin,10-margin,4]);
}

translate([width/4-1+40+8,-17+7.5,-20])cylinder(r=5.7/2,h=100,$fn=300);
translate([width/4-1+40-150+8,-17+7.5,-20])cylinder(r=5.7/2,h=100,$fn=300);
translate([width/2-1+11,length/3+40+10,-20])cylinder(r=5.7/2,h=100,$fn=300);
translate([width/2-1+11,80+10,-20])cylinder(r=5.7/2,h=100,$fn=300);

}



/*
translate([-22,-21+2,-30]){
translate([-1-5,450+170-7,13]){
translate([0,-516.5,0]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
}
}
}
*/


}

translate([-22,-21,-30]){
translate([10+360-5.8+163-6,30-12,20-3])cube([62+5.8,43+2.+8,38]);
}

translate([width/2,length/2,0]){
translate([8-8+5+30+18+28,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5+30+220-30,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
}
translate([width/2,0,0]){
translate([8-8+5,length/2-1+11-30,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5,length/2-1+11-30-130-120,-120])cylinder(r=5.7/2,h=300,$fn=300);
}


}


translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([0,-516.5,0]){
translate([16+73.5+410,30-12-77,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,3]);
}
}
}



}


module bottom_right_sawtooth(width,length,margin){

difference(){union(){
color("pink")translate([0,0,0])union(){

translate([width/4-1+40+70-10,-17,0])cube([17+20,18,3]);
translate([width/4-1+40-150+50-10,-17,0])cube([17+20,18,3]);
translate([-1-15,length/3+40-10,0])cube([17,20+20,3]);
translate([-1-15,80-10,0])cube([17,20+20,3]);



cube([width/2-margin/2,length/2-margin/2,3]);
for(i=[0,1,2,3]){
translate([width/2-margin/2,length*i/8,0])cube([10-margin,length*1/16-margin,3]); 
translate([width*i/8,length/2-margin/2,0])cube([width/15-margin,10-margin,3]);
}
}
translate([65,20,-50])#cylinder(r=10/2,h=100,$fn=300);


/*
translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
}
}


translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([16+73.5+412,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
}
}
*/

}

translate([width/4-1+40+70+8,-17+7,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([width/4-1+40-150+50+8,-17+7,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([-1-15+6,length/3+40+10,-20])cylinder(r=5.7/2,h=200,$fn=300);
translate([-1-15+6,80+10,-20])cylinder(r=5.7/2,h=200,$fn=300);

translate([-22,-21,-30]){
translate([10,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
}

translate([0,length/2,0]){
translate([8-8+5+30+18+28-65,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5+30+220-30,length/2-1+11-30-130-175,-120])cylinder(r=5.7/2,h=300,$fn=300);
}
translate([width/2,0,0]){
translate([8-8+5,length/2-1+11-65,-120])cylinder(r=5.7/2,h=300,$fn=300);
translate([8-8+5,length/2-1+11-30-130-120-40,-120])cylinder(r=5.7/2,h=300,$fn=300);
}



}

translate([-22,-21+2,-30]){
translate([-1-5,450+170-7,13]){
translate([0,-516.5,0]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,3]);
}
}
}




}



module sawtooth_base(){

// Main cube dimensions
width = 550; //570;
length = 660; //640;
height = 4;
margin = 0.75;

difference(){

union(){
top_right_sawtooth(width,length,margin);

bottom_left_sawtooth(width,length,margin);
top_left_sawtooth(width,length,margin);
bottom_right_sawtooth(width,length,margin);
/*
*/
}
/*
translate([-22,-21,-30]){
translate([10,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
translate([10+360-5.8+163-6,30-12,20-3])cube([62+5.8,43+2.+8,38]);
translate([-1-5,450+170-7,0]){
translate([16,30-12,20-3])cube([60+5.8-3,43+2.+8,38]);
translate([10+360-5.8+163,30-12,20-3])cube([62+5.8,43+2.+8,38]);
}
}
*/
}


/*
translate([-22,-21,-30]){
translate([-1-5,450+170-7,13]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
translate([16+73.5+412,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
translate([0,-516.5,0]){
translate([16+73.5,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
translate([16+73.5+412,30-12-60,20-3])rotate([0,0,45])cube([60+5.8-3,43+2.+8,4]);
}
}
}
*/


}



