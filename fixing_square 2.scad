// configuration
width = 1;      // in holes
height = 5;     // in holes
hole = 4;       // diameter in mm
space = 4;      // inter-hole space in mm
pad = space/2;  // in mm

// internal data
h = width*hole + (width - 1)*space + 3*pad;
v = height*hole + (height - 1)*space + 3*pad;
w = hole + 2*pad;

// horizontal pane
difference() {
    cube([h, w, pad]);

    for(i=[1:width]) {
        translate([
            i*hole + (i-1)*space - hole/2 + 2*pad,
            pad + hole/2,
            -pad])
        {
            cylinder(h = pad * 3, r = hole / 2 + 0.2);
        };
    };

};

// vertical pane
difference() {
    cube([pad, w, v]);
    for(i=[1:height]) {
        translate([
            -pad,
            hole/2 + pad,
            i*hole + (i-1)*space - hole/2 + 2*pad
        ]) {
            rotate([0, 90, 0]) {
                cylinder(h = pad * 3, r = hole / 2 + 0.2);
            };
        };
    };
}

