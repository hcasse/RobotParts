include <../config.scad>

module FixingAngle(width = 2, height = 3) {
    $fa = 1;
    $fs = 0.4;

    // internal data
    h = (hole + pad) * (width + 1);
    v = (hole + pad) * (height + 1);
    w = 2 * pad + hole;
    r = hole/2*hfix;

    difference() {
        cube([h, w, thickness]);
        for(i=[1,width]) {
            translate([(hole + pad) * i + hole / 2, pad + hole/2, -thickness]) {
                cylinder(h = thickness * 3, r=r);
            };
        };
    };
    difference() {
        cube([thickness, w, v]);
        for(i=[1:height]) {
            translate([-thickness, pad + hole/2, (hole + pad) * i + hole / 2]) {
                rotate([0, 90, 0]) {
                    cylinder(h = thickness * 3, r=r);
                };
            };
        };
    }
}

FixingAngle();

