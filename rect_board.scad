// configuration
width = 5;      // in holes
height = 8;    // in holes
thickness = 2;  // in mm
hole = 4;       // diameter in mm
pad = 2;        // in mm

// pre-computation
w = width * (hole + pad) + pad;
h = height * (hole + pad) + pad;

difference() {
    cube([w, h, thickness]);
    for(i=[0:width-1]) {
        for(j=[0:height-1]) {
            translate([
                pad + hole/2 + (pad + hole) * i,
                pad + + hole/2 + (pad + hole) * j,
                -thickness
            ]) {
                cylinder(h=3 * thickness, r=hole/2);
            }
        }
    }
};
