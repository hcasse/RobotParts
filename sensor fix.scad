// configuration
space = 4;
hole = 4;
pad = space / 2;

width = 4;
height = 4;
thickness = 2;

difference(){

    cube([
        width*hole + (width-1)*space + 2*pad,
        thickness,
        height*hole + (height-1)*space + 2*pad
    ]);

    for(i=[1:width]) {
        for(j=[1:height]) {
            translate([
                i*hole + (i-1)*space -hole/2 + pad,
                0,
                j*hole + (j-1)*space - hole/2 + pad
            ]) {
                rotate([90, 0, 0]) {
                    translate([0, 0, -2*thickness]) {
                        cylinder(r = hole/2 + 0.2, h = 3*thickness);
                    }
                }
            }
        }
    }

    translate([pad, -thickness, pad + hole/2]) {
        cube([hole, 3*thickness, (height-2)*hole + (height-2)*space]);
    }

    translate([(width - 1)*hole + (width-1)*space + pad, -thickness, pad + hole/2]) {
        cube([hole, 3*thickness, (height-2)*hole + (height-2)*space]);
    }

}





