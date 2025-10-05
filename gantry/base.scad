
difference(){
union(){
/*
import("base_Modular_Cut_2024-08-13T13-17-30/Part_1.stl");
color("lime")import("base_Modular_Cut_2024-08-13T13-17-30/Part_2.stl");
color("pink")import("base_Modular_Cut_2024-08-13T13-17-30/Part_3.stl");
color("lightblue")import("base_Modular_Cut_2024-08-13T13-17-30/Part_4.stl");
*/

/*
//a
translate([289,50,0])cube([45,20,4]);
translate([289+13,50,0])cube([20,120,4]);
translate([289,150,0])cube([45,20,4]);
//b
translate([0,410,0]){
translate([289,50,0])cube([45,20,4]);
translate([289+13,50,0])cube([20,120,4]);
translate([289,150,0])cube([45,20,4]);
}
//c
translate([210,0,0])rotate([0,0,90]){
translate([289,50,0])cube([55,20,4]);
translate([289+17,50,0])cube([20,120,4]);
translate([289,150,0])cube([55,20,4]);
}
//d
translate([210+420,0,0])rotate([0,0,90]){
translate([289,50,0])cube([55,20,4]);
translate([289+17,50,0])cube([20,120,4]);
translate([289,150,0])cube([55,20,4]);
}
*/
//e bracket
translate([210+220,0,0])rotate([0,0,90]){
translate([289,50,0])cube([55,20,4]);
translate([289+17,50,0])cube([20,130,4]);
translate([289,150+20,0])cube([55,20,4]);
}

translate([0,200,0]){
translate([289,50,0])cube([45,20,4]);
translate([289+13,50,0])cube([20,130,4]);
translate([289,160,0])cube([45,20,4]);
}
/*
*/

}

holes(2.8);
}
//translate([0,0,2])#color("lime")import("base_Modular_Cut_2024-08-13T13-17-30/Part_2.stl");


module holes(dia){
translate([50,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([150,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([250,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([0,44,0]){
translate([50,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([150,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([250,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
}
/*
translate([335,24,-2]){
cube([200,250,40]);
translate([0,70,0])cube([250,180,40]);
}
*/
translate([320,44,0]){
translate([50,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([150,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([250,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
}
translate([320,0,0]){
translate([50,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([150,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([250,295,-100])cylinder(r=2.8/2,h=300,$fn=300);
}

translate([0,10,0]){
translate([295,50,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,150,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,250,-100])cylinder(r=2.8/2,h=300,$fn=300);
}
translate([33,10,0]){
translate([295,50,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,150,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,250,-100])cylinder(r=2.8/2,h=300,$fn=300);
}

translate([0,320,0]){
translate([295,50,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,150,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,250,-100])cylinder(r=2.8/2,h=300,$fn=300);
}
translate([33,320,0]){
translate([295,50,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,150,-100])cylinder(r=2.8/2,h=300,$fn=300);
translate([295,250,-100])cylinder(r=2.8/2,h=300,$fn=300);
}
}

module base_cut(){
difference(){
cube([624,632,3]);
translate([624/2,0,-2])cube([624,632+20,30]);
translate([0,632/2,-2])#cube([624+10,632+20,30]);
translate([0,0,-2])#cube([70,70,10]);
translate([624-70,0,-2])#cube([70,70,10]);
translate([624-70,632-70,-2])#cube([70,70,10]);
translate([0,632-70,-2])#cube([70,70,10]);
translate([100,10,0])#cylinder(r=4/2,h=30,$fn=300);
translate([300-50,10,0])#cylinder(r=4/2,h=30,$fn=300);
translate([300+50,10,0])#cylinder(r=4/2,h=30,$fn=300);
translate([525,10,0])#cylinder(r=4/2,h=30,$fn=300);
translate([0,632-10,0]){
translate([100,0,0])#cylinder(r=4/2,h=30,$fn=300);
translate([300-50,0,0])#cylinder(r=4/2,h=30,$fn=300);
translate([300+50,0,0])#cylinder(r=4/2,h=30,$fn=300);
translate([525,0,0])#cylinder(r=4/2,h=30,$fn=300);
}
translate([10,100,0])#cylinder(r=4/2,h=30,$fn=300);
translate([10,300-50,0])#cylinder(r=4/2,h=30,$fn=300);
translate([10,300+50,0])#cylinder(r=4/2,h=30,$fn=300);
translate([10,525,0])#cylinder(r=4/2,h=30,$fn=300);
translate([624-10,0,0]){
translate([0,100,0])#cylinder(r=4/2,h=30,$fn=300);
translate([0,300-50,0])#cylinder(r=4/2,h=30,$fn=300);
translate([0,300+50,0])#cylinder(r=4/2,h=30,$fn=300);
translate([0,525,0])#cylinder(r=4/2,h=30,$fn=300);
}
}
}
