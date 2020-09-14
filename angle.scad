difference(){
difference(){
    cube([24,28,28]);
    translate([0, 4, 4]){
        cube([24,28,28]);};
};

union(){
    for(i=[0:2]){
        for(j=[0:2]){
            translate([4+ 8*i, 8+8*j, 0]){cylinder(h=4, r=2);}
            }
        }
    
    
    
translate([0,4,0]){   
    rotate([90,0,0]){
        union(){
            for(i=[0:2]){
                for(j=[0:2]){
                    translate([4+ 8*i, 8+8*j, 0]){cylinder(h=4, r=2);}
                }
            }
        }
    }
}

}
}