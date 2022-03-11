// configuration
space = 4;
hole = 4;
pad = space/2;
length = 6;
width = 4;

l = length*hole + (length-1)*space + 2*pad;
w = width*hole + (width-1)*space + 2*pad;
h = hole + 3*pad;

difference() {
    
    // total piece
    cube([l, w, h]);
    
    // hollow internal
    translate([-pad, pad, pad]) {
        cube([l + 2*pad, w - 2*pad, h]);
    };
    
    // horizontal holes
    for(i=[1:length]) {
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
};



