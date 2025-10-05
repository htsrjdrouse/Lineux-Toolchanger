
lineux_lineactuator_dock();

module lineux_lineactuator_dock(){

translate([50.813-55-10,-55.8-0.75,70-0.95-6+6-23])cube([24+10,9,72]);


difference(){
translate([20-10+10-40,0-24-6-46.7,100])color("lime")rotate([0,0,-90])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/STL/Lineux_One/Dock/dock_parts/dock_body.stl");
translate([50.813-61.8,-55.8-25,70-0.95-6+6])cube([30,40,60]);
}

translate([-23-10,0,0])difference(){
translate([20-10+10-40,0-24-6-46.7,100])color("lime")rotate([0,0,-90])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/STL/Lineux_One/Dock/dock_parts/dock_body.stl");
translate([50.813-61.8+29.8,-55.8-25,70-0.95-6+6-50])cube([50,40,140]);
}
//translate([-29,0,80])rotate([90,0,0])tslot20(200);


}
