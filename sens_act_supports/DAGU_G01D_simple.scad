include <../config.scad>

module DAGU_G01D(left = false) {
    $fa = 1;
    $fs = 0.4;

    // motor size
    motor_length = 20;  // 18.8;
    motor_width = 23;   // 22.5;

    // distances between holes
    // 2 front holes - 1 back hole
    front_hole_dist = 17.5;
    front_back_dist = 31.8 + 2;  // 1 = distance motor block - back hole
    back_axis_dist = 11.2;

    // hole diameters
    tie_hole = 3;
    axis_hole = 7.2;
    picot_hole = 5;


    // sizes after to adaption to hole scheme
    vert_offset = 6;     // from border to tie hole center
    piece_height = 2*vert_offset + front_back_dist;
    hh = ceil((piece_height - 2*pad + space) / (space+hole));
    h = hh*hole + (hh-1)*space + 2*pad + 4*pad + 2*hole;
    l = pad * 4 + hole;
    w = motor_width + pad + pad;
    tie_offset = (motor_width - front_hole_dist)/2 + pad;
    mw = motor_width + pad;
    iw = (hole + 2*pad)*ufix;

    difference() {
        
        union() {

            translate([
                !left ? 0 : (4*pad + hole - thickness),
                0,
                0
            ]) {
                cube([thickness, w, h - 2*(2*pad + hole)]);
            }

            translate([0, w - thickness, -(2*pad + hole)]) {
                cube([
                    4*thickness + hole,
                    thickness,
                    h
                ]);
            }
        }
        
        translate([-thickness, -10, 12]) {
            cube([
                2*thickness + 4*pad + hole,
                w,
                22
            ]);
        }

        translate([-thickness, -20, 30]) {
            cube([
                2*thickness + 4*pad + hole,
                w,
                22
            ]);
        }
        
        // tie hole (bottom)
        translate([
            (l + 2*pad)/2 - pad,
            tie_offset,
            vert_offset
        ]) {
            rotate([0, 90, 0]) {
                translate([
                    0,
                    0,
                    -(l + 2*pad)/2
                ]) {
                    cylinder(
                        h=l + 2*pad,
                        r=tie_hole/2 * hfix
                    );
                };
            };
        };

        // tie hole (top)
        translate([
            (l + 2*pad)/2 - pad,
            tie_offset + front_hole_dist,
            vert_offset
        ]) {
            rotate([0, 90, 0]) {
                translate([
                    0,
                    0,
                    -(l + 2*pad)/2
                ]) {
                    cylinder(
                        h = l + 2*pad,
                        r = tie_hole/2 * hfix
                    );
                };
            };
        };



        // back hole
        translate([
            (l + 2*pad)/2 - pad,
            tie_offset + front_hole_dist/2,
            vert_offset + front_back_dist])
        {
            rotate([0, 90, 0]) {
                translate([
                    0,
                    0,
                    -(l + 2*pad)/2
                ]) {
                    cylinder(
                        h = l + 2*pad,
                        r = tie_hole/2 * hfix
                    );
                };
            };
        };

        for(i=[0, 1, 4, 6, 7]) {
            translate([
                !left ? (3*pad + hole/2) : pad + hole/2,
                w - .5*pad,
                -pad -hole/2 + i*(2*pad + hole)
            ]) {
                rotate([90, 0, 0]){
                    translate([0, 0, -1.5*pad]) {
                        cylinder(h=3*pad, d=hole);
                    }
                }
            }
        }
    }

    translate([
        !left ? 0 : (3*pad + hole + thickness),
        w - pad,
        h - 8 - 6*pad - 2*hole
    ]) {
        rotate([0, !left?0:180,0]) {
        rotate([0, 0, !left ? -90 : -90])  {
            translate([0, 0, -4]) {
                linear_extrude(8) {
                    polygon(points=[[0,0],[8,0],[0,10]], paths=[[0,1,2]]);
                };
            }
        }
        }
    };

    translate([
        !left ? 0 : (3*pad + hole + thickness),
        w - pad,
        5*pad + (!left?0:(6*pad+tie_hole/2))
    ]) {
        rotate([0, !left?0:180,0]) {
        rotate([0, 0, !left ? -90 : -90])  {
            linear_extrude(2*(hole + 2*pad) - pad) {
                polygon(points=[[0,0],[8,0],[0,10]], paths=[[0,1,2]]);
            }
        }
        }
    }

}

DAGU_G01D(left = false);


