rangees_longueur = 2;
rangees_largeur = 2;
difference(){
cube([rangees_longueur*8, rangees_largeur*8,4]);

union(){
for(i = [0:rangees_longueur]){
    for(j=[0: rangees_largeur]){
        translate([4+i*8, 4+j*8, 0]){
            cylinder(h=4, r= 2);
            }
        }
    }
}
}