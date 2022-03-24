// family configuration
space=4;
hole=4;
pad=space / 2;
fixdist=69.85;
fixhole=3.2;

// multiplier for hole size
// 1.2 PLA
hfix = 1.2;

// internal
width=ceil(ceil(fixdist - 2*pad + space) / (hole+space)/2)*2;
assert(width % 2 == 0);
fixhole_center = (width*(hole+space)+pad - fixdist - fixhole)/2;
fixhole_offset = fixhole_center + fixhole + 2*pad;
hollow_width = width*(hole+space) + pad - 2 * fixhole_offset;

difference(){
    
    // full piece
    cube([width*hole + (width-1)*space + 2*pad, 3*pad+fixhole, hole+3*pad]);

    // main cavity
    translate([-1, pad, pad]){
        cube([(hole+space)*width+pad+pad, 28,28]);};

    // low cavity
    translate([fixhole_offset, pad, -pad]){
        cube([hollow_width, 2*(hole+space)+pad, 3*pad]);
    };

    // low plate right hole
    translate([fixhole_center + fixhole / 2, 2*pad + fixhole/2, -pad]){
        cylinder(h=3*pad*hfix, r=fixhole/2 + 0.2);
    };

    // low plate left hole
    translate([fixhole_center + fixhole / 2 + fixdist, 2*pad + fixhole/2, -pad]){
        cylinder(h=3*pad*hfix, r=fixhole/2);
    };
    
    // vertical plate holes
    translate([0, 0, 2*pad+hole/2]) {   
        rotate([90, 0, 0]) {
                union() {
                    for(i=[0:width-1]) {
                        translate([pad + (hole + space)*i + hole/2, 0, -2*pad]) {
                            cylinder(h=pad*4*hfix, r=hole/2*1.2);
                        }
                    }
                }
        }
    }
}

