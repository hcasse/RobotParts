include <../config.scad>

module HoleyBar(size = 3) {
    $fa = 1;
    $fs = 0.4;

    // script
    l = pad*2 + hole*size + space*(size - 1);
    w = pad*2 + hole;
    h = pad*2 + hole;
    r = hole/2*hfix;

    difference() {
    cube([l, w, h]);

    for(i=[0:size-1])
        translate([pad +i*(hole + space) + hole/2, pad + hole/2, -pad])
                cylinder(h=h + 2*pad, r=r);

    for(i=[0:size-1])
        translate([pad + (hole + space)*i + hole/2, w+pad, pad + hole/2])
            rotate([90,0,0])
                cylinder(h=h + 2*pad, r=r);
    }
}

HoleyBar();
