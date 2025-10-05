translate([278,255,0])rotate([0,0,90])screwpart();
longpart();

//translate([0,48+473,0])mirror([0,1,0])screwpart();
//shorterpart();

module screwpart(){
difference(){
import("wago_221-415_corner_mount.stl");
translate([-50,242+1.8,-250])cube([130,100,30]);
}
}

module shorterpart(){
difference(){
import("wago_221-415_corner_mount.stl");
translate([-50,242+1.8+35,-250])cube([185,100,30]);
}
}

module longpart(){
difference(){
import("wago_221-415_corner_mount.stl");
translate([-50+85,242+1.8+35-50,-250])cube([185,100,30]);
#translate([-50+85-100,242+1.8+35-50-35,-250])cube([185,100,30]);
}
}



