module latch() {
    buttDiameter = 14;
    buttRadius = buttDiameter/2;
    stemLength = 17;
    latchLength = 28;
    hingeHoleDiameter = 4;
    toothWidth = 2;
    scaleFactor = 24.5 / 16;
    resolution = 100;
    tongueHoleDiameter = 5;
    tongueHoleRadius = tongueHoleDiameter / 2;
    tongueHoleDepth = 10;
    latchWidth = buttDiameter / 2;
    tongueHoleMargin = 1;
    
    module _hingeSide() {
        difference() {
            union() {
                circle(d=buttDiameter);
                polygon(points=[
                    [-buttRadius, 0],
                    [buttRadius, 0],
                    [buttRadius, stemLength],
                    [0, stemLength],
                ]);
            };
            circle(d=hingeHoleDiameter);
        };
    };
    
    module _tongueSide() {
        
        polygon(points=[
            [0, stemLength],
            [-buttRadius+toothWidth, stemLength+2],
            [-buttRadius, stemLength],
            [-buttRadius, latchLength-4],
            [-buttRadius+toothWidth, latchLength],
            [buttRadius, latchLength],
            [buttRadius, stemLength],
        ]);
    }
    
    scale(v=[scaleFactor, scaleFactor, scaleFactor]) {
        difference() {
            linear_extrude(height=7, $fn=resolution) {
                union() {
                    _hingeSide();
                    _tongueSide();
                };
            };
            translate([
                -tongueHoleDepth/4,
                latchLength-tongueHoleRadius-tongueHoleMargin,
                latchWidth/2,
            ]) {
                rotate([0, 90, 0]) {
                    cylinder(
                        r=tongueHoleRadius, 
                        h=tongueHoleDepth + 0.15, 
                        $fn=resolution
                    );
                };
            };
        }
    }
}

latch();
    