/*
import("Arm5.stl");
import("Base5.stl");
import("Rad3.stl");	
*/
//import("Transm1.stl");

color("pink")translate([0,0,6])
difference(){
//import("bmg_gear_fixed.stl");
rotate([0,90,0])import("Extruder_dişli.stl");
translate([0,0,3])#cylinder(r=10/2,h=5,$fn=300);
}

