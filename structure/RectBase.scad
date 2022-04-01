include <../config.scad>

module RectBase(width = 5, height = 8) {
    $fa = 1;
    $fs = 0.4;
    
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
    }
}

RectBase();
