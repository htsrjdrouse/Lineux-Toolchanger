//import("Dock_mount_fixed_v2.stl");


//translate([104.6,20,4.5+27.25])rotate([-90,0,0])#cylinder(r=5./2,h=50,$fn=300);
//translate([104.6,20,4.5])rotate([-90,0,0])#cylinder(r=5./2,h=50,$fn=300);


difference(){
union(){
import("Dock_sidemount_fixed_v2.stl");
translate([12.25,0,4.3]){
translate([104.6,67.7,4.5+18])rotate([-90,0,0])cylinder(r=5./2,h=22,$fn=300);
translate([104.6,67.7,4.5])rotate([-90,0,0])cylinder(r=5./2,h=22,$fn=300);
}
}
translate([164,94.7,-2])cube([8,3,40]);
hull(){
translate([168.5-8,94.7-30,9])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
translate([168.5+4,94.7-30,9])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
}
hull(){
translate([168.5+4,94.7-30,9+18])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
translate([168.5-8,94.7-30,9+18])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
}
translate([12.5,0,0]){
translate([104.6,40,4.5+27.25])rotate([-90,0,0])#cylinder(r=5./2,h=50,$fn=300);
translate([104.6,40,4.5])rotate([-90,0,0])#cylinder(r=5./2,h=50,$fn=300);
}

}
//import("Dock_mount_variable_pt1_v2.stl");
