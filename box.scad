csize = 30;
thickness = 2;

difference() {
    cube(size=csize);
    translate([thickness, thickness, thickness]){
        cube([
            csize - 2 * thickness,
            csize - 2 * thickness,
            csize
        ]);
    };
};


