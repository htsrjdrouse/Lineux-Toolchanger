//import("F695_1mm_Bearing_idler.stl");

//m5_washer();

//import("model_Motor_Mount_v2Motor_Mount_B_Top.stl");
//mod_Motor_Mount_v2Motor_Mount_B_Top();

//import("mod_Motor_Mount_v2Motor_Mount_B_Bottom.stl");
mod_Motor_Mount_v2Motor_Mount_B_Bottom();


module mod_Motor_Mount_v2Motor_Mount_B_Top(){
difference(){
import("Motor_Mount_v2Motor_Mount_B_Top.stl");
//#translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);


#translate([9,2.5,0]){
translate([4.5,-37.5,-20])cylinder(r=5.5/2,h=100,$fn=300);
translate([4.5,-37.5,30+5])cylinder(r=10.5/2,h=100,$fn=300);
}

#translate([9,-2.5,0]){
translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
translate([4.5-18,-37.5+2.5,30+5])cylinder(r=10.5/2,h=130,$fn=300);
}

}
}

module mod_Motor_Mount_v2Motor_Mount_B_Bottom(){
difference(){

union(){
import("Motor_Mount_v2Motor_Mount_B_Bottom.stl");
#translate([9,-2.5,0]){
translate([4.5-18,-37.5+2.5,0])cylinder(r=6.5/2,h=12,$fn=300);
}
#translate([9,2.5,0]){
translate([4.5,-37.5,0])cylinder(r=6.5/2,h=12,$fn=300);
}
}

#translate([9,-2.5,-1]){
translate([4.5-18,-37.5+2.5,0])cylinder(r=4.8/2,h=18,$fn=300);
}
#translate([9,2.5,-1]){
translate([4.5,-37.5,0])cylinder(r=4.8/2,h=18,$fn=300);
}


}
}


