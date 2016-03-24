InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 50e3,
  'cellSizeY' => 50e3,
  'nX' => 77,
  'nY' => 80,
  'dX' => 100e3,
  'dY' => 50e3,
#   IMPLANT
  'implantSizeX' => 32e3,
  'implantSizeY' => 36e3,
  'metalOH' => 3e3,
  'shiftX' => 2e3,
#   VIA
  'viaX0' => -12.5e3, 
  'viaY0' => 12.5e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => 0.0e3,
  'bPY0' => -12.5e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 27.0e3, 
  'PTY0' => 25e3,
  'PTholeDia' => 38e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 10e3,
  'bLWidth' => 3e3,	#bias line
  'bLHoleWidth' => 10e3,
  'bDotDia' => 16e3,	#bias dot
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 4e3,
  'innerPTmetalOH' => 3.0e3,
#   PSTOP
  'PSdistX' => 7.0e3,
  'PSdistY' => 5.0e3,
  'PSwidth' => 2.0e3,
  'PSrIn' => 2e3,
  'PSrOut' => 0e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}

PixelGrid = {

    'sizeX' => 7764e3,
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