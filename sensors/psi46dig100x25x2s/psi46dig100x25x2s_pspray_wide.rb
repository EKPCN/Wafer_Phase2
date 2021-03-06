InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 25e3,
  'cellSizeY' => 100e3,
  'nX1' => 13, #left and middle pixel
  'nX2' => 12, #right pixel
  'nY' => 80,
  'dX' => 600e3,
  'dY' => 100e3,
#   IMPLANT
  'implantSizeX' => 15.0e3,
  'implantSizeY' => 90e3,
  'metalOH' => 3e3,
  'shiftX' => 0.0e3,
#   VIA
  'viaX0' => 0.0e3, 
  'viaY0' => 25.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => 0.0e3,
  'bPY0' => 0.0e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 0.0e3, 
  'PTY0' => 0.0e3,
  'PTholeDia' => 0e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 0e3,
  'bLWidth' => 0e3,	#bias line
  'bLHoleWidth' => 0e3,
  'bDotDia' => 0e3,	#bias dot
  'PTviaDia' => 0e3,
  'PTpStopWidth' => 0e3,
  'innerPTmetalOH' => 0.0e3,
#   PSTOP
  'PSdistX' => 0e3,
  'PSdistY' => 0e3,
  'PSwidth' => 0e3,
  'PSrIn' => 2e3,
  'PSrOut' => 5e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}

LargePixel = {
  
#   PIXEL GRID
  'cellSizeX' => 275e3,
  'cellSizeY' => 100e3,
  'nX' => 13,
  'nY' => 80,
  'dX' => 600e3,
  'dY' => 100e3,
#   IMPLANT
  'implantSizeX' => 265.0e3,
  'implantSizeY' => 90e3,
  'metalOH' => 3e3,
  'shiftX' => 0.0e3,
#   ROUTING
  'routingwidth' => 4e3,
  'routingdist' => 7e3, #dist from routing line to pad
#   VIA
  'viaX0' => 57.50e3, 
  'viaY0' => 25.0e3,
  'viaDia' => 5e3,
#   PSTOP
  'PSdistX' => 0e3,
  'PSdistY' => 0e3,
  'PSwidth' => 0e3,
  'PSrIn' => 2e3,
  'PSrOut' => 5e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}
  
LargePixelBPPar = [
#   BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  75.0e3, 0.0e3,150e3,0e3,
]


LargePixel1 = {
#   BUMP PAD 1
  'bPX0' => -125.0e3,
  'bPY0' => 0.0e3,
}

LargePixel2 = {
#   BUMP PAD 2
  'bPX0' => 75.0e3,
  'bPY0' => 0.0e3,
}

LargePixel3 = {
#   BUMP PAD for large pixel w/o routing
  'bPX0' => 50.0e3,
  'bPY0' => 0.0e3,
}


BumpPad = {
  
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
}
  
PixelGrid = {

    'sizeX' => 7800e3,
    'sizeY' => 8000e3
}

#   PERIPHERY


BiasRing = {

    'distX' => 18e3,
    'distY' => 18e3,
    'width' => 88e3,
    'rOut' => 79e3,
    'rIn' => 0,
    
    'outerX' => 7952e3,
    'outerY' => 8375e3,
    'aluOuterX' => 7952e3,
    'aluOuterY' => 8420e3,  
    
    'aluDistX' => 5.5e3,
    'aluDistY' => 5.5e3,
    'aluWidth' => 123e3,
    'aluROut' => 101.5e3,
    'aluRIn' => 0,

    'bumpDia' => 12e3,
    'bumpX0' => 13e3,
    'bumpY0' => -250.64e3,
} 

GuardRing = {

    'distX' => 158e3,
    'distY' => 158e3+81.5e3,
    'width' => 28e3,
    'rIn' => 131e3,
    'rOut' => 159e3,
    
    'aluDistX' => 145.5e3,
    'aluDistY' => 145.5e3+81.5e3,
    'aluWidth' => 73e3,
    'aluROut' => 191.5e3,
    'aluRIn' => 118.5e3,
    
    'x0' => 0e3,
    'y0' => -69.32e3,
    
    'bumpDia' => 12e3,
    'bumpX0' => 13e3,
    'bumpY0' => -350.64e3,
}

PixelEdge = {
    
    'distX' => 426e3,
    'distY' => 426e3+81.5e3,
    'sizeX' => 10000e3,
    'sizeY' => 10000e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3+81.5e3,
    'aluSizeX' => 9920e3,
    'aluSizeY' => 9920e3,

    'outerX0'    => 0,
    'outerY0'    => -69.32e3
}