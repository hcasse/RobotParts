include <../config.scad>

module DoubleThinAngle(length = 6, width = 2) {
    $fa = 1;
    $fs = 0.4;

    // internal
    l = length*hole + (length-1)*space + 2*pad;
    w = width*hole + (width-1)*space + 2*pad;
    sl = (length-2)*hole + (length-3)*space + 2*pad;
    sw = (width-1)*hole + (width-2)*space + 2*pad;

    // design
    difference(){
        cube([
            l,
            w,
            thickness
        ]);

        for(i = [0:length-1]){
            for(j=[0: width-1]){
                translate([
                    i * (space + hole) + pad + hole/2,
                    j * (space + hole) + pad + hole/2,
                    -thickness])
                {
                    cylinder(
                        h = thickness * 3,
                        r= hole/2*hfix);
                    }
                }
            }

        translate([
            pad + hole + space/2,
            -pad,
            -pad
        ]) {
            cube([sl, sw+pad, 3*thickness]);
        }
    }
}

DoubleThinAngle();


