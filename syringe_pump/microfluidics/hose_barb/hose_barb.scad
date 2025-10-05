

difference(){
cylinder(r=5/2,h=10,$fn=300);
translate([0,0,-1])cylinder(r=3/2,h=20,$fn=300);
}
// Super-Duper Parametric Hose Barb
$fn = 90;

// Hose Outer Diameter (used to calculate shlouder length)
hose_od = 6;
// Hose Inner Diameter
hose_id = 5;

// How far the barbs swell the diameter.
swell = 1.5;

// Wall thickness of the barb.
wall_thickness = 1.2;

// Number of barbs.
barbs = 5;
// How far between each barb section?
barb_length = 2;

// Do you want to render the outer shell?
shell = true;

// Do you want to render the bore?
bore = true;

// Flattens the barbs on one end. Usefull if youre printing barbs at angles, as the flattened side can be rotated downward facing the bed.
ezprint = false;

rotate([0,30,0])barb(hose_od = hose_od, hose_id = hose_id, swell = swell, wall_thickness = wall_thickness, barbs = barbs, barb_length = barb_length, shell = shell, bore = bore, ezprint = ezprint);
rotate([0,-30,0])barb(hose_od = hose_od, hose_id = hose_id, swell = swell, wall_thickness = wall_thickness, barbs = barbs, barb_length = barb_length, shell = shell, bore = bore, ezprint = ezprint);



module barb(hose_od = 21.5, hose_id = 15, swell = 1, wall_thickness = 1.31, barbs = 3, barb_length = 2, shell = true, bore = true, ezprint = true) {
    id = hose_id - (2 * wall_thickness);
    translate([0, 0, -((barb_length * (barbs + 1)) + 4.5 + (hose_od - hose_id))])
    difference() {
        union() {
            if (shell == true) {
                cylinder(d = hose_id, h = barb_length);
                for (z = [1 : 1 : barbs]) {
                    translate([0, 0, z * barb_length]) cylinder(d1 = hose_id, d2 = hose_id + swell, h = barb_length);
                }
                translate([0, 0, barb_length * (barbs + 1)]) cylinder(d = hose_id, h = 4.5 + (hose_od - hose_id));
            }
        }
        if (bore == true) {
            translate([0, 0, -1]) cylinder(d = id, h = (barb_length * (barbs + 1)) + 4.5 + (hose_od - hose_id) + 1);
        }
        if (ezprint == true) {
            difference() {
                cylinder(d = hose_id + (swell * 3), h = (barb_length * (barbs + 1)));
                translate([swell, 0, 0]) cylinder(d = hose_id + (swell * 2), h = (barb_length * (barbs + 1)));
            }
        }
    }
}
