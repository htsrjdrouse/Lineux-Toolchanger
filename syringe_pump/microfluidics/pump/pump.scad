/*

difference(){
cube([200,65,4]);
cylinder(r=2.8/2,h=30,$fn=300);
translate([15,5,-2])cylinder(r=5.7/2,h=30,$fn=300);
translate([200-15,5,-2])cylinder(r=5.7/2,h=30,$fn=300);

for(i=[0:2]){
translate([70*i,0,0]){
translate([5,5+41,-2])cylinder(r=2.8/2,h=30,$fn=300);
translate([5+49,5+41,-2])cylinder(r=2.8/2,h=30,$fn=300);
translate([5+49/2,5+41,-2])cylinder(r=29/2,h=30,$fn=300);
}
}
}

*/

//pump_plate();

//translate([97,119,20])rotate([0,180,90])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/CAN_cabling/keystone-box-1_lid.stl");

$fn = 300; // Set global resolution

module roundedCube(size, radius) {
    minkowski() {
        cube([size[0] - 2*radius, size[1] - 2*radius, size[2] - radius]);
        sphere(r = radius);
    }
}


module pump_plate(){
difference() {
   union(){
    translate([0, 0, 2]) roundedCube([200, 70, 4], 2); // Moved up by 2 to compensate for rounded bottom
    translate([36-5, 20+40, 2]) roundedCube([60+10, 25, 4], 2); // Moved up by 2 to compensate for rounded bottom
   } 
    translate([15, 5, -2]) cylinder(r=5.7/2, h=30);
    translate([200-15, 5, -2]) cylinder(r=5.7/2, h=30);
    #translate([15+22, 5+70-0.2, -2]) cylinder(r=3.7/2, h=30);
    #translate([15+22+54, 5+70-0.2, -2]) cylinder(r=3.7/2, h=30);

    for(i=[0:2]) {
        translate([70*i, 0, 0]) {
            translate([5, 5+41, -2]) cylinder(r=2.95/2, h=30);
            translate([5+49, 5+41, -2]) cylinder(r=2.95/2, h=30);
            translate([5+49/2, 5+41, -2]) cylinder(r=29/2, h=30);
        }
    }
}
}
