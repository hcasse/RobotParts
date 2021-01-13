largeur = 4;
hauteur = 5;
epaisseur = 2;
difference(){
difference(){
    cube([largeur*8, 20, hauteur*8]);
    translate([-1,-1,epaisseur]){
        cube([largeur*8+2, 9, hauteur*8]);
    };
    translate([-1,8+epaisseur,24+epaisseur/2]){
        cube([largeur*8+2, 8+epaisseur+1, 24+epaisseur/2]);
    };
    translate([-1,8+epaisseur,epaisseur]){
        cube([largeur*8+2, 8+epaisseur+1, 24-epaisseur/2-epaisseur]);
    };
};


/*union(){
for(i=[0:largeur]){
    for(j=[0:1]){
      
        translate([4+i*8, 12, 8+j*8]){
            rotate([90,0,0]){
            cylinder(h=4, r= 2);
            }
        }
    };
    for(j=[3:hauteur-2]){
      
        translate([4+i*8, 12, 8+j*8]){
            rotate([90,0,0]){
            cylinder(h=4, r= 2);
            }
        }
    }
    
    
    }
};*/
union(){
    for(i=[0:largeur]){
        translate([4+i*8, 4, -1]){
            if(i==0 || i == largeur-1)
            cylinder(h=4, r=2);
            }
    }
};

union(){
    for(i=[0:largeur]){
        translate([4+i*8, 16, -1]){
            if(i!=0 && i != largeur-1)
            cylinder(h=epaisseur+2, r=2);
            }
    }
};

}

translate([14,0,0]){cube([3, 9,hauteur*8 ]);};

translate([0, 9, 0]){cube([8,11, epaisseur+2]);};
translate([8*(largeur-1), 9, 0]){cube([8,11, epaisseur+2]);};

