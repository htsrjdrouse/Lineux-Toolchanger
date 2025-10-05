//keystone_syringe_box_connector();

//fivevolt_power_supply();


module fivevolt_power_supply(){

difference(){
union(){
cube([100,20,5]);
translate([-20,-10,0])cube([20,40,5]);
hull(){
translate([-10,12,0])cylinder(r=5.5/2,h=8,$fn=300);
translate([-10,26,0])cylinder(r=5.5/2,h=8,$fn=300);
}
}
translate([30,10,-2]){
cylinder(r=4/2,h=30,$fn=300);
translate([55,0,0])cylinder(r=4/2,h=30,$fn=300);
}
translate([-10,0,-2])cylinder(r=6/2,h=30,$fn=300);


}
}

module keystone_syringe_box_connector(){
difference(){
union(){
#translate([110-10,-5-5,0])cube([10,65,4]);
#translate([110-10,-5-5+16,0])cube([25,30,4]);
translate([110-10+35-10,-5-5+16,0])cube([10,30,4+15]);
}

translate([110,-5+20-1,12])rotate([0,90,0])cylinder(r=3.7/2,h=30,$fn=300);
translate([110,-5+20+13,12])rotate([0,90,0])cylinder(r=3.7/2,h=30,$fn=300);
#translate([-5-4,0,0]){
translate([110,-5+20-1,12])rotate([0,90,0])cylinder(r=9.7/2,h=30,$fn=300);
translate([110,-5+20+13,12])rotate([0,90,0])cylinder(r=9.7/2,h=30,$fn=300);
}


translate([105,-5,-2])#cylinder(r=2.95/2,h=30,$fn=300);
translate([105,-5+54,-2])#cylinder(r=2.95/2,h=30,$fn=300);
}

}

//keystone_lid_mod();
module keystone_lid_mod(){

import("keystone-box-1.stl");
//import("keystone-box-1_lid.stl");

difference(){union(){
translate([8,0,0]){
translate([95,-15+10,0])cube([13,10,2]);
translate([95,-21+10,0])cube([13,10,4]);
translate([95,-15+50,0])cube([13,10,2]);
translate([95,-15+59.5,0])cube([13,10,4]);
}
}
translate([110,-5,-2])#cylinder(r=2.95/2,h=30,$fn=300);
translate([110,-5+54,-2])#cylinder(r=2.95/2,h=30,$fn=300);
}
}

//voron_keystone_inside();
//voron_keystone_outside();

module voron_keystone_inside(){
difference(){
import("voron-skirt-keystone-inside.stl");
translate([-10.5,0,26.5-2])color("pink")cylinder(r=5.5/2,h=10,$fn=300);
translate([10.5,0,26.5-2])color("pink")cylinder(r=5.5/2,h=10,$fn=300);
}
}

module voron_keystone_outside(){
difference(){
import("voron-skirt-keystone-outside.stl");
translate([-6,-0.7,4])#cube([12,10,10]);
}
}
//import("voron-skirt-keystone-outside.stl");


