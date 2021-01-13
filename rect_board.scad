// configuration
width = 8;      // in holes
height = 10;    // in holes
thickness = 2;  // in mm
hole = 4;       // diameter in mm
pad = 2;        // in mm

// pre-computation
w = width * hole + pad * 2;
h = height * hole + pad * 2;

difference() {
    cube([w, h, thickness]);
    for(i=[0:width-1]) {
        for(j=[0:height-1]) {
        }
    }
};
