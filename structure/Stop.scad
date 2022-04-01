include <../config.scad>

module Stop(width = 1, height=3, depth=1) {
    $fa = 1;
    $fs = 0.4;
    r = hole*hfix/2;
    h = 2*pad + height*hole + (height-1)*space + 2*thickness;
    d = 2*pad + hole*depth + thickness;
    w = 2*pad + width*hole + (width -1)*space;

    difference(){
        cube([w, d, h]);
        translate([-thickness, thickness, thickness])
            cube([w + 2*thickness, d, h]);


        translate([0, thickness, 0])
            rotate([90, 0, 0])
                for(i=[0:width-1])
                    for(j=[0:height-1])
                        translate([
                            pad + (hole + space)*i + hole/2,
                            pad + 2*thickness + (hole + space)*j + hole/2,
                            -thickness
                        ])
                            cylinder(h=thickness*3, r=r);
    }

}

Stop();


