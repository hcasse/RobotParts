include <../config.scad>

module Junction(length = 6) {
    $fa = 1;
    $fs = 0.4;
    width = 1;

    // design
    difference(){
        cube([
            length*hole + (length-1)*space + 2*pad,
            width*hole + (width-1)*space + 2*pad,
            thickness
        ]);

        for(i = [0:length-1]){
            for(j=[0: width-1]){
                translate([
                    i * (space + hole) + pad + hole/2,
                    j * (space + hole) + pad + hole/2,
                    -thickness])
                {
                    cylinder(
                        h = thickness * 3,
                        r= hole/2 + 0.2);
                    }
                }
            }
    }
}

Junction();
