include <tslot.inc.scad>


translate([0,449+20,20])rotate([0,90,0])tslot20(590);
translate([0,0,20])rotate([0,90,0])tslot20(590);
translate([-5+590/2,25.25,20])rotate([-90,0,0])tslot20(448.5);
translate([-5+590/2-220,25.25,20])rotate([-90,0,0])tslot20(448.5);
translate([-5+590/2+220,25.25,20])rotate([-90,0,0])tslot20(448.5);
translate([85,15,-50])cylinder(r=5.8/2,h=400,$fn=300);
translate([305,15,-50])cylinder(r=5.8/2,h=400,$fn=300);
translate([525,15,-50])cylinder(r=5.8/2,h=400,$fn=300);
translate([590,15,-50])cylinder(r=5.8/2,h=400,$fn=300);

