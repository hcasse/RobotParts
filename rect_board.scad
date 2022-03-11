// configuration
width = 5;          // in holes
height = 8;         // in holes
thickness = 2;      // in mm
hole = 4;           // diameter in mm
space = 4;          // inter-hole space in mm
pad = space / 2;    // in mm

// pre-computation
w = width*hole + (width-1)*space + 2*pad;
h = height*hole + (height-1)*space + 2*pad;

difference() {
    cube([w, h, thickness]);
    for(i=[1:width]) {
        for(j=[1:height]) {
            translate([
                i*hole + (i - 1)*space - hole/2 + pad,
                j*hole + (j - 1)*space - hole/2 + pad,
                -thickness
            ]) {
                cylinder(h=3 * thickness, r=hole/2 + 0.2);
            }
        }
    }
};
