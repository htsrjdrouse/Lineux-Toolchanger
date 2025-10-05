/*
*/
//filament_sensor();
umbilical_extrusion();

module umbilical_extrusion(){
difference(){
union(){
import("Umbilical_Extrusion_Mount_ribboncable.stl");
translate([30-10-10-1,30-3-5,27.7])cube([10,6,11.95]);
}
translate([30-10-10+4.2,30-3-5-1,27.7+5])rotate([-90,0,0])cylinder(r=3.2/2,h=11,$fn=300);
#translate([30-10-10+4.2,30-3-5,27.7+5])rotate([-90,0,0])cylinder(r=5/2,h=4.4,$fn=300);
}
}



module filament_sensor(){
difference(){
union(){
import("Umbilical_Extrusion_Mount_ribboncable.stl");
translate([30-10,30-3+9.5+1.37,27.7])cube([25,11.63,11.95]);
//translate([30-10,30-3,27.7])#cube([25,13,11.95]);
translate([30-10-10-1,30-3-5,27.7])cube([10,6,11.95]);
translate([50-5-24.5,-95+12-0.5+11,200-1.6+10-310])rotate([90,0,90])mirror([0,0,0])import("selector_chomp.stl");
}
translate([30-10-0.4,30-3+9.5+1.37-12,27.7-1])#cube([11.5,12,14.95]);
translate([30-10-10+4.2,30-3-5-1,27.7+5])rotate([-90,0,0])cylinder(r=3.2/2,h=11,$fn=300);
#translate([30-10-10+4.2,30-3-5,27.7+5])rotate([-90,0,0])cylinder(r=5/2,h=4.4,$fn=300);
}
}

//#translate([30-10-10+4.2+18,30-3-5-1+10.9,27.7+5+12.35])rotate([0,90,0])cylinder(r=3.2/2,h=11,$fn=300);
//#translate([30-10-10+4.2+20.9,30-3-5-1+10.9,27.7+5+12.35])rotate([0,90,0])cylinder(r=5/2,h=4.4,$fn=300);
/*
difference(){
import("a_Selector_Cart.stl");
translate([100,70,0])cube([50,66,30]);
translate([122,70,0])cube([50,66+100,30]);
translate([122-20,70.5,-20])cube([50,70,30]);
#translate([122-3,70,24])cube([50,66+100,30]);
}
*/
//translate([118,136.3,0])cube([18,19,4]);
//translate([118+3,136.3+16,0])#cube([15,19,4]);

/*
translate([-1,-30,0])difference(){
import("ORIGKlickyDockMountVariablePart3.stl");
translate([118-15-20,136.3+50-14,-4])cube([40,30,14]);
}
translate([118-15-20+25+5+8,136.3+50-14-30+2,0])cube([5,24,5]);
#translate([118-15-20+25+5+8+8.8,136.3+50-14-30+2,0])cube([5.9,14,6]);
*/
