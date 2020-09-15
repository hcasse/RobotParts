a = 104;
epaisseur = 2;
rail = cube([a/10, 3, epaisseur]);
//difference(){
//difference(){
//difference(){
    difference(){
       intersection(){
            cube([a,a,epaisseur]);
            translate([a/2,a/2,0]){
                rotate(45){
                    translate([-a/2,-a/2,0]){cube([a,a,epaisseur]);
                        };
                    };
                };
       };
    //    translate([20, 4*a/10, 0]){cube([2*a/3, 3, 4]);};
  //  };

//    translate([20, 15*a, 0]){cube([3*a, 3, 4]);};
//};

//translate([100, 161.5,0]){
union(){
/*translate([10,3.5,0]){cube([50, 50, 4]);};

translate([2, 53, 0]){cylinder(h=4,r=2);};

translate([2,2,0]){cube([4,8,4]);}

translate([62, 53, 0]){cylinder(h=4,r=2);};

translate([62,2,0]){cube([4,8,4]);}}}};
*/

for(i= [0 : (a)/(16)]){
for(j= [0 : 2+(a/16 -i)]){
union(){
    translate([a/2 - 8*j,8*i+a/2,0]){cylinder(h=epaisseur,r=2);};
    translate([a/2 - 8*j,a/2-8*i,0]){cylinder(h=epaisseur,r=2);};
    translate([a/2 + 8*j,a/2+8*i,0]){cylinder(h=epaisseur,r=2);};
    translate([a/2 + 8*j,a/2-8*i,0]){cylinder(h=epaisseur,r=2);};
    };
    };};};};
