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
  'metalOH' => 1e3,
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
  'cellSizeX' => 525e3,
  'cellSizeY' => 100e3,
  'nX' => 12,
  'nY' => 80,
  'dX' => 600e3,
  'dY' => 100e3,
#   IMPLANT
  'implantSizeX' => 515.0e3,
  'implantSizeY' => 90e3,
  'metalOH' => 1e3,
  'shiftX' => 0.0e3,
#   ROUTING
  'routingwidth' => 6e3,
  'routingdist' => 5e3, #dist from routing line to pad
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
#   ROUTING BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  -100.0e3, 0.0e3,-275e3,0e3,
#   BP3
  200.0e3,0e3,275e3,0e3,
]


LargePixelBP = {
#   PIXEL BUMP PAD
  'bPX0' => 0.0e3,
  'bPY0' => 0.0e3,
}


LeftPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 282.5e3,
  'nX' => 1,
#   IMPLANT
  'implantSizeX' => 272.5e3,
#   PIXEL BUMP PAD
  'bPX0' => -121.25e3,
  'bPY0' => 0.0e3,
}

LeftPixelBPPar = [
#   ROUTING BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  78.75e3, 0.0e3,153.75e3,0e3,
]
  
UpperRow = {
  
  'Yplus' => 100.0e3,
  'nY' => 1,
}

RightPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 207.5e3,
  'nX' => 1,
#   IMPLANT
  'implantSizeX' => 197.5e3,
#   BUMP PAD
  'bPX0' => 83.75e3,
  'bPY0' => 0.0e3,
}

BumpPad = {
  
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
}
  
PixelGrid = {

    'sizeX' => 7740e3,
    'sizeY' => 8000e3
}

#   PERIPHERY


BiasRing = {

    'distX' => 18e3,
    'distY' => 18e3,
    'width' => 88e3,
    'rOut' => 79e3,
    'rIn' => 0,
    
    'aluDistX' => 5.5e3,
    'aluDistY' => 5.5e3,
    'aluWidth' => 123e3,
    'aluROut' => 101.5e3,
    'aluRIn' => 0
} 

GuardRing = {

    'distX' => 158e3,
    'distY' => 158e3,
    'width' => 28e3,
    'rIn' => 131e3,
    'rOut' => 159e3,
    
    'aluDistX' => 145.5e3,
    'aluDistY' => 145.5e3,
    'aluWidth' => 73e3,
    'aluROut' => 191.5e3,
    'aluRIn' => 118.5e3
}

PixelEdge = {
    
    'distX' => 426e3,
    'distY' => 426e3,
    'sizeX' => 10000e3,
    'sizeY' => 10000e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3,
    'aluSizeX' => 9920e3,
    'aluSizeY' => 9920e3,

    'outerX0'    => 0,
    'outerY0'    => -150e3
}