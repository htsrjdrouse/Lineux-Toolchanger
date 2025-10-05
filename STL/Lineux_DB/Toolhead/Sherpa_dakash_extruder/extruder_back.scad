//import("extruder_back.stl");

difference(){
union(){
import("extruder_back.stl");
//translate([200-2.8,130-2.8,213.55])color("pink")cylinder(r=11.85/2,h=2.7,$fn=300);
}
translate([200-2.8,130-2.8,213.55-5])color("pink")cylinder(r=9.15/2,h=12.7,$fn=300);
}
/*
*/
