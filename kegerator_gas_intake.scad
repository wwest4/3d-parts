// base params
mounting_hole_spacing = 102.5;
mounting_hole_radius = 2;

// dependent params: copied from tower grommet dimensions. sync manually
passthrough_height = 89;
passthrough_radius_outer = 25.5;
wall_thickness = 2.5;
flare_radius = 12.5;
flare_thickness = 3;
fit_gap = 1;
passthrough_radius_inner = passthrough_radius_outer - wall_thickness - fit_gap/2;

// computed params
bracket_width = mounting_hole_spacing * 1.1;
slip_ring_thickness = flare_thickness * 2;
bracket_depth = slip_ring_thickness;
bracket_height = bracket_depth * 4;
slip_ring_radius_outer = passthrough_radius_inner - wall_thickness + flare_radius*2;
slip_ring_radius_inner = passthrough_radius_outer + fit_gap;

// slip ring
translate([0,0,0]) {
    difference() {
        //
        // main flare
        cylinder(
            h = slip_ring_thickness,
            r1 = slip_ring_radius_outer,
            r2 = slip_ring_radius_outer,
            center = true);
        //
        // void
        cylinder(
            h = passthrough_height + 1,
            r1 = slip_ring_radius_inner,
            r2 = slip_ring_radius_inner,
            center = true);
    }  
}

// mounting bracket
translate([slip_ring_radius_inner,bracket_width/2,-bracket_depth/2]) {
    rotate(
    a = [90,0,0]) {
        difference() {
            // bracket bar
            linear_extrude(bracket_width) {
                square([bracket_height, bracket_depth], [0,0]);
            }
            // through-holes
            rotate(
            a = [0,90,0]) {
                translate([-(bracket_width-mounting_hole_spacing)/2,bracket_depth/2,0]) {
                cylinder(
                    h = bracket_height*1.1,
                    r1 = mounting_hole_radius,
                    r2 = mounting_hole_radius);
                }
                translate([-(bracket_width+mounting_hole_spacing)/2,bracket_depth/2,0]) {
                cylinder(
                    h = bracket_height*1.1,
                    r1 = mounting_hole_radius,
                    r2 = mounting_hole_radius);
                }
            }
        }
    }     
}