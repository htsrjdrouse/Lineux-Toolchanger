///import("probe_holder_screws.stl");
//probe_holder_screws();

//import("AB_mount-screw.stl");

//endstop_mod_top_2_fix_cut();
//klicky_mount_mod_pcb_clone();

//mag_probe_screw_mod();
translate([0,0,-100])rotate([0,-90,180])rotate([0,0,0])dock_mount_fixed();
//translate([0,-70,65])rotate([0,0,0])retractable_dock_magnet();

module mag_probe_screw_mod(){

difference(){
union(){
import("whopping_Voron_mods/pcb_klicky/STLs/probe-screw.stl");
translate([0,-17,-7.6])color("pink")cube([27,17,2]);
translate([18.4,-0.0,-11])rotate([90,0,0])cylinder(r=5.3/2,h=5,$fn=300);
}
#translate([18.4,-0.0,-11])rotate([90,0,0])cylinder(r=4/2,h=2,$fn=300);
#translate([8.1,-3.1,-20])color("pink")cylinder(r=2.9/2,h=40,$fn=300);
#translate([8.1,-3.1-10.8,-20])color("pink")cylinder(r=2.9/2,h=40,$fn=300);
#translate([8.1+10.8,-3.1-10.8/2,-20])color("pink")cylinder(r=2.9/2,h=40,$fn=300);
translate([10.65,-14.9,-15])rotate([90,0,90])endstop_mod_top_2_fix_cut();
}
}



module retractable_dock_magnet(){
difference(){
union(){
translate([22.15,28,-40])rotate([-90,0,180])import("dock/klicky_dock.stl");
#translate([-6.4-5,28,-48-5])color("")rotate([90,0,0])cube([8.5+18,10-6,7]);
//#translate([-6.4-5,28,-48-5])color("")rotate([90,0,0])cube([8.5,10-6,7]);
//#translate([-6.4-5+18,28,-48-5])color("")rotate([90,0,0])cube([8.5,10-6,7]);
}
#translate([-6.4-0.3,30-2+20,-48])color("silver")rotate([90,0,0])cylinder(r=5/2,h=23,$fn=300);
#translate([-6.4+17.5,30-2+20,-48])color("silver")rotate([90,0,0])cylinder(r=5/2,h=23,$fn=300);
}
}
/*
*/
//translate([0,0,-30])import("probe-screw.stl");

/*
difference(){
import("probe_holder.stl");
translate([6-0.1-0.2,10-4+4.4-2,22+0.2])color("pink")cube([13+0.4,6+2,6.5]);
}
*/

/*
//import("probe_holder_mod.stl");
difference(){
import("klicky_mount.stl");
translate([-5,0,-40+1])rotate([-90,0,0])#cylinder(r=1.7/2,h=50,$fn=300);
translate([11,0,-40+1])rotate([-90,0,0])#cylinder(r=1.7/2,h=50,$fn=300);
translate([-5,32,-40+1-5])rotate([0,0,0])#cylinder(r=1.7/2,h=50,$fn=300);
translate([-5+16,32,-40+1-5])rotate([0,0,0])#cylinder(r=1.7/2,h=50,$fn=300);
}
*/

module klicky_mount_mod_pcb_clone(){

translate([0,0,50]){
//import("omron_klicky_assy.stl");

difference(){
import("klicky_mount.stl");
//mirror([0,1,0])#import("klicky_mount.stl");
translate([-20,20,-59])cube([60,20,30]);
}
}
translate([0-10,38.813,0])color("pink")difference(){
union(){
//translate([27,0,0])mirror([1,0,0])import("AB_mount-screw.stl");
translate([0,0,0])mirror([0,0,0])import("AB_mount-screw.stl");
}
translate([-20,-15,27.5])#cube([80,30,10]);
}

}
/*

*/

//import("omron_klicky_assy.stl");

module probe_holder_screws(){
difference(){
union(){
translate([15.2,8.225,-70+9.5])color("pink")rotate([90,0,180])import("probe_holder.stl");
translate([0,0,-1.5-1])translate([-5.5,33.6125,-50+8])cylinder(r=6.9/2,h=2.8,$fn=300);
translate([16.6,0,-1.5-1])translate([-5.5,33.6125,-50+8])cylinder(r=6.9/2,h=2.8,$fn=300);
}
#translate([-6.4+0.8+2-0.2-0.15,30-2+15-8-5+0.5,-74.3])#cube([13.2+0.25,6.3,30]);
#translate([-6.4+0.8,30-2+15,-48])color("silver")rotate([90,0,0])cylinder(r=2.8/2,h=30,$fn=300);
translate([0,0,-1.5-0.7])translate([-5.5,33.6125,-50+8+0.3])cylinder(r=6/2,h=3,$fn=300);
translate([0,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=2/2,h=80,$fn=300);
translate([16.6,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=2/2,h=80,$fn=300);
translate([16.6,0,-1.5-0.7])translate([-5.5,33.6125,-50+8+0.3])cylinder(r=6/2,h=3,$fn=300);

hull(){
#translate([3,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=1.5/2,h=80,$fn=300);
#translate([3.5,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=1.5/2,h=80,$fn=300);
}
translate([10.2,0,0])hull(){
#translate([3,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=1.5/2,h=80,$fn=300);
#translate([3.5,0,-1.5-6.5])translate([-5.5,33.6125,-50+8])cylinder(r=1.5/2,h=80,$fn=300);
}


}
}
/*
translate([-3.5,36.5,-51])rotate([90,0,0])endstop_mod_top_2_fix_cut();
translate([0,0,-1.5]){
translate([-5.5,33.6125,-50+8])color("silver")difference(){
cylinder(r=6/2,h=3,$fn=300);
#translate([0,0,-0.5])cylinder(r=1.8/2,h=4,$fn=300);
}
translate([-5.5+16.6,33.6125,-50+8])color("silver")difference(){
cylinder(r=6/2,h=3,$fn=300);
translate([0,0,-0.5])cylinder(r=1.8/2,h=4,$fn=300);
}
}
*/

module endstop_mod_top_2_fix_cut(){
//WMYCONGCONG 50 PCS Micro Switch AC 2A 125V 3 Pin SPDT Limit Micro Switch Long Hinge Lever
//difference(){
translate([-0.2,-0.2,-0.2])color("black")cube([12.8+0.4,6.5+0.4+5,5.7+0.4]);
//translate([-0.2,-0.2,-0.2])color("black")cube([12.8+0.4-4,6.5+0.4+6,5.7+0.4]);
translate([0,0,-5]){
//translate([12.8/2-6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
//translate([12.8/2+6.5/2,5.2,0])cylinder(r=4/2,h=5,$fn=300);
translate([0,-0,7.6]){
translate([12.8/2-6.5/2,5.2,-5])cylinder(r=1.9/2,h=12,$fn=300);
translate([12.8/2-6.5/2,5.2,-5-10])cylinder(r=4.5/2,h=12,$fn=300);
translate([12.8/2+6.5/2,5.2,-5])cylinder(r=1.9/2,h=12,$fn=300);
translate([12.8/2+6.5/2,5.2,-5])cylinder(r=4.5/2,h=2,$fn=300);
translate([12.8/2+6.5/2,5.2,-5-10])cylinder(r=4.5/2,h=12,$fn=300);
}
//}
}
}


/*
difference(){
translate([-50,-250,7])import("AB_mount.stl");
//translate([80,295,-30])#cube([100,100,100]);
}
*/
//import("probe_heatset.stl");
//import("probe_v0.2.1.stl");

module dock_mount_fixed(){
difference(){
union(){
import("v1.8_v2.4_Legacy_Trident_STL/Dock_sidemount_fixed_v2.stl");
translate([12.25,0,4.3]){
translate([104.6,67.7,4.5+18])rotate([-90,0,0])cylinder(r=5./2,h=22,$fn=300);
translate([104.6,67.7,4.5])rotate([-90,0,0])cylinder(r=5./2,h=22,$fn=300);
}
}
translate([164,94.7,-2])cube([8,3,40]);
hull(){
translate([168.5-8,94.7-30,9])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
translate([168.5+4,94.7-30,9])rotate([-90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
}
hull(){
translate([168.5+4,94.7-30,9+18])rotate([-90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
translate([168.5-8,94.7-30,9+18])rotate([-90,0,0])cylinder(r=5.7/2,h=100,$fn=300);
}
translate([12.5,0,0]){
translate([104.6,40,4.5+27.25])rotate([-90,0,0])#cylinder(r=2.9/2,h=50,$fn=300);
translate([104.6,40,4.5])rotate([-90,0,0])#cylinder(r=2.9/2,h=50,$fn=300);
}
}
}



