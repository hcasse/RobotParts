epaisseur = 2;
hauteur = 3;
profondeur = 1;
largeur = 3;
difference(){
difference(){
    cube([largeur*8,profondeur*8+4,hauteur*8+4]);
    translate([-1, epaisseur, epaisseur]){
        cube([largeur*8+2,profondeur*8+4,hauteur*8+4]);};
};

union(){
    for(i=[0:largeur-1]){
        for(j=[0:profondeur-1]){
            translate([4+ 8*i, 8+8*j, -1]){cylinder(h=6, r=2);}
            }
        }
    
    
    
translate([0,4,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:largeur-1]){
                for(j=[0:hauteur-1]){
                    translate([4+ 8*i, 8+8*j, 0]){cylinder(h=6, r=2);}
                }
            }
        }
    }
}

}
}

