include <../config.scad>

module HoleyShelf(width = 6, depth = 4) {
    $fa = 1;
    $fs = 0.4;
    r = hole/2*hfix;

    l = width*hole + (width-1)*space + 2*pad;
    w = depth*hole + (depth-1)*space + 2*pad;
    h = hole + 3*thickness;

    difference() {
        
        // total piece
        cube([l, w, h]);
        
        // hollow internal
        translate([-pad, pad, pad]) {
            cube([l + 2*pad, w - 2*pad, h]);
        };
        
        // horizontal holes
        for(i=[1:width]) {
            translate([
                i*hole + (i - 1)*space - hole/2 + pad,
                w/2,
                2*pad + hole/2
            ]) {
                rotate([90, 0, 0]) {
                    translate([0, 0, -w/2 -pad]) {
                        cylinder(h=w + 2*pad, r=hole/2 + 0.2);
                    };
                };
            };
        };

        for (i=[1:width]) {
            for (j=[1:depth]) {
                translate([
                    i*hole + (i-1)*space - hole/2 + pad,
                    j*hole + (j-1)*space - hole/2 + pad,
                    -pad
                ]) {
                    cylinder(h=3*pad, r=hole/2 + 0.2);
                }
            }
        }
    };
}

HoleyShelf();





