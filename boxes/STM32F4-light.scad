include <../config.scad>

module board(holes) {
    w = holes*hole + space*(holes-1) + 2*pad;
    h = hole + 2*pad;
    d = thickness;
    difference() {
        cube([w, d, h]);
        translate([pad + hole/2, thickness/2, pad+hole/2])
            rotate([90, 0, 0])
                cylinder(d=hole*hfix, h=3*thickness, center=true);
        translate([w - pad - hole/2, thickness/2, pad+hole/2])
            rotate([90, 0, 0])
                cylinder(d=hole*hfix, h=3*thickness, center=true);
    }
}

module STM32F4_light(vertical = true) {
    $fa = 1;
    $fs = 0.4;

    // board configuration
    board_width = 67;          // in fact 66
    board_thickness = 3;    // in fact 2
    fixing_height = 33;
    fixing_width = 5;

    // derived definitions
    fixing_total_width = board_width + 2*thickness;
    holes_num = ceil((fixing_total_width)/(hole + space));
    echo("holes_num=", holes_num);
    width = holes_num * hole + (holes_num - 1) * space;
    height = 2*thickness + fixing_height;
    depth = 2*thickness + board_thickness;
    side = (width - fixing_total_width)/2;

    // fixboard
    foot_holes = holes_num + 2;
    foot_width = foot_holes*hole + (foot_holes-1)*space + 2*pad;
    foot_height = hole + 2*pad;
    foot_depth = thickness;

    // draw it
    difference() {
        union() {
            cube([fixing_total_width, depth, height], true);
            if(vertical) {
                translate([-foot_width/2, thickness, -height/2])
                    board(foot_holes);
            }
            else {
                translate([-foot_width/2, depth/2, -height/2])
                    rotate([90, 0, 0])
                        board(foot_holes);
            }
        }
        translate([0, 0, 2*thickness])
            cube([board_width, board_thickness, height+thickness], true);
        translate([0, 0, 2*thickness])
            cube([
                fixing_total_width - 2*fixing_width,
                depth + 2*thickness,
                height
            ], true);
    }
    
    
}


STM32F4_light();