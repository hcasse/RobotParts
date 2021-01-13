nb_rangees = 1;
epaisseur = 2;
difference(){
difference(){
    cube([8*nb_rangees,10,28]);
    translate([-1, epaisseur, epaisseur]){
        cube([2+8*nb_rangees,28,28]);};
};


translate([0,epaisseur,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:nb_rangees]){
                for(j=[0:2]){
                    translate([4+ 8*i, 8+8*j, -1]){cylinder(h=epaisseur+2, r=2);}
                }
            }
        }
    }
}


}

