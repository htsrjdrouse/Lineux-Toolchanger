//import("Cowl.stl");
//import("Ebb36_Sherpa_Micro_Spacer.stl");
color("pink")import("Cowl_Klicky.stl");
import("Faceplate_Klicky.stl");
import("Sherpa_Micro_Bambu_TZ_2.0_Mount.stl");
import("Sherpa_Micro_Mount.stl");
import("sherpa_micro_ebb_mount.stl");

//translate([-1.5,60+1,50-3])rotate([90,0,0])sherpa_extruder();
import("sherpa_extruder/back_plate.stl");
import("sherpa_extruder/sherpa_micro_romz_mod.stl");

//translate([58.6,79,20])sherpa_micro_romz();

module sherpa_micro_romz(){
import("sherpa_extruder/sherpa_micro_romz/SherpaMicroRomzModLock.stl");
import("sherpa_extruder/sherpa_micro_romz/SherpaMicroRomzModModelAHousingCore.stl");
}
module sherpa_extruder(){
import("sherpa_extruder/housing_core_ecas_v1.stl");
translate([-66,62,-7])color("pink")import("sherpa_extruder/housing_rear_nema14housing_sherpa_mini_a3_r9c-1.stl");
}

//translate([-140+280+6.5-0.125,-130+400+2.5,270-5])rotate([-90,0,180])rotate([0,0,0])color("green")extruder_assy();

filament_path();

module filament_path(){
color("red")translate([2.75,55,-50])cylinder(r=1.7/2,h=300,$fn=300);

}

module extruder_assy(){
translate([-50+0.75,70+0.6,-9.1])extruder_back();
color("pink")extruder_front();
}

module extruder_front(){
difference(){
union(){
        //import("Sherpa_dakash_extruder/extruder_front.stl");
        import("extruder_front.stl");

/*
translate([130-0.15,225-0.5,230-20+17]){
  translate([14-0.2,-32-5-4,0-10+0.5])rotate([90,0,0])
  difference(){
  color("pink")cylinder(r=12.15/2,h=6,$fn=300);
  translate([0,0,0-1])cylinder(r=3.9/2,h=10,$fn=300);
  }
 }
*/

}

/*
#translate([130-0.15,225-0.5,230-20+17]){
translate([0,0,0])color("pink")cylinder(r=12.15/2,h=5,$fn=300);
translate([28,0,0])color("pink")cylinder(r=12.15/2,h=5,$fn=300);
}
*/
}
}


module extruder_back(){
difference(){
union(){
//import("Sherpa_dakash_extruder/extruder_back.stl");
import("extruder_back.stl");
}
//#translate([200-2.8,130-2.8,213.55-5])color("pink")cylinder(r=9.15/2,h=12.7,$fn=300);
}
}
