nb_rangees = 4;
epaisseur = 2;
difference(){
difference(){
    cube([8*nb_rangees,10,28]);
    translate([0, epaisseur, epaisseur]){
        cube([8*nb_rangees,28,28]);};
};

translate([8,0,0]){
    cube([16, 10, epaisseur]);
    };
    
union(){
    translate([2, 0, 8]){
        cube([4, epaisseur, 16]);
        };
    translate([7*nb_rangees-2, 0, 8]){
        cube([4, epaisseur, 16]);
        }
    };
    
translate([2.67,6,0]){
    cylinder(h=epaisseur, r=1.5);
    };

translate([8*nb_rangees-2.67,6,0]){
    cylinder(h=epaisseur, r=1.5);
    };

translate([0,epaisseur,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:nb_rangees-1]){
                for(j=[0:2]){
                    translate([4+ 8*i, 8+8*j, 0]){cylinder(h=epaisseur, r=2);}
                }
            }
        }
    }
}


}

