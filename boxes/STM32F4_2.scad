include <../config.scad>

module STM32F4() {
    $fa = 1;
    $fs = 0.4;
    length = 13;
    width = 9;

    board_length=96;
    board_width=66;

    // length
    //      |-------[jumper]---------[pins]-------|
    //  real            6      26     64   
    //  config          10      20     66
    span_front = 2;
    jump_size = 10;
    inter_size = 20;
    span_size = 66;
    span_back = 1;
    
    //width
    //      |------[pins 1]-----------[pins 2]-----|
    // real     2                               2
    // config   2   15                  15      2
    span_side = 2;
    span_width = 10;
    offset = 4;

    l = length*hole + (length-1)*space + 2*pad;
    w = width*hole + (width-1)*space + 2*pad;
    h = pad + hole + pad + pad + thickness + offset;
    offx = pad + span_front;
    offy = (w - board_width) / 2 + span_side;
    echo("l=", l);
    echo("w=", w);

    gap_length = jump_size + inter_size + span_size;
    echo("gap_length=", gap_length);
    gap_offset = (l - gap_length) / 2;
    jump_offset = gap_offset + span_size + inter_size;

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
        translate([gap_offset, offy, -pad]) {
            cube([span_size, span_width, 3*pad]);
        };
        translate([gap_offset, w - offy - span_width, -pad]) {
            cube([span_size, span_width, 3*pad]);
        };
        
        // jumpers
        translate([
            jump_offset,
            offy,
            -pad
        ]) {
            cube([jump_size, span_width, 3*pad]);
        };
        translate([jump_offset, w - offy - span_width, -pad]) {
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



