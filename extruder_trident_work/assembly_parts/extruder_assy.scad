sherpa_micro_ebb_mount_mod();

//umbilical_cord();


/*

translate([0,0,6.5]){
import("0.5mm_shimdrive_core_sherpa_mini_compact_r6a.stl");
import("shaftdrive_core_sherpa_mini_compact_r6a.stl");
import("filament_gear_drive_core_sherpa_mini_compact_r6a.stl");
import("sherpa_mini_gear_50t_sl_7mm_drive_core_sherpa_mini_compact_r6a.stl");
import("mr85_2rs_drive_core_sherpa_mini_compact_r6a003.stl");
import("m3_set_screw_drive_core_sherpa_mini_compact_6a.stl");
import("mr85_2r_drive_core_sherpa_mini_compact_r6a007.stl");
}




import("idler_pin_sherpa_mini_compact_r6a.stl");
import("idler_gear_assy_sherpa_mini_compact_r6a.stl");
import("socket_button_head_screw_iso_7380_m3x8_8n.stl");
import("insert_m3x5x4.stl");
import("thumbscrew.stl");
//#import("sherpa_housing.stl");
import("sherpa_lever.stl");
import("sherpa_cover.stl");
import("socket_button_head_screw_iso_iso7380_m3x8.stl");
import("lever_arm.stl");
import("insert_m3x5x4_1.stl");
import("insert_m3x5x4_2.stl");
import("insert_m3x5x4_3.stl");
import("m3x20mm.stl");
import("m3_20mm_bhcs.stl");
import("m3_30mm_shcs.stl");
import("m3_30mm_shcs.stl");
import("m3_30mm_shcs_1.stl");
import("insert_m3x5x4_3.stl");
//translate([4.5,-22.5,-9])rotate([-90,0,0])import("nema14_sherpa_micro_r9.stl");
//import("printed_parts/diffuser.stl");

import("printed_parts/housing.stl");
import("printed_parts/sherpa_housing.stl");
translate([8-6.5,-46,60])rotate([-90,0,0])color("pink")import("printed_parts/sherpa_micro_bambu.stl");
translate([1.5,-46,61])rotate([-90,0,0]){
import("printed_parts/sherpa_micro_mount.stl");
translate([0,0,-0])import("printed_parts/cowl_exo_klicky.stl");
import("printed_parts/back_plate.stl");
color("silver")import("electronics/micro_switch_2.stl");
import("printed_parts/Ebb36_sherpa_micro_spacer.stl");
import("printed_parts/Ebb36_sherpa_micro_spacer_1.stl");
//import("printed_parts/sherpa_micro_ebb_mount.stl");
sherpa_micro_ebb_mount_mod();
translate([15,7,8])import("electronics/ebb36_brd.stl");
}
*/

module sherpa_micro_ebb_mount_mod(){
//import("printed_parts/sherpa_micro_ebb_mount.stl");
difference(){
translate([0,16.25,0])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/STL/Lineux_One/Toolhead/Sherpa_Micro_Ebb_Mount_.stl");
translate([-3.5+4-0.75-20,70+6.15-10.5,90+5-2-60])color("pink")cube([9.5,2.3+2,25]);
}
difference(){
translate([-3.5,70-0.085,90+12])color("pink")cube([16,12+3.3,15]);
translate([-3.5+4-0.75,70+6.15,90+5-2])color("pink")cube([9.5,2.3,25]);
//#translate([-3.5+8,70+6.15+24,90+5-2+12])rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=300);
translate([-3.5+8,70+6.15+24,90+5-2+16])rotate([90,0,0])#cylinder(r=3.7/2,h=30,$fn=300);
translate([-3.5+8,70+6.15+24-15+0.1,90+5-2+16])rotate([90,0,0])#cylinder(r=5.5/2,h=5,$fn=300);
}

}

module umbilical_cord(){

difference(){
union(){
translate([0,16.25,0])import("/Users/richard/Documents/voron/Trident/lineux_toolchanger/Lineux-Toolchanger/STL/Lineux_One/Dock/Umbilical_Extrusion_Mount.stl");
}
translate([-10,10,27.65-4])cube([50,30,30]);
}
difference(){
translate([0,27,27.65])cube([30,13,12]);
translate([10-0.75,30,27.8-5])cube([9.5,2.2,30]);
translate([14,30+5,27.8-5+10])rotate([90,0,0])#cylinder(r=2.9/2,h=100,$fn=300);

}
}

