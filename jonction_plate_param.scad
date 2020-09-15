rangees_longueur = 6;
rangees_largeur =1;
epaisseur = 2;
difference(){
cube([rangees_longueur*8, rangees_largeur*8,epaisseur]);

union(){
for(i = [0:rangees_longueur]){
    for(j=[0: rangees_largeur]){
        translate([4+i*8, 4+j*8, 0]){
            cylinder(h=epaisseur, r= 2);
            }
        }
    }
}
}