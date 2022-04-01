include <../config.scad>

module AngleForFixing(height = 3, depth = 1, width = 4) {
    $fa = 1;
    $fs = 0.4;
    w = 2*pad + width*hole + (width - 1)*space;
    d = 2*pad + depth*hole + (depth - 1)*space + thickness*2;
    h = 2*pad + height*hole + (height - 1)*space + thickness*2;
    r = hole * hfix / 2;

    difference(){
        cube([w, d, h]);
        
        translate([-thickness, thickness, thickness])
            cube([w + 2*thickness, d, h]);

        for(i=[0:width-1])
            for(j=[0:depth-1])
                translate([
                    pad + hole/2 + (hole + space)*i,
                    2*pad + 2*thickness + (hole + space)*j,
                    -thickness
                ])
                    cylinder(h=thickness*3, r=r);
        
        translate([(w - (hole + space)*2)/2 + hole/2, 2*thickness, 0]) 
            rotate([90, 0, 0])
                for(i=[0:1])
                    for(j=[0:height-1])
                        translate([
                            //pad + hole/2 + /*thickness*2 +*/ (hole + space)*i,
                            hole/2 + (hole + space)*i,
                            2*pad + thickness*2 + (hole + space)*j,
                            0
                        ])
                            cylinder(h=thickness*3, r=r);
    }
}

AngleForFixing();


