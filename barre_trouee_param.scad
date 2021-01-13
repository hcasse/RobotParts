longueur_trous = 20;
difference(){
cube([longueur_trous * 8, 8, 8]);


union(){
    for(i=[0:longueur_trous]){
        translate([4+8*i, 4,-1]){
                cylinder(h=10, r=2);
            }
        };
    for(i=[0:longueur_trous]){
        translate([4+8*i, 9,4]){
            rotate([90,0,0]){
                cylinder(h=10, r=2);
            }
            }
        }
        
    }
}