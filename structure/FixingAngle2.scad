include <../config.scad>

module FixingAngle2(width = 1, height = 5) {
    $fa = 1;
    $fs = 0.4;

    // internal data
    h = width*hole + (width - 1)*space + 3*pad;
    v = height*hole + (height - 1)*space + 3*pad;
    w = hole + 2*pad;
    r = hole/2*hfix;

    // horizontal pane
    difference() {
        cube([h, w, pad]);

        for(i=[1:width]) {
            translate([
                i*hole + (i-1)*space - hole/2 + 2*pad,
                pad + hole/2,
                -pad])
            {
                cylinder(h = pad * 3, r = r);
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
                    cylinder(h = pad * 3, r = r);
                };
            };
        };
    }
}

FixingAngle2();
