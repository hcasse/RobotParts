include <../config.scad>

module perforated_board(width, depth) {
    $fa = 1;
    $fs = 0.4;
    w = width*hole + space*(width-1) + 2*pad;
    d = depth*hole + space*(depth-1) + 2*pad;
    h = thickness;
    difference() {
        cube([w, d, h]);
        for(i=[1:width])
            for(j=[1:depth])
                translate([
                    pad + hole/2 + i*hole + (i-1)*space - hole,
                    pad + hole/2 + j*hole + (j-1)*space - hole,
                    -thickness
                ])
                    cylinder(h=3*thickness, d=hole*hfix);
        }
}
