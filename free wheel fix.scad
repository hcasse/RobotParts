// configuration
space = 4;
hole = 4;
pad = space/2;
length = 1;
width = 8;
thickness = 2;

support_length = 38;
support_width = 32;
hole_length = 30;
hole_width = 24;
support_hole = 3.5;
support_desc = 1;

l = length*hole + (length-1)*space + 2*pad;
w = width*hole + (width-1)*space + 2*pad;
h = hole + 3*pad + support_desc;

difference() {
    
    union() {

        // total piece
        cube([l, w, h]);

        // freewheel support
        translate([
            -support_width/2 + l/2,
            (w - support_length)/2,
            0
        ]) {
            difference() {
                cube([support_width, support_length, thickness]);

                translate([
                    (support_width - hole_width - support_hole)/2 + support_hole/2,
                    (support_length - hole_length - support_hole)/2 + support_hole/2,
                    -thickness
                ]) {
                    cylinder(h = 3*thickness, r = support_hole/2 + 0.2);
                }

                translate([
                    (support_width - hole_width - support_hole)/2 + support_hole/2 + hole_width,
                    (support_length - hole_length - support_hole)/2 + support_hole/2,
                    -thickness
                ]) {
                    cylinder(h = 3*thickness, r = support_hole/2 + 0.2);
                }

                translate([
                    (support_width - hole_width - support_hole)/2 + support_hole/2,
                    (support_length - hole_length - support_hole)/2 + support_hole/2 + hole_length,
                    -thickness
                ]) {
                    cylinder(h = 3*thickness, r = support_hole/2 + 0.2);
                }

                translate([
                    (support_width - hole_width - support_hole)/2 + support_hole/2 + hole_width,
                    (support_length - hole_length - support_hole)/2 + support_hole/2 + hole_length,
                    -thickness
                ]) {
                    cylinder(h = 3*thickness, r = support_hole/2 + 0.2);
                }
            }
        }
    }
    
    // hollow internal
    translate([-pad, pad, pad]) {
        cube([l + 2*pad, w - 2*pad, h]);
    };
    
    // horizontal holes
    for(i=[1:length]) {
        translate([
            i*hole + (i - 1)*space - hole/2 + pad,
            w/2,
            2*pad + hole/2 + support_desc
        ]) {
            rotate([90, 0, 0]) {
                translate([0, 0, -w/2 -pad]) {
                    cylinder(h=w + 2*pad, r=hole/2 + 0.2);
                };
            };
        };
    };

    // vertical holes
    for (i=[1:length]) {
        for (j=[1:width]) {
            translate([
                i*hole + (i-1)*space - hole/2 + pad,
                j*hole + (j-1)*space - hole/2 + pad,
                -pad
            ]) {
                cylinder(h=3*pad, r=hole/2 + 0.2);
            }
        }
    }
    
    // support holes
};




