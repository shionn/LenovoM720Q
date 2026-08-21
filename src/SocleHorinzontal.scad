pc_w = 180;
pc_h = 35.4;

wall = 5;

base_l = 160;
base_h = pc_h+wall*2+wall*2;
base_w = pc_w+wall*2;

difference() {
	cube([base_w, base_l, base_h]);
	translate([wall,-wall,wall*3])
		cube([pc_w, base_l+wall*2, pc_h]);
	top_hole();
	foot_hole_round();
	foot_hole();
	side_hole();
	bottom_hole();
	
	led_ruban();
	led_controler();
	pc_foot();
}

module top_hole() {
	translate([wall*3,-wall,base_h-wall*2])
		cube([pc_w-wall*4,base_l+wall*2,wall*3]);
	translate([wall,wall*6,base_h-wall*2])
		cube([pc_w,base_l-wall*12,wall*3]);
	translate([wall*3,wall*6,base_h-wall*2])
		scale([wall*2,wall*4,1])
			cylinder(wall*3,1,1, $fn=32);
	translate([wall*3,base_l-wall*6,base_h-wall*2])
		scale([wall*2,wall*4,1])
			cylinder(wall*3,1,1, $fn=32);
	translate([base_w-wall*3,wall*6,base_h-wall*2])
		scale([wall*2,wall*4,1])
			cylinder(wall*3,1,1, $fn=32);
	translate([base_w-wall*3,base_l-wall*6,base_h-wall*2])
		scale([wall*2,wall*4,1])
			cylinder(wall*3,1,1, $fn=32);
}

module foot_hole() {
	translate([wall*6,-wall,-wall])
		cube([base_w-wall*12,base_l+wall*2,wall*3]);
	translate([-wall,wall*6,-wall])
		cube([base_w+wall*2,base_l-wall*12,wall*3]);
}

module foot_hole_round() {
	translate([wall*6,-wall,0])
		rotate([-90,0,0])
			scale([wall*4,wall*2,1])
				cylinder(base_l+wall*2,1,1, $fn=32);
	translate([base_w-wall*6,-wall,0])
		rotate([-90,0,0])
			scale([wall*4,wall*2,1])
				cylinder(base_l+wall*2,1,1, $fn=32);
	translate([-wall,wall*6,0])
		rotate([-90,0,-90])
			scale([wall*4,wall*2,1])
				cylinder(base_w+wall*2,1,1, $fn=32);
	translate([-wall,base_l-wall*6,0])
		rotate([-90,0,-90])
			scale([wall*4,wall*2,1])
				cylinder(base_w+wall*2,1,1, $fn=32);
}

module side_hole() {
	/*translate([wall/2, base_l/2, 15+pc_h/2])
		cube([wall*2, base_l-wall*2, pc_h], true);**/
	translate([base_w/2, 10+20,15+pc_h/2])
		rotate([0,90,0])
			scale([10,20,1])
				cylinder(base_w+20,1,1, center = true, $fn=32);
	translate([base_w/2, base_l-10-20,15+pc_h/2])
		rotate([0,90,0])
			scale([10,20,1])
				cylinder(base_w+20,1,1, center = true, $fn=32);
	translate([base_w/2, base_l/2,pc_h/2+15])
		cube([base_w+20,base_l-20-20-10-10,20], true);
}

module bottom_hole() {
	translate([base_w/2, base_l/2, 10+wall/2])
		scale([base_w/2,base_l/2,1])
			rotate([0,0,45])
				cube([1,1,wall*2], true);

}

module led_ruban() {
	l = 135;
	w = 10.5;
	translate([base_w/2-l/2-10,10,10-9])
		cube([l+20,w,10]);
	translate([10,base_l/2-l/2,10-9])
		cube([w,l,10]);
	translate([base_w-10-w,base_l/2-l/2,10-9])
		cube([w,l,10]);
}

module led_controler() {
	l = 30;
	translate([base_w-40,base_l-l/2-20, 10])
		cube([20,l,4], center=true);
	translate([base_w-65,base_l, 12.5])
		rotate([-85,0,40])
			cylinder(90,4/2,4/2, $fn=16, center = true);
}

module pc_foot() {
	w = 7;
	p=2.5;
	translate([5+5,4,15-p])
		cube([w,base_l, p*2]);
	translate([base_w-5-5-w,4,15-p])
		cube([w,base_l, p*2]);
}

color("red") {
}
