include <../config.scad>

module Frame(length = 12, width = 8) {
    $fa = 1;
    $fs = 0.4;

    // script
    l = pad*2 + hole*length + space*(length - 1);
    w = pad*2 + hole*width + space*(width - 1);
    h = pad*2 + hole;
    
    difference() {
        cube([l, w, h]);

        translate([
            2*pad + hole,
            2*pad + hole,
            -pad
        ])
            cube([
                l - 4*pad - 2*hole,
                w - 4*pad - 2*hole,
                h + 2*pad
            ]);

        for(i=[0:length-1])
            translate([
                pad + hole/2 + i*(space + hole),
                w/2,
                pad + hole/2
            ])
                rotate([90, 0, 0])
                    translate([0, 0, -w/2-pad])
                        cylinder(h=w + 2*pad, r=hole/2);

        for(i=[0:width-1])
            translate([
                l/2,
                pad + hole/2 + i*(space + hole),
                pad + hole/2
            ])
                rotate([0, 90, 0])
                    translate([0, 0, -l/2-pad])
                        cylinder(h=l + 2*pad, r=hole/2);

        for(i=[0:length-1])
            for(j=[0:width-1])
                    translate([
                        pad + hole/2 + i*(hole + space),
                        pad + hole/2 + j*(hole + space),
                        -pad
                    ])
                        cylinder(h=h + 2*pad, r=hole/2);


    }
 }

Frame();
