use<writescad/Write.scad>
include <tslot.inc.scad>
include <PiZero.scad>
include <arducam-raspi.scad>
include <The_Ultimate_box_maker/files/U_Box_V104_Test_Cleaned.scad>
/*
include <modparts.scad>
use<writescad/write.scad>
include <bom_vacuum_pumps_box.scad>
include <bom_openmv_camera.scad>
include <nanoplotter.scad>
include <PiZero.scad>
*/


//top();
//fan60mm();

//rj45_jack3();
//miuzei_camera_breadboard_b();
//labautobox();







module labautobox_shelf_support(){

translate([90,87,-3])difference(){
rotate([0,0,45])cylinder(r=70,2,h=5,$fn=4);
rotate([0,0,45])cylinder(r=50,2,h=5,$fn=4);
translate([30,42,-20])rotate([0,0,0])cylinder(r=3.7/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=3.7/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=3.7/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=3.7/2,h=95,$fn=30);
}
}


module labautobox_shelf_a(){
difference(){
union(){
translate([-8,-13,0])cube([196.5,196,3]);
translate([-8+20,-13-20,0])cube([20+176.5-40,196+40,3]);
}
translate([-8,-13+196/2,-1])cube([196.5+3,3+200,10]);
translate([-8+196.5/2,-13-20,-2])cube([3+200,196+3+50,10]);
translate([0,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([0,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([90,86,0]){
translate([30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
}
}
}

module labautobox_shelf_b(){
difference(){
union(){
translate([-8,-13,0])cube([196.5,196,3]);
translate([-8+20,-13-20,0])cube([20+176.5-40,196+40,3]);
}
translate([-8,-13+196/2,-1])cube([196.5+3,3+200,10]);
translate([-8+196.5/2,-13-20,-2])cube([3,196+3+50,100]);
translate([-8+196.5/2-200,-13-20,-2])cube([3+200,196+3+50,10]);
translate([0,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([0,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([90,86,0]){
translate([30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
}
}
}


module labautobox_shelf_c(){
difference(){
union(){
translate([-8,-13,0])cube([196.5,196,3]);
translate([-8+20,-13-20,0])cube([20+176.5-40,196+40,3]);
}
translate([-8,-13+196/2-200,-1])cube([196.5+3,3+200,10]);
translate([-8+196.5/2-200,-13-20,-2])cube([3+200,196+3+50,10]);
translate([0,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([0,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([90,86,0]){
translate([30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
}
}
}

module labautobox_shelf_d(){
difference(){
union(){
translate([-8,-13,0])cube([196.5,196,3]);
translate([-8+20,-13-20,0])cube([20+176.5-40,196+40,3]);
}
translate([-8,-13+196/2,-1])cube([196.5+3,3,10]);
translate([-8+196.5/2,-13-20,-2])cube([3,196+3+50,10]);
translate([0,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([0,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([90,86,0]){
translate([30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
}
}
}

























module labautobox_shelf(){
difference(){
union(){
translate([-8,-13,0])cube([196.5,196,3]);
translate([-8+20,-13-20,0])cube([20+176.5-40,196+40,3]);
}
translate([-8,-13+196/2,-1])cube([196.5+3,3,10]);
translate([-8+196.5/2,-13-20,-2])cube([3,196+3+50,10]);
translate([0,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([0,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,40,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([180,140,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,-25,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([130,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([50,195,-30])cylinder(r=3.7/2,h=150,$fn=30);
translate([90,86,0]){
translate([30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
translate([-30,-42,-20])rotate([0,0,0])cylinder(r=2.9/2,h=95,$fn=30);
}
}
}







module multichannel_syringe_to_labautobox_connect(){
difference(){union(){
translate([-106,-20,81-10])cube([8,25,40]);
translate([-106,-20+17,81])cube([40,8,20]);
translate([-106+6,-20+17,81-10])rotate([0,-15,-0])cube([35,8,20]);
translate([-106,-20+17,81+10])rotate([0,15,-0])cube([35,8,20]);
}
translate([-106+4.2,-20+9.5,81-1])rotate([0,90,0])cylinder(r=8/2,h=4,$fn=30);
translate([-106-5,-20+9.5,81-1])rotate([0,90,0])cylinder(r=4.7/2,h=34,$fn=30);

translate([-106+4.2,-20+9.5,81-1+23])rotate([0,90,0])cylinder(r=8/2,h=4,$fn=30);
translate([-106-5,-20+9.5,81-1+23])rotate([0,90,0])cylinder(r=4.7/2,h=34,$fn=30);


translate([-106+4.2+10,-20+9.5+11,81-1+23/2])rotate([90,0,0])cylinder(r=8/2,h=4,$fn=30);
translate([-106+4.2+10,-20+25.5,81-1+23/2])rotate([90,0,0])cylinder(r=4.7/2,h=34,$fn=30);
translate([-106+4.2+28,-20+9.5+11,81-1+23/2])rotate([90,0,0])cylinder(r=8/2,h=4,$fn=30);
translate([-106+4.2+28,-20+25.5,81-1+23/2])rotate([90,0,0])cylinder(r=4.7/2,h=34,$fn=30);

}
}



module labautobox_microfluidics(){

translate([-150+10,-240-11+10,-130])valve_assy_4set_noslot();
translate([-150+10-206,-240-11+10,-130])valve_assy_4set_noslot();
translate([-100+315,-174+235,150-30])rotate([0,0,0])nalgene_bottle_assy_electrocaloric();
translate([-50+280,-41,100-1])rotate([0,0,0])multichannel_syringe_to_labautobox_connect();
translate([-50+280,-41,100-1])rotate([90,0,0])multichannel_syringe_assy();
//pressurecomp_to_valves();

/*
labautobox_pressurecompensation_tubing();
labautobox_multichannel_syringe_tubing();
*/
labautobox_multichannel_syringe_tubing_to_pipettes();
labautobox_pcv_wash_waste_tubing();

//wash bottle
color("lightblue"){
translate([100,-270,-50])cylinder(r=180/2,h=200,$fn=30);
translate([100,-270,-50])cylinder(r=100/2,h=250,$fn=30);
translate([100,-270,-50])cylinder(r=8/2,h=270,$fn=30);
translate([100,-270,220])rotate([-55-2,67,0])cylinder(r=8/2,h=178,$fn=30);
}

//waste bottle
translate([0,-200,0])color("lightblue"){
translate([100,-270,-50])cylinder(r=180/2,h=200,$fn=30);
translate([100,-270,-50])cylinder(r=100/2,h=250,$fn=30);
translate([100,-270,-50])cylinder(r=8/2,h=270,$fn=30);
translate([100,-270,220])rotate([-55-2,67,0])cylinder(r=8/2,h=325,$fn=30);
}

/*
//bleach bottle
translate([0,-400,0])color("lightblue"){
translate([100,-270,-50])cylinder(r=180/2,h=200,$fn=30);
translate([100,-270,-50])cylinder(r=100/2,h=250,$fn=30);
translate([100,-270,-50])cylinder(r=8/2,h=270,$fn=30);
translate([100,-270,220])rotate([-55-30,-67-32,2])cylinder(r=8/2,h=791,$fn=30);
}
*/


}


module labautobox_pcv_wash_waste_tubing(){

translate([275,4,330])color("lightblue")cylinder(r=8/2,h=50,$fn=30);
translate([275,4-4,330+50])color("lightblue")rotate([-90,0,0])cylinder(r=8/2,h=50,$fn=30);
translate([275,4-4+50,330+50])color("lightblue")rotate([-90+5,0,42])cylinder(r=8/2,h=320+300,$fn=30);
//#translate([275,4-4+50,330+50])color("lightblue")rotate([-90-33,0,55])cylinder(r=8/2,h=320,$fn=30);

//water reservoir to PCV and wash
translate([275-202,4+200,330-122])color("lightblue")rotate([90,0,0])cylinder(r=8/2,h=50,$fn=30);
translate([275-202+25,4+200-48,330-122])color("lightblue")rotate([90-20,60,0])cylinder(r=8/2,h=300,$fn=30);
translate([275-202,4+200-48,330-122])color("lightblue")rotate([90,0,90])cylinder(r=8/2,h=40,$fn=30);
translate([275-202+39,4+200,330-122])color("lightblue")rotate([90,0,0])cylinder(r=8/2,h=50,$fn=30);

//wash station
translate([275-202+26,4+200,330-122])color("lightblue")rotate([90,0,0])cylinder(r=8/2,h=10,$fn=30);
translate([275-202+26,4+200-10,330-122])color("lightblue")rotate([0,0,0])cylinder(r=8/2,h=50,$fn=30);
translate([275-202+26,4+200-14,330-122+50])color("lightblue")rotate([-90,0,0])cylinder(r=8/2,h=150,$fn=30);
translate([275-202+26,4+200-14+150,330-122+52])color("lightblue")rotate([-90+38,-33.5+10,40])cylinder(r=8/2,h=295,$fn=30);
//#translate([275-202+26,4+200-14+150,330-122+52])color("lightblue")rotate([-90-58,-33.5,0])cylinder(r=8/2,h=245,$fn=30);

//waste station
translate([275-202+39+26,4+200,330-122])color("lightblue")rotate([90-20,57,0])cylinder(r=8/2,h=430,$fn=30);
translate([275-202+39+39,4+200,330-122])color("lightblue")rotate([90,0,0])cylinder(r=8/2,h=10,$fn=30);
translate([275-202+39+39,4+200-10,330-122])color("lightblue")rotate([0,0,0])cylinder(r=8/2,h=70,$fn=30);
translate([275-202+39+39,4+200-10-4,330-122+70])color("lightblue")rotate([-90,0,0])cylinder(r=8/2,h=150,$fn=30);
translate([275-202+39+39,4+200-10-4+150,330-122+70])color("lightblue")rotate([-90+30,-19.5,0+52])cylinder(r=8/2,h=320,$fn=30);
//#translate([275-202+39+39,4+200-10-4+150,330-122+70])color("lightblue")rotate([-90-68.5,-19.5,0])cylinder(r=8/2,h=240,$fn=30);


/*
//bleach station
translate([-0,118,207])rotate([0,90,0])color("lightblue")cylinder(r=8/2,h=10,$fn=30);
translate([-0,118+13,207])rotate([0,90,0])color("lightblue")cylinder(r=8/2,h=20,$fn=30);
translate([-0+20,118+13,207])rotate([-0.5,-0.5,0])color("lightblue")cylinder(r=8/2,h=202,$fn=30);
translate([-0+20,118+13,207+200])rotate([-140+62-8,15-1+10,0+24])color("lightblue")cylinder(r=8/2,h=375,$fn=30);
//#translate([-0+20,118+13,207+200])rotate([-140,15,0])color("lightblue")cylinder(r=8/2,h=480,$fn=30);
*/


}


module labautobox_multichannel_syringe_tubing_to_pipettes(){


//1
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-29])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29])rotate([180+90-55+55+55+11,0-57,0])color("lightblue")cylinder(r=3/2,h=540,$fn=30);
//#translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29])rotate([180+90-55,0,0])color("lightblue")cylinder(r=3/2,h=300,$fn=30);

//2
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-29-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71])rotate([180+90-45+45+70,0-48,0])color("lightblue")cylinder(r=3/2,h=290+100,$fn=30);
//#translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71])rotate([180+90-45,0,0])color("lightblue")cylinder(r=3/2,h=240,$fn=30);
//translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+56,335+55+40-182-10-29-3])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=73,$fn=30);

//3
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-71-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-29-71-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71])rotate([180+90-30+30+70,0-45,0])color("lightblue")cylinder(r=3/2,h=185+340,$fn=30);
///translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71])rotate([180+90-30,0,0])color("lightblue")cylinder(r=3/2,h=185,$fn=30);

//translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+56+59,335+55+40-182-10-29-3-3])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=73,$fn=30);

//4
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-71-71-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-10-29-71-71-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71-71])rotate([180+90-10+10+72,0-40,0])color("lightblue")cylinder(r=3/2,h=170+385,$fn=30);
//translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71-71])rotate([180+90-10,0,0])color("lightblue")cylinder(r=3/2,h=170,$fn=30);
//translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44+56+59+27,335+55+40-182-10-29-3-3-3])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=73,$fn=30);

//5
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-29])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29])rotate([180+90-55+55+53,0-34,0])color("lightblue")cylinder(r=3/2,h=300,$fn=30);
//#translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29])rotate([180+90-55,0,0])color("lightblue")cylinder(r=3/2,h=300,$fn=30);


//6
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-29-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71])rotate([180+90-45+45+60,0-20,0])color("lightblue")cylinder(r=3/2,h=320,$fn=30);
//#translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71])rotate([180+90-45,0,0])color("lightblue")cylinder(r=3/2,h=240,$fn=30);


//7
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-71-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-29-71-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71])rotate([180+90-30+30+65,0-25,0])color("lightblue")cylinder(r=3/2,h=395,$fn=30);
//translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71])rotate([180+90-30,0,0])color("lightblue")cylinder(r=3/2,h=185,$fn=30);


//8
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-71-71-71])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);

translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-29-71-71-71])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=50,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71-71])rotate([180+90-10+10+70,-20,0])color("lightblue")cylinder(r=3/2,h=440,$fn=30);
//#translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+50,335+55+40-182-10-29-71-71-71])rotate([180+90-10,0,0])color("lightblue")cylinder(r=3/2,h=170,$fn=30);

/*
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-10-29-71-71-71])rotate([180+90+55,0,0])color("lightblue")cylinder(r=3/2,h=249,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44+56+59+27,335+55+40-182-10-29-3-3-3])rotate([180+90,0,0])color("lightblue")cylinder(r=3/2,h=73,$fn=30);
*/

}
module labautobox_multichannel_syringe_tubing(){
translate([-160+16+395+8-145+31,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=280,$fn=30);
translate([-160+16+395+8-145+31,-117+119-100+16+280,335+55+40-70])rotate([180,-50,26])color("lightblue")cylinder(r=3/2,h=131,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182])rotate([0,0,0])color("lightblue")cylinder(r=3/2,h=29,$fn=30);

translate([-160+16+395+8-145+31-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=280,$fn=30);
translate([-160+16+395+8-145+31-14,-117+119-100+16+280,335+55+40-70])rotate([180,-50,26])color("lightblue")cylinder(r=3/2,h=177,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-71])rotate([-12,14,0])color("lightblue")cylinder(r=3/2,h=75,$fn=30);

translate([-160+16+395+8-145+31-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=280,$fn=30);
translate([-160+16+395+8-145+31-14-14,-117+119-100+16+280,335+55+40-70])rotate([180,-50,25.25])color("lightblue")cylinder(r=3/2,h=177+36,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-71-70])rotate([-12,14,0])color("lightblue")cylinder(r=3/2,h=75+48,$fn=30);

translate([-160+16+395+8-145+31-14-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=280,$fn=30);
translate([-160+16+395+8-145+31-14-14-14,-117+119-100+16+280,335+55+40-70])rotate([180,-50,25.25])color("lightblue")cylinder(r=3/2,h=177+36+35,$fn=30);
translate([-160+16+395+8-145+31+90,-117+119-100+16+280+44,335+55+40-182-71-70-70])rotate([-12.25,13.5,0])color("lightblue")cylinder(r=3/2,h=75+48+50,$fn=30);


translate([-160+16+395+8-145+31-14-14-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=280,$fn=30);
translate([-160+16+395+8-145+31-14-14-14-14,-117+119-100+16+280,335+55+40-70])rotate([180,51,-26])color("lightblue")cylinder(r=3/2,h=87,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182])rotate([14,0,0])color("lightblue")cylinder(r=3/2,h=60,$fn=30);

translate([-160+16+395+8-145+31-14-14-14-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=305,$fn=30);
translate([-160+16+395+8-145+31-14-14-14-14-14,-117+119-100+16+280+24,335+55+40-70])rotate([180,35,-42])color("lightblue")cylinder(r=3/2,h=132,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-71])rotate([-22,-7,0])color("lightblue")cylinder(r=3/2,h=84,$fn=30);


translate([-160+16+395+8-145+31-14-14-14-14-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=305,$fn=30);
translate([-160+16+395+8-145+31-14-14-14-14-14-14,-117+119-100+16+280+24,335+55+40-70])rotate([180,35,-52])color("lightblue")cylinder(r=3/2,h=157,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-71-71])rotate([-22,-10,0])color("lightblue")cylinder(r=3/2,h=140,$fn=30);


translate([-160+16+395+8-145+31-14-14-14-14-14-14-14,-117+119-100+16,335+55+40-70])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=305,$fn=30);
translate([-160+16+395+8-145+31-14-14-14-14-14-14-14,-117+119-100+16+280+24,335+55+40-70])rotate([180,45,-62])color("lightblue")cylinder(r=3/2,h=168,$fn=30);
translate([-160+16+395+8-145+31-116,-117+119-100+16+280+44,335+55+40-182-71-71-71])rotate([-22,-10,0])color("lightblue")cylinder(r=3/2,h=228,$fn=30);

}

module labautobox_pressurecompensation_tubing(){
translate([-160+16+395+8,-117+119,335])color("lightblue")cylinder(r=5.5,h=100,$fn=30);
translate([-160+16+395+8,-117+119,335+95])rotate([0,-90,0])color("lightblue")cylinder(r=5.5,h=145,$fn=30);
translate([-160+16+395+8-145,-117+119,335+55+40])rotate([-90,0,0])color("lightblue")cylinder(r=3/2,h=260,$fn=30);
translate([-160+16+395+8-145,-117+119+260,335+55+40])rotate([180,0,0])color("lightblue")cylinder(r=3/2,h=400,$fn=30);


translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190])rotate([0,90,0])color("lightblue")cylinder(r=3/2,h=126,$fn=30);
translate([-160+16+395+8-145-3+124,-117+119+260,335+55+40-190])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3+124,-117+119+260,335+55+40-190-72])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-72])rotate([0,90,0])color("lightblue")cylinder(r=3/2,h=126,$fn=30);
translate([-160+16+395+8-145-3+124,-117+119+260,335+55+40-190-71-71])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-71-71])rotate([0,90,0])color("lightblue")cylinder(r=3/2,h=126,$fn=30);
translate([-160+16+395+8-145-3+124,-117+119+260,335+55+40-190-72-71-68])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-71-71-68])rotate([0,90,0])color("lightblue")cylinder(r=3/2,h=126,$fn=30);

translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190])rotate([0,-90,0])color("lightblue")cylinder(r=3/2,h=84,$fn=30);
translate([-160+16+395+8-145-3-82,-117+119+260,335+55+40-190])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-72])rotate([0,-90,0])color("lightblue")cylinder(r=3/2,h=84,$fn=30);
translate([-160+16+395+8-145-3-82,-117+119+260,335+55+40-190-72])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-71-71])rotate([0,-90,0])color("lightblue")cylinder(r=3/2,h=84,$fn=30);
translate([-160+16+395+8-145-3-82,-117+119+260,335+55+40-190-72-71])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);
translate([-160+16+395+8-145-3,-117+119+260,335+55+40-190-71-71-68])rotate([0,-90,0])color("lightblue")cylinder(r=3/2,h=84,$fn=30);
translate([-160+16+395+8-145-3-82,-117+119+260,335+55+40-190-71-71-68])rotate([90,0,0])color("lightblue")cylinder(r=3/2,h=10,$fn=30);





/*
translate([-160+20-80,-117,450+45])rotate([-90,0,0])color("lightblue")cylinder(r=5.5,h=272,$fn=30);
translate([-160+20-80,-117+272,160])rotate([0,0,0])color("lightblue")cylinder(r=5.5,h=340,$fn=30);
translate([-160+20-84,-117+272,160])rotate([0,90,0])color("lightblue")cylinder(r=5.5,h=140,$fn=30);
translate([-160+20-84+70,-117+272-13,160])rotate([0,90,0])color("lightblue")cylinder(r=5.5,h=70,$fn=30);
translate([-160+20-84+70,-117+272-13,160])rotate([0,0,0])color("lightblue")cylinder(r=5.5,h=200,$fn=30);
translate([-160+20-84+70,-117+272-13,360])rotate([0,-90,0])color("lightblue")cylinder(r=5.5,h=195,$fn=30);
translate([-160+20-84+70-195,-117+272-10,360])rotate([90,0,0])color("lightblue")cylinder(r=5.5,h=143,$fn=30);
translate([-160+20-84+70-195,-117+272-13-140,230])rotate([0,0,0])color("lightblue")cylinder(r=5.5,h=134,$fn=30);
*/
}

module labautobox_extrusions(){

translate([-15,-15,5])rotate([-90,0,0])tslot20(200);
translate([-15+180,-15,5])rotate([-90,0,0])tslot20(200);
translate([-15+180-150-25+20,-15-25,5])rotate([0,90,0])tslot20(160);
translate([-15+180-150-25+20,-15-25+220,5])rotate([0,90,0])tslot20(160);

translate([0,0,200]){
translate([-15,-15,5])rotate([-90,0,0])tslot20(200);
translate([-15+180,-15,5])rotate([-90,0,0])tslot20(200);
translate([-15+180-150-25+20,-15-25,5])rotate([0,90,0])tslot20(160);
translate([-15+180-150-25+20,-15-25+220,5])rotate([0,90,0])tslot20(160);
}
translate([-15+180-150-25+25,-15-25+220,-45])rotate([0,0,90])tslot20(300);
translate([-15+180-150-25+25+180,-15-25+220,-45])rotate([0,0,90])tslot20(300);
translate([-15+180-150-25+25,-15-25+220-220,-45])rotate([0,0,90])tslot20(300);
translate([-15+180-150-25+25+180,-15-25+220-220,-45])rotate([0,0,90])tslot20(300);

}

module labautobox(){
labautobox_extrusions();
translate([-100+15-70-3+64,103+380+30-230,-73+0.7+20])import("files/foot_big.stl");
translate([-100+15-70-3+64+180,103+380+30-230,-73+0.7+20])import("files/foot_big.stl");
translate([-100+15-70-3+64+180,103+380+30-230-220,-73+0.7+20])import("files/foot_big.stl");
translate([-100+15-70-3+64,103+380+30-230-220,-73+0.7+20])import("files/foot_big.stl");

/*
translate([180,180,5])rotate([0,0,180]){
terminalfrontpanel();
color("black")atxbackbackpanel();
translate([180,175,0])rotate([0,0,180]){
top_assy();
bottom_assy();
}
}
*/

labautobox_microfluidics();
/*
*/

translate([0,0,200])labautobox_shelf();
labautobox_shelf();
}

/*
terminalblock_outside_liquidlevel_wdp_panel();
terminalblock_outside_liquidlevel_wdp();
terminalblock_inside_liquidlevel_wdp();
*/


//terminalblock_outside();
//terminalblock_inside();
//terminalblock_outside_xyzs_ht();
//terminalblock_inside_xyzs_ht();
//translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_outside_xyzs_ht_panel();
//terminalfrontpanel();
//atxbackbackpanel();
//ffrontpanel();

//conduitclamp();

//power_indicator();

//window_v2();
//sd_lightfixture_mod3();
//mirror([0,1,0])sd_lightfixture_mod3();
//translate([-23,200,0])rotate([0,0,-90])import("cytokinetics/platereader_v2/platereader_v3/sd_lightfixture_mod.stl");
//translate([0,3,-25])pr_lightfixture_mod();

//mirror([0,0,0])pr_lightfixture_mod3();

//pr_lightfixture_mod_diffuse();
//mirror([0,1,0])pr_lightfixture_mod3();
//mirror([0,1,0])pr_lightfixture_mod2();

//teachplate_core_larger();

//cytokinetics_banner();
//htsresources_banner();
//cytokinetics_emblem();
//code2d_emblem();
//code_imager_banner();

//power_indicator();


//cytokinetics_RFID();
/*
mirror([0,1,0])raspi2_bottom();
rfid_camera_connector();
rfid_camera_module();
*/

//rfid_holder();

//rfid_holder_mount();

/*
difference(){
cylinder(r=12/2,h=2,$fn=30);
translate([0,0,-0.2])cylinder(r=4.3/2,h=30,$fn=30);
}
*/

//translate([-20,100,24])rotate([90,0,0])tslot20(100);
///translate([-14,10,24])color("orange")mti_antenna_interfaceplate();

//color("lime")mti_antenna();



module fan60mm(){

translate([55,55,110])difference(){
cube([60,60,5]);
translate([30,30,-5]){
translate([25,25,0])cylinder(r=3.7/2,h=30,$fn=30);
translate([-25,25,0])cylinder(r=3.7/2,h=30,$fn=30);
translate([25,-25,0])cylinder(r=3.7/2,h=30,$fn=30);
translate([-25,-25,0])cylinder(r=3.7/2,h=30,$fn=30);
}
}
}



module terminalblock_inside(){
translate([-98-4,0,0])difference(){
union(){
cube([46.5+108+3,10,10]);
//translate([0,7,0])cube([46.5+108+3,3,20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
//translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([58,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
//translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
//translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4+4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,8,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,8,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,8,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,8,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}
















module mti_antenna_interfaceplate(){
difference(){
cube([105,80,5]);
translate([31.5,7.5,-1]){
//translate([-22.5,0,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([-22.5,20,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([-22.5,50,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([0,0,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([33,33,0])cylinder(r=40.8/2,h=16,$fn=30);
translate([66,0,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([0,66,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([66,66,0])cylinder(r=5.8/2,h=16,$fn=30);
}
}
}

module mti_antenna(){



cube([192,192,25]);
translate([71,135,25])cylinder(r=12/2,h=16,$fn=30);
translate([17.5,17.5,25]){
translate([0,0,0])cylinder(r=5/2,h=16,$fn=30);
translate([66,0,0])cylinder(r=5/2,h=16,$fn=30);
translate([0,66,0])cylinder(r=5/2,h=16,$fn=30);
translate([66,66,0])cylinder(r=5/2,h=16,$fn=30);
}
}

//raspimount_holes();

//translate([180/2,175/2,108])teachplate_core();

//teachplate_core_larger();

//backbackpanel_group();

//backbackpanel();


//raspi_holder_base();

//arducam_rotate_case();
//rj45jack_panel_tmp();
//power_indicator();
//translate([60,95,20+15])rotate([0,0,180])dual_camera_stand();
//pr_lightfixture_mod_diffuse();
//translate([0,25,0])sd_lightfixture_mod_diffuse();
//color("lime")translate([80,19.5+138/2+7.5,20-11])rotate([0,90,0])miuzei_camera_breadboard_b();

//arducam_rotate_2mount_adjuster();

//arducam_rotate_2mount_adjuster_nut();
//arducam_rotate_2mount_adjuster();
//translate([120.5,81,20+15])dual_camera_assy();
//translate([120,80,20+15])dual_camera_stand();

//color("")top();







module terminalblock_outside(){
translate([-98-4+63,-116,-84]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "X motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Y motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H0T0",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
translate([-98-4,0,0])difference(){
union(){
cube([46.5+108+3,10,10]);
translate([0,7,0])cube([46.5+108+3,3,20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}






module terminalblock_outside_xyzs_ht_panel(){
translate([-98-4+63,-116,-84]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("white")translate([-19-25,0,-9.5])writecube( "X",where=[0,0,0],size=[0,0,0],h=7,face="top");
   rotate([90,0,0])color("white")translate([-19-14,0,-9.5])writecube( "+-+-",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+11,0,-9.5])writecube( "+-S",where=[0,0,0],size=[0,0,0],h=5,face="top");

   translate([58,-0,-0]){
   rotate([90,0,0])color("white")translate([-19-25,0,-9.5])writecube( "Y",where=[0,0,0],size=[0,0,0],h=7,face="top");
   rotate([90,0,0])color("white")translate([-19-14,0,-9.5])writecube( "+-+-",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+11,0,-9.5])writecube( "+-S",where=[0,0,0],size=[0,0,0],h=5,face="top");
   }
   translate([103-4.5,0,0])rotate([90,0,0])color("white")translate([-19,0,-9.5])writecube( "H0T0",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}

translate([-98-4+63,-116,-84-30]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("white")translate([-19-25,0,-9.5])writecube( "Z",where=[0,0,0],size=[0,0,0],h=7,face="top");
   rotate([90,0,0])color("white")translate([-19-14,0,-9.5])writecube( "+-+-",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+11,0,-9.5])writecube( "+-S",where=[0,0,0],size=[0,0,0],h=5,face="top");

   translate([58,-0,-0]){
   rotate([90,0,0])color("white")translate([-19-25,0,-9.5])writecube( "S",where=[0,0,0],size=[0,0,0],h=7,face="top");
   rotate([90,0,0])color("white")translate([-19-14,0,-9.5])writecube( "+-+-",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+8,0,-9.5])writecube( "+-",where=[0,0,0],size=[0,0,0],h=5,face="top");
   }
   translate([103-4.5,0,0])rotate([90,0,0])color("white")translate([-19,0,-9.5])writecube( "H1T1",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}

/*
translate([-98-4+63,-116,-84-30]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Z motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "S motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H1T1",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
*/
translate([-98-4,0,0])difference(){
union(){
//translate([0,0,-10])cube([46.5+108+3,10,20]);
translate([0,7,0-20])color("black")cube([46.5+108+3,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}

translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}



translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}


module terminalblock_liquidlevel_wdp_jackpanel(){
      color("white")translate([0,84+64,87])rotate([90,-0,-90]) writecube( "P",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-25,87])rotate([90,-0,-90]) writecube( "L",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-50,87])rotate([90,-0,-90]) writecube( "H3",where=[0,0,0],size=[0,0,0],h=9,face="top");

/*
     difference(){
      color("black")translate([0,84,56])rotate([0,0,0])cube([3,46.5+108+3-88+8,40]);

        translate([-40,103+59-1.5-12,84-3-10]) rotate([0,90,0])cylinder(r=15.5/2,h=80,$fn=30);
        translate([-40,103+59-1.5-12-25,84-3-10]) rotate([0,90,0])cylinder(r=15.5/2,h=80,$fn=30);
        translate([-40,103+59-1.5-12-50,84-3-10]) rotate([0,90,0])cylinder(r=15.5/2,h=80,$fn=30);
}
*/
}


module terminalblock_outside_xyzs_ht_jackpanel(){
      color("white")translate([0,84+64,87-42])rotate([90,-0,-90]) writecube( "X",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-25,87-42])rotate([90,-0,-90]) writecube( "Y",where=[0,0,0],size=[0,0,0],h=9,face="top");

      color("white")translate([0,84+64-50,87-42])rotate([90,-0,-90]) writecube( "Z",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-75,87-42])rotate([90,-0,-90]) writecube( "S",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-100,87-42])rotate([90,-0,-90]) writecube( "H1",where=[0,0,0],size=[0,0,0],h=9,face="top");
      color("white")translate([0,84+64-125,87-42])rotate([90,-0,-90]) writecube( "H2",where=[0,0,0],size=[0,0,0],h=9,face="top");
/*
     difference(){
      color("black")translate([0,84-72,56-40-3])rotate([0,0,0])cube([3,46.5+108+3-88+8+72,40]);

        translate([-40,103+59-1.5-20+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-25+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-50+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-75+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-100+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-125+8,84-55]) rotate([0,90,0])cylinder(r=15/2,h=80,$fn=30);
}
 */
}














module terminalblock_outside_liquidlevel_wdp_panel(){
translate([-98-4+63,-116,-84]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("white")translate([-19-25-4,0,-9.5])writecube( "L",where=[0,0,0],size=[0,0,0],h=7,face="top");
   rotate([90,0,0])color("white")translate([-19-14-6,0,-9.5])writecube( "H H",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19-14+7,0,-9.5])writecube( "S S",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+11,0,-9.5])writecube( "+ CDP",where=[0,0,0],size=[0,0,0],h=5,face="top");

   }
}

translate([-98-4+63,-116,-84-30]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("white")translate([-19-14,0,-9.5])writecube( "H3T3",where=[0,0,0],size=[0,0,0],h=5,face="top");
   rotate([90,0,0])color("white")translate([-19+11,0,-9.5])writecube( "-    ",where=[0,0,0],size=[0,0,0],h=5,face="top");
   }
}

/*
translate([-98-4+63,-116,-84-30]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Z motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "S motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H1T1",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
*/
translate([-98-4,0,0])difference(){
union(){
//translate([0,0,-10])cube([46.5+108+3,10,20]);
color("black")translate([0,7,0-20])cube([46.5+108+3-88,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([58,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}

translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}



translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}










module terminalblock_outside_xyzs_ht(){
/*
translate([-98-4+63,-116,-84]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "X motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Y motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H0T0",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
translate([-98-4+63,-116,-84-30]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Z motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "S motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H1T1",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
*/
translate([-98-4,0,0])difference(){
union(){
translate([0,0,-10])color("black")cube([46.5+108+3,10-3,20]);
//translate([0,7,0-20])cube([46.5+108+3,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}


translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:1]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}



module terminalblock_outside_liquidlevel_wdp(){
translate([-98-4,0,0])difference(){
union(){
translate([0,0,-10])color("black")cube([46.5+108+3-88,10-3,20]);
//translate([0,7,0-20])cube([46.5+108+3,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
/*
translate([14+28+24,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
*/
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
/*
translate([14+28+24,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
*/
}
}





















module terminalblock_inside_xyzs_ht(){
translate([-98-4,12,0])difference(){
union(){
translate([0,0,-10])cube([46.5+108+3,8,20]);
//translate([0,7,0-20])cube([46.5+108+3,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:1]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}

module terminalblock_inside_liquidlevel_wdp(){
translate([-98-4,12,0])difference(){
union(){
translate([0,0,-10])cube([46.5+108+3-88,8,20]);
//translate([0,7,0-20])cube([46.5+108+3,3,20+20]);
}
translate([0,0,-5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
/*
translate([14+28+24,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,3])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
*/


translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}

/*
translate([14+28+24,-1.5,0])for(i=[0:3]){
translate([0+i*6,6.5,-43])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,-5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
*/

}
}














































module terminalblock_outside_zs(){
translate([-98-4+63,-116,-84-20]){
   translate([-7.5,123-10,99]){
   rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "Z motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([61,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "S motor limit",where=[0,0,0],size=[0,0,0],h=6,face="top");
   translate([103,0,0])rotate([90,0,0])color("black")translate([-19,0,-9.5])writecube( "H1T1",where=[0,0,0],size=[0,0,0],h=6,face="top");
   }
}
translate([-98-4,0,0])difference(){
union(){
cube([46.5+108+3,10,10]);
translate([0,7,0-10])cube([46.5+108+3,3,20]);
}
/*
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);

translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([148,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
*/

translate([0,0,5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}
translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,4,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}







}
}


module terminalblock_inside_zs(){

translate([-98-4,0,0])difference(){
union(){
cube([46.5+108+3,10,10]);
}

translate([0,0,5]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
translate([59,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
translate([59+55,0,0]){
translate([5,15,5])rotate([90,0,0])cylinder(r=3.8/2,h=40,$fn=30);
translate([5,15-9.1,5])rotate([90,0,0])cylinder(r=8.5/2,h=6,$fn=30);
}
}




translate([14,-1.5,0])for(i=[0:3]){
translate([0+i*6,8,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28,-1.5,0])for(i=[0:2]){
translate([0+i*6,8,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+58,-1.5,0])for(i=[0:3]){
translate([0+i*6,8,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+28+58,-1.5,0])for(i=[0:2]){
translate([0+i*6,8,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
translate([14+112,-1.5,0])for(i=[0:3]){
translate([0+i*6,8,-34])cylinder(r=2.8/2,h=40,$fn=30);
translate([0+i*6,15,5])rotate([90,0,0])cylinder(r=3.2/2,h=40,$fn=30);
}
}
}


































module mti_antenna_interfaceplate(){
difference(){
cube([105,80,5]);
translate([31.5,7.5,-1]){
//translate([-22.5,0,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([-22.5,20,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([-22.5,50,0])cylinder(r=4.8/2,h=16,$fn=30);
translate([0,0,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([33,33,0])cylinder(r=40.8/2,h=16,$fn=30);
translate([66,0,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([0,66,0])cylinder(r=5.8/2,h=16,$fn=30);
translate([66,66,0])cylinder(r=5.8/2,h=16,$fn=30);
}
}
}

module mti_antenna(){



cube([192,192,25]);
translate([71,135,25])cylinder(r=12/2,h=16,$fn=30);
translate([17.5,17.5,25]){
translate([0,0,0])cylinder(r=5/2,h=16,$fn=30);
translate([66,0,0])cylinder(r=5/2,h=16,$fn=30);
translate([0,66,0])cylinder(r=5/2,h=16,$fn=30);
translate([66,66,0])cylinder(r=5/2,h=16,$fn=30);
}
}

//raspimount_holes();

//translate([180/2,175/2,108])teachplate_core();

//teachplate_core_larger();

//backbackpanel_group();

//backbackpanel();


//raspi_holder_base();

//arducam_rotate_case();
//rj45jack_panel_tmp();
//power_indicator();
//translate([60,95,20+15])rotate([0,0,180])dual_camera_stand();
//pr_lightfixture_mod_diffuse();
//translate([0,25,0])sd_lightfixture_mod_diffuse();
//color("lime")translate([80,19.5+138/2+7.5,20-11])rotate([0,90,0])miuzei_camera_breadboard_b();

//arducam_rotate_2mount_adjuster();

//arducam_rotate_2mount_adjuster_nut();
//arducam_rotate_2mount_adjuster();
//translate([120.5,81,20+15])dual_camera_assy();
//translate([120,80,20+15])dual_camera_stand();

//color("")top();


//hdmi_jack();

//backbackpanel();
//usbjack_panel();
//hdmijack_panel();
//bottom_assy();
//top_assy();
//ffrontpanel();
//color("grey")
//translate([180/2,175/2,108])teachplate_core_larger();
//translate([130,65,100])color("grey")rotate([180,0,180])raspi_setup();

//translate([30-38,0,0])raspimount_holes();


module raspi_setup(){
translate([0,-70,50-30])rotate([-90,180,0])import("cytokinetics/Top_Slots_SM.stl");
import("cytokinetics/platereader_v2/platereader_v4/raspi_holder_base.stl");
}


module usbjack_panel(){
  difference(){
  translate([85,-55,0])cube([30,46,2]);
  usb_jack();
  }
}

module hdmijack_panel(){
  difference(){
  translate([85+35,-55,0])cube([30,46,2]);
  hdmi_jack();
  }
}



module hdmi_jack(){

translate([77.5+17*3+1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([-4.5,-19/2,-1])cube([9,19,10]);
//rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
}




}



module usb_jack(){

//usb port
translate([77.5+17-1,20+3-76+1,0]){
translate([15/2,20,0])translate([0,-14.6,-1])cylinder(r=3.7/2,h=10);
translate([15/2,20,0])translate([0,0,-1])rotate([0,0,45])cylinder(r=16/2,h=10,$fn=4);
translate([15/2,20,0])translate([0,14.6,-1])cylinder(r=3.7/2,h=10);
}


}


module rj45jack_panel_tmp(){
  difference(){
 translate([-11.5+4-10,-5+5,0])cube([35,60,2]);
	//rj45 jack
	//translate([77.5+17+(17*3)-148,20+3-76+1+80,55])rotate([0,90,0]){
	translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
	//}
 } 
}





module rj45jack_panel(){
  difference(){
 translate([-11.5+4,-5+5,0])cube([37.5-8,40,2]);
	//rj45 jack
	//translate([77.5+17+(17*3)-148,20+3-76+1+80,55])rotate([0,90,0]){
	translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
	//}
 } 
}


//emblem
module cytokinetics_emblem(){
color("black")translate([0,0,0]) translate([0,0,-1])roundedRect([38,38,2], 4);
color("white")translate([10,-10,0])cylinder(r=8/2,h=3,$fn=30);
difference(){
color("white")cylinder(r=34/2,h=3,$fn=30);
translate([0,0,0])cylinder(r=20/2,h=5,$fn=30);
translate([10,-10,0])cylinder(r=13/2,h=5,$fn=30);
}
}

//code2d emblem
module code2d_emblem(){
color("black")translate([0,0,0]) translate([0,0,-1])roundedRect([38,38,2], 4);

x = [-0,-7,-6,-5,-4,-3,-8,-7,-6,-5,4,-2,-1,0,-2,-4,-6,1,0,0,2,4,5,5,6,6,7,7,6,4,3];
y = [-5,-8,-6,-6,-6,-6,-3,-1,0,-1,1,2,2,2,4,6,7,0,2,4,-2,-3,-4,-7,-6,-5,3,4,5,7,8];
for(i=[0:30]){
color("white")translate([x[i]*2,y[i]*2,0])rotate([0,0,45])cylinder(r=5/2,h=3,$fn=4);
}
/*
difference(){
color("white")cylinder(r=34/2,h=3,$fn=30);
translate([0,0,0])cylinder(r=20/2,h=5,$fn=30);
translate([10,-10,0])cylinder(r=13/2,h=5,$fn=30);
}
*/

}




//cytokinetics
module cytokinetics_banner(){
color("black")translate([0,0,0]) translate([0,0,-1])roundedRect([70,15,2], 4);
color("white")translate([-19,0,1.5])writecube( "Cyto",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("white")translate([12,0,1.5])writecube( "kinetics",where=[0,0,0],size=[0,0,0],h=7,face="top");
}

//htsresources.com
module htsresources_banner(){
color("black")translate([3.5,0,0]) translate([0,0,-1])roundedRect([70,15,2], 4);
color("white")translate([-19,0,1.5])writecube( "HTS",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("white")translate([12-11,0,1.5])writecube( "Reso",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("white")translate([12+11.5,0,1.5])writecube( "urces",where=[0,0,0],size=[0,0,0],h=7,face="top");
}

//labbot control
module labbot_banner(){
color("black")translate([3.5+5,0,0]) translate([0,0,-1])roundedRect([76,15,2], 4);
color("white")translate([-19,0,1.5])writecube( "Lab",where=[0,0,0],size=[0,0,0],h=6,face="top");
color("white")translate([12-11-7,0,1.5])writecube( "Bot",where=[0,0,0],size=[0,0,0],h=6,face="top");
color("white")translate([12+11.5,0,1.5])writecube( "Controller",where=[0,0,0],size=[0,0,0],h=6,face="top");
}







//Cytokinetics RFID
module cytokinetics_RFID(){

difference(){
color("black")translate([0,-35,0]) translate([0,0,-1])roundedRect([38,38+95,2], 4);
translate([0,25,-5])cylinder(r=4.7/2,h=45,$fn=30);
translate([0,-94,-5])cylinder(r=4.7/2,h=45,$fn=30);
}
color("white")translate([10,-10,0])cylinder(r=8/2,h=3,$fn=30);
difference(){
color("white")cylinder(r=34/2,h=3,$fn=30);
translate([0,0,0])cylinder(r=20/2,h=5,$fn=30);
translate([10,-10,0])cylinder(r=13/2,h=5,$fn=30);
}

translate([12,-55,0])rotate([0,0,-90]){
color("white")translate([-19,0,1.5])writecube( "Cyto",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("white")translate([12,0,1.5])writecube( "kinetics",where=[0,0,0],size=[0,0,0],h=7,face="top");
}
translate([-1,-55,0])rotate([0,0,-90]){
color("white")translate([-0,0,1.5])writecube( "RFID Scanner",where=[0,0,0],size=[0,0,0],h=7,face="top");
}
translate([-13,-41,0])rotate([0,0,-90]){
color("white")translate([-0,0,1.5])writecube( "LabBot",where=[0,0,0],size=[0,0,0],h=7,face="top");
}

}






//power indicator
module power_indicator(){
difference(){union(){
 color("black")translate([0-14,0,0]) translate([0,0,-1])roundedRect([30+20,37,2], 4);
color("white")translate([-15-15,10,1.5])writecube( "12V",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("white")
 translate([0,10,1.5])writecube( "5V",where=[0,0,0],size=[0,0,0],h=7,face="top");
}
translate([-15-15,-7,-5])cylinder(r=12.4/2,h=30,$fn=30);
translate([0,-7,-5])cylinder(r=12.4/2,h=30,$fn=30);
}
}


module top_assy(){

color("pink")translate([-43,110,115]){translate([30,0,20-2.5])rotate([0,180,0])import("labautobox_rpi4_case_lid.stl");
import("labautobox_rpi4_case_base.stl");}


difference(){color("black")top();
//translate([180/2,175/2,108])topfill_fanmnt();
translate([180/2,175/2,108])
translate([30-2,30-32.50,-5]){
translate([25,25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-25,25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([25,-25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-25,-25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([0,0,0])cylinder(r=45/2,h=30,$fn=30);

translate([-25-24.5,28.2,0])cylinder(r=3.8/2,h=230,$fn=30);
translate([-25-24.5,28.2+49.2,0])cylinder(r=3.8/2,h=230,$fn=30);

translate([-58,0,0]){
translate([-25-24.5,28.2,0])cylinder(r=3.8/2,h=230,$fn=30);
translate([-25-24.5,28.2+49.2,0])cylinder(r=3.8/2,h=230,$fn=30);
}
}
}


//pr_lightfixture_mod();
//translate([0,175,0])mirror([0,1,0])pr_lightfixture_mod();

//sd_lightfixture_mod();
//translate([180,0,0])mirror([1,0,0])sd_lightfixture_mod();
//color("grey")translate([180/2,175/2,108])teachplate_core();
/*
*/
}




module code_imager_banner(){
color("black")translate([0,0,0]) translate([0,0,-1])roundedRect([80,15,2], 4);
color("white")translate([0,0,1.5])writecube( "2D Code Imager",where=[0,0,0],size=[0,0,0],h=7,face="top");
}


module pr_lightfixture_mod_diffuse(){
difference(){
//translate([-44-20-2,0,0])
//cube([85,11+8,2]);
cube([85,11+8-3,2]);
translate([10,19/2,-3])cylinder(r=3.2/2,h=100,$fn=30);
translate([10+65,19/2,-3])cylinder(r=3.2/2,h=100,$fn=30);
}
}

module sd_lightfixture_mod_diffuse(){
translate([-44-20-2,0,0])cube([56+15,11+8,2]);
}

module pr_lightfixture_mod(){
difference(){
translate([95,36,105])rotate([-90,0,0])pr_lightfixture(108);
translate([58,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+10,38.5+20,98+3])rotate([90,0,0])cylinder(r=4/2,h=100,$fn=30);
translate([58+10,38.5+98.5,98+3])rotate([90,0,0])cylinder(r=7.5/2,h=100,$fn=30);
translate([58+55,38.5,98+3])rotate([90,0,0])cylinder(r=4/2,h=100,$fn=30);
translate([58+55,38.5+98.5,98+3])rotate([90,0,0])cylinder(r=7.5/2,h=100,$fn=30);
}
}


module pr_lightfixture_mod3(){
difference(){
translate([95,36,105])rotate([-90,0,0])pr_lightfixture3(108);
/*
translate([58,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
*/
translate([58,38.5+8+9,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58,38.5+8+12,30])cylinder(r=2.4/2,h=100,$fn=30);
/*
translate([58+65,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
*/
translate([58+65,38.5+8+9,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5+8+12,30])cylinder(r=2.4/2,h=100,$fn=30);


for(i=[0:3]){
translate([58+10,38.5+20,98-23+i*6])rotate([90,0,0])cylinder(r=2.8/2,h=100,$fn=30);
translate([58+55,38.5+20,98-23+i*6])rotate([90,0,0])cylinder(r=2.8/2,h=100,$fn=30);
}

}
}

module sd_lightfixture_mod3(){
difference(){
translate([95,36,105])rotate([-90,0,0])pr_lightfixture3(56);


translate([42.5,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([42.5,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([42.5,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([42.5+42,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([42.5+42,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([42.5+42,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
}
}

module pr_lightfixture_mod2(){
difference(){
translate([95,36,105])rotate([-90,0,0])pr_lightfixture2(108);
translate([58,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5+4,30])cylinder(r=2.2/2,h=100,$fn=30);
translate([58+65,38.5+8,30])cylinder(r=2.2/2,h=100,$fn=30);
}
}









module sd_lightfixture_mod(){
difference(){
translate([100-3.5+1+65+10,-62+119+25,105-25+5+4])rotate([90,0,-90])sd_lightfixture(108);
//translate([100-3.5+1+62.5,-62+119+8.5,105-25+5+4-50])cylinder(r=2.2/2,h=100,$fn=30);
//translate([100-3.5+1+62.5,-62+119+8.5+42,105-25+5+4-50])cylinder(r=2.2/2,h=100,$fn=30);
}
}




module dlink_des_105(){ 
difference(){
cube([20,80,2]);
translate([10,8,-1])cylinder(r=3/2,h=5,$fn=30);
translate([10,8+63,-1])cylinder(r=3/2,h=5,$fn=30);
}
}

//teachplate_holder();

//7.5inch x 6.69inch x 5.11
//translate([-100,105-190,-20])cube([290,210,100]);
/*
translate([-100,105-190+5,-20])cube([180,160,120]);
translate([-100,105-190+5,-20])cube([180,160,100]);
*/
//platereader_assy();


//translate([30,150,3])rotate([90,0,0])switch();



module terminalfrontpanel(){

   translate([2,0,3])terminalblock_liquidlevel_wdp_jackpanel();
   translate([2,0,0])terminalblock_outside_xyzs_ht_jackpanel();
   
   /*
   translate([0,-1.5,-3]){
   translate([-7.5,120-55,84])rotate([0,0,-90])
   terminalblock_liquidlevel_wdp_jackpanel();
   }
   translate([0,-1.5,-3]){
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_outside_liquidlevel_wdp_panel();
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_outside_liquidlevel_wdp();
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_inside_liquidlevel_wdp();
   }
   translate([0,-1.5,-50-5]){
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_outside_xyzs_ht_panel();
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_outside_xyzs_ht();
   translate([-7.5,120-55,84])rotate([0,0,-90])terminalblock_inside_xyzs_ht();
   }
   translate([0,59,90])rotate([90,0,-90])labbot_banner();
   */
  //translate([0,52,50])rotate([90,0,-90])code_imager_banner();
  //translate([0,130,40])rotate([0,-90,0])cytokinetics_emblem();
       color("black")difference(){
        translate([Thick+m/2,Thick+m/2,Thick+m/2]) Panel(Length,Width,Thick,Filet);
        translate([Thick+m/2-10,Thick+m/2+40,Thick+m/2+70]) rotate([0,90,0])cylinder(r=5/2,h=20,$fn=30);

        translate([-40,103+59-1.5-12,84-3-10+3]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-12-25,84-3-10+3]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-12-50,84-3-10+3]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);

        translate([-40,103+59-1.5-20+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-25+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-50+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-75+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-100+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
        translate([-40,103+59-1.5-20-125+8,84-55]) rotate([0,90,0])cylinder(r=16.2/2,h=80,$fn=30);
       /*       
        translate([-40,103-1.5,84-3]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);
        translate([-5,103-1.5+2+3,84-3-8]) cube([20,49,16]); 
        //rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);


        translate([-40,103+59-1.5,84-3]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);

        translate([-5,103-1.5+2+3,84-3-8-52.5]) cube([20,49,16]); 

        translate([-5,103-1.5+2+3-56,84-3-8-52.5]) cube([20,47,16]); 
        translate([-5,103-1.5+2+3-56-32,84-3-8-52.5]) cube([20,24,16]); 

        translate([-40,103+59-1.5,84-55]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);
        translate([-40,103-1.5,84-55]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);
        translate([-40,103-55-1.5,84-55]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);
        translate([-40,103-55-34-1.5,84-55]) rotate([0,90,0])cylinder(r=3.7/2,h=80,$fn=30);
      */
     }
}









module ffrontpanel(){
  translate([0,120,84])rotate([90,0,-90])cytokinetics_banner();
  translate([0,52,50])rotate([90,0,-90])code_imager_banner();
  translate([0,130,40])rotate([0,-90,0])cytokinetics_emblem();
       color("white")difference(){
        translate([Thick+m/2,Thick+m/2,Thick+m/2]) Panel(Length,Width,Thick,Filet);
        translate([Thick+m/2-10,Thick+m/2+40,Thick+m/2+70]) rotate([0,90,0])cylinder(r=5/2,h=20,$fn=30);
     }
}




/*
*/


module rj45_jack3(){
     translate([180,28,55-20])rotate([0,90,0])rj45jack_panel();
     translate([180,28,55+5])rotate([0,90,0])rj45jack_panel();
     translate([180,28,55+5+25])rotate([0,90,0])rj45jack_panel();
}


module rj45_jack2(){
     translate([180,28,55-20])rotate([0,90,0])rj45jack_panel();
     translate([180,28,55+5])rotate([0,90,0])rj45jack_panel();
     translate([180,28,55+5+25])rotate([0,90,0])rj45jack_panel();
}



module atxbackbackpanel(){
    difference(){union(){
    color("white")translate([180-0.55,120,38])rotate([90,0,-90]){
     import("atx_24pin_power_panel.stl");
     translate([-15-30,28,0])cube([66.5+80,25,3]);
     translate([-15-30,28-50,0])cube([66.5-35,50,3]);
     translate([-15-30+95,28-50,0])cube([66.5-15,50,3]);
     translate([-15-30,28-55,0])cube([66.5+80,10,3]);
    }
     //translate([-15-30+190,28+112,83.5])rotate([0,90,0])cylinder(r=20/2,h=50,$fn=30);
     //color("black")rj45_jack3();
     //translate([180+1,114+16,49])rotate([90,0,90])power_indicator();
 	translate([175,0,0])difference(){
        union(){
        color("white")translate([Thick+m/2,Thick+m/2,Thick+m/2]) Panel(Length,Width,Thick,Filet);
  	}

      translate([0,115,49])rotate([90,0,90]){
      //this is really need I just uncomment it for show
      translate([-45,-35,-5])cube([63,62,20]);
      /*
      */

      translate([15,22,-55])cylinder(r=3.5/2,h=130,$fn=30);
      translate([15+20,22,-55])cylinder(r=3.5/2,h=130,$fn=30);
      //translate([-15-30+70,28+112-105.5,-25])rotate([0,0,0])cylinder(r=20/2,h=50,$fn=30);

     /*
      translate([20,5,-5])cylinder(r=12.4/2,h=30,$fn=30);
      translate([20,-20,-5])cylinder(r=12.4/2,h=30,$fn=30);
     */
      /*
      translate([-54,-90-15,0])rotate([0,0,90])usb_jack();
      translate([-55,-90-25,0])rotate([0,0,90])hdmi_jack();
      */
      }
     }
       //conduitclamp();
    }
     color("")translate([180-0.55,120+45,38+11])rotate([90,0,-90]){
      translate([-15-30+70,28+112-105.5,-25])rotate([0,0,0])cylinder(r=20/2,h=50,$fn=30);
      translate([15,22,-55])cylinder(r=3.5/2,h=130,$fn=30);
      translate([15+20,22,-55])cylinder(r=3.5/2,h=130,$fn=30);
     }
      //translate([-15-30+190,28+112,83.5])rotate([0,90,0])cylinder(r=20/2,h=50,$fn=30);
    }
}




module conduitclamp(){
   difference(){
    union(){
       color("pink")translate([150+7,140,75+8])rotate([0,90,0])rotate([0,0,0])cylinder(r=33/2,h=20,$fn=30);
       color("pink")translate([150+7+15,140-20,67])cube([5,40,13]);
    }
       color("pink")translate([150+7+15-35,140-20,67+15])cube([45,55,2]);
       translate([150,140,75+8])rotate([0,90,0])cylinder(r=20/2,h=80,$fn=30);
       translate([100,140+10,75+8-12])rotate([0,90,0])cylinder(r=8/2,h=72,$fn=30);
       translate([100,140-10,75+8-12])rotate([0,90,0])cylinder(r=8/2,h=72,$fn=30);
       translate([100,140+10,75+8-12])rotate([0,90,0])cylinder(r=3.7/2,h=102,$fn=30);
       translate([100,140-10,75+8-12])rotate([0,90,0])cylinder(r=3.7/2,h=102,$fn=30);

       translate([163,140-12.5,75+8-2])rotate([0,0,0])cylinder(r=3.7/2,h=102,$fn=30);
       translate([163,140-12.5,75+8-52])rotate([0,0,0])cylinder(r=2.8/2,h=102,$fn=30);
       translate([163,140-12.5,75+8-2+10])rotate([0,0,0])cylinder(r=8/2,h=102,$fn=30);

       translate([163,140+12.5,75+8-2])rotate([0,0,0])cylinder(r=3.7/2,h=102,$fn=30);
       translate([163,140+12.5,75+8-52])rotate([0,0,0])cylinder(r=2.8/2,h=102,$fn=30);
       translate([163,140+12.5,75+8-2+10])rotate([0,0,0])cylinder(r=8/2,h=102,$fn=30);
    }

}



/*
*/


module backbackpanel(){
   //color("black")rj45_jack3();
     //translate([180+1,114+16,49])rotate([90,0,90])power_indicator();
     /*
     translate([180,28,55-20])rotate([0,90,0])rj45jack_panel();
     translate([180,28,55+5])rotate([0,90,0])rj45jack_panel();
     */
    /*
     translate([175+5,115,49])rotate([90,0,90]){
         color("black")translate([-54,-90-15,0])rotate([0,0,90])usbjack_panel();
         color("black")translate([-55,-90-25,0])rotate([0,0,90])hdmijack_panel();
     }
    */
 	translate([175,0,0])difference(){
        union(){
        color("white")translate([Thick+m/2,Thick+m/2,Thick+m/2]) Panel(Length,Width,Thick,Filet);
  	}
	//rj45 jack

        /*
	translate([77.5+17+(17*3)-148,20+3-76+1+80,55-20])rotate([0,90,0]){
	translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
        }
	translate([77.5+17+(17*3)-148,20+3-76+1+80,55+5])rotate([0,90,0]){
	translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
	}
        translate([0,0,0]){
	translate([77.5+17+(17*3)-148,20+3-76+1+80+50,55+5])rotate([0,90,0]){
	translate([15/2,20,0])translate([0,-27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([0,27/2,-1])cylinder(r=3.7/2,h=10);
	translate([15/2,20,0])translate([-5.5,-16.5/2,-1])cube([14,16.5,10]);
	}
	}
        */
      translate([0,115,49])rotate([90,0,90]){
      translate([20,5,-5])cylinder(r=12.4/2,h=30,$fn=30);
      translate([20,-20,-5])cylinder(r=12.4/2,h=30,$fn=30);
      /*
      translate([-54,-90-15,0])rotate([0,0,90])usb_jack();
      translate([-55,-90-25,0])rotate([0,0,90])hdmi_jack();
      */
      }
     }
}




/*
*/

module frontpanel(){
        translate([Length-(Thick*2+m/2),Thick+m/2,Thick+m/2])
        FPanL();
}


module window_v2(){
rd = 3;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;

difference(){
union(){
//topbox();
translate([17,33,140])cube([148,108,1]);
//color("pink")translate([180/2,175/2,108])teachplate_core();
}
translate([17+15,33+15,140-1])cube([148-30,108-30,3]);
color("pink")translate([180/2,175/2,108]) translate([0,0,-1])roundedRect([l-9,w-7,hb+30], rd);
color("pink")translate([180/2,175/2,108]) {
 for (i=[0,134]){
 for (j=[0,93]){
 translate([-67+i,20-67+j,-10])rotate([0,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 }
 }
}
}
}

module top(){
rd = 3;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;

difference(){
union(){
topbox();
//color("pink")translate([180/2,175/2,108])teachplate_core();
}
//commenting this out for show
//color("pink")translate([180/2,175/2,108]) translate([0,0,-1])roundedRect([l-9,w-7,hb+30], rd);
color("pink")translate([180/2,175/2,108]) {

 /*
 for (i=[25,67]){
 for (j=[-3,137]){
 translate([j,i,0]){
  translate([-67,20-67,-60])rotate([0,0,0])cylinder(r=3.8/2,h=300,$fn=30);
 }
 }
 }
 for (i=[-2,96]){
 for (j=[35,100]){
 translate([j,i,0]){
  translate([-67,20-67,-80])rotate([0,0,0])cylinder(r=3.8/2,h=300,$fn=30);
 }
 }
 }
 */
/*
 for (i=[0,134]){
 for (j=[0,93]){
 translate([-67+i,20-67+j,-10])rotate([0,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 }
 }
*/
}
}
}

module dual_camera_assy(){
//translate([-60-7+7-9,-4,0])rotate([0,0,0])arducam_rotate_case();
//translate([-65+67-7+9,17,0])rotate([0,0,180])arducam_rotate_case();
rotate([0,180,0]){
arducam_rotate_2mount_adjuster();
arducam_rotate_2mount_adjuster_nut();
translate([-103,0,0])arducam_rotate_2mount_adjuster_nut();
}
}

module 3dprint_dual_camera_assy_plate(){
translate([0,0,-4])difference(){union(){
 translate([3,0+8,0])cube([18,50-8,4]);
 translate([20,30,0])cube([20,20,8]);
}
 translate([20+15,40,-20])cylinder(r=2.8/2,h=40,$fn=30);
 translate([10,15,-20])cylinder(r=3.8/2,h=40,$fn=30);
}
}



module 3dprint_dual_camera_assy_tslotattach(){
//translate([-60-7+7-9,-4,0])rotate([0,0,0])arducam_rotate_case();
//translate([-65+67-7+9,17,0])rotate([0,0,180])arducam_rotate_case();
rotate([0,180,0]){
//arducam_rotate_2mount_adjuster();
3dprint_adjuster_octoprint();
//translate([-100,0,0])arducam_rotate_2mount_adjuster_nut();
//translate([-103,0,0])arducam_rotate_2mount_adjuster_nut();
}
}





module 3dprint_dual_camera_assy(){
//translate([-60-7+7-9,-4,0])rotate([0,0,0])arducam_rotate_case();
//translate([-65+67-7+9,17,0])rotate([0,0,180])arducam_rotate_case();
rotate([0,180,0]){
//arducam_rotate_2mount_adjuster();
3dprint_adjuster();
//translate([-100,0,0])arducam_rotate_2mount_adjuster_nut();
//translate([-103,0,0])arducam_rotate_2mount_adjuster_nut();
}
}

module 3dprint_adjuster(){
difference(){
union(){
translate([-4.5+22.0-15-22-15,-4+0,0])cube([60+44+30-94,20,8]);
translate([3,0,5]){
translate([-4.5+22.0-15-22-15+40,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
translate([-4.5+22.0-15-22-15+42,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
translate([-4.5+22.0-15-22-15+44,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
}
//translate([-4.5+22.0-15-22-15+30,-4+0,0])#cube([10,20,8+10]);
//translate([-4.5+22.0-15-22-15+40-4,-4+0,0])cube([4,20,8+10]);
}
translate([-4.5+22.0+15+10-28,-4+0+30,6])rotate([90,0,0])#cylinder(r=3.7/2,h=50,$fn=30);
translate([-4.5+22.0-15-22-15,-4+0,-8])#cube([60+44+30-94+20,20,8]);
for(i=[0:0]){
translate([-4.5+22.0+15+10-70,-4+0+10,20+i*0.5-5])rotate([0,90,0])cylinder(r=3.7/2,h=50,$fn=30);
}
for(i=[65:68+28]){
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
}
}
}


module 3dprint_adjuster_octoprint(){
difference(){
union(){
translate([-4.5+22.0-15-22-15+3,-4+0,0])cube([35,20,8]);
translate([-4.5+22.0-15-22-15+3,-4+0,0])cube([55,20,4]);
/*
translate([3,0,5]){
translate([-4.5+22.0-15-22-15+40,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
translate([-4.5+22.0-15-22-15+42,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
translate([-4.5+22.0-15-22-15+44,-4+12,0])rotate([90,0,0])cylinder(r=15/2,h=5,$fn=30);
}
*/
//translate([-4.5+22.0-15-22-15+30,-4+0,0])#cube([10,20,8+10]);
//translate([-4.5+22.0-15-22-15+40-4,-4+0,0])cube([4,20,8+10]);
}
translate([-4.5+22.0+15+10-28+9-10,-4+0+10,6-15])rotate([0,0,0])#cylinder(r=3.7/2,h=50,$fn=30);
translate([-4.5+22.0-15-22-15,-4+0,-8])cube([60+44+30-94+20,20,8]);
for(i=[0:0]){
translate([-4.5+22.0+15+10-70,-4+0+10,20+i*0.5-5])rotate([0,90,0])cylinder(r=3.7/2,h=50,$fn=30);
}
for(i=[55:68+28]){
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
}
}
}













module dual_camera_stand(){

difference(){
union(){
color("pink")translate([-32-4,-8,-22.8])cylinder(r=12/2,h=12,$fn=30);
color("pink")translate([-32-2,-8,-22.8])cylinder(r=12/2,h=12,$fn=30);
color("pink")translate([-32,-8,-22.8])cylinder(r=12/2,h=12,$fn=30);
color("pink")translate([-32+2,-8,-22.8])cylinder(r=12/2,h=12,$fn=30);
color("pink")translate([-32+4,-8,-22.8])cylinder(r=12/2,h=12,$fn=30);

color("pink")translate([-32,0,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
color("pink")translate([-32-15,0,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
color("pink")translate([-32+15,0,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
color("pink")translate([-32,7,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
color("pink")translate([-32-15,7,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
color("pink")translate([-32+15,7,-22.8])rotate([0,0,45])cylinder(r=25/2,h=4,$fn=4);
}
translate([-32+15,7,-22.8-5])cylinder(r=4.7/2,h=30,$fn=30);
translate([-32-15,7,-22.8-5])cylinder(r=4.7/2,h=30,$fn=30);
translate([-32-5,-8,-22.8])cylinder(r=2.8/2,h=28,$fn=30);
translate([-32+5,-8,-22.8])cylinder(r=2.8/2,h=28,$fn=30);
}
}

module bottom_assy(){

//dlink_des_105();
//translate([60,95,20+15])rotate([0,0,180])dual_camera_assy();
//translate([60,95,20+15])rotate([0,0,180])dual_camera_stand();
//color("lime")translate([80,19.5+138/2+7.5,20-11])rotate([0,90,0])miuzei_camera_breadboard_b();
color("black")bottom();
}
/*
*/

module bottom(){
//raspimount_holes();



translate([0,0,0])difference(){
union(){
translate([0,0,0])color("")bottombox();

/*
translate([80,19.5+138/2+7.5,20])rotate([0,90,0]){
translate([20,-4,-30+83+15])rotate([0,-90,0])cylinder(r=10/2,h=5,$fn=30);
translate([20,-13,-30+83+15])rotate([0,-90,0])cylinder(r=10/2,h=5,$fn=30);
translate([20,-4,-30-15])rotate([0,-90,0])cylinder(r=10/2,h=5,$fn=30);
translate([20,-13,-30-15])rotate([0,-90,0])cylinder(r=10/2,h=5,$fn=30);
}
*/
}
translate([80-50+88,19.5+138/2+7.5-1+10-68,20])rotate([0,90,0]){
translate([19+30,-4+72,-30+83+15-148+52])rotate([0,-90,0])cylinder(r=4.2/2,h=50,$fn=30);
translate([19+30,-4+72-50,-30+83+15-148+52])rotate([0,-90,0])cylinder(r=4.2/2,h=50,$fn=30);
}
/*
translate([80,19.5+138/2+7.5,20])rotate([0,90,0]){
translate([19,-4,-30+83+15])rotate([0,-90,0])cylinder(r=2.8/2,h=50,$fn=30);
translate([19,-13,-30+83+15])rotate([0,-90,0])cylinder(r=2.8/2,h=100,$fn=30);
translate([19,-4,-30-15])rotate([0,-90,0])cylinder(r=2.8/2,h=100,$fn=30);
translate([19,-13,-30-15])rotate([0,-90,0])cylinder(r=2.8/2,h=100,$fn=30);
}
*/
}
}



module raspimount_holes(){

difference(){
union(){
translate([72-20,15-5,-5])cube([85+0,45+19-12,3]);
translate([72-20,15-5-12,-5])cube([85,12,18]);
}
translate([72+5-10,15+10-8,-5])cube([57,45-20,4]);
//union(){

translate([4,0,28]){
translate([-11,3,0])translate([140,10,-20])rotate([90,0,0])cylinder(r=3.8/2,h=50,$fn=30);
translate([-11-58,3,0])translate([140,10,-20])rotate([90,0,0])cylinder(r=3.8/2,h=50,$fn=30);
translate([-11,3,0])translate([140,44.5+10,-20])rotate([90,0,0])cylinder(r=8/2,h=50,$fn=30);
translate([-11-58,3,0])translate([140,44.5+10,-20])rotate([90,0,0])cylinder(r=8/2,h=50,$fn=30);
}

translate([-10,-7,0]){
translate([-11,3,0])translate([140,10,-20])cylinder(r=2.8/2,h=50,$fn=30);
translate([-11-58,3+49,0])translate([140,10,-20])cylinder(r=2.8/2,h=50,$fn=30);
translate([-11,3+49,0])translate([140,10,-20])cylinder(r=2.8/2,h=50,$fn=30);
translate([-11-58,3,0])translate([140,10,-20])cylinder(r=2.8/2,h=50,$fn=30);
}


//}
}
}

module raspimount(){
difference(){union(){
translate([-11,3,0])difference(){
translate([140,10,0])cylinder(r1=15/2,r2=6/2,h=8,$fn=30);
translate([140,10,-20])cylinder(r=2.7/2,h=50,$fn=30);
}
translate([-11,3+49,0])difference(){
translate([140,10,0])cylinder(r1=15/2,r2=6/2,h=8,$fn=30);
translate([140,10,-20])cylinder(r=2.7/2,h=50,$fn=30);
}
translate([-11-58,3+49,0])difference(){
translate([140,10,0])cylinder(r1=15/2,r2=6/2,h=8,$fn=30);
translate([140,10,-20])cylinder(r=2.7/2,h=50,$fn=30);
}
translate([-11-58,3,0])difference(){
translate([140,10,0])cylinder(r1=15/2,r2=6/2,h=8,$fn=30);
translate([140,10,-20])cylinder(r=2.7/2,h=50,$fn=30);
}
}
translate([72,15,-5])cube([57,45,20]);
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




module topbox(){
if(TShell==1)
// Coque haut - Top Shell
        color( Couleur1,1){
            translate([0,Width,Height+0.2]){
                rotate([0,180,180]){
                        Coque();
                        }
                }
        }

/*
if(BShell==1)
// Coque bas - Bottom shell
        color(Couleur1){
        Coque();
        }
*/
}






module bottombox(){
/*
if(TShell==1)
// Coque haut - Top Shell
        color( Couleur1,1){
            translate([0,Width,Height+0.2]){
                rotate([0,180,180]){
                        Coque();
                        }
                }
        }

*/
if(BShell==1)
// Coque bas - Bottom shell
        color(Couleur1){
        Coque();
        }
}



module switch(){
 cube([98,93,28]);
}


module arducam_rotate_2mount_adjuster_nut(){
translate([42,0,0])
difference(){
union(){
color("pink")translate([-4.5+22.0+15+10-1,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
color("pink")translate([-4.5+22.0+15+10,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
color("pink")translate([-4.5+22.0+15+10+1,-4+0+10,4.2])cylinder(r=8.4/2,h=4,$fn=30);
}
color("pink")translate([-4.5+22.0+15+10,-4+0+10,-4.2])cylinder(r=2.4/2,h=14,$fn=30);
}
}





module arducam_rotate_2mount_adjuster(){
difference(){
union(){
translate([-4.5+22.0-15-22-15,-4+0,0])cube([60+44+30,20,8]);
translate([-4.5+22.0-15+20,-4+0-12,0])cube([20,20,8]);
translate([-4.5+22.0-15+20-20,-4+0-12+5,0])cube([60,35,8]);
}
translate([-4.5+22.0-15+20-20+9.5-3,-4+0-12+5+6,-15])cube([3.8+8,23,30]);
translate([-4.5+22.0-15+20-20+9.5-3+35,-4+0-12+5+6,-15])cube([3.8+8,23,30]);
translate([-4.5+22.0+15,-4+0+10,-10])cylinder(r=4.2/2,h=50,$fn=30);
translate([5,0,0]){
translate([-4.5+22.0+15,-4+0+10-15,-2])cylinder(r=3.7/2,h=40,$fn=30);
translate([-4.5+22.0+15,-4+0+10-15,-2+1.9])cylinder(r=8.7/2,h=4,$fn=30);
}
translate([-5,0,0]){
translate([-4.5+22.0+15,-4+0+10-15,-2])cylinder(r=3.7/2,h=40,$fn=30);
translate([-4.5+22.0+15,-4+0+10-15,-2+1.9])cylinder(r=8.7/2,h=4,$fn=30);
}
for(i=[65:68+28]){
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15+10+i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,-10])cylinder(r=3/2,h=50,$fn=30);
translate([-4.5+22.0+15-10-i*0.5,-4+0+10,4])cylinder(r=9/2,h=50,$fn=30);
}
}
}





module arducam_rotate_2mount(){
difference(){union(){
translate([-4.5,-4,0])arducam_rotate_case();
translate([-4.5+46.0+27.5,-4+20,0])rotate([0,0,180])arducam_rotate_case();
translate([-4.5+22.0,-4+0,0])cube([30,20,4]);
}
translate([-4.5+22.0+15,-4+0+10,-10])cylinder(r=3.2/2,h=50,$fn=30);
}
}


module platereaderbase_A(){
difference(){
union(){
translate([-8+6,-54.5-3.5-5,-24.])cube([10,115+10,4]);
translate([-8+58-5+6,-54.5-5+59,-24.])roundedRect([100-10+5,114+9-12+10,4], 4);
}
translate([83-10,50-49.5,-15-30])color("silver")cylinder(r=5.7/2,h=270,$fn=30);
translate([83-70,50-49.5,-15-30])color("silver")cylinder(r=5.7/2,h=270,$fn=30);
translate([83,50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);
translate([83,-50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);

translate([83-50,50-49.5+30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-70,50-49.5+30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-50,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-70,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);


}
}

module platereaderbase_aligner(){

difference(){
translate([83-10-120,50-49.5-30-5,-15-30+16.5])cube([90,9,4]);
translate([83-10-90,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-10-110,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-50,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-70,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
}
}


module platereaderbase_B(){
difference(){
union(){
translate([-8-4,-54.5-3.5-5,-24.])cube([10,115+10,4]);
translate([-8+63-100-0.28-8,-54.5-5+59,-24.])roundedRect([100-17.5+5,114+9-12+10,4], 4);
//translate([83-10-120,50-49.5-30-5,-15-30+16.5])cube([90,9,4]);
}
translate([83-10-90,50-49.5,-15-30])color("silver")cylinder(r=5.7/2,h=270,$fn=30);
translate([83-70-90,50-49.5,-15-30])color("silver")cylinder(r=5.7/2,h=270,$fn=30);
translate([-85+6-1,50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);
translate([-85+6-1,-50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);

translate([83-10-90,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-10-110,50-49.5-30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-10-90,50-49.5+30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);
translate([83-10-110,50-49.5+30,-15-30])color("silver")cylinder(r=2.7/2,h=270,$fn=30);

}
}

module platereader_assy(){
platereader_sidepanel_washer();

/*
*/
translate([0,0,0])platereader_sidepanel();
translate([100-3.5+1,-62+32,105-25+5])rotate([90,0,-90])sd_lightfixture(56);

rotate([180,180,0]){
translate([0,0,0])platereader_sidepanel();
translate([100-3.5+1,-62+32,105-25+5])rotate([90,0,-90])sd_lightfixture(56);
}
/*
*/

translate([-100,-14.5-0.5,5])rotate([0,90,0])tslot20(200);
translate([-20,0,20]){
//translate([-4.5,-4,0])arducam_case();
translate([-4.5+43,-4,20])arducam_case_standoff_shim();
translate([-4.5+43,-4,0])arducam_case_standoff();
//translate([-4.5+43,-4,0])arducam_rotate_case();
}


/*
*/
color("Thistle")platereaderbase_A();
color("Violet")platereaderbase_B();
translate([-30-0.5,-30,-15])mirror([0,0,0])rotate([0,0,-90])
import("cytokinetics/pillarsupport_112.stl");
translate([-30-0.5+64,-30,-15])mirror([1,0,0])rotate([0,0,-90])
import("cytokinetics/pillarsupport_112.stl");
translate([-30-0.5,-30-100,-15])mirror([0,0,0])rotate([0,0,-90])
import("cytokinetics/pillarsupport_112.stl");
translate([-30-0.5+64,-30-100,-15])mirror([1,0,0])rotate([0,0,-90])
import("cytokinetics/pillarsupport_112.stl");

translate([0,-62,105])rotate([-90,0,0])pr_lightfixture(120);
platereader_frontpanel();
translate([0,-70,50-30])rotate([-90,180,0])import("cytokinetics/Top_Slots_SM.stl");
translate([0,0,-30])raspi_holder_base();

rotate([180,180,0]){
translate([0,-62,105])rotate([-90,0,0])pr_lightfixture(120);
platereader_frontpanel();
translate([0,-70,50-30])rotate([-90,180,0])import("cytokinetics/Top_Slots_SM.stl");
translate([0,0,-30])raspi_holder_base();
}
/*
*/
/*
*/


color("pink")translate([0,0,72+49-49-72-9+112])teachplate_holder();


translate([-85+6-1,50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);
translate([-85+6-1,-50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);
translate([83,50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);
translate([83,-50,-15-30])color("silver")cylinder(r=8.7/2,h=270,$fn=30);

translate([-80.5,0,0])bar_clamp();
translate([80.5,0,0])bar_clamp();
mirror([0,1,0]){
translate([-80.5,0,0])bar_clamp();
translate([80.5,0,0])bar_clamp();
}


}












//platereader_frontpanel_right();
module largerspacers(){
for(y=[0:1]){
for(i=[0:1]){
translate([i*9,y*9,0])difference(){
cylinder(r=8/2,h=20,$fn=30);
translate([0,0,-1])cylinder(r=4/2,h=24,$fn=30);
}
}
}
}



module smallspacers(){
for(y=[0:1]){
for(i=[0:5]){
translate([i*9,y*9,0])difference(){
cylinder(r=8/2,h=6,$fn=30);
translate([0,0,-1])cylinder(r=4/2,h=10,$fn=30);
}
}
}
}



//mirror([1,0,0])
//rotate([0,0,-90])pillarsupport_130();

//platereader_frontpanel();

//pillarsupport_130();
//translate([161,0,0])pillarsupport_130();

//raspi4_holder();
/*
*/
//translate([0,0,0])mouse_conenozzle(dia,hi,cut);
//waterproof_camera_square_tube(10);
/*
cage_assy();
light_pvc_holder();
translate([333,0,0])light_pvc_holder();
*/
//mirror([0,1,0])raspi2_bottom();
//rfid_camera_connector();
//rfid_camera_module();


//translate([0,0,72])teachplate_holder();

//translate([-80.5,0,0])bar_clamp();
//mirror([0,1,0]){
//translate([-80.5,0,0])bar_clamp();
//}
//translate([-4.5,-4,0])arducam_case();



module raspi_holder_base(){
translate([0,-70,50])rotate([90,0,0])difference(){
import("cytokinetics/Bottom_Base_SM.stl");
translate([-43/2,27,-20])cylinder(r=3.7/2,h=50,$fn=30);
translate([43/2,27,-20])cylinder(r=3.7/2,h=50,$fn=30);
translate([0,27,-20])cylinder(r=33.7/2,h=50,$fn=30);
translate([0,27+5,-20])cylinder(r=33.7/2,h=50,$fn=30);
translate([0,27-5,-20])cylinder(r=33.7/2,h=50,$fn=30);
}
}



module pillarsupport_130(){
translate([-49,2-58,-7])color("peru"){
translate([2-26-7,6,0])difference(){
union(){
rotate([0,0,45])cylinder(r=24/2,h=130,$fn=4);
translate([0,4,0])rotate([0,0,45])cylinder(r=24/2,h=130,$fn=4);
}
for(i=[0:13]){
translate([0,i,-1])cylinder(r=8.2/2,h=140,$fn=30);
}
translate([0,8,30])rotate([0,0,45])cylinder(r=24/2,h=22,$fn=4);
translate([0,8,80])rotate([0,0,45])cylinder(r=24/2,h=22,$fn=4);
translate([-5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+100])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+100])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
}
}
}





module pillarsupport_112(){
translate([-49,2-58,-7+15]){
translate([2-26-7,6,0])difference(){
union(){
rotate([0,0,45])cylinder(r=24/2,h=112,$fn=4);
translate([0,4,0])rotate([0,0,45])cylinder(r=24/2,h=112,$fn=4);
}
for(i=[0:13]){
translate([0,i,-1])cylinder(r=8.2/2,h=140,$fn=30);
}
translate([0,8,30])rotate([0,0,45])cylinder(r=24/2,h=22,$fn=4);
translate([0,8,80])rotate([0,0,45])cylinder(r=24/2,h=22-6,$fn=4);
translate([-5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+100-15])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+100-15])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+100-18])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+100-8])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
}
}
}


module pillarsupport_115(){
translate([-49,2-58,-7+15]){
translate([2-26-7,6,0])difference(){
union(){
rotate([0,0,45])cylinder(r=24/2,h=115,$fn=4);
translate([0,4,0])rotate([0,0,45])cylinder(r=24/2,h=115,$fn=4);
}
for(i=[0:13]){
translate([0,i,-1])cylinder(r=8.2/2,h=140,$fn=30);
}
translate([0,8,30])rotate([0,0,45])cylinder(r=24/2,h=22,$fn=4);
translate([0,8,80])rotate([0,0,45])cylinder(r=24/2,h=22-6,$fn=4);
translate([-5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+50])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-5,10,20+100-15])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([5,10,20+100-15])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,7,20+100-18])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+50])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,5,10+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
translate([-30,-5,10+100])rotate([0,90,0])cylinder(r=2.8/2,h=130,$fn=30);
}
}
}











module raspi4_holder(){

translate([-49,2,-7]){
import("RasPiHolderCase_0010.STL");

translate([2-26,6,0])difference(){
union(){
translate([-16,33,0])cube([20,18,15]);
translate([-16+18,33,0])cube([20+8,18,8]);
}
translate([-16,33+9,-1])
for(i=[0:10]){
translate([i,0,-1])cylinder(r=8.2/2,h=50,$fn=30);
}
translate([-16+5,33+9+10,7.5])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-16+5,33+9,7.5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
}



translate([2-26+162,6,0])difference(){

union(){
translate([-16,33,0])cube([20.5,18,15]);
translate([-16+18-33,33,0])cube([20,18,8]);
}

translate([-16+9,33+9,-1])
for(i=[0:12]){
translate([i,0,-1])cylinder(r=8.2/2,h=50,$fn=30);
}
translate([-16+5+12,33+9+10,7.5])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-16+5+12,33+9,7.5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
}
}
}
module platereader_sidepanel_washer(){
difference(){
translate([100-2-10+4.1,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5])rotate([0,90,0])cylinder(r=10/2,h=6,$fn=30);
translate([100-2-10-20,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);
}
}
module platereader_sidepanel(){
difference(){
translate([100-2,-61.5,-18.5-1.5])color("pink")cube([2,123,123+10+1.5]);
translate([100-2,-61.5+47,-18.5-5])cube([30,30-1,16.7+5]);
translate([100-2,-61.5+47+5-0.5,-18.5])cube([30,21,16.7+2.5]);
translate([100-2-10,-61.5+47+5-0.5-15,-18.5+105+5])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);
translate([100-2-10,-61.5+47+5-0.5-15+50,-18.5+105+5])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);

translate([100-2-10-20,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);
translate([100-2-10-20,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5-85])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);

translate([0,100,0]){
translate([100-2-10-20,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);
translate([100-2-10-20,-61.5+47+5-0.5-15-20,-18.5+105+5+6.5-85])rotate([0,90,0])cylinder(r=4.7/2,h=50,$fn=30);
}
}
}


module platereader_frontpanel_left(){
rd = 1;
rdd =3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;
color("lightblue")difference(){
dd = 30.5;
color("")translate([0-60-5,-63+1.5,60-4+2-dd/2])rotate([90,0,0])roundedRect([70,154-dd,2], rd);
color("")translate([0-60+20,-63+1.5+100,130-1-dd])rotate([90,0,0])cylinder(r=5.7/2,h=300,$fn=30);
color("")translate([0-60+20-40-5.5,-63+1.5+100,130-1-26-8])rotate([90,0,0])cylinder(r=5.7/2,h=300,$fn=30);
color("")translate([0-60+20-40-5.5,-63+1.5+100,130-1-26-50])rotate([90,0,0])cylinder(r=5.7/2,h=300,$fn=30);
color("")translate([0-60+20-40-5.5+45,-63+1.5+100,130-1-26-75])rotate([90,0,0])cylinder(r=2.7/2,h=300,$fn=30);
color("")translate([0-60+20-40-5.5,-63+1.5+100,130-1-26-100])rotate([90,0,0])cylinder(r=5.7/2,h=300,$fn=30);
}
}

module platereader_frontpanel_right(){
rd = 1;
rdd =3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;
color("lime")difference(){
dd = 30.5;
color("")translate([0+60+5,-63+1.5,60-4+2-dd/2])rotate([90,0,0])roundedRect([70,154-dd,2], rd);
color("")translate([0-60+20+85,-63+1.5+100,130-1-dd])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("")translate([0-60+20+85+44,-63+1.5+100,130-1-26-8])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("")translate([0-60+20+85+44,-63+1.5+100,130-1-26-50])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("")translate([0-60+20+85+44-50,-63+1.5+100,130-1-26-75])rotate([90,0,0])cylinder(r=2.7/2,h=300,$fn=30);
color("")translate([0-60+20+85+44,-63+1.5+100,130-1-26-100])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
}
}

module platereader_frontpanel_middle(){
rd = 1;
rdd =3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;

difference(){
dd = 30.5;
color("pink")translate([0+0,-63+1.5-2,60-4+2-dd/2])rotate([90,0,0])roundedRect([100,154-dd,2], rd);
color("pink")translate([0-60+20,-63+1.5+100,130-1-dd])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("pink")translate([0-60+20+85,-63+1.5+100,130-1-dd])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("pink")translate([0-43/2,-63+1.5,60-4+2+20-30])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
color("pink")translate([43/2,-63+1.5,60-4+2+20-30])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);
color("pink")translate([0-60+20-40-5.5+45,-63+1.5+100,130-1-26-75])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
color("pink")translate([0-60+20+85+44-50,-63+1.5+100,130-1-26-75])rotate([90,0,0])cylinder(r=4.9/2,h=300,$fn=30);
}

}
module platereader_frontpanel(){
platereader_frontpanel_left();
platereader_frontpanel_middle();
platereader_frontpanel_right();
}


module bar_clamp(){
translate([85.5,0,0])difference(){
  union(){
 translate([-100-4,10,-20])cube([40,4,18]);
 translate([-100+10,10,-20])cube([10,4+30,8]);
 translate([-100+15,10+40,-20])rotate([0,0,45])cylinder(r=28/2,h=13,$fn=4);
 translate([-100+10,10+40,-20])rotate([0,0,45])cylinder(r=28/2,h=13,$fn=4);
 }
 for(i=[0:20]){
  translate([-100+15-i,10+40,-20])rotate([0,0,45])cylinder(r=8.2/2,h=88,$fn=30);
 }
  translate([-100+150-145+1,10+80,-13])rotate([90,0,0])cylinder(r=2.8/2,h=68,$fn=30);
  translate([-100+150-145+1,10+80,-13])rotate([90,0,0])cylinder(r=3.8/2,h=42,$fn=30);
  translate([-100+150-145+1-2,10+10,-10])rotate([90,0,0])cylinder(r=5.7/2,h=42,$fn=30);
  translate([-100+150-145+1-2+23,10+10,-10])rotate([90,0,0])cylinder(r=5.7/2,h=42,$fn=30);

 }
}



module teachplate_core(){
rd = 3;
rdd = 3;
//w = 85.4964-rd+0.3;
//l = 127.7112-rd;
w = 85.4964-3+0.3; // 
l = 127.7112-3; //
h =  14.351-0.;
hb = 2.5;
color("white")translate([12-66,47.5,1.5+11])writecube( "A1",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("gray")difference(){
 difference(){
 union(){
 difference(){
 union(){
 translate([-0,-0,2])roundedRect([l+18,w+18,hb+8], rd);
 }
 translate([-0,-0,-1])roundedRect([l+0.7,w+0.7,hb+31], rd);
 }
 translate([-0,-0,2])roundedRect([l+0.7,w+0.7,hb], rd);
 }
 translate([0,0,-1])roundedRect([l-9,w-7,hb+30], rd);
}
 translate([-40,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-25+70,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,25,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,20-50,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
 /*
 for (i=[25,67]){
 for (j=[-3,137]){
 translate([j,i,0]){
  translate([-67,20-67,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
  translate([-67,20-67,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
 }
 for (i=[-2,96]){
 for (j=[35,100]){
 translate([j,i,0]){
  translate([-67,20-67,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
  translate([-67,20-67,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
 }
 */
 for (i=[0,134]){
 for (j=[0,93]){
 translate([-67+i,20-67+j,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
 translate([-67+i,20-67+j,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
}
}

module topfill_fanmnt(){

rd = 2;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;
 translate([0,0,0])difference(){
 translate([-0,-0,2])roundedRect([l+18,w+18,hb], rd);
 for (i=[0,134]){
 for (j=[0,93]){
 translate([-67+i,20-67+j,-10])rotate([0,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 }
 }

translate([0-13-80,46-26,0])cube([80,50,10]);

translate([30-2,30-32.50,-5]){
translate([25,25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-25,25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([25,-25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([-25,-25,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([0,0,0])cylinder(r=45/2,h=30,$fn=30);
}


}

}

module teachplate_core_larger(){
rd = 2;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;
color("white")translate([12-66,47.5,1.5+11])writecube( "A1",where=[0,0,0],size=[0,0,0],h=7,face="top");
color("gray")difference(){
 difference(){
 union(){
 difference(){
 union(){
 translate([-0,-0,2])roundedRect([l+18,w+18,hb+8], rd);
 }
 translate([-0,-0,-1])roundedRect([l+0.7,w+0.7,hb+31], rd);
 }
 translate([-0,-0,2])roundedRect([l+0.7,w+0.7,hb], rd);
 }
 translate([0,0,-1])roundedRect([l-9,w-7,hb+30], rd);
}
 translate([-40,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-25+70,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,25,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,20-50,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
 for (i=[25,67]){
 for (j=[-3,137]){
 translate([j,i,0]){
  translate([-67,20-67,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
  translate([-67,20-67,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
 }
 for (i=[-2,96]){
 for (j=[35,100]){
 translate([j,i,0]){
  translate([-67,20-67,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
  translate([-67,20-67,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
 }
 /*
 */
 for (i=[0,134]){
 for (j=[0,93]){
 translate([-67+i,20-67+j,12-4])rotate([0,0,0])cylinder(r=8/2,h=300,$fn=30);
 translate([-67+i,20-67+j,-10])rotate([0,0,0])cylinder(r=3.7/2,h=300,$fn=30);
 }
 }
}
}















































module teachplate_holder(){
rd = 3;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;

difference(){
 difference(){
 union(){
 difference(){
 union(){
 translate([70+8-5-130+27.5,50-8.5+1.8-106.5,2])cube([24.5+34,20,2]);
 translate([70+8-5-130+27.5,50-8.5+1.8,2])cube([24.5+34,20,2]);
 translate([70+8-5-130,50-8.5,2])cube([24.5+93,20,2]);
 translate([70+8-5-130,50-111.5,2])cube([24.5+93,20,2]);
 translate([70+8-5,50-90-5.5,2])cube([24.5+2.8,82+8.7,2]);
 translate([70+8-5-167.5-2.8,50-90-5.5,2])cube([24.5,82+8.7,2]);
 translate([70+8,50,2])roundedRect([35,20,10], rd);
 translate([70+8,50-100,2])roundedRect([35,20,10], rd);
 translate([70-140-5,50,2])roundedRect([35,20,8], rd);
 translate([70-140-5,50-100,2])roundedRect([35,20,8], rd);
 translate([-0,-0,2])roundedRect([l+18,w+18,hb+8], rd);
 }

 translate([70+12,50,-1])for(i=[0:15]){if(i==0){translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);} else {translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);}translate([8,20,8])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);translate([8,20,8])rotate([90,0,0])cylinder(r=3.8/2,h=20,$fn=30);}
 
translate([70+12,50-100,-1])for(i=[0:15]){if(i==0){translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);} else {translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);}translate([8,20,8])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);translate([8,0,8])rotate([90,0,0])cylinder(r=3.8/2,h=20,$fn=30);}

translate([70-12-140-12,50-100,-1])for(i=[0:15]){if(i==15){translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);} else {translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);}translate([6,20,8])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);translate([6,0,8])rotate([90,0,0])cylinder(r=3.8/2,h=20,$fn=30);}
 
translate([70-12-140-12,50,-1])for(i=[0:15]){if(i==15){translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);} else {translate([i,0,0])cylinder(r=8.2/2,h=100,$fn=30);}translate([8,20,8])rotate([90,0,0])cylinder(r=2.8/2,h=40,$fn=30);translate([8,20,8])rotate([90,0,0])cylinder(r=3.8/2,h=20,$fn=30);}


 //translate([-0,-0,-1])roundedRect([l+0.5,w+0.5,hb+31], rd); very tight
 translate([-0,-0,-1])roundedRect([l+0.7,w+0.7,hb+31], rd);
 }
 //translate([-0,-0,2])roundedRect([l+0.5,w+0.5,hb], rd);
 translate([-0,-0,2])roundedRect([l+0.7,w+0.7,hb], rd);
 }
 translate([0,0,-1])roundedRect([l-9,w-7,hb+30], rd);
}
 translate([-40,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-25+70,25+100,8])rotate([90,0,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,25,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
 translate([-100,20-50,8])rotate([0,90,0])cylinder(r=2.8/2,h=300,$fn=30);
}
}











module teachplate(){

color("yellow")import("cytokinetics/PF00-MC-T0010-E4.stl");
rd = 3;
rdd = 3;
w = 85.4964-rd+0.3;
l = 127.7112-rd;
h =  14.351-0.;
hb = 2.5;

//color("lime")teachplate();
difference(){
 union(){
 roundedRect([l,w,hb], rd);
 roundedRect([l-4,w-4,h], rdd);
}
 cc = 103.5;
 translate([cc,-cc/2,2])rotate([0,0,45])roundedRect([l,w,h+2], rd);
 translate([0,0,-1])roundedRect([l-28,w-34,h+28], rdd+8);
 translate([-150,15,h/2+2.1])rotate([0,90,0])cylinder(r=4/2,h=250,$fn=30);
 translate([-150,-15,h/2+2.1])rotate([0,90,0])cylinder(r=4/2,h=250,$fn=30);
 translate([15,150,h/2+2.1])rotate([90,0,0])cylinder(r=4/2,h=250,$fn=30);
 translate([-15,150,h/2+2.1])rotate([90,0,0])cylinder(r=4/2,h=250,$fn=30);
 }
}
module roundedRect(size, radius)
{
x = size[0];
y = size[1];
z = size[2];
linear_extrude(height=z)
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);
    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);
    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
}
}











module rfid_camera_standoff(){
difference(){
translate([25-2,-5+107-5+4,0])cube([18,10,30]);
translate([28,-5+107-5+6.5+3,-10])cylinder(r=2.8/2,h=300,$fn=30);
translate([28+8,-5+107-5+6.5+3,-10])cylinder(r=2.8/2,h=300,$fn=30);
}
}

module rfid_camera_module(){
translate([30,-19+140,0])rotate([0,0,-90])cytokinetics_miuzei_raspicam_base();
difference(){
translate([25,-5+107-5+38,0])cube([16,10,3]);
translate([28,-5+107-5+6.5-2.5+40,-10])cylinder(r=3.8/2,h=300,$fn=30);
translate([28+8,-5+107-5+6.5-2.5+40,-10])cylinder(r=3.8/2,h=300,$fn=30);
}
}


module rfid_camera_connector(){
rfid_holder();
difference(){
translate([25,-5+107-5,0])cube([16,13,3]);
translate([28,-5+107-5+6.5+3,-10])cylinder(r=2.8/2,h=300,$fn=30);
translate([28+8,-5+107-5+6.5+3,-10])cylinder(r=2.8/2,h=300,$fn=30);
}
}

//tslot20(100);
//rfid();
//camera_65mm_mount_tslotstand();
//waterproof_camera_square_tube(10);
//rotate([0,180,0])mouse_restraint(44.3,62);

/*
mouse_restraint(31,12);
//translate([35,0,0])mouse_nozzle(3);
*/
/*
a = 0;
b = 0;
dia = [0.7,0.8,0.9,1.1,1.2,1.3,1.4,1.5];
//x = [0,45,85,0,45,85,24];
//y = [0,0,0,0,0,0,25];
x = [0,45,85,120,150,175,200];
y = [0,0,0,0,0,0,0];
for(i=[0:6]){
 echo(31/dia[i]);
 translate([x[i],y[i],0])mouse_restraint(31/dia[i],10);
}

*/

//mirror([0,1,0])import("files/endstop_y.stl");

//endstop_y();


//rotate([0,90,0])tslot20(100);
//translate([0,20,0])rotate([0,90,0])tslot20(100);
//y_arm_flag();



module rfid_holder(){
//translate([0,0,0])rotate([0,90,90])tslot20(100);
difference(){
union(){
translate([-4,-4,0])cube([61+8,96+8,13]);
translate([-23,5,0])cube([20,20,4]);
translate([-23,60,0])cube([20,20,4]);
}
translate([0,0-10,2])cube([20,20,20]);
translate([-23+8,70,-10])cylinder(r=4.7/2,h=30);
translate([-23+8,15,-10])cylinder(r=4.7/2,h=30);
translate([0,0,2])cube([61,96,20]);
translate([15,15,-1])cube([61-30,96-30,20]);
translate([50,20,6])rotate([0,90,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([50,80,6])rotate([0,90,0])cylinder(r=2.8/2,h=30,$fn=30);
}
}


module rfid_holder_mount(){
//translate([0,0,0])rotate([0,90,90])tslot20(100);
difference(){
union(){
//translate([-4,-4,0])cube([61+8,96+8,13]);
translate([-23,10,0])cube([20,20+40,4]);
translate([-23+10,5+10,0])cylinder(r=23/2,h=4+25,$fn=30);
//translate([-23,60,0])cube([20,20,4]);
translate([-23+10,60+10,0])cylinder(r=23/2,h=4+25,$fn=30);
}
translate([0,0-10,2])cube([20,20,20]);
translate([-23+10,70,-10])cylinder(r=3.8/2,h=130,$fn=30);
translate([-23+10,15,-10])cylinder(r=3.8/2,h=130,$fn=30);
translate([-23+10,43+8,-10])cylinder(r=4.7/2,h=130,$fn=30);
translate([-23+10,43-9,-10])cylinder(r=4.7/2,h=130,$fn=30);
translate([0,0,2])cube([61,96,20]);
translate([15,15,-1])cube([61-30,96-30,20]);
translate([50,20,6])rotate([0,90,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([50,80,6])rotate([0,90,0])cylinder(r=2.8/2,h=30,$fn=30);
}
}









module y_arm_flag(){

difference(){
cube([15,30,4]);
translate([6,6,-1])cylinder(r=5.7/2,h=30,$fn=30);
}
}


module endstop_y(){
difference(){
union(){
//import("files/endstop_y.stl");
translate([40+30-38,1.5,-0.0])cube([85-10+38-83,28,4]);
translate([40+30-38,1.5,-0.0])cube([18,28,4]);
//translate([40.9,12.5,0])rotate([0,0,45])cylinder(r=8.7/2,h=8,$fn=4);
for(x=[-3:2]){
translate([40.9+x,25,4])cylinder(r=5.5/2,h=3,$fn=30);
}
}
translate([60,-114,0])rotate([0,0,90]){
translate([40.75+80,4.5,-0.2])cylinder(r=3.2/2,h=30,$fn=20);
translate([60.75+80,4.5,-0.2])cylinder(r=3.2/2,h=30,$fn=20);
}
//#translate([40.9,25,4])cylinder(r=5.5/2,h=4,$fn=30);
translate([40.9,5,-0.2])cylinder(r=4.7/2,h=30,$fn=30);
//translate([50.,12,-0.2])cube([120,20,20]);
}
}







/*
rfid();
translate([0,43,0])rfid();
*/
module rfid(){

difference(){
translate([0,-8,0])cube([30,35+16,32+8]);
translate([-1,0,8])cube([32,35,32+5]);
translate([6,18,-2-3.4+10.1])cylinder(r=10/2,h=3.4,$fn=20);
translate([6,18,-2-3.29])cylinder(r=5.7/2,h=10,$fn=20);
translate([24,18,-2-3.4+10.1])cylinder(r=10/2,h=3.4,$fn=20);
translate([24,18,-2-3.29])cylinder(r=5.7/2,h=10,$fn=20);

translate([15,24+33,-2-3.4+10.1])cylinder(r=10/2,h=3.4,$fn=20);
translate([15,24+33,-2-3.29])cylinder(r=5.7/2,h=10,$fn=20);
translate([15,24+70,0+28])rotate([90,0,0])cylinder(r=2.8/2,h=130,$fn=20);
}
}


module mouse_nozzle(dia){
//dia = 31;
difference(){
cylinder(r1=dia/2,r2=(5+5)/2,h=14,$fn=30);
translate([0,0,-0.5])cylinder(r1=(dia*0.8)/2,r2=(5)/2,h=14,$fn=30);
translate([0,0,-2])cylinder(r=(5.4)/2,h=34,$fn=30);
}
}

module mouse_flatnozzle(dia){
//dia = 31;
difference(){
cylinder(r=(dia+6)/2,h=14,$fn=30);
translate([0,0,2])cylinder(r=(dia+0.4)/2,h=20,$fn=30);
translate([0,0,-1])cylinder(r=(5.5)/2,h=30,$fn=30);
}
}

module mouse_conenozzle(dia,hi,cut){
//dia = 31;
//hi = 9;
difference(){
union(){
translate([0,0,hi+1])cylinder(r=(dia+6)/2,h=hi-cut,$fn=30);
cylinder(r2=(dia+6)/2,r1=10,h=hi+1,$fn=30);
}
translate([0,0,2])cylinder(r1=(dia*0.4)/2,r2=(dia+0.6-6.125)/2,h=hi-0.9,$fn=30);
translate([0,0,hi+3])cylinder(r=(dia+0.4)/2,h=hi*3,$fn=30);
translate([0,0,hi+1])cylinder(r=(dia+0.4-6.125)/2,h=hi*3,$fn=30);
translate([0,0,-1])cylinder(r=(5.5)/2,h=hi*3,$fn=30);
}
}






module mouse_restraint(dia,hi){
difference(){
//dia = 31;
cylinder(r=dia/2,h=hi,$fn=30);

translate([-15+4,10-3,10-6])cube([22.5/2-4,20,30+6]);
translate([-15+4+22.5/2+4,10-3,10-6])cube([22.5/2-4,20,30+6]);

translate([0,0,-2])cylinder(r=(dia-5)/2,h=125,$fn=30);
translate([0,0,100])for(i=[0:20]){
if (i>17){
translate([0,0,0+i])rotate([0,90,0])cylinder(r=15/2,h=40);
translate([0,0,0+i])rotate([0,-90,0])cylinder(r=15/2,h=40);
translate([0,0,0+i])rotate([90,0,0])cylinder(r=15/2,h=40);
translate([0,0,0+i])rotate([-90,0,0])cylinder(r=15/2,h=40);
} else {
translate([0,0,0+i])rotate([0,90,0])cylinder(r=10/2,h=40);
translate([0,0,0+i])rotate([0,-90,0])cylinder(r=10/2,h=40);
translate([0,0,0+i])rotate([90,0,0])cylinder(r=10/2,h=40);
translate([0,0,0+i])rotate([-90,0,0])cylinder(r=10/2,h=40);
}
}
}
}
/*
*/

//camera_65mm_mount_tslotstand();
//waterproof_camera(15);
//pvc_raspi();
//waterproof_camera_square_tube(0);
//uctronics_5();
//one_inch_pvc_mount();
//translate([12.5,60,-25])rotate([90,0,0])tslot20(200);



/*
color("lime")translate([-10+2+8,-42-7,0])rotate([90,45,0])cylinder(r=(59)/2,h=5,$fn=4);
color("pink")translate([-10+2+8,-42,0])rotate([90,45,0])cylinder(r=(60.81)/2,h=5,$fn=4);
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([43-sh,43-sh,5], sh);
sh=2.1;
difference(){union(){
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([43-sh,43-sh,5], sh);
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([43-sh+8,43-sh+8,3], sh);
}
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([43-sh-14,43-sh-14,5], sh);
}
*/

module one_inch_pvc_mount(){

difference(){
union(){
cylinder(r=(34+8)/2,h=18);
translate([-9+25-15,-30+8,0])cube([18+15,63+12-30,4]);
}
translate([0,0,-3])cylinder(r=(34-0.2)/2,h=400);
translate([-30,0,12])rotate([0,90,0])cylinder(r=(2.8)/2,h=20,$fn=20);
translate([0+27.5,-24-6+14,-7])cylinder(r=(4.7)/2,h=20,$fn=20);
translate([0+27.5,26+6-16,-7])cylinder(r=(4.7)/2,h=400,$fn=20);
}
}




module uctronics_5(){
difference(){
translate([-20,-22,0])cube([120+40,75+44,3+3.5+2]);
translate([-0.2-0.5,-0.2-1.5,0])cube([120.4+1,75.4+3,6.5]);
translate([-0.2-0.5+3,-0.2-1.5+3,0])cube([120.4+1-6,75.4+3-6,16.5]);
translate([-9,-12,0]){
cylinder(r=3.2/2,h=100,$fn=20);
translate([0,0,5])cylinder(r=10/2,h=100,$fn=20);
}
translate([-9,-12+99,0]){
cylinder(r=3.2/2,h=100,$fn=20);
translate([0,0,5])cylinder(r=10/2,h=100,$fn=20);
}
translate([-9+138,-12+99,0]){
cylinder(r=3.2/2,h=100,$fn=20);
translate([0,0,5])cylinder(r=10/2,h=100,$fn=20);
}
translate([-9+138,-12,0]){
cylinder(r=3.2/2,h=100,$fn=20);
translate([0,0,5])cylinder(r=10/2,h=100,$fn=20);
}

translate([3,-4,-2]){
translate([0,0,0])cylinder(r=3.2/2,h=100,$fn=20);
translate([0,-1,0])cylinder(r=3.2/2,h=100,$fn=20);
translate([114,0,0])cylinder(r=3.2/2,h=100,$fn=20);
translate([114,-1,0])cylinder(r=3.2/2,h=100,$fn=20);
}
translate([3,75+4,-2]){
cylinder(r=3.2/2,h=100,$fn=20);
translate([114,0,0])cylinder(r=3.2/2,h=100,$fn=20);
}
}
}


module waterproof_camera_square_tube(ang){
translate([0,0,39-2]){
translate([0,0,3])rotate([90,0,ang])camera_65mm_mount();
translate([0,0,3+5])rotate([90,0,ang])camera_65mm_mount_disc_square();
translate([0,0,3+5+153-94])rotate([-90,0,ang])camera_65mm_mount_disc_square();
translate([0,0,7])rotate([-90,0,ang])color("black")cylinder(r=14/2,h=15,$fn=20);
}
//color("pink")waterproof_toppanel();
translate([0,0,60-9])rotate([0,0,ang]){
translate([-40+13+2,2.2,22])rotate([0,90,0])pvc_raspi();
translate([0,0,50])rotate([0,90,0])displayPiZero();
}
translate([0,0,37])color("")camera_65mm_mount_tslotstand();
//1.5inch PVC pipe
//translate([0,0,150-4])color("black")rotate([0,0,45+ang])cylinder(r=(44.45-0.3)/2,h=4,$fn=4);
//translate([0,0,150])color("black")rotate([0,0,45+ang])cylinder(r=(44.45-0.3+4.5)/2,h=4,$fn=4);
difference(){
color("lightblue")rotate([0,0,45+ang])cylinder(r=71.5/2,h=150,$fn=4);
translate([0,0,-0.2])rotate([0,0,45+ang])cylinder(r=58/2,h=324,$fn=4);
//color("lightblue")rotate([0,0,45+ang])cylinder(r=50.8/2,h=150,$fn=4);
//translate([0,0,-0.2])rotate([0,0,45+ang])cylinder(r=44.45/2,h=324,$fn=4);
}
}






module waterproof_camera(ang){
translate([0,0,39-2]){
translate([0,0,3])rotate([90,0,ang])camera_65mm_mount();
translate([0,0,3+5])rotate([90,0,ang])camera_65mm_mount_disc();
translate([0,0,7])rotate([-90,0,ang])color("black")cylinder(r=14/2,h=15,$fn=20);
}
//color("pink")waterproof_toppanel();
translate([0,0,60-9]){
translate([-40+13+2,2.2,22])rotate([0,90,0])pvc_raspi();
translate([0,0,50])rotate([0,90,0])displayPiZero();
}
translate([0,0,37])color("")camera_65mm_mount_tslotstand();
//1.5inch PVC pipe
translate([0,0,150])color("black")cylinder(r=49/2,h=4);
difference(){
color("lightblue")cylinder(r=49/2,h=150);
translate([0,0,-0.2])cylinder(r=40.5/2,h=324);
}
}




/*
*/

//translate([120+40,359+50,10])cage_miuzei_camera_module();

//lightfixture();
module sd_lightfixture(ln){
difference(){
union(){
translate([-44-20-2,0,0])cube([ln+15,11+8,10]);
}
//translate([-44-1+5+85-50,4+2.5,5-50])cylinder(r=3.7/2,h=140,$fn=30);
//translate([-44-1+5+85-100,4+2.5,5-50])cylinder(r=3.7/2,h=140,$fn=30);
//translate([-44-1-10-12,4,5])cube([ln+1+18,11,10]);
translate([-44-1-10-12,8,13])rotate([0,90,0])cylinder(r=6,h=ln+19,$fn=30);
}
}

//translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");



module pr_lightfixture3(ln){
difference(){
union(){
translate([-44-20-2,0,0])cube([ln+15,11+8+15,10+3+13]);
}
//translate([-44-1+5,4+2.5,5-10])cylinder(r=3.7/2,h=40,$fn=30);
//translate([-44-1+5+85,4+2.5,-10])cylinder(r=3.7/2,h=40,$fn=30);
translate([-44-1-10-12+5-4.5,4-6+6,5+5-7])rotate([0,0,0])cube([ln+1+18-12+9,11+5+20,15+10]);
//translate([-44-1-10-12,4,5])cube([ln+1+18,11,10]);
}
}






module pr_lightfixture2(ln){
difference(){
union(){
translate([-44-20-2,0,0])cube([ln+15,11+8,10+3]);
}
//translate([-44-1+5,4+2.5,5-10])cylinder(r=3.7/2,h=40,$fn=30);
//translate([-44-1+5+85,4+2.5,-10])cylinder(r=3.7/2,h=40,$fn=30);
translate([-44-1-10-12+5,4-6+3,5+5])rotate([-18,0,0])cube([ln+1+18-12,11+5+12,15]);
//translate([-44-1-10-12,4,5])cube([ln+1+18,11,10]);
}
}








module pr_lightfixture(ln){
difference(){
union(){
translate([-44-20-2,0,0])cube([ln+15,11+8-4,10]);
}
//translate([-44-1+5,4+2.5,5-10])cylinder(r=3.7/2,h=40,$fn=30);
//translate([-44-1+5+85,4+2.5,-10])cylinder(r=3.7/2,h=40,$fn=30);
translate([-44-1-10-12,4-2,5-3])cube([ln+1+18,11,10]);
}
}






//translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");



module lightfixture(){
difference(){
union(){
translate([-44,0,0])cube([100,11+8,10]);
rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
}
translate([-44-1,4,5])cube([102,11,10]);
}
}

//translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
//translate([120+40,359+50,10])cage_miuzei_camera_module();
//translate([300,-100+50+14+1,23])rotate([0,180,180])anglecornersupport();


//translate([300,-100+50+14+1,23])rotate([0,180,180])anglecornersupport();
//cage_assy();


//translate([30,0,0])


//translate([0,0,3])rotate([0,0,0])camera_65mm_mount();


/*
translate([0,0,3])rotate([90,0,0])camera_65mm_mount();
color("pink")camera_65mm_mount_tslotstand();
translate([0,0,3])rotate([90,0,0])camera_65mm_mount();
translate([0,0,7])rotate([-90,0,0])color("black")cylinder(r=14/2,h=15,$fn=20);
*/

//rotate([90,0,0])

/*
color("pink")waterproof_toppanel();
waterproof_toppanel_lid();
color("pink")waterproof_toppanel();
translate([-28,-6+4,26])displayPiZero();
waterproof_backpanel();
waterproof_rightpanel();
waterproof_frontpanel();
waterproof_camera_case();
waterproof_leftpanel();
*/







module waterproof_toppanel_lid(){
 translate([0,0,15])difference(){union(){
 translate([10.1-75-4-5,-16-5-8,21+5])cube([86+12+5,39+8+7,4]);
 }
 translate([-30+24-80+68.5+1-48-5,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48-5,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89/2,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89/2,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 }
}




module pvc_raspi(){
 md = 9-2.5+0.2-1.75+6.5-4.8-2+1;
 //md = 9-2.5+0.2-1.75+6.5-4.8-2+1-18;
 difference(){union(){
 //md = 9-2.5+0.2;
 //md = 9-2.5+0.2-1.75;
 translate([10.1-75-4-5+10,-16-5-8+md,21])cube([70,39+8+7-md*2,4]);
 /*
 difference(){ 
 translate([10.1-75-4-5+10+35,-16-5-8+26.5+0.5,21])cylinder(r=52.5,h=4);
 translate([10.1-75-4-5+10,-16-5-8+md-20,21])cube([90,39+8+7-md*2+40,4]);
 }
 */
 /*
 translate([10.1-75-4,-16-5-8,21])cube([86+10,8,15+5]);
 translate([10.1-75-4,-16-5-8+46,21])cube([86+10,8,15+5]);
 translate([10.1-75-4-5,-16-5-8,21])cube([8,39+8+7,15+5]);
 translate([10.1-75-4+90,-16-5-8,21])cube([8,39+8+7,15+5]);
 */
 }
 translate([10.1-75-4-5+20,-16-5-8+md+10,21-10])cube([70-20,39+8+7-md*2-20,29]);

 //translate([-30+24-80+68.5-4+30,-14+2.5,-32+4+51.6-3])rotate([0,0,0])cube([2.5,19,8]);

 translate([-30+24-80+68.5+1+17.5,-14+9-8.6,-32+4-10])rotate([0,0,0])cylinder(r=2.2/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1+17.5,-14+9-8.6+23,-32+4-10])rotate([0,0,0])cylinder(r=2.2/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1+17.5-58,-14+9-8.6,-32+4+50-10])rotate([0,0,0])cylinder(r=2.2/2,h=20,$fn=20);
 translate([-30+24-80+68.5+1+17.5-58,-14+9-8.6+23,-32+4+50-10])rotate([0,0,0])cylinder(r=2.2/2,h=20,$fn=20);


 }
}

module waterproof_toppanel(){
 difference(){union(){
 translate([10.1-75-4-5,-16-5-8,21])cube([86+10+5,39+8+7,6]);
 translate([10.1-75-4,-16-5-8,21])cube([86+10,8,15+5]);
 translate([10.1-75-4,-16-5-8+46,21])cube([86+10,8,15+5]);
 translate([10.1-75-4-5,-16-5-8,21])cube([8,39+8+7,15+5]);
 translate([10.1-75-4+90,-16-5-8,21])cube([8,39+8+7,15+5]);
 }

 translate([-30+24-80+68.5-4+30,-14+2.5,-32+4+51.6-3])rotate([0,0,0])cube([2.5,19,8]);

 translate([-30+24-80+68.5+1-48-5,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48-5,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89/2,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89/2,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89,-14+9-19,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1-48+89,-14+9-19+44,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);

 translate([-30+24-80+68.5+1+17.5,-14+9-8.6,-32+4])rotate([0,0,0])cylinder(r=2.2/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1+17.5,-14+9-8.6+23,-32+4])rotate([0,0,0])cylinder(r=2.2/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1+17.5-58,-14+9-8.6,-32+4+50])rotate([0,0,0])cylinder(r=2.2/2,h=20,$fn=20);
 translate([-30+24-80+68.5+1+17.5-58,-14+9-8.6+23,-32+4+50])rotate([0,0,0])cylinder(r=2.2/2,h=20,$fn=20);

 translate([-30+24-80+68.5+1,-14+9,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1,-14+9,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);
 //translate([-30+24-80+68.5+1,-14+9+13,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);

 translate([-30+24-80+76,-14+9+14+5,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76,-14+9+14+5,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);

 translate([-30+24-80+76+20,-14+9+14+5,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76+20,-14+9+14+5,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);
 translate([0,-36,0]){
 translate([-30+24-80+76,-14+9+14+11,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76,-14+9+14+11,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);
 translate([-30+24-80+76+20,-14+9+14+11,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76+20,-14+9+14+11,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);
 }
 translate([38.1,0,0]){
 translate([-30+24-80+68.5-4,-14+9,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5-4,-14+9,-32+4+51.6])rotate([0,0,0])cylinder(r=8/2,h=3.5,$fn=20);
 //translate([-30+24-80+68.5-4,-14+9+13,-32+4])rotate([0,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 }
 }
}







module waterproof_rightpanel(){
translate([38.1,0,0])difference(){union(){
translate([-18-2.1,16-36,-32])cube([2,38,53]);
translate([-18-2.1-4,16-36+5,-32+49])cube([5,38-10,4]);
}
 translate([-30+24-80+10,-14+9,-32+4])rotate([0,90,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+10,-14+9+14,-32+4])rotate([0,90,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5-4,-14+9,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5-4,-14+9+13,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
}
}


module waterproof_leftpanel(){
translate([0.1,0,0])difference(){union(){
translate([-18-2.1,16-36,-32])cube([2,38,53]);
translate([-18-2.1,16-36+5,-32+49])cube([6,38-10,4]);
}
 translate([-30+24-80+10,-14+9,-32+4])rotate([0,90,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+10,-14+9+14,-32+4])rotate([0,90,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1,-14+9,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+68.5+1,-14+9+13,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
}
}



module waterproof_frontpanel(){
difference(){union(){
translate([-18,16,-32])cube([36,2,53]);
translate([-18+4,16-5,-32+49])cube([36-8,5,4]);
}

 translate([-30+24-80+80+13/2-0.35,-14+9+14+50,-32+4+35])rotate([90,0,0])cylinder(r=15.8/2,h=150,$fn=20);

 translate([-30+24-80+80,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+93,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76,-14+9+14+5,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+76+20,-14+9+14+5,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
}
}

module waterproof_backpanel(){
translate([0,-36,0])difference(){union(){
translate([-18,16,-32])cube([36,2,53]);
translate([-18+4,16-5+6,-32+49])cube([36-9,5,4]);
}
 translate([-30+24-80+80,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+93,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+76,-14+9+14+11,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+76+20,-14+9+14+11,-32+4])rotate([0,0,0])cylinder(r=2.8/2,h=150,$fn=20);
}
}

module cytokinetics_miuzei_raspicam_base(){
translate([-7,-25+8,0])rotate([0,0,-90])smd_justclip();
translate([-10,-32,0])difference(){
union(){
translate([0,15,0])cube([20,5,2.5]);
}
translate([5,9,0])cube([10,5,6]);
}
difference(){
union(){
difference(){
translate([0,1,0])roundedRect([26,24,10-2],3.5);
translate([-13,-11.5,1])cube([26,25,15]);
translate([-9,-20,1])cube([18,25,15]);
}
translate([0,1,0])roundedRect([26,24,1],3.5);
translate([0,1+2+2,0])roundedRect([26,20-4,5],3.5);
translate([10.5,-1.5-1.5,0])cylinder(r=4/2,h=6, $fn=30);
translate([0,12.5,0]){
translate([10.5,-1.5,0])cylinder(r=4/2,h=6, $fn=30);
}
translate([-21,0,0]){
translate([10.5,-1.5-1.5,0])cylinder(r=4/2,h=6, $fn=30);
translate([0,12.5,0]){
translate([10.5,-1.5,0])cylinder(r=4/2,h=6, $fn=30);
}
}
}
translate([10.5,-1.5-1.5,1.5])cylinder(r=1.8/2,h=18, $fn=30);
translate([0,12.5,1.5]){
translate([10.5,-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
}
translate([-21,0,1.5]){
translate([10.5,-1.5-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
translate([0,12.5,0])translate([10.5,-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
}
translate([0,4,-1])cylinder(r=14/2,h=20);
translate([-12.5,1-0.5,1.5])cube([25,7,30]);
//translate([0,-1.5,-2])cylinder(r=17/2,h=30);
translate([0,-1.5,1.5])rotate([0,0,45])cylinder(r=24.75/2,h=9,$fn=4);
translate([0,1.7,1])roundedRect([11.5,20,10],3.5);
}
}



module 3dprint_miuzei_raspicam_base(){
translate([-7,-25+8,0])rotate([0,0,-90])smd_justclip();
translate([-10,-32,0])difference(){
union(){
translate([0,16+2,0])cube([20,3-1,1+4]);
translate([0,16+30,0])cube([20,5-1+18-5+10,3]);
//translate([0,16+30+17,0])cube([20,5-1,3+15]);

/*
translate([0,15+3,0])cube([3,5-3,8]);
translate([0+17,15+3,0])cube([3,5-3,8]);
translate([2.145,15-3-2,0])cube([3,5+4,2.5+7.5-3]);
translate([2.145,15-3-1,8-3])rotate([0,90,0])roundedRect([7,8,3.],2.8);
translate([13,0,0]){
translate([2.145,15-3-2,0])cube([3,5+4,2.5+7.5-3]);
translate([2.145,15-3-1,8-3])rotate([0,90,0])roundedRect([7,8,3.],2.8);
}
*/

}
translate([5,9,0])cube([10,5,6]);
translate([10,66,-50])rotate([0,0,0])cylinder(r=4/2,h=100,$fn=30);

}
difference(){
union(){
difference(){
translate([0,1,0])roundedRect([26,24,10-2],3.5);
translate([-13,-11.5,1])cube([26,25,15]);
translate([-9,-20,1])cube([18,25,15]);
}
translate([0,1,0])roundedRect([26,24,1],3.5);
translate([0,1+2+2,0])roundedRect([26,20-4,5],3.5);
translate([10.5,-1.5-1.5,0])cylinder(r=4/2,h=6, $fn=30);
translate([0,12.5,0]){
translate([10.5,-1.5,0])cylinder(r=4/2,h=6, $fn=30);
}
translate([-21,0,0]){
translate([10.5,-1.5-1.5,0])cylinder(r=4/2,h=6, $fn=30);
translate([0,12.5,0]){
translate([10.5,-1.5,0])cylinder(r=4/2,h=6, $fn=30);
}
}
}
translate([10.5,-1.5-1.5,1.5])cylinder(r=1.8/2,h=18, $fn=30);
translate([0,12.5,1.5]){
translate([10.5,-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
}
translate([-21,0,1.5]){
translate([10.5,-1.5-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
translate([0,12.5,0])translate([10.5,-1.5,0])cylinder(r=1.8/2,h=18, $fn=30);
}
translate([0,4,-1])cylinder(r=14/2,h=20);
translate([-12.5,1-0.5,1.5])cube([25,7,30]);
//translate([0,-1.5,-2])cylinder(r=17/2,h=30);
translate([0,-1.5,1.5])rotate([0,0,45])cylinder(r=24.75/2,h=9,$fn=4);
translate([0,1.7,1])roundedRect([11.5,20,10],3.5);
}
}















/*
*/












module waterproof_camera_case(){
 difference(){union(){
 translate([10.1,-16,-31.5])cube([8,32,7]);
 translate([10.1-28,-16+24,-31.5])cube([8+26,8,7]);
 translate([10.1-28,-16+24-7,-31.5])cube([8+26,8+3,3]);
 translate([10-28.1,-16,-31.5])cube([8,32,7]);
 translate([10.1-28,-16+24-24-1.8,-31.5])cube([8+28,6.5+2.2,7]);
 }
 translate([-30+24-80+10,-14+9,-32+4])rotate([0,90,0])cylinder(r=3.8/2,h=150,$fn=20);
 translate([-30+24-80+10,-14+9+14,-32+4])rotate([0,90,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+80,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=2.8/2,h=150,$fn=20);
 translate([-30+24-80+93,-14+9+14+50,-32+4])rotate([90,0,0])cylinder(r=2.8/2,h=150,$fn=20);
}
}

module camera_65mm_mount_tslotstand(){
difference(){
union(){
translate([-30-10-6,-14,-46])cube([60+20+12,18,4]);
translate([-30+20,-14,-46])cube([23,18,4+3]);
}
translate([-30+24-80,-14+9,-46-10+28])rotate([0,90,0])cylinder(r=2.8/2,h=150,$fn=20);
translate([-30+24,-14+9,-46-10])cylinder(r=3.7/2,h=40,$fn=20);
translate([-30+24+12,-14+9,-46-10])cylinder(r=3.7/2,h=40,$fn=20);
translate([-30+24,-14+9,-46-10+10])cylinder(r=8.5/2,h=4,$fn=20);
translate([-30+24+12,-14+9,-46-10+10])cylinder(r=8.5/2,h=4,$fn=20);
translate([-30+8-10-6,-14+9,-46-10])cylinder(r=4.7/2,h=40,$fn=20);
translate([-30+60-8+10+6,-14+9,-46-10])cylinder(r=4.7/2,h=40,$fn=20);
}
}

module camera_65mm_mount_disc_square(){
sh=2.1;
difference(){
union(){
//translate([-10+2+8,-42,0])rotate([90,45,0])cylinder(r=(44.45-0.3)/2,h=5,$fn=4);
//translate([-10+2+8,-42-3,0])rotate([90,0,0])cylinder(r=(38.1-0.4+2.9+8)/2,h=2);
//translate([-10+2+8,-42,0])rotate([90,45,0])cylinder(r=(60.81-.5)/2,h=5,$fn=4);
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([42.4-sh,42.4-sh,5], sh);
difference(){
translate([-10+2+8-0.1,-42-3,0+0])rotate([90,45-45,0])roundedRect([43-sh+9+6,43-sh+9+6,6], sh);
translate([-10+2+8-0.1,-42-3+2,0+0])rotate([90,45-45,0])roundedRect([43-sh+9,43-sh+9,6], sh);

}
/*
difference(){
translate([-10+2+8,-42-3,0])rotate([90,45,0])cylinder(r=(71.5+8)/2,h=2+4,$fn=4);
translate([-10+2+8,-42-3,0])rotate([90,45,0])cylinder(r=(71.5-1)/2,h=2,$fn=4);
}
*/
//color("lightblue")rotate([0,0,45+ang])cylinder(r=71.5/2,h=150,$fn=4);
//translate([0,0,-0.2])rotate([0,0,45+ang])cylinder(r=58/2,h=324,$fn=4);

}
translate([-6,-20-10,5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
translate([6,-20-10,5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
}
}

module camera_65mm_mount_disc(){
difference(){
union(){
translate([-10+2+8,-42,0])rotate([90,0,0])cylinder(r=(38.1-0.4+2.9)/2,h=5);
translate([-10+2+8,-42-3,0])rotate([90,0,0])cylinder(r=(38.1-0.4+2.9+8)/2,h=2);
}
translate([-6,-20,5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
translate([6,-20,5])rotate([90,0,0])cylinder(r=3.8/2,h=30,$fn=30);
}
}







module camera_65mm_mount(){
difference(){
union(){
//import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
cytokinetics_miuzei_raspicam_base();
translate([-10,-42+5,0])cube([20,17-5,10]);
translate([-10+2,-42+5,0])cube([14+2,17+8-5,10-3]);
//camera_65mm_mount_disc();
}
translate([-30+24-80,-14+9-26,-46-10+61])rotate([0,90,0])cylinder(r=2.8/2,h=150,$fn=20);
translate([-6,-20,5])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=30);
translate([6,-20,5])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=30);
}
}


/*
translate([-17-170-30-10,40-14-20,-55])rotate([0,0,180]){
//translate([-17-170-30-10,40-14-20,-55])rotate([0,0,180+45]){
translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
//translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])connectionarms2(50);
//translate([-18+2+3,100-21+10+1-49+50,-26.3+10-1.5+10])rotate([0,90,-90])connectionarms2(50);
translate([-35-10,90-50+50,64-37+60])rotate([90,0,0]){
translate([30,1,8])miuzei_cover();
//translate([30,0,0])miuzei_raspicam_base();
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
//translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
//translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
}
}
}
*/




//rotate([90,0,0])connectionarms2(30);
//rotate([0,180,0])tslot20innerbracket();
//translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])

//ledholder();
//translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");

/*
translate([100-125,60+120,200])rotate([90,90,0])tslot20innerbracket();
translate([100-128,60+120-22,21])tslot20(100);
translate([100+203,60+120,200])rotate([90,90,0])tslot20innerbracket();
translate([100+201,60+120-22,21])tslot20(100);
for(i=[0:2]){
translate([0,i*150,0]){
carsensor_holder();
translate([-40+20-3-1+330,60-58,0])rotate([0,0,180])carsensor_holder_mirror();
}
}
cage_assy();
*/

module carsensor_holder_mirror(){
mirror([0,1,0])difference(){
union(){
//translate([-100+55-1+10,20+2,25-5])cube([40-10,12,4]);
translate([-100+55-1+25,20+14,25-5])cube([40-24,20-5,4]);
translate([-100+55-1-2+10+17+10,20+2,25-5])cube([40-15-10,16,4+5+5]);
//translate([-100+46+9-5+10,22.5,25+4-5+5])color("pink")carsensor();
}
translate([-100+46+9+33,22.5+8+15-2,25+4-5+5-13])cylinder(r=4.7/2,h=40);
}
}





module carsensor_holder(){
difference(){
union(){
translate([-100+55-1+10,20+2,25-5])cube([40-10,16,4]);
translate([-100+55-1+25,20+14,25-5])cube([40-24,20,4]);

translate([-100+55-1-2+10,20+2,25-5])cube([40-15,16,4+5]);
translate([-100+46+9-5+10,22.5,25+4-5+5])color("pink")carsensor();
}
translate([-100+46+9+33,22.5+8+15,25+4-5+5-13])cylinder(r=4.7/2,h=40);
translate([-100+46+9+33-30.5+10,22.5+8-0.5,25+4-5+5-13])cylinder(r=4.7/2,h=40);
}
}

module cage_assy(){


translate([-9,60,30])rotate([0,0,-90])waterproof_camera(15);

translate([-9+150,-22,30])rotate([0,0,0])waterproof_camera(15);

translate([0,8,0]){
translate([-10+5-17,-50,25])rotate([0,90,0])tslot20(315+35);
}
translate([-50+10+2.7+40,-100+5+34+50-6,25])rotate([0,90,90])tslot20(430);
translate([-50+10+2.7+40+330,-100+5+34+50-6,25])rotate([0,90,90])tslot20(430);

translate([0+315-10,8+360,0])rotate([0,0,180]){
translate([-10+5,-50,25])rotate([0,90,0])tslot20(315);
}
translate([15,15,0])color("lightblue")cube([300-30,380-30,180]);
}

/*
*/


module carsensor(){
difference(){
cube([31,15,1]);
translate([31*0.25,15/2,-0.1])cylinder(r=3,h=3);
}
}




module cage_miuzei_camera_module(){
//translate([0-26-18,90-13.5,-50-13+5])rotate([-90,0,-90])
//rotate([0,90,0])miuzei_camera_breadboard_a();
//import("BOM_inventory/build3/stls/miuzei_camera_breadboard_a.stl");
//rotate([0,180,0])import("BOM_inventory/build3/stls/miuzei_camera_breadboard_b.stl");
//translate([0,0,11])rotate([0,90,0])miuzei_camera_breadboard_b();
/*
translate([-212,-330-53,110+45])rotate([-90,0,0]){
translate([175-2+10,300-120,400])rotate([-90,0,90]){
translate([0,0,3+6])rotate([0,180,0])displayPiZero();
raspizerobase_extrusion();
color("white")raspizero_ribbon_cable();
}
}
*/
/*
translate([43,-57,-62]){
translate([-11.5+3.8+(9*5)-10+1+9+3,80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
translate([-11.5+3.8+(9*5)-10+1+9-(9*9),80-1.5+0.5-20-17-0.75,-50+10-1.3+100+7])rotate([90,0,90])color("pink")import("BOM_inventory/build2/stls/miuzei_camera_breadboard_screwstub.stl");
}
*/
/*
*/

/*
//translate([0-26-18,90-13.5-20+1,-50-13+5+120])rotate([-0,90,-0])miuzei_camera_breadboard();
rotate([0,90,0])miuzei_camera_breadboard_a();
translate([0,0,-4])rotate([0,180,0])import("BOM_inventory/build3/stls/miuzei_camera_breadboard_b.stl");
*/


translate([-17-170-30-10,40-14-20,-55])rotate([0,0,180+45]){
translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])connectionarms2(50);
translate([-18+2+3,100-21+10+1-49+50,-26.3+10-1.5+10])rotate([0,90,-90])connectionarms2(50);
translate([-35-10,90-50+50,64-37+60])rotate([90,0,0]){
translate([30,1,8])miuzei_cover();
//translate([30,0,0])miuzei_raspicam_base();
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
}
}
}


translate([-17-170-30-10+500-100+20,40-14-20-500+35,-55])rotate([0,0,180-90-45]){
translate([-7-15,-25+120-31.5+16.4-36,-37-17+10+110-1])rotate([0,-0,-90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])connectionarms2(50);
translate([-18+2+3,100-21+10+1-49+50,-26.3+10-1.5+10])rotate([0,90,-90])connectionarms2(50);
translate([-35-10,90-50+50,64-37+60])rotate([90,0,0]){
translate([30,1,8])miuzei_cover();
//translate([30,0,0])miuzei_raspicam_base();
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
}
}
}


translate([-17-170-30-10+500-100+20,40-14-20-500+35+200+40,-55+40])rotate([0,0,180-90]){
translate([-7-15+15,-25+120-31.5+16.4-36-14,-37-17+10+110-1-18])rotate([0,-90,90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])connectionarms2(50);
translate([-18+2+3,100-21+10+1-49+50,-26.3+10-1.5+10])rotate([0,90,-90])connectionarms2(50);
translate([-35-10,90-50+50,64-37+60])rotate([90,0,0]){
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
/*
translate([30,1,8])miuzei_cover();
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
*/
}
}
}


translate([-17-170-30-10+500-100+20-400-5,40-14-20-500+35+200+40-31,-55+40])rotate([0,0,180+90]){
translate([-7-15+15,-25+120-31.5+16.4-36-14,-37-17+10+110-1-18])rotate([0,-90,90])import("BOM_inventory/build2/stls/mnt_md_justclip.stl");
translate([0,-60,83]){
translate([-18+2,100-21+1,-26.3+10-1.5+10])rotate([0,90,90])connectionarms2(50);
translate([-18+2+3,100-21+10+1-49+50,-26.3+10-1.5+10])rotate([0,90,-90])connectionarms2(50);
translate([-35-10,90-50+50,64-37+60])rotate([90,0,0]){
translate([30,0,0])import("BOM_inventory/build2/stls/miuzei_raspicam_base.stl");
/*
translate([30,1,8])miuzei_cover();
translate([30,4,-10])color("black")cylinder(r=12/2,h=18);
translate([30,4,-3])color("black")cylinder(r=16/2,h=8);
*/
}
}
}









/*
*/
}



//(C) Nathan Zadoks 2011
//CC-BY-SA or GPLv2, pick your poison.
module tslot(
	size=10,	//size of each side
	length=10,	//length. descriptive enough, no?
	thickness=3,	//thickness of the 'sheet'
	gap=0,		//gap, thickness of the lower part of the 'T'
	center=false,	//somewhat vague. todo.
	nut=false,	//set to true to make a fitting T-slot nut
){
	start=thickness/sqrt(2);
	if(nut){
		linear_extrude(height=10)
		intersection(){
			polygon([[size/2-gap/2,0],[size/2-gap/2,thickness],[thickness+start,thickness],[size/2,size/2-2],[size-thickness-start,thickness],[size/2+gap/2,thickness],[size/2+gap/2,0]]);
			square([size,size/2-(gap+thickness)/2]);
		}
	}	
	else{
		color([0.5,0.5,0.5])
		linear_extrude(height=length,center=center)
		translate([15,15])
		difference(){
			union(){
				for(d=[0:3]) rotate([0,0,d*90]) polygon(points=[
					[0,0],
					[0,start],[size/2-thickness-start,size/2-thickness],[gap/2,size/2-thickness],[gap/2,size/2],
					[size/2,size/2],[size/2,gap/2],[size/2-thickness,gap/2],[size/2-thickness,size/2-thickness-start],[start,0]
				]);
				square(gap+thickness,center=true);
			}
			circle(r=gap/2,center=true);
		}
	}
}
module tslot20(length,nut){
	tslot(size=20,gap=5.26,thickness=1.5,length=length,nut=nut);
}
module tslot30(length,nut){
	tslot(size=30,gap=8.13,thickness=2.55,length=length,nut=nut);
}
module tslot30_3060(length,nut){
	union(){
		tslot30(length,nut);
		translate([30,0,0])
		tslot30(length,nut);
	}
}


// EXAMPLE USAGE:
// roundedBox([20, 10, 4], 5, true);

// size is a vector [w, h, d]
module roundedBox(size, radius, sidesonly)
{
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
    }
  }
  else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);

    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis]) 
          translate([x,y,0]) 
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true);
      }
    }
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(radius);
    }
  }
}














// This generates geometry for creating PVC pipe fittings
// Licenced under Creative Commons: Attribution, Share-Alike
//		http://creativecommons.org/licenses/by-sa/3.0/
// For attribution you can direct people to the original file on thingiverse:
// 		http://www.thingiverse.com/thing:222574

// ================ variables

//CUSTOMIZER VARIABLES

/* [Main] */

// Rated strength
schedule=40; // [40:schedule_40,1:schedule_80]

// Nominal size ("inch")
nom_idx=1; // [0:1/2,1:3/4,2:1,3:1 1/4,4:1 1/2,5:2,6:2 1/2,7:3,8:4,9:5,10:6,11:8,12:10,13:12,14:14,15:16]

// Length in mm
length=35;

// What to generate
generate=1; // [0:outside fitting,1:outside fitting - boolean diff,2:inside fitting,3:inside fitting - boolean diff,4:inside outside,5:inside outside - boolean diff]

// Tightness of fit, in mm (0=tight 0.3=snug 0.6=loose)
tightness=0.3; // 0.0,1.0

// In points per cylinder
resolution=64;

//CUSTOMIZER VARIABLES END
/* [Hidden] */

// =============== calculated variables
$fn=resolution;

// =============== program

// ---- Data
nom_data=["1/2","3/4","1","1 1/4","1 1/2","2","2 1/2","3","4","5","6","8","10","12","14","16"];
sch40id_data=[0.622,0.824,1.049,1.38,1.61,2.067,2.469,3.068,4.026,5.047,6.065,7.981,10.02,11.938,13.124,15];
sch40od_data=[0.84,1.05,1.315,1.66,1.9,2.375,2.875,3.5,4.5,5.563,6.625,8.625,10.75,12.75,14,16];
sch40pvcweight_data=[0.16,0.21,0.32,0.43,0.51,0.68,1.07,1.41,2.01,2.73,3.53,5.39,7.55,10.01,11.8,15.43];
sch40cpvcweight_data=[0.17,0.23,0.34,0.46,0.55,0.74,1.18,1.54,2.2,-1,3.86,5.81,8.24,10.89,-1,-1];
sch80id_data=[0.546,0.742,0.957,1.278,1.5,1.939,2.323,2.9,3.826,4.813,5.761,7.625,9.564,11.376,12.5,14.314];
sch80od_data=[0.84,1.05,1.315,1.66,1.9,2.375,2.875,3.5,4.5,5.563,6.625,8.625,10.75,12.75,14,16];
sch80pvcweight_data=[0.2,0.27,0.41,0.52,0.67,0.95,1.45,1.94,2.75,3.87,5.42,8.05,12,16.5,19.3,25.44];
sch80cpvcweight_data=[0.22,0.3,0.44,0.61,0.74,1.02,1.56,2.09,3.05,-1,5.82,8.83,13.09,18,-1,-1];
thou2mm=25.4;

//---- Functions

/////////////////////////////////////////////////////////
// module create_pvc_component()
// This generates geometry for creating PVC pipe fittings.
// In general, you should use create_pvc() instead because it gives more options.
// schedule = Rated strength (40 or 80)
// nom_idx = Nominal size index as described by nom_data[] 
// length - Length in mm
// generate - What to generate:
//		0="outside fitting"
//		1="outside fitting - boolean diff"
//		2="inside fitting"
//		3="inside fitting - boolean diff"
// tightness - Tightness of fit, in mm (0=tight 0.3=snug 0.6=loose)
module create_pvc_component(schedule=40,nom_idx=0,generate=0,tightness=0.02,length=35) {
	dia=
	(thou2mm*(schedule==80 ?
		(generate==0||generate==1?sch80od_data[nom_idx]:sch80id_data[nom_idx])
		:
		(generate==0||generate==1?sch40od_data[nom_idx]:sch40id_data[nom_idx])
	))
	+(generate==2||generate==3?-tightness:tightness);
	echo("========== INFO ==========");
	echo(str("for ",nom_data[nom_idx],"in (nom) pipe"));
	echo(str("created ",dia,"mm dia part"));
	echo(str("including ",(generate==2||generate==3?-tightness:tightness),"mm for fit"));
	echo("==========================");
	// now draw it
	rotate([90,0,0]) if(generate==1||generate==3){
		cylinder(r=dia/2,h=length,center=true);
	}else{
		difference() {
			cube([dia+10,dia+10,length],center=true);
			cylinder(r=dia/2,h=length,center=true);
		}
	}
};

/////////////////////////////////////////////////////////
// module create_pvc()
// This generates geometry for creating PVC pipe fittings.
// Just like create_pvc_component() only adds generate options 4 and 5
// schedule = Rated strength (40 or 80)
// nom_idx = Nominal size index as described by nom_data[] 
// length - Length in mm
// generate - What to generate:
//		0="outside fitting"
//		1="outside fitting - boolean diff"
//		2="inside fitting"
//		3="inside fitting - boolean diff"
//		4="inside outside"
//		5="inside outside - boolean diff"
// tightness - Tightness of fit, in mm (0=tight 0.3=snug 0.6=loose)
module create_pvc(schedule=40,nom_idx=0,generate=0,tightness=0.02,length=35) {
	if(generate<=3){
		create_pvc_component(schedule,nom_idx,generate,tightness,length);
	}
	else if(generate==4){
		difference() {
			create_pvc_component(schedule,nom_idx,1,tightness,length);
			create_pvc_component(schedule,nom_idx,3,tightness,length*2);
		}
	}
	else{
		union() {
			create_pvc_component(schedule,nom_idx,0,tightness,length);
			create_pvc_component(schedule,nom_idx,3,tightness,length);
		}
	}
};

//---- The program

//light_pvc_holder();
//translate([333,0,0])light_pvc_holder();
module light_pvc_holder(){
//translate([-15,200-60,33])color("white")create_pvc(schedule,nom_idx,generate,tightness,length+20);
translate([-15,200-60,103-11])color("white")rotate([90,0,0])create_pvc(schedule,nom_idx,generate,tightness,length+100);
translate([-15,200-7,170])color("lightblue")create_pvc(schedule,nom_idx,generate,tightness,length+100);
}


module roundedRect(size, radius)
{
x = size[0];
y = size[1];
z = size[2];

linear_extrude(height=z)
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
}
}












//remember you got to mirror this
//mirror([0,1,0])raspi2_bottom();
module raspi2_bottom(){
//color("lime")
translate([106,6,0])
difference(){
union(){
cube([62,90.5+2-20,2]);
translate([60,20,0])cube([30,20,4]);
}
translate([80,30,0])cylinder(r=4.7/2,h=20,$fn=30);
translate([2,22,2])cube([62-4,86.5+1,15.5]);
translate([42.7,75,7])cube([14.5,20,35.5]);
translate([42.7-18,75,7])cube([14.5,20,35.5]);
translate([4.5,75,7])cube([14.5+38,20,35.5]);
translate([42.7-28,-10,7])cube([34.5,20,35.5]);
translate([42.7-20,-10,2])cube([16,20,35.5]);
translate([4.5-10,72-45-2.5,5])cube([14.5,21,65.5]);
translate([-5,56.6,10])rotate([0,90,0])cylinder(r=4.5,h=20);
translate([4.5-10,72-45-2.5-17,5])cube([14.5,12.5,65.5]);
translate([45-1.5+9-0.5-48,72-60,-5]){for (b=[0:6]){translate([6.5,b*10,0])cube([40,5,20]);}}

translate([0,0,-5]){
translate([6.25,6.25,0]){translate([0,0,3])cylinder(r=2/2,h=30);}
translate([6.25+49,6.25,0]){translate([0,0,3])cylinder(r=2/2,h=30);}
translate([0,58,-5]){
translate([6.25,6.25,0]){translate([0,0,3])cylinder(r=2/2,h=30);}
translate([6.25+49,6.25,0]){translate([0,0,3])cylinder(r=2/2,h=30);}
}
}
/*
*/


}//end difference


translate([106,6,0]){
translate([6.25,6.25,0]){difference(){cylinder(r=6.5/2,h=6);translate([0,0,3])cylinder(r=2/2,h=30);}}
translate([6.25+49,6.25,0]){difference(){cylinder(r=6.5/2,h=6);translate([0,0,3])cylinder(r=2/2,h=30);}}
translate([0,58,0]){
translate([6.25,6.25,0]){difference(){cylinder(r=6.5/2,h=6);translate([0,0,3])cylinder(r=2/2,h=30);}}
translate([6.25+49,6.25,0]){difference(){cylinder(r=6.5/2,h=6);translate([0,0,3])cylinder(r=2/2,h=30);}}
}
}


/*
translate([106,6,0]){
translate([60,80,0])difference(){cube([11,10,10.5]);for(a=[0:0]){translate([6.5,5+(10*a),-2]){cylinder(r=3.7/2,h=30);translate([0,0,2])rotate([0,0,90])cylinder(r=6.6/2,h=3,$fn=6);}}}
translate([-10,80,0])difference(){cube([11,10,10.5]);for(a=[0:0]){translate([6.5,5+(10*a),-2]){cylinder(r=3.7/2,h=30);translate([0,0,2])rotate([0,0,90])cylinder(r=6.6/2,h=3,$fn=6);}}}
translate([0,-10,0])difference(){cube([11,10,10.5]);for(a=[0:0]){translate([5.5,5+(10*a),-2]){cylinder(r=3.7/2,h=30);translate([0,0,2])rotate([0,0,90])cylinder(r=6.6/2,h=3,$fn=6);}}}
translate([50,-10,0])difference(){cube([11,10,10.5]);for(a=[0:0]){translate([5.5,5+(10*a),-2]){cylinder(r=3.7/2,h=30);translate([0,0,2])rotate([0,0,90])cylinder(r=6.6/2,h=3,$fn=6);}}}
}
*/
}








