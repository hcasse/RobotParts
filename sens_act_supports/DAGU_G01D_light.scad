include <../config.scad>


module DAGU_G01D_light(width=3, left=false) {
    $fa = 1;
    $fs = 0.4;

    w = pad * 2 + hole * width + space * (width - 1);
    d = 28;
    h = thickness*2 + pad*2 + hole; 
    before_hole = 8;
    after_hole = 6;
    motor_hole = 1.6;

    difference() {
        cube([
            w,
            d,
            h
        ]);


        translate([
            -thickness,
            thickness,
            left ? -thickness : thickness
        ]){
            cube([
                w + 2*thickness,
                d,
                h
            ]);
        };

        translate([
            before_hole + after_hole,
            thickness,
            left ? thickness : -thickness
        ]) {
            cube([
                w,
                d,
                h
            ]);
        };
            
        translate([
            before_hole,
            7,
            -thickness
        ]){
            cylinder(
                h=h + 2*thickness,
                r=motor_hole
            );
        };
        
        translate([
            before_hole,
            24.5,
            -thickness
        ]){
            cylinder(
                h=h + 2*thickness,
                r=motor_hole
            );
        };  
        
        translate([
            0,
            thickness,
            0
        ]){
            rotate([
                90,
                0,
                0
            ]){
                for(i=[0:width-1]){
                    translate([
                        pad + i*(hole + space) + hole/2,
                        left ? pad + hole/2 : thickness*2 + pad + hole/2,  //+8*j,
                        -thickness
                    ]){
                        cylinder(
                            h=3*thickness,
                            r=hole/2
                        );
                    }
                }
            }
        }
    }
}

DAGU_G01D_light();


