nb_rangees = 4;
epaisseur = 2;
difference(){

    cube([8*nb_rangees,epaisseur,28]);



    
union(){
    translate([2, 0, 16]){
        cube([4, epaisseur, 8]);
        };
    translate([7*nb_rangees-2, 0, 16]){
        cube([4, epaisseur, 8]);
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

