/*
*/

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
import("printed_parts/sherpa_micro_ebb_mount.stl");
translate([15,7,8])import("electronics/ebb36_brd.stl");
}

