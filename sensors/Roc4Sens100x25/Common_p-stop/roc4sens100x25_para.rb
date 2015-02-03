InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 100e3,
  'cellSizeY' => 25e3,
  'nX' => 81,
  'nY' => 162,
  'dX' => 100e3,
  'dY' => 50e3,
#   IMPLANT
  'implantSizeX' => 90e3,
  'implantSizeY' => 15e3,
  'metalOH' => 1e3,
#   VIA
  'viaX0' => 0.0e3, 
  'viaY0' => 0.0e3,
  'viaDia' => 6e3,
#   BUMP PAD
  'bPX0' => -25e3,
  'bPY0' => 0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 34e3, 
  'PTY0' => 0e3,
  'PTholeDia' => 12e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 4e3,
  'bLWidth' => 2e3,	#bias line
  'bLHoleWidth' => 8e3,
  'bDotDia' => 5e3,	#bias dot
  'PTviaDia' => 3e3,
  'PTpStopWidth' => 1.5e3,
  'PTminDistToEdge' =>3e3,
#   PSTOP
  'PSdistX' => 3e3,
  'PSdistY' => 3e3,
  'PSwidth' => 2e3,
  'PSrIn' => 2e3,
  'PSrOut' => 0e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}

PixelGrid = {

    'sizeX' => 8100e3,
    'sizeY' => 8100e3
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
    'sizeX' => 9960e3,
    'sizeY' => 10260e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3,
    'aluSizeX' => 9960e3,
    'aluSizeY' => 10260e3,

    'outerX0'    => 0,
    'outerY0'    => -150e3
}