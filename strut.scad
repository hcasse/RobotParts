// configuration
height = 10;
hole = 3.5;
diam = 4;

length = diam;
width = diam/2 + .25;

difference() {
    union() {
        translate([
            -length/2,
            -width/2,
            0
        ]) {
            cube([
                length,
                width,
                height
            ]);
        }

        rotate([0, 0, 60]) {
            translate([
                -length/2,
                -width/2,
                0
            ]) {
                cube([
                    length,
                    width,
                    height
                ]);
            }
        };

        rotate([0, 0, 120]) {
            translate([
                -length/2,
                -width/2,
                0
            ]) {
                cube([
                    length,
                    width,
                    height
                ]);
            }
        };   
    }
    
    translate([0, 0, -2]) {
        cylinder(r=hole/2, h=height+4);
    }
}
