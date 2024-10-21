// base params
concavity_radius = 25.4;
intake_radius_outer = 13;
intake_depth = 30;
wall_thickness = 2;

// computed parans
intake_radius_inner = intake_radius_outer - wall_thickness;


difference() {
    // intake cylinder hollowed
    difference() {
        // intake cylinder main
        cylinder(
            h = intake_depth,
            r1 = intake_radius_outer,
            r2 = intake_radius_outer);
        // intake cylinder void
        cylinder(
            h = intake_depth,
            r1 = intake_radius_inner,
            r2 = intake_radius_inner);
    }
    // intake cylinder concavity (should match radial dimensions of mating grommet)
    translate(
        v = [0, intake_radius_outer, -intake_radius_outer]) {
        rotate(
            a = [90,0,0]
        ) {
            cylinder(
                h = 2*intake_radius_outer,
                r1 = concavity_radius,
                r2 = concavity_radius);
        }
    }
}