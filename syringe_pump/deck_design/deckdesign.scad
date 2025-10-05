include<tslot.inc.scad>

//deck_cross_bar();
//deck_bar();
pipettetip_box();

//pipette_box_clamp();

//deck_assy();


module pipette_box_clamp(){

difference(){
cube([25,10,10]);
translate([8+5,5+15,5])rotate([90,0,0])#cylinder(r=2.8/2,h=30,$fn=300);
translate([8,5,-5])#cylinder(r=4/2,h=30,$fn=300);
translate([18,5,-5])#cylinder(r=4/2,h=30,$fn=300);
translate([8,5,5])#cylinder(r=8/2,h=30,$fn=300);
translate([18,5,5])#cylinder(r=8/2,h=30,$fn=300);
}
}

module deck_assy(){

translate([54,49,19.])pipette_box_clamp();


translate([0,0,5])rotate([0,90,0])tslot20(500);
translate([0,220,5])rotate([0,90,0])tslot20(500);
translate([0,440,5])rotate([0,90,0])tslot20(500);


deck_clamp();
translate([0,220,0])deck_clamp();
translate([0,440,0])deck_clamp();

translate([450-145.-237+305-293+306,470,0])rotate([0,0,180]){
deck_clamp();
translate([0,220,0])deck_clamp();
translate([0,440,0])deck_clamp();
}

translate([402-145-237+366,0,25])rotate([0,180,0])color("pink")deck_bar();
//translate([402-145-237+318,0,0])rotate([0,0,0])color("pink")deck_bar();
color("pink")deck_bar();

for(j=[0:4]){
translate([-10,40+13+(j*90),4])deck_cross_bar();
}
}

module deck_cross_bar(){


difference(){
translate([20,-4,11])cube([370,10,4]);
translate([32,1,0])#cylinder(r=4.5/2,h=50,$fn=300);
translate([42,1,0])#cylinder(r=4.5/2,h=50,$fn=300);

#translate([257+81-6,0,0]){
translate([32,1,0])cylinder(r=4.5/2,h=50,$fn=300);
translate([42,1,0])cylinder(r=4.5/2,h=50,$fn=300);
}

for(i=[0:5]){
translate([40+(i*50),0,0]){
translate([32,1,-2])#cylinder(r=2.8/2,h=50,$fn=300);
translate([42,1,-2])#cylinder(r=2.8/2,h=50,$fn=300);
}
}


}
}



module deck_bar(){
difference(){
translate([20-3,-4,11])cube([23,480,4]);
for(j=[0:4]){
#translate([8+16-2,30+11.1+(j*90)+13,-10])cylinder(r=2.9/2,h=140,$fn=300);
#translate([8+16-2+10,30+11.1+(j*90)+13,-10])cylinder(r=2.9/2,h=140,$fn=300);
}
translate([0,0,0]){
//translate([8+16,15,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,0,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,30,-10])cylinder(r=2.9/2,h=40,$fn=300);
}
for(i=[-1:1]){
translate([0,220+i,0]){
//translate([8+16,15,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,0,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,30,-10])cylinder(r=2.9/2,h=40,$fn=300);
}
translate([0,440+i,0]){
//translate([8+16,15,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,0,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,30,-10])cylinder(r=2.9/2,h=40,$fn=300);
}
}
}
}









module pipettetip_box(){

difference(){
translate([-8,-8,0])#cube([120+16,85+16,24]);
translate([0,0,-1])cube([120,85,30]);
}

}


module deck_clamp(){
difference(){
union(){
translate([0,6,0])cube([40,18,4]);
translate([20,6-10,0])cube([20,18+20,11]);
}
translate([8,15,-10])cylinder(r=5.7/2,h=40,$fn=300);
translate([8+25,15,-10])cylinder(r=5.7/2,h=40,$fn=300);
translate([8+25,15,0+4])cylinder(r=11.7/2,h=40,$fn=300);
translate([0,0,0]){
translate([8+16,15,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,0,-10])cylinder(r=2.9/2,h=40,$fn=300);
translate([8+16,30,-10])cylinder(r=2.9/2,h=40,$fn=300);
}
}
}
