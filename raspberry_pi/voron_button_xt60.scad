//x = 12
//y = 19

//import("../gantry/350/side_skirt_a_350_x2.stl");


//color("lime")translate([-26.5/2,17.5+5,-1-2.])cube([26.5,12,9]);
difference(){
union(){
cylinder(r=(45+5)/2,h=2+6,$fn=300);
//#translate([-26.5/2,17.5+5-5,0])cube([26.5,12+5,2]);
translate([-26.5/2,17.5+5-5,0])cube([26.5,5,2+6]);
translate([-26.5/2,17.5+5,6])cube([26.5,12,2]);
/*
*/
//#translate([-26.5/2+8-5,17.5+5-48-2,0])cube([10+10,12,8]);
#translate([-26.5/2+8-5+10,17.5+5-48-2+16,0])cylinder(r=15,h=8,$fn=300);
}
//translate([-26.5/2+8-30,17.5+5-48-9,-1-6])cube([90,12+30,33]);
//translate([-26.5/2+8-30,17.5+5-48-9+9,4])rotate([0,90,0])#cylinder(r=2.4/2,h=100,$fn=300);
translate([-26.5/2+8-30,17.5+5-48-9+13,4])rotate([0,90,0])#cylinder(r=2.4/2,h=100,$fn=300);


translate([-26.5/2,17.5+5,-1-2])cube([26.5,12,9]);
translate([-26.5/2+8,17.5+5-48-9,-1-6])cube([10,12+10,33]);
translate([0,0,-1])cylinder(r=35/2,h=12,$fn=300);
//translate([0,0,-1])cylinder(r=40/2,h=12,$fn=300);
translate([0,0,-40])cylinder(r=39/2,h=120,$fn=300);
translate([0,1.5+4.5,0]){
translate([10,21,-1])cylinder(r=3/2,h=12,$fn=300);
translate([-10,21,-1])cylinder(r=3/2,h=12,$fn=300);
}
}

/*
difference(){
cylinder(r=12/2,h=13,$fn=6);
translate([0,0,-1])cylinder(r=5.9/2,h=15,$fn=300);
}
*/
//voron_skirt_xt60_sidepanel();

module voron_skirt_xt60_sidepanel(){
difference(){
union(){
translate([143.5,114.4,-4.0])color("pink")cube([27.7,76,4]);
translate([0,0,-0]){
translate([125.2,144.4,-2])color("lime")import("voron-skirt-insert-12mm-button.stl");
translate([125.2,144.4+50,-2])color("lime")import("voron-skirt-insert-12mm-button.stl");
}
}
translate([143.5+8,114.4+28.5,-4.1])#cube([12.1,19,6]);
translate([0,-3.1,-1.1]){
translate([143.5+8+6.05,114.4+28.5,-3.0])#cylinder(r=2.2/2,h=50,$fn=300);
translate([143.5+8+6.05,114.4+28.5+25,-3.0])#cylinder(r=2.2/2,h=50,$fn=300);
}
}
}

//color("pink")cube([16, 34,2]);
