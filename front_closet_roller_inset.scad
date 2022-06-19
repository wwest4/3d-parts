scale([.05,.05,.05]) {
    translate([0, 0, 0]) {
        difference() {
            cylinder(h = 50, r1 = 87, r2 = 87, center = true);
            cylinder(h = 51, r1 = 53.5, r2 = 53.5, center = true);
        }
    }
}
scale([.05,.05,.05]) {    
        translate([0, 200, 180]) {
        difference() {
            cylinder(h = 410, r1 = 90, r2 = 90, center = true);
            cylinder(h = 411, r1 = 70, r2 = 70, center = true);
        }
    }
}