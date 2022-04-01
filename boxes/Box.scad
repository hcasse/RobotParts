include <../config.scad>

module Box(width = 3, depth = 3, height = 3) {
    $fa = 1;
    $fs = 0.4;
    w = 2*pad + width*hole + (width-1)*space;
    d = 2*pad + depth*hole + (depth-1)*space;
    h = 2*pad + height*hole + (height-1)*space;

    difference() {
        cube([w, d, h]);
        translate([thickness, thickness, thickness]){
            cube([
                w - 2 * thickness,
                d - 2 * thickness,
                h
            ]);
        };
    };
}

Box();
