
difference(){
union(){
	import("extruder_front.stl");
translate([130-0.15,225-0.5,230-20+17]){
  translate([14-0.2,-32-5-4,0-10+0.5])rotate([90,0,0])
  difference(){
  color("pink")cylinder(r=12.15/2,h=6,$fn=300);
  translate([0,0,0-1])cylinder(r=3.9/2,h=10,$fn=300);
  }
 }
}

#translate([130-0.15,225-0.5,230-20+17]){
translate([0,0,0])color("pink")cylinder(r=12.15/2,h=5,$fn=300);
translate([28,0,0])color("pink")cylinder(r=12.15/2,h=5,$fn=300);
}
/*
*/
}

/*
translate([130-0.15,225-0.5,230-20]){
translate([0,0,0])color("pink")cylinder(r=4.4/2,h=25,$fn=300);
translate([28,0,0])color("pink")cylinder(r=4.4/2,h=25,$fn=300);
}
*/


