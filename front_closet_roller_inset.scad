scale([.05,.05,.05]) {
    translate([0, 0, 0]) {
        difference() {
            cylinder(h = 50, r1 = 87, r2 = 87, center = false);
            cylinder(h = 51, r1 = 53.5, r2 = 53.5, center = false);
            linear_extrude(height = 51, slices = 20, scale = 1.0) {
                square(size=[30, 150], center=true);
            }
            linear_extrude(height = 51, slices = 20, scale = 1.0) {
                square(size=[150, 30], center=true);
            }
        }
    }
}

scale([.05,.05,.05]) {    
    translate([0, 0, 50]) {
        difference() {
            cylinder(h = 440, r1 = 90, r2 = 90, center = false);
            cylinder(h = 441, r1 = 70, r2 = 70, center = false);

        }
    }
}
    

