include <../config.scad>

module Angle(height = 3, depth = 1, width = 3) {
    $fa = 1;
    $fs = 0.4;
    w = 2*pad + width*hole + (width-1)*space;
    d = 2*pad + depth*hole + (depth-1)*space + 2*thickness;
    h = 2*pad + depth*hole + (height-1)*space + 2*thickness;
    
    difference(){

        cube([w, d, h]);

        translate([-thickness, thickness, thickness])
            cube([w + 2*thickness, d, h]);

        for(i=[0:width-1])
            for(j=[0:depth-1])
                translate([
                    pad + hole/2 + (hole + space)*i,
                    2*pad + 2*thickness + (hole + space)*j,
                    -thickness
            ])
                    cylinder(h=thickness*3, r=hole/2);
        
        
        
        translate([0, 2*thickness, 0])
            rotate([90, 0, 0])
                for(i=[0:width-1])
                    for(j=[0:height-1])
                        translate([
                            pad + hole/2 + (hole + space)*i,
                            pad + 2*thickness + hole/2 + (hole + space)*j,
                            0
                        ])
                            cylinder(h=3*thickness, r=hole/2);

    }
 }


Angle();

