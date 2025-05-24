include <roundedcube.scad>

// Case TOP
union() {
	// Base
	difference() {
		//cube([179, 170, 14]);
		roundedcube([179, 170, 16], false, 1, "y");
		translate([-1, -1, 14]) {
			cube([190,180,3]);
		};
		translate([1.5, 3, 2]) {
			cube([179-3, 170, 14]);
		};
		// encoche devant
		translate([1.5, -5, 2+3]) {
			cube([179-3, 10, 14]);
		};
		translate([179-3-2, -1, 2]) {
			cube([3, 5, 4]);
		};
		// encoche facade
		translate([74, -1, 2]) {
			cube([20, 5, 2]);
		};
		// GPU passé de 57 a 58 apres le premier proto
		// passer a 57.5 apres le second
		translate([96,-1,-1]) {
			cube([57.5,112,12]);
		};
		// vis GPU
		translate([179+1, 170-8, 8]) {
			rotate([0, -90, 0]) {
				cylinder(4, 2, 2,$fn=8);
			}
		};
	};
	
	// support vis arriere
	translate([77, 170-3-6, 2]) {
		difference() {
			cube([12, 6, 17]);
			translate([6,2,12.5]) {
				rotate([-90,0,0]) {
					cylinder(5, 2.5, 2.5,$fn=8);
				}
			}
		}
	};
	// langete droite
	translate([179-8-14, -6, 2]) {
		cube([14, 7, 2]);
	};
	// langete gauche
	translate([10, -6, 2]) {
		cube([28, 7, 2]);
	};
}//*/

// Frontale
translate([0,-30,0]) {
	union() {
		difference() {
			roundedcube([179,11,35], false, 1, "ymin");
			// evidage
			translate([2,1.5,2]) {
				cube([179-4,11,35-4]);
			};
			// trou button
			translate([179-15,-1, 35-5-11/2]) {
				rotate([-90,0,0]) {
					cylinder(4,11.5/2,11.5/2);
				};
			};
			// trou encoche gauche et droite
			translate([9, 4.5, 1.8]) {
				cube([30, 7, 2.2]);
			};
			translate([179-9-14, 4.5, 1.8]) {
				cube([16, 7, 2.2]);
			};

			// trou micro / casque
			translate([179-40, -1, 24]) {
				rotate([-90,0,0]) {
					cylinder(4, 6.5/2, 6.5/2);
				}
			};
			translate([179-52.5, -1, 24]) {
				rotate([-90,0,0]) {
					cylinder(4, 6.5/2, 6.5/2);
				}
			};

			// USB
			translate([106,-1,22]) {
				cube([10,4,5]);
			};
			translate([86,-1,20]) {
				cube([16,4,7]);
			};

			// trou GPU
			translate([179-58-25, 11-2,-4]) {
				cube([58,5,12]);
			};

			
			// tous les troutages
			for ( x = [7 : 5 : 175] ){
				translate([x,-1, 5]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
				translate([x,-1, 10]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
				translate([x,-1, 15]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
			}
			for ( x = [7 : 5 : 85] ){
				translate([x,-1, 20]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
				translate([x,-1,25]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
				translate([x,-1, 30]) {
					rotate([-90,0,0]) {
						cylinder(4,2,2,$fn=8);
					}
				};
			}

		};
		
		// bouton
		translate([179-15,0, 35-5-11/2]) {
			translate([6 ,1,-3]) {
				cube([3,6,6]);
				translate([-6,6.,0]) {
					cube([9,.6,6]);
				}
			};
			rotate([-90,0,0]) {
				cylinder(2,5,5);
				cylinder(12,3,3,$fn=8);
			};
		};
		
		// encoche centrale
		translate ([75, 5, 2]) {
			cube([18, 13, 2]);
		};

		// encoche de gauche
		difference() {
			translate([2,8,2]) {
				cube([40,3,3]);
			};
			translate([9, 6, 1.8]) {
				cube([30, 7, 2.2]);
			};
		};
		// encoche de droite
		difference() {
			translate([179-2-23,8,2]) {
				cube([20,3,3]);
			};
			translate([179-9-14, 6, 2]) {
				cube([16, 7, 2]);
			};
		};
		// atache
		translate([3,1,35-2-1-7]) {
			cube([2,14,7]);
			translate([-.5,12.4,0]) {
				rotate([0,0,180]) {
					scale([1,2,1]) {
						cylinder(7,1,1, $fn=3);
					}
				};
			};
		};
		translate([179-3-2,1,35-2-1-7]) {
			cube([2,14,7]);
			translate([2.5,12.4,0]) {
				scale([1,2,1]) {
					cylinder(7,1,1, $fn=3);
				}
			};
		};

	};
}; //*/

color("red") {
	translate([0,-30,0]) {
	};

};
	


