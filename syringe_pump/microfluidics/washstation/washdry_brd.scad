
/*
BOM_washdrypcv_kill_etch_copper_bottom.svg
BOM_washdrypcv_kill_etch_copper_bottom_mirror.svg
BOM_washdrypcv_kill_etch_copper_top.svg
BOM_washdrypcv_kill_etch_copper_top_mirror.svg
BOM_washdrypcv_kill_etch_mask_bottom.svg
BOM_washdrypcv_kill_etch_mask_bottom_mirror.svg
BOM_washdrypcv_kill_etch_mask_top.svg
BOM_washdrypcv_kill_etch_mask_top_mirror.svg
BOM_washdrypcv_kill_etch_silk_bottom.svg
BOM_washdrypcv_kill_etch_silk_bottom_mirror.svg
BOM_washdrypcv_kill_etch_silk_top.svg
BOM_washdrypcv_kill_etch_silk_top_mirror.svg
*/

svgsee("BOM_washdrypcv_kill_etch_copper_bottom.svg"); //BOM_washdrypcv_kill_etch_silk_top.svg");

//x = [28, 72,5.5, 92]
//y = [5, 3, 91.5, 91.5]


module svgsee(filename){

difference(){
union(){
linear_extrude(height = 2) {
import(filename);
}

#translate([100/2-15,100-10,0])cube([30,20,2]);
translate([100/2-15,100,0])cube([30,20,20]);

translate([28,5,0])cylinder(r=10/2,h=7,$fn=300);
translate([72,3,0])cylinder(r=10/2,h=7,$fn=300);
translate([5.5,91.5,0])cylinder(r=10/2,h=7,$fn=300);
translate([92,91.5,0])cylinder(r=10/2,h=7,$fn=300);
}


#translate([100/2-15-15,100-10-65,-1])cube([60,45,12]);


translate([100/2-15+15,130,14])rotate([90,0,0])#cylinder(r=5.7/2,h=100,$fn=300);
translate([100/2-15+15,130-10-4,14])rotate([90,0,0])#cylinder(r=10/2,h=100,$fn=300);


translate([28,5,-4])#cylinder(r=2.8/2,h=100,$fn=300);
translate([72,3,-4])#cylinder(r=2.8/2,h=100,$fn=300);
translate([5.5,91.5,-4])#cylinder(r=2.8/2,h=100,$fn=300);
translate([92,91.5,-4])#cylinder(r=2.8/2,h=100,$fn=300);
}
}
