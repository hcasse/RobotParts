include <../config.scad>

module FreeWheel(support_thickness=2*pad, shift=4, axis=8) {
    $fa = 1;
    $fs = 0.4;
    
    //   side_width
    //  | n |       
    //  || ||       shift_height
    //  | u |
    //  ^^^^^      add_space
    //  \  o  \     axis_width
    //   ^^^^^^     support thickness
    
    side_width = 2*pad;
    shift_height = shift;
    axis_width = axis;
    add_space = 4;
    axis_size = axis * hfix;

    shifth = hole * shift_height + space * (shift_height - 1);
    height = shifth + 2 * pad + support_thickness;
    width = max(hole + 2*pad, axis_width + 2*pad);
    depth = width + thickness + add_space;
    
    difference() {
        union() {
            cube([width, thickness, height]);
            cube([width, depth, support_thickness]);
        }
        
        translate([
            width/2 - hole/2,
            -thickness,
            support_thickness + pad + hole/2
        ])
            cube([
                hole,
                3*thickness,
                shifth - hole
            ]);
 
        translate([
            pad + axis_width/2,
            pad + axis_width/2 + thickness + add_space,
            -thickness
        ])
            cylinder(r=axis_width/2, h=thickness*2 + support_thickness);
        
        translate([
            width / 2,
            thickness * 2,
            support_thickness + pad + hole/2
        ])
            rotate([90, 0, 0])
                cylinder(d=hole, h=3*thickness);
        translate([
            width / 2,
            thickness * 2,
            height - pad - hole/2
        ])
            rotate([90, 0, 0])
                cylinder(d=hole, h=3*thickness);
    }
}

FreeWheel();


