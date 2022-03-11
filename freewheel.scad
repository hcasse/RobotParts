
diam = 26;
thickness = 13;
height = 35;

support_length = 38;
support_width = 32;
support_thickness = 1;
hole_length = 30;
hole_width = 24;
hole = 3.5; 

tube_diam = 32;
tube_height = 6;

join_length = 30;
join_thickness = 1;
join_height = 10;



translate([0, 0, diam/2]) {
    rotate([90, 0, 0]) {
        translate([0, 0, -thickness/2]) {
            cylinder(r = diam/2, h=13);
        }
    }
}

difference() {
    translate([
        0, //-support_width / 2,
        -support_length / 2,
        height - support_thickness
    ]) {
        cube([support_width, support_length, support_thickness]);
    }
    translate([
        (support_width - hole_width)/2,
        -hole_length/2,
        height - 2*support_thickness
    ]) {
        cylinder(h = 3*support_thickness, r = hole/2);
    }

    translate([
        (support_width - hole_width)/2 + hole_width,
        -hole_length/2,
        height - 2*support_thickness
    ]) {
        cylinder(h = 3*support_thickness, r = hole/2);
    }

    translate([
        (support_width - hole_width)/2,
        hole_length/2,
        height - 2*support_thickness
    ]) {
        cylinder(h = 3*support_thickness, r = hole/2);
    }

    translate([
        (support_width - hole_width)/2 + hole_width,
        hole_length/2,
        height - 2*support_thickness
    ]) {
        cylinder(h = 3*support_thickness, r = hole/2);
    }
}

translate([
    support_width/2,
    0,
    height - tube_height - support_thickness
]) {
    cylinder(r = tube_diam/2, h = tube_height);
};

translate([6, thickness/2, 20]) {
    rotate([0, -45, 0]) {
        translate([-join_length/2, 0, -join_height/2]) {
            cube([join_length, join_thickness, join_height]);
        }
    }
}

translate([6, -thickness/2 - join_thickness, 20]) {
    rotate([0, -45, 0]) {
        translate([-join_length/2, 0, -join_height/2]) {
            cube([join_length, join_thickness, join_height]);
        }
    }
}

