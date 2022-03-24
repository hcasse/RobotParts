// configuration
size = 3;        // number of holes


// family configuration
space = 4;
hole = 4;
pad = space/2;


// multiplier for hole size
// 1.2 PLA
hfix = 1.2;


// script
l = pad*2 + hole*size + space*(size - 1);
w = pad*2 + hole;
h = pad*2 + hole;

difference(){
//union() {
cube([l, w, h]);


union(){
    for(i=[0:size-1]){
        translate([pad +i*(hole + space) + hole/2, pad + hole/2, -pad]){
                cylinder(h=h + 2*pad, r=hole/2*hfix);
            }
        };
    for(i=[0:size-1]){
        translate([pad + (hole + space)*i + hole/2, w+pad, pad + hole/2]){
            rotate([90,0,0]){
                cylinder(h=h + 2*pad, r=hole/2*hfix);
            }
            }
        }
        
    }
}