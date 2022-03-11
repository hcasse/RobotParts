// piece configuration
nb_rangees = 4;
height = 5;
width = 4;

// home configuration
hole = 4;
space = 4;
pad = space / 2;
thickness = 2;


// internal calculations
h = height * hole + (height - 1) * space + 2 * pad;
w = width * hole + (width - 1) * space + 2 * pad;
half = (width % 2 == 0) ? ((width - 2) / 2) : ((width - 1) / 2);
pos = (width % 2 == 0)
    ? pad + half*hole + (half - 1)*space + space + hole + space/2
    : pad + half*hole + (half - 1)*space + space + hole/2;
echo(half);

difference(){
//union(){

    cube([w, h, thickness]);

    for(i=[0:half-1]) {
        for(j=[0:height-1]) {
            union(){
                translate([
                    pad + (hole + space) * i + hole/2,
                    pad + (hole + space) * j + hole/2,
                    -thickness
                ]) {
                    cylinder(h=thickness * 3, r=hole/2);
                }
                translate([
                    w - pad + (hole + space) * i - hole/2,
                    pad + (hole + space) * j + hole/2,
                    -thickness
                ]) {
                    cylinder(h=thickness * 3, r=hole/2);
                }
            }
        }
    }
    
    translate([pos, pad + hole/2, -thickness ]) {
        cylinder(h=thickness * 3, r=hole/2);
    }
    translate([pos, h - pad - hole/2, -thickness ]) {
        cylinder(h=thickness * 3, r=hole/2);
    }
    translate([pos - hole/2, pad + hole/2, -thickness]) {
        cube([hole, h - pad*2 -hole, thickness*3]);
    }

    
/*union(){
    translate([2, -1, 16]){
        cube([4, epaisseur+2, 8]);
        };
    translate([7*nb_rangees-2, -1, 16]){
        cube([4, epaisseur+2, 8]);
        }
    };
    
translate([2.67,6,0]){
    cylinder(h=epaisseur+2, r=1.5);
    };

translate([8*nb_rangees-2.67,6,0]){
    cylinder(h=epaisseur+2, r=1.5);
    };

translate([0,epaisseur+1,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:nb_rangees-1]){
                for(j=[0:2]){
                    translate([4+ 8*i, 8+8*j, 0]){cylinder(h=epaisseur+2, r=2);}
                }
            }
        }
    }
}*/


}

