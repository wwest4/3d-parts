module AutoPhoneChargerAssembly() {
    wallWidth = 6;
    phoneLength = 148;
    phoneHeight = 10;
    phoneWidth = 70;
    
    PhoneBox(
        wallWidth=wallWidth,
        phoneHeight=phoneHeight,
        phoneWidth=phoneWidth,
        phoneLength=phoneLength
    );
    
    translate([0,phoneWidth+wallWidth*2,0]) {
        ChargerBox(wallWidth=wallWidth);
    }
}

module PhoneBox(wallWidth, phoneLength, phoneHeight, phoneWidth) {
    PhoneCover(wallWidth=wallWidth, phoneWidth=phoneWidth, phoneLength=phoneLength);

    translate([0,0,wallwidth/4]) difference() {
        linear_extrude(height=phoneHeight) { 
            square(size=[phoneLength+wallWidth, phoneWidth+wallWidth], center=true);
        }
        linear_extrude(height=phoneHeight) { 
            square(size=[phoneLength, phoneWidth], center=true);
        }
        translate([phoneLength/2+wallWidth/4,0,-wallWidth/4]) {
            CableThroughHole(wallWidth=wallWidth);
        }
   }
}

module ChargerBox(wallWidth) {
    chargerHeight = 10;
    chargerWidth = 72;
    chargerLength = chargerWidth;
    
    translate([0,0,chargerHeight+wallWidth]) rotate([0,180,0]) difference() {
        linear_extrude(height=chargerHeight+wallWidth) { 
            square(size=chargerWidth+wallWidth, center=true);
        }
        linear_extrude(height=chargerHeight+wallWidth/2) { 
            square(size=chargerWidth, center=true);
        }
        translate([chargerLength/2+wallWidth/4,0,0]) {
            CableThroughHole(wallWidth=wallWidth);
        }
    }
}

module CableThroughHole(wallWidth) {
    width = 12.5;
    height = 7.5;
    
    translate([0,0,wallWidth/2]) linear_extrude(height=height) { 
       square(size=[wallWidth/2, width], center=true);
    }
}

module PhoneCover(wallWidth, phoneLength, phoneWidth) {
    difference() {
        linear_extrude(height=wallWidth/4) { 
            square(size=[phoneLength+wallWidth, phoneWidth+wallWidth], center=true);
        }
        linear_extrude(height=wallWidth) { 
            square(size=[phoneLength-wallWidth/2, phoneWidth-wallWidth/2], center=true);
        }
    }
}

scale(1,1,1) translate([0,0,0]) AutoPhoneChargerAssembly();