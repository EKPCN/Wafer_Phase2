AllPixel = {
  
#   PIXEL GRID
  'nX' => 8,
  'nY' => 13,
  'dX' => 900e3,
  'dY' => 600e3,
#   IMPLANT
  'metalOH' => 3e3,
  'shiftX' => 0.0e3,
#   ROUTING
  'routingwidth' => 5e3,
  'routingdist' => 9e3, #dist from routing line to pad
#   VIA
  'viaX0' => 17.5e3, 
  'viaY0' => 25.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
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

EdgePixel = {
  
#   PIXEL GRID
  'dX' => 300e3,
  'dY' => 100e3,
  'nXl' => 1,
  'nXr1' => 2,
  'nXr2' => 1,
  'nXu1' => 26,
  'nXu2' => 26,
  'nYu' => 2,
}
  
Pixel1 = {
  
#   PIXEL GRID
  'cellSizeX' => 150e3,
  'cellSizeY' => 100e3,
#   IMPLANT
  'implantSizeX' => 137.0e3,
  'implantSizeY' => 87e3,
#   BUMP PAD
  'bPX0' => 25.0e3,
  'bPY0' => 0.0e3,
}

Pixel2 = {
  
#   PIXEL GRID
  'cellSizeX' => 350e3,
  'cellSizeY' => 100e3,
#   IMPLANT
  'implantSizeX' => 337.0e3,
  'implantSizeY' => 87e3,
#   BUMP PAD
  'bPX0' => -75.0e3,
  'bPY0' => 0.0e3,
}
  
Pixel2BPPar = [
#   BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  25.0e3, 0.0e3,200e3,25e3,
]

Pixel3 = {
  
#   PIXEL GRID
  'cellSizeX' => 200e3,
  'cellSizeY' => 200e3,
#   IMPLANT
  'implantSizeX' => 187.0e3,
  'implantSizeY' => 187e3,
#   BUMP PAD
  'bPX0' => -50.0e3,
  'bPY0' => 50.0e3,
}
  
Pixel3BPPar = [
#   BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  -50.0e3, -50.0e3,125e3,125e3,
]

Pixel4 = {
  
#   PIXEL GRID
  'cellSizeX' => 100e3,
  'cellSizeY' => 200e3,
#   IMPLANT
  'implantSizeX' => 87.0e3,
  'implantSizeY' => 187e3,
#   BUMP PAD
  'bPX0' => 0.0e3,
  'bPY0' => -50.0e3,
}
  
Pixel4BPPar = [
#   BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2
  0.0e3, 50.0e3,25e3,125e3,
]

PixelI = {
  
#   PIXEL GRID
  'cellSizeX' => 50e3,
  'cellSizeY' => 50e3,
#   IMPLANT
  'implantSizeX' => 37.0e3,
  'implantSizeY' => 37e3,
#   VIA
  'viaX0' => 0e3, 
  'viaY0' => 0e3,
}
  
PixelIIBPPar = [
#   BUMP PAD COORDINATES X,Y and PIXEL CENTER X,Y
#   BP2

  25.0e3, 25.0e3,25.0e3,25.0e3,
]


  
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
    'outerY0'    => 0
}
