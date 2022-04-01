// configuration
width = 2;       // in holes
height = 3;      // in holes
thickness = 2;   // in mm
space = 4;       // inter-hole space in mm
hole = 4;        // hole diameter in mm
pad = space/2;   // in mm

// internal data
w = 2*pad + hole;
xl = width*hole + (width-1)*space + 2*pad;
yl = height*hole + (height-1)*space + 2*pad;

difference() {
    cube([xl, w, thickness]);
    for(i=[1:width]) {
        translate([
            i*hole + (i - 1)*space - hole/2 + pad,
            pad + hole/2,
            -thickness
        ]) {
            cylinder(r = hole/2 + 0.2, h = 3*thickness);
        };
    };
};
difference() {
    cube([w, yl, thickness]);
    for(i=[1:height]) {
        translate([
            pad + hole/2,
            i*hole + (i - 1)*space - hole/2 + pad,
            -thickness
        ]) {
            cylinder(r = hole/2 + 0.2, h = 3*thickness);
        };
    };
};

