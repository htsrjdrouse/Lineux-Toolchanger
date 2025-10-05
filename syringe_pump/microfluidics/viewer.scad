include <bom_wash.scad>
include <bom_multichannel.scad>
include <washstation/washstation.scad>
include <BOSL2/std.scad> // Add BOSL2 library inclusion

//translate([50-50,-3,1])rotate([0,0,180])drypad();

//cube([20,20,25]);
//p1000_model_eppendorf_mod();
//p1000_model_eppendorf_modagain();
//singlechannel_tipremoval();
//pressurecompensation_bottle();
//singlechannel_tipremoval_base();

//rotate([0,180,0])washbowl_1tip();
//washbowl_stilt();

 //translate([40+5,-42,80])color("")pressurecompensation_bottle();
/*
 translate([40+5,-42,80])color("")pressurecompensation_bottle();
 //translate([6.5,-6.5,185])nalgene_cap_for_electrocaloric();
 translate([0,3,0])color("lightblue")rotate([90,0,0])import("Bottle.STL");
 //translate([6.5,-6.5,185])bottle_cap();
*/


//translate([-11.5+3.8+(9*5),80-1.5+0.5,-50+10-1.3])rotate([0,90,0])color("pink")miuzei_camera_breadboard_screwstub();

nalgene_250ml_bottle_holder();

//liquidlevel_sensor_holder();




module liquidlevel_sensor_holder(){

difference(){
union(){
cylinder(r=(28.15+4)/2,h=5,$fn=300);
translate([-15-5,-20,0])cube([40,40,5]);
}
#translate([0,0,-1])cylinder(r=28.4/2,h=15,$fn=300);
translate([0,0,-1])cylinder(r=(28.15-4)/2,h=15,$fn=300);
}
}




module nalgene_250ml_bottle_holder(){
translate([38,150,20])rotate([-90,0,-90])liquidlevel_sensor_holder();
dia = 76;
translate([0,150,0]){
//color("lightblue")cylinder(r=61./2,h=100,$fn=300);
difference(){
union(){
cylinder(r=(dia+12)/2,h=5,$fn=300);
translate([-10,31-2+6,0])cube([20,14,17]);
translate([-45,-10,0])cube([20,20,20]);
translate([-45,-10-40-5,0])cube([10,42+20,20]);
translate([-45,-10-40-5,0])cube([10,32+0,25]);
//translate([-48,-43,0])rotate([0,90,0])#cylinder(r=5.5/2,h=8,$fn=300);

/*
hull(){
translate([-47,-43,2.546])rotate([0,90,0])rotate([0,0,45])cylinder(r=7.2/2,h=8,$fn=4);
translate([-47,-43,2.546+5])rotate([0,90,0])rotate([0,0,45])cylinder(r=7.2/2,h=8,$fn=4);
}
*/


}
translate([0,0,-1])cylinder(r=dia/2,h=170,$fn=300);
translate([-5,0,-1])cube([10,55,27]);

translate([0,2,0]){
translate([-60,43,12])rotate([0,90,0])cylinder(r=2.8/2,h=200,$fn=300);
translate([-60+63,43,12])rotate([0,90,0])cylinder(r=3.8/2,h=8,$fn=300);
}

translate([0,-5,0]){
translate([0,0,2]){
translate([-50,-43,15])rotate([0,90,0])cylinder(r=3.8/2,h=58,$fn=300);
translate([-45+5,-43,15])rotate([0,90,0])cylinder(r=9.5/2,h=58,$fn=300);
}
translate([0,0,-12]){
translate([-50,-43,15])rotate([0,90,0])cylinder(r=3.8/2,h=58,$fn=300);
translate([-45+5,-43,15])rotate([0,90,0])cylinder(r=9.5/2,h=58,$fn=300);
}
}

translate([0,10,2]){
translate([-50,-43,15])rotate([0,90,0])cylinder(r=3.8/2,h=58,$fn=300);
translate([-45+5,-43,15])rotate([0,90,0])cylinder(r=9.5/2,h=58,$fn=300);
}


}
}
}
//import("Bottle.stl");



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




module washbowl_stilt(){
difference(){
translate([0,-55,-25])color("pink")cube([20,55,15]);
#translate([10,-55+20,-25])cylinder(r=4.8/2,h=50,$fn=300);
#translate([10,-55+20+13,-25])cylinder(r=4.8/2,h=50,$fn=300);
#translate([10,-55+20-12,-25])cylinder(r=5.7/2,h=50,$fn=300);
#translate([10,-55+20+13+14,-25-1])cylinder(r=5.7/2,h=50,$fn=300);
#translate([10,-55+20-12,-25+4])cylinder(r=10/2,h=50,$fn=300);
#translate([10,-55+20+13+14,-25+4])cylinder(r=10/2,h=50,$fn=300);
}
}


//washbowl_1tip();
//singlechannel_tipremoval();


//pipette_load_model();

//multichannel_drypad_384();

//translate([0,0,-10-15])color("pink")singlechannel_tipremoval_base();
//singlechannel_tipremoval();
//p20_use();
/*
*/

