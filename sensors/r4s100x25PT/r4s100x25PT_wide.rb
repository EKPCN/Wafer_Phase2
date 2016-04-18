InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 100e3,
  'cellSizeY' => 25e3,
  'nX' => 78,
  'nY' => 160,
  'dX' => 100e3,
  'dY' => 50e3,
#   IMPLANT
  'implantSizeX' => 90e3,
  'implantSizeY' => 15e3,
  'metalOH' => 1e3,
#   VIA
  'viaX0' => 0.0e3, 
  'viaY0' => 0.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => 25e3,
  'bPY0' => 0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 12e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => -30.5e3, 
  'PTY0' => 0e3,
  'PTholeDia' => 17e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 3e3,
  'bLWidth' => 5e3,	#bias line
  'bLHoleWidth' => 14e3,
  'bDotDia' => 9e3,	#bias dot
  'PTviaDia' => 2e3,
  'PTpStopWidth' => 0e3,
  'minDistToEdge' =>2e3,
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
    
    'outerX' => 8012e3,
    'outerY' => 8212e3+130e3,
    'aluOuterX' => 8012e3,
    'aluOuterY' => 8212e3+130e3+45e3,
    
    'aluDistX' => 5.5e3,
    'aluDistY' => 5.5e3,
    'aluWidth' => 123e3,
    'aluROut' => 101.5e3,
    'aluRIn' => 0,
    
    'bumpDia' => 12e3,
    'bumpX0' => 25e3,
    'bumpY0' => -212.5e3,
    
} 

GuardRing = {

    'distX' => 158e3,
    'distY' => 158e3+65e3,
    'width' => 28e3,
    'rIn' => 131e3,
    'rOut' => 159e3,
    
    'aluDistX' => 145.5e3,
    'aluDistY' => 145.5e3+65e3,
    'aluWidth' => 73e3,
    'aluROut' => 191.5e3,
    'aluRIn' => 118.5e3,
    
    'x0' => 0e3,
    'y0' => -65e3,
}

PixelEdge = {
    
    'distX' => 426e3,
    'distY' => 426e3+65e3,
    'sizeX' => 10000e3,
    'sizeY' => 10000e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3+65e3,
    'aluSizeX' => 9920e3,
    'aluSizeY' => 9920e3,

    'outerX0'    => 0,
    'outerY0'    => 0
}