// configuration
width = 2;       // in holes
height = 2;      // in holes
thickness = 2;   // in mm
hole = 4;        // hole diameter in mm
pad = 2;         // in mm

// internal data
w = 2 * pad + hole;
xl = pad + (pad + hole) * width;
yl = pad + (pad + hole) * height;

difference() {
    cube([xl, w, thickness]);
    for(i=[0:width-1]) {
        translate([
            pad + hole / 2 + (pad + hole) * i ,
            pad + hole / 2,
            -thickness
        ]) {
            cylinder(r = hole / 2, h = 3 * thickness);
        };
    };
};
difference() {
    cube([w, yl, thickness]);
    for(i=[0:height-1]) {
        translate([
            pad + hole / 2,
            pad + hole / 2 + (pad + hole) * i ,
            -thickness
        ]) {
            cylinder(r = hole / 2, h = 3 * thickness);
        };
    };
};

