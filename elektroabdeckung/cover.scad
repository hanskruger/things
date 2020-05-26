// Ortlieb bag storage bar using 8mm steel rod
// Aart 12-2016

$fn = 100; 

wall = 1.5;

module roundRect(width, depth, height, rounding) {
	hull()
	for (x=[-width/2 + rounding, width/2 - rounding])
	for (y=[-depth/2 + rounding, depth/2 - rounding]) {
		translate([x,y])
		cylinder(r=rounding, h=height);
	}
}

module screwhole(d1, d2, h1, h2)  {
    union() {
    cylinder (d1 = d1, d2 = d1, h = h1);  
    translate ([0,0, h1]) cylinder (d1 = d1, d2 = d2, h = d2 - d1);
    translate ([0,0, h1 + (d2 - d1)]) cylinder (d1 = d2, d2 = d2, h = h2);
    }
}

module breakout(L) {
hull () {
cylinder(d1=5, d2=5, h=L-wall);
translate([5,0,0]) cylinder(d1=5, d2=5, h=L-wall);
}
}


difference() {
union() {
difference() {
    roundRect(60, 80, 30, 5);
    translate([0,0,wall])
    roundRect(60-2*wall, 80-2*wall, 30, 5);
}

intersection() {
   union() {
translate([0, 35, 0]) 
hull() {
    cylinder(d1=10, d2=10, h=30);
    translate([0, 10, 0]) cylinder(d1=10, d2=10, h=30);
}
translate([0, -45, 0]) 
hull() {
    cylinder(d1=10, d2=10, h=30);
    translate([0, 10, 0]) cylinder(d1=10, d2=10, h=30);
}
}
roundRect(60, 80, 30, 5);
}
}
translate([0, -35, 30]) rotate([180,0,0]) screwhole (4, 8, 10, 30);
translate([0, 35, 30]) rotate([180,0,0]) screwhole (4, 8, 10, 30);

translate([-30+wall/2,0,30])
    rotate([0,90,0]) breakout(60);
translate([-30+wall/2,-20,30])
    rotate([0,90,0]) breakout(60);
translate([-30+wall/2,20,30])
    rotate([0,90,0]) breakout(60);
translate([15,-40+wall/2,30])
    rotate([0,90,90]) breakout(80);
translate([-15,-40+wall/2,30])
    rotate([0,90,90]) breakout(80);

}



translate ([40,-10,0])
union(){
cylinder(d1=7.5, d2=7.5, h=wall);
difference() {
cylinder(d1=7.5, d2=7.5, h=wall+4);
cylinder(d1=7.5-2*wall, d2=7.5-2*wall, h=wall+4);
}
}
translate ([40,+10,0])
union(){
cylinder(d1=7.5, d2=7.5´, h=wall);
difference() {
cylinder(d1=7.5, d2=7.5, h=wall+4);
cylinder(d1=7.5-2*wall, d2=7.5-2*wall, h=wall+4);
}
}



