// configuration
width = 2;      // in holes
height = 2;    // in holes
thickness = 2;  // in mm
hole = 4;       // diameter in mm
pad = 2;        // in mm

// internal data
h = (hole + pad) * (width + 1);
v = (hole + pad) * (height + 1);
w = 2 * pad + hole;

difference() {
    cube([h, w, thickness]);
    for(i=[1,width]) {
        translate([(hole + pad) * i + hole / 2, pad + hole/2, -thickness]) {
            cylinder(h = thickness * 3, r = hole / 2);
        };
    };
};
difference() {
    cube([thickness, w, v]);
    for(i=[1,height]) {
        translate([-thickness, pad + hole/2, (hole + pad) * i + hole / 2]) {
            rotate([]) {
                cylinder(h = thickness * 3, r = hole / 2);
            };
        };
    };
}

