largeur = 3;
hauteur = 5;
difference(){
difference(){
    cube([largeur*8, 20, hauteur*8]);
    translate([0,0,4]){
        cube([largeur*8, 8, hauteur*8]);
    };
    translate([0,12,26]){
        cube([largeur*8, 8, 24]);
    };
    translate([0,12,0]){
        cube([largeur*8, 8, 22]);
    };
};


union(){
for(i=[0:largeur]){
    for(j=[0:hauteur-2]){
      
        translate([4+i*8, 12, 8+j*8]){
            rotate([90,0,0]){
            cylinder(h=4, r= 2);
            }
        }
    }
    }
};
union(){
    for(i=[0:largeur]){
        translate([4+i*8, 4, 0]){
            cylinder(h=4, r=2);
            }
    }
};

union(){
    for(i=[0:largeur]){
        translate([4+i*8, 16, 0]){
            cylinder(h=32, r=2);
            }
    }
};

}