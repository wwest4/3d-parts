passthrough_height = 89;
passthrough_radius_outer = 25.5;
wall_thickness = 2.5;
flare_radius = 12.5;
flare_thickness = 3;
fit_gap = 1;

passthrough_radius_inner = passthrough_radius_outer - wall_thickness - fit_gap/2;


//
// inner grommet
translate([0,0,0]) {
    difference() {
        // 
        // main tube
        cylinder(
            h = passthrough_height,
            r1 = passthrough_radius_inner,
            r2 = passthrough_radius_inner,
            center = true);
        //
        // void
        cylinder(
            h = passthrough_height + 1,
            r1 = passthrough_radius_inner - wall_thickness,
            r2 = passthrough_radius_inner - wall_thickness,
            center = true);
    }
}

// inner grommet base flare
translate([0,0,-(passthrough_height + flare_thickness)/2]) {
    difference() {
        //
        // main flare
        cylinder(
            h = 5,
            r1 = passthrough_radius_inner - wall_thickness + flare_radius,
            r2 = passthrough_radius_inner - wall_thickness + flare_radius,
            center = true);
        //
        // void
        cylinder(
            h = passthrough_height + 1,
            r1 = passthrough_radius_inner - wall_thickness,
            r2 = passthrough_radius_inner - wall_thickness,
            center = true);
    }  
}

// outer grommet
translate([0,(passthrough_radius_outer + flare_radius)*2.25,0]) {
    difference() {
        // 
        // main tube
        cylinder(
            h = passthrough_height,
            r1 = passthrough_radius_outer,
            r2 = passthrough_radius_outer,
            center = true);
        //
        // void
        cylinder(
            h = passthrough_height + 1,
            r1 = passthrough_radius_outer - wall_thickness,
            r2 = passthrough_radius_outer - wall_thickness,
            center = true);
    }
}

// outer grommet base flare
translate([0,(passthrough_radius_outer + flare_radius)*2.25,-(passthrough_height + flare_thickness)/2]) {
    difference() {
        //
        // main flare
        cylinder(
            h = 5,
            r1 = passthrough_radius_inner - wall_thickness + flare_radius,
            r2 = passthrough_radius_inner - wall_thickness + flare_radius,
            center = true);
        //
        // void
        cylinder(
            h = passthrough_height + 1,
            r1 = passthrough_radius_inner - wall_thickness,
            r2 = passthrough_radius_inner - wall_thickness,
            center = true);
    }  
}


