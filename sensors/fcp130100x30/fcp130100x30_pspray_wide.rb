InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 100e3,
  'cellSizeY' => 30e3,
  'nX' => 24,
  'nY' => 78,
  'dX' => 200e3,
  'dY' => 30e3,
#   IMPLANT
  'implantSizeX' => 90.0e3,
  'implantSizeY' => 20e3,
  'metalOH' => 3e3,
  'shiftX' => 0.0e3,
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

InnerPixel1 = {
#   VIA
  'viaX0' => 25.0e3, 
  'viaY0' => 0.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => -30.0e3,
  'bPY0' => 0.0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
}

InnerPixel2 = {
#   VIA
  'viaX0' => -25.0e3, 
  'viaY0' => 0.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => 10.0e3,
  'bPY0' => 0.0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
}


PixelGrid = {

    'sizeX' => 4800e3,
    'sizeY' => 4680e3,
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
    'sizeX' => 7200e3,
    'sizeY' => 7200e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3,
    'aluSizeX' => 7120e3,
    'aluSizeY' => 7120e3,

    'outerX0'    => 0,
    'outerY0'    => -150e3
}