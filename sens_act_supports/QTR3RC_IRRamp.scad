include <../config.scad>

module QTR3RC_IRRamp() {
    $fa = 1;
    $fs = 0.4;

    // pre-computation
    ramp_gap = 16;
    ramp_width = 8;
    ramp_fix = 8;
    ramp_length = 2*ramp_fix + ramp_gap;
    ramp_hole = 1.5 * hfix;
    ramp_loffset = 2.67;
    ramp_woffset = 4;
    
    //width = 4;
    width = ceil((ramp_length - 2*pad + space)/(hole + space));
    
    l = 2*pad + hole*width + space*(width-1);
    loffset = (l - ramp_length)/2;
    w = thickness + ramp_width;
    h = 2*pad + hole + thickness + 1;

    difference(){

        cube([l, w, h]);

        translate([-thickness, thickness, thickness]) {
            cube([l+2*thickness, w, h]);};


        translate([ramp_fix, thickness, -thickness]) {
            cube([ramp_gap, w, thickness*3]);
        };

        translate([ramp_loffset+loffset, ramp_woffset+thickness, -thickness]){
            cylinder(h=thickness*3, r=ramp_hole);
        };

        translate([l-ramp_loffset-loffset, ramp_woffset+thickness, -thickness]){
            cylinder(h=thickness*3, r=ramp_hole);
        };

        translate([0, thickness*2, 0]){   
            rotate([90, 0, 0]){
                for(i=[0:width-1]){
                    translate([
                        pad + (hole + space)*i + hole/2,
                        thickness+pad+1+hole/2,
                        0
                    ]){
                        cylinder(h=thickness*3, r=2);
                    }
                }
            }
        }
    }

}

QTR3RC_IRRamp();

