epaisseur = 2;
hauteur = 1;
profondeur = 3;
largeur = 3;
difference(){
difference(){
    cube([largeur*8,profondeur*8+4,hauteur*8+4]);
    translate([0, epaisseur, epaisseur]){
        cube([largeur*8,profondeur*8+4,hauteur*8+4]);};
};

translate([0, epaisseur,0]){cube([10, profondeur*8+4, hauteur*8+4]);};
translate([(largeur-1)*8, 7, 0]){
    cylinder(h=epaisseur, r=1.4);
    };  
    
translate([(largeur-1)*8, 24.5, 0]){
    cylinder(h=epaisseur, r=1.4);
    };  
    
translate([0,4,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:largeur-1]){
                for(j=[0:hauteur-1]){
                    translate([4+ 8*i, 8+8*j, 0]){cylinder(h=4, r=2);}
                }
            }
        }
    }
}


}

