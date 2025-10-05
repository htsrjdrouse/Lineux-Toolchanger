
translate([-3+3,0,0])led_diffuser_standard();
//led_diffuser_standard_back();

module led_diffuser_standard(){
//translate([0,0,-3])import("bambulab_extruder.stl");
translate([80-4,-10.5,174])rotate([0,90,0])color("white")difference(){
cylinder(r=9.4/2,h=4+7,$fn=300);
//#translate([-2.5-4,-2.525,-1])cube([5.05+10,5.05,1.5+2]);
#translate([-2.5-4+6.5,-2.525+5.05/2,-1])cylinder(r=5.1/2,h=10,$fn=300);

//translate([-2.5,-2.5-3,0])cube([5,5,1.5]);
}
}

module led_diffuser_standard_back(){
//translate([0,0,-3])import("bambulab_extruder.stl");
//translate([80-4-4.6,-10.5-5,174+4.1+3.9])rotate([0,90,0])
color("pink")difference(){
//cylinder(r=9.5/2,h=4,$fn=300);
translate([80-4-4.2,-10.5-5,174+4.1+3.9+0])rotate([0,90,0])cube([13.8+0,10.2,4-1+1]);
translate([80-4-1-1.2,-10.5-1.25,174+6])rotate([0,90,0])translate([-2.5,-2.525,0])cube([5.05+10,5.05+2.5,1.5+2]);
//translate([80-4-1-1.2,-10.5-1.25-2-0,174+6-5])rotate([0,90,0])translate([-2.5,-2.525,0])cube([5.05+2,5.05+2.5,1.5+2]);

for(i=[0:3]){
#translate([80-4-1-1.2+3,-10.5-1.25-2+13,174+6-7+i*(1.7)+1])rotate([90,0,0])translate([-2.5,-2.525,0])cylinder(r=1.2/2,h=50,$fn=300);
}
}
}
