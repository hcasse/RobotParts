include <../config.scad>

module STM32F4() {

    length = 13;
    width = 10;

    board_length=96;
    board_width=66;
    span_front = 2;
    span_side = 4;
    span_width = 7;
    jump_size = 8;
    span_size = 65;
    span_back = 1;
    offset = 4;

    l = length*hole + (length-1)*space + 2*pad;
    w = width*hole + (width-1)*space + 2*pad;
    h = pad + hole + pad + pad + thickness + offset;
    offx = pad + span_front;
    offy = (w - board_width) / 2 + span_side;

    difference() {
        
        // total piece
        cube([l, w, h]);
        
        // hollow internal
        translate([pad, pad, pad]) {
            cube([l - 2*pad, w - 2*pad, h]);
        };
        
        // horizontal holes
        for(i=[0:length-1]) {
            translate([
                i*(hole+space) + pad + hole/2,
                w/2,
                3*pad + hole/2 + offset
            ]) {
                rotate([90, 0, 0]) {
                    translate([0, 0, -w/2 -pad]) {
                        cylinder(h=w + 2*pad, r=hole/2 + 0.2);
                    };
                };
            };
        };

        // spans
        translate([offx, offy, -pad]) {
            cube([span_size, span_width, 3*pad]);
        };
        translate([offx, w - offy - span_width, -pad]) {
            cube([span_size, span_width, 3*pad]);
        };
        
        // jumpers
        translate([pad + board_length - span_back - jump_size, offy, -pad]) {
            cube([jump_size, span_width, 3*pad]);
        };
        translate([pad + board_length - span_front - jump_size, w - offy - span_width, -pad]) {
            cube([jump_size, span_width, 3*pad]);
        };
        
        // open back
        translate([-pad, pad, pad]) {
            cube([3 * pad, w - 2*pad, h]);
        }

        // open front
        translate([l - 2*pad, pad, pad]) {
            cube([3 * pad, w - 2*pad, h]);
        }
    };
}

STM32F4();



