module showerDoorstop() {
    length = 128;
    height = 48;
    innerWidth = 72;
    wallThickness = 24;
    floorThickness = 16;
    scaleFactor = 25.4 / 64;
   
   
    module _floor() {
        polygon(points=[
            [0, 0],
            [0, innerWidth],
            [floorThickness, innerWidth],
            [floorThickness, 0],
        ]);
    };
    
    module _side() {
        polygon(points=[
            [0, 0],
            [0, wallThickness],
            [height, wallThickness],
            [height, 0],
        ]);
    }
    
    scale([scaleFactor, scaleFactor, scaleFactor]) {
        rotate([0, -90, 0]) {
            linear_extrude(height=length, center=true) {
                union() {
                    _floor();
                    translate(v=[0, -wallThickness, 0]) {
                        _side();
                    }
                     translate(v=[0, innerWidth, 0]) {
                        _side();
                    }
                }
            }
        }
    }
}

showerDoorstop();
    

  