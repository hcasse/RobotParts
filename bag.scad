// configuration
length = 10;
width = 10;
height = 1;

hole = 4;
space = 4;
pad = space / 2;


// internal data
l = length*hole + (length-1)*space + 2*pad;
w = width*hole + (width-1)*space + 2*pad;
h = height*hole + (height-1)*space + 2*pad;

difference(){

    // total cube
    cube([l, w, h]);
    
    // hollow cube
    translate([pad, pad, pad]){
        cube([l - 2*pad, w - 2*pad, h]);
    };

    // holes along length
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
                            r=hole/2 + 0.2
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
                w/2,
                i*hole + (i-1)*space,
                j*hole + (j-1)*space
            ]) {
                rotate([0, 90, 0]) {
                    translate([0, 0, -l/2 + pad]) {
                        cylinder(
                            h=l + 2*pad,
                            r=hole/2 + 0.2
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
                            r=hole/2 + 0.2
                        );
                    };
                };
            };
        };
    };

};


