include <tslot.inc.scad>

gantry_assy();
corners();
z_constrain();





front_skirt();

module front_skirt(){
translate([627,-30+0.5,-183.0])rotate([90,0,90])difference(){
import("350/front_skirt_b_350.stl");
translate([229-1,85,0])cube([4,100,80]);
}
translate([627,-30+0.5+210-3,-183.0+121])rotate([90,0,90])difference(){
import("350/longer_custom_center_300.stl");
translate([-59+0,-20,-30])cube([80,100,80]);
translate([-59+341.5,-20,-30])cube([80,100,80]);
}
translate([627,-30+422,-183.0])rotate([90,0,90])import("350/front_skirt_a_350.stl");
//translate([627,-30,-182])rotate([90,0,90])import("350/rear_center_skirt_350.stl");
}



module z_constrain(){
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+226+380])rotate([0,0,00])difference(){
union(){
cylinder(r=(22.2+6)/2,h=11,$fn=300);
translate([1.6+8,-40+5,0])cube([12,50-5,8]);
translate([1.6+8+8,-40.5,-18])cube([12-8,18,28]);
}
translate([5,-32,4])rotate([0,90,0])cylinder(r=(5.7)/2,h=18,$fn=300);
translate([5-1.4-4,-32,4])rotate([0,90,0])#cylinder(r=(10.7)/2,h=18,$fn=300);
translate([5,-32,-14])rotate([0,90,0])cylinder(r=(5.7)/2,h=18,$fn=300);
translate([0,0,-1])cylinder(r=(8.7)/2,h=18,$fn=300);
translate([0,0,3.1])cylinder(r=(22.2)/2,h=8,$fn=300);
}
}








module corners(){
translate([-53+60-134+564,-68+0.5-50+774.5-652+147.5,122.5-310+370])rotate([0,-180,90])import("z_stepper_left.stl");
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+206])rotate([0,0,90])color("")import("nema17.stl");
translate([-53+60-134+720+12.4,-68+0.5-50+774.5-652+147.5-105.34,122.5-310+226])rotate([0,0,00])
cylinder(r=8.7/2,h=500,$fn=300);
z_constrain();
translate([-53+60-134,-68+0.5-50+774.5-652,122.5-310])rotate([0,-90,-90])import("corner_a_x2.stl");
translate([-53+60-134+132,-68+0.5-50+774.5-652+800-15.5,122.5-310])rotate([0,-90,180])import("corner_a_x2.stl");

translate([652.5,2,0])rotate([0,0,90]){
translate([-53+60-136.5+135,-68+0.5-50+774.5-651.5-130,122.5-00])rotate([0,90,0])import("corner_b_x2.stl");
//translate([-53+60-136.5,-68+0.5-50+774.5-651.5,122.5-310])rotate([0,-90,-90])import("corner_a_x2.stl");
translate([-53+60-134+780,-68+0.5-50+774.5-780,-188])rotate([0,-90,0])import("corner_a_x2.stl");
}
/*
*/
}





module gantry_assy(){

x = 622;
y = 632;
z = 610;

//HF5N610-X10X448Y10Y448-TPW
tslot20(z); 
translate([0,y,0])tslot20(z);
translate([x,0,0])tslot20(z);
translate([x,y,0])tslot20(z);


translate([x,20+5,20+5])rotate([-90,0,0])tslot20(y-20);
translate([0,20+5,20+5])rotate([-90,0,0])tslot20(y-20);

translate([x,20+5,20+5+438])rotate([-90,0,0])tslot20(y-20);
translate([0,20+5,20+5+438])rotate([-90,0,0])tslot20(y-20);


translate([25,0,20+5])rotate([0,90,0])tslot20(x-20);
translate([25,y,20+5])rotate([0,90,0])tslot20(x-20);

translate([0,0,438]){
translate([25,0,20+5])rotate([0,90,0])tslot20(x-20);
translate([25,y,20+5])rotate([0,90,0])tslot20(x-20);
}

//HF5N642-X10X632-TPW
translate([-20,0,z]){
translate([25,0,20+5])rotate([0,90,0])tslot20(x+20);
translate([25,y,20+5])rotate([0,90,0])tslot20(x+20);
}
}


