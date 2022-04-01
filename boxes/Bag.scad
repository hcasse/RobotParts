include <../config.scad>

module Bag(length = 4, width = 4, height = 3) {
    $fa = 1;
    $fs = 0.4;
    l = length*hole + (length-1)*space + 2*pad;
    w = width*hole + (width-1)*space + 2*pad;
    h = height*hole + (height-1)*space + 2*pad;
    r = hole/2*hfix;

    difference(){

        // total cube
        cube([l, w, h]);
        
        // hollow cube
        translate([pad, pad, pad]){
            cube([l - 2*pad, w - 2*pad, h]);
        };

        // holes along width
        for(j=[1:height]) {
            for(i=[1:length]) {
                translate([
                    i*hole + (i-1)*space,
                    w/2,
                    j*hole + (j-1)*space
                ]) {
                    rotate([90 ,0, 0]) {
                        translate([0, 0, -w/2 - 2*pad]) {
                            cylinder(
                                h=w + 4*pad,
                                r=r
                            );
                        };
                    };
                };
            };
        };

        // holes along length
        for(j=[1:height]) {
            for(i=[1:width]) {
                translate([
                    w/2 - 2*thickness,
                    i*hole + (i-1)*space,
                    j*hole + (j-1)*space
                ]) {
                    rotate([0, 90, 0]) {
                        translate([0, 0, -l/2 + pad]) {
                            cylinder(
                                h=l + 2*thickness,
                                r=r
                            );
                        };
                    };
                };
            };
        };

        // holes along height
        for(j=[1:width]) {
            for(i=[1:length]) {
                translate([
                    i*hole + (i-1)*space,
                    j*hole + (j-1)*space,
                    w/2
                ]) {
                    rotate([0, 0, 90]) {
                        translate([0, 0, -h/2 - 3*pad]) {
                            cylinder(
                                h=h + 3*pad,
                                r=r
                            );
                        };
                    };
                };
            };
        };

    };
}

Bag();



