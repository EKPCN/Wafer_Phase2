InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 100e3,
  'cellSizeY' => 25e3,
#<<<<<<< HEAD
#  'nX' => 38,
#=======
  'nX' => 39,
  'nY' => 160,
  'dX' => 200e3,
  'dY' => 25e3,
#   IMPLANT
  'implantSizeX' => 85e3,
  'implantSizeY' => 10e3,
  'metalOH' => 1e3,
  'shiftX' => 2.25e3,
#   VIA
  'viaX0' => 25.0e3, 
  'viaY0' => 0.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => -25.0e3,
  'bPY0' => 0.0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 52.25e3, 
  'PTY0' => 12.5e3,
  'PTholeDia' => 30e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 10e3,
  'bLWidth' => 3e3,	#bias line
  'bLHoleWidth' => 10e3,
  'bDotDia' => 16e3,	#bias dot
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 0e3,
  'innerPTmetalOH' => 1.0e3,
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

PixelGrid = {

#<<<<<<< HEAD
#    'sizeX' => 7710e3,
#=======
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
    'outerY0'    => -150e3
}

RightImplant = {

    'sizeX' => 85e3,
    'sizeY' => 35e3,
    'radius' => 4e3,
    'metalOH' => 2.5e3  
}

RightPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nX' => 1,
    'nY' => 160,
    'dX' => 7700e3,
    'dY' => 50e3 
}
