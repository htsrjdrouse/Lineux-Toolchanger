//import("F695_1mm_Bearing_idler.stl");

//m5_washer_1mm();
mod_corner_bracket_long_2020_top();


/*
difference(){
union(){
translate([0,0,-4])cylinder(r1=32/2,r2=22/2,h=13,$fn=300);
}
union(){
cylinder(r=18/2,h=7.5,$fn=6);
translate([0,0,-1])cylinder(r=10.5/2,h=20,$fn=300);
#translate([0,0,-4])cylinder(r=22/2,h=4,$fn=300);
}
}
*/

module m5_washer(){
difference(){
cylinder(r=5,h=0.5,$fn=300);
translate([0,0,-1])cylinder(r=5.3/2,h=10.5,$fn=300);
}
}

module m5_washer_1mm(){
difference(){
cylinder(r=5,h=1,$fn=300);
translate([0,0,-1])cylinder(r=5.3/2,h=10.5,$fn=300);
}
}

//mod_Motor_Mount_v2Motor_Mount_A_Top();
//mod_Motor_Mount_v2Motor_Mount_A_Bottom();
//mod_corner_bracket_long_2020_top();
//mod_corner_bracket_long_2020_bottom();
//printed_spacer();

module printed_spacer(){
difference(){
cylinder(r=10/2,h=10,$fn=300);
translate([0,0,-1])cylinder(r=5.7/2,h=20,$fn=300);
}
}

module mod_Motor_Mount_v2Motor_Mount_A_Top(){
difference(){
import("Motor_Mount_v2Motor_Mount_A_Top.stl");
translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
#translate([4.5,-37.5,-20])cylinder(r=5.5/2,h=100,$fn=300);
#translate([4.5,-37.5,30+5-1])cylinder(r=10.5/2,h=100,$fn=300);


#translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
#translate([4.5-18,-37.5+2.5,30+5-1])cylinder(r=10.5/2,h=130,$fn=300);
}
}

module mod_Motor_Mount_v2Motor_Mount_A_Bottom(){
difference(){
union(){
import("Motor_Mount_v2Motor_Mount_A_Bottom.stl");
#translate([4.5-18,-37.5+2.5,0])cylinder(r=5.5/2,h=10,$fn=300);
#translate([4.5,-37.5,0])cylinder(r=5.5/2,h=10,$fn=300);
}
#translate([4.5-18,-37.5+2.5,-1])cylinder(r=4.8/2,h=15,$fn=300);
#translate([4.5,-37.5,-1])cylinder(r=4.8/2,h=15,$fn=300);
} 

}
module mod_corner_bracket_long_2020_top(){
difference(){
import("corner_bracket_long_2020_top.stl");
#translate([4.5-18+31.5,-37.5+2.5+3,-25])cylinder(r=5.7/2,h=130,$fn=300);
#translate([4.5-18+31.5-50,-37.5+2.5+3,-25-15])rotate([0,90,0])cylinder(r=5.7/2,h=130,$fn=300);
//#translate([4.5-18,-37.5+2.5,-90+85-5-15])cylinder(r=8.5/2,h=5+15,$fn=6);
}
}

module mod_corner_bracket_long_2020_bottom(){
difference(){
import("corner_bracket_long_2020.stl");
//translate([4.5,-37.5,-20])cylinder(r=5.5/2,h=100,$fn=300);
//translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
translate([4.5-18,-37.5+2.5,-60+100+5-5])cylinder(r=9.5/2,h=5,$fn=300);
}
}



/*
difference(){
union(){


//import("Motor_Mount_A_Middle.stl");

difference(){
import("Motor_Mount_v2Motor_Mount_A_Top.stl");
translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
}

difference(){
import("Motor_Mount_v2Motor_Mount_A_Bottom.stl");
translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
}

difference(){
import("corner_bracket_long_2020_top.stl");
translate([4.5-18,-37.5+2.5,-90+85])cylinder(r=8/2,h=5,$fn=6);
}

difference(){
import("corner_bracket_long_2020.stl");
//translate([4.5,-37.5,-20])cylinder(r=5.5/2,h=100,$fn=300);
//translate([4.5-18,-37.5+2.5,-60])cylinder(r=5.5/2,h=130,$fn=300);
translate([4.5-18,-37.5+2.5,-60+100+5-5])cylinder(r=9.5/2,h=5,$fn=300);
}


}
}
*/

