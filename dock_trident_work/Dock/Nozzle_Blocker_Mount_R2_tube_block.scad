//translate([0,-32,50])
//import("battery_plate.stl");
//import("nozzle_blocker.stl");



module Nozzle_Blocker_Mount_R2_tube_block(){
difference(){
union(){
translate([0,-32,50])
import("Nozzle_Blocker_Mount_R2.stl");
translate([-2.65,0,-4.835])color("lime")cube([12,28,6.5]);
}
translate([-2.65+3,10,-4.835+0.5])color("lime")#cube([6,18,16]);
}
}
/*
translate([0,0,1]){
translate([0,0,1])color("grey")cube([10,28,2]);
cube([10,28,1]);
}
*/
