
base_w = 80;
base_l = 160;
base_h = 35;

pc_w = 35.4;

difference() {
	cube([base_w,base_l,base_h]);
	pc_hole();
	pc_hole_side();
	base_round();
	foot_round();
	led_ruban();
	led_controler();
}


module pc_hole() {
	translate([base_w/2-pc_w/2,-5,base_h-20])
		cube([35.4,base_l+10,25]);
}

module pc_hole_side() {
	r_y=20;
	r_z=10;
	
	translate([0,10+r_y,base_h-10])
		cube([base_w, base_l-10*2-r_y*2, 20]);
	translate([0,10+r_y,base_h])
		rotate([0,90,0])
			scale([r_z,r_y,1]) 
				cylinder(base_w, 1, 1, $fn=32);
	translate([0,base_l-10-r_y,base_h])
		rotate([0,90,0])
			scale([r_z,r_y,1]) 
				cylinder(base_w, 1, 1, $fn=32);
}

module base_round() {
	translate([0,0,base_h])
		rotate([-90,0,0])
			translate([0,0,-5])
				scale([(base_w-pc_w)/2-5,base_h-5,1])
					cylinder(base_l+10, 1, 1, $fn=64);
	translate([base_w,0,base_h])
		rotate([-90,0,0])
			translate([0,0,-5])
				scale([(base_w-pc_w)/2-5,base_h-5,1])
					cylinder(base_l+10, 1, 1, $fn=64);
}

module foot_round() {
	x = 25;
	h = 10;
	translate([x,0,0])
		rotate([-90,0,0])
			translate([0,0,-5])
				scale([15,h,1])
					cylinder(base_l+10, 1, 1, $fn=64);
	translate([base_w-x,0,0])
		rotate([-90,0,0])
			translate([0,0,-5])
				scale([15,h,1])
					cylinder(base_l+10, 1, 1, $fn=64);
	translate([x,-5,-5])
		cube([base_w-x*2, base_l+10, h+5]);
}

module led_ruban() {
	l = 135;
	translate([20,base_l/2, 10-2])
		cube([10.5,l,6], true);
	translate([base_w-20,base_l/2, 10-2])
		cube([10.5,l,6], true);
}

module led_controler() {
	l = 30;
	translate([base_w/2,base_l-l/2-40, 10])
	cube([20,l,4], center=true);
	translate([base_w/2,base_l, 12.5])
		rotate([-85,0,0])
			cylinder(90,3/2,3/2, $fn=16, center = true);
}

color("red") {
		
}
