include <../config.scad>

module U(size = 3) {
    l = 2*pad + hole*size + space*(size - 1);
    iw = (2*pad + hole) * ufix; 
    w = iw + 2*thickness;
    h = 2*pad + hole + thickness;
    
    difference() {
        cube([l, w, h]);
        
        translate([-thickness, thickness, thickness])
            cube([l + 2*thickness, iw, h]);
    };
}

U();
