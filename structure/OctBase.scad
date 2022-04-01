include <../config.scad>

module OctBase(size = 13) {
    $fa = 1;
    $fs = 0.4;
    w = 2*pad + size*hole + (size - 1)*space;
    r = hole/2*hfix;
    o = space + hole;
    d = (size % 2) == 0 ? 3 : 2;
    g = ceil(size / 4);

    difference(){
           intersection() {
               cube([w, w, thickness]);
               translate([w/2, w/2, 0]) 
                   rotate(45)
                        translate([-w/2,-w/2,0])
                            cube([w, w, thickness]);
           };

        for(i = [0: size/2])
            for(j = [max(g - i, 0): min(size, size - (g - i))-1]) {
                translate([
                    i * o + pad + hole/2,
                    j * o + pad + hole/2,
                    -thickness
                ])
                    cylinder(r=r, h=3*thickness);
                translate([
                    w - i * o - pad - hole/2,
                    j * o + pad + hole/2,
                    -thickness
                ])
                    cylinder(r=r, h=3*thickness);
            }
    };
}

OctBase();

