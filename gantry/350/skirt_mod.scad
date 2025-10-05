
//translate([-40,0,0])import("front_skirt_a_350.stl");
//translate([-50,0,0])rotate([0,0,90])import("side_skirt_a_350_x2.stl");


translate([-24+24,0,0])difference(){
union(){
translate([-68,-121,0]){
translate([85+50,0,0])rotate([0,0,0])
import("front_skirt_b_350.stl");
translate([-0,0,0])
import("front_skirt_a_350.stl");
//import("../250/front_skirt_a_250.stl");
}
}
//translate([50,-20,-10])#cube([100,90,50]);
}
