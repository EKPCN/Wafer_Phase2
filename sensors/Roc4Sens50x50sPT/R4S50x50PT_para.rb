InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 50e3,
  'cellSizeY' => 50e3,
  'nX' => 75,
  'nY' => 158,
  'dX' => 100e3,
  'dY' => 50e3,
#   IMPLANT
  'implantSizeX' => 37e3,
  'implantSizeY' => 37e3,
  'metalOH' => 3e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -12.0e3,
  'viaDia' => 5e3,
#   BUMP PAD
  'bPX0' => 12e3,
  'bPY0' => 12e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => -5.5e3, 
  'PTY0' => -5.5e3,
  'PTholeDia' => 21e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 3e3,
  'bLWidth' => 5e3,	#bias line
  'bLHoleWidth' => 14e3,
  'bDotDia' => 9e3,	#bias dot
  'PTviaDia' => 2e3,
  'PTpStopWidth' => 3e3,
#   PSTOP
  'PSdistX' => 5e3,
  'PSdistY' => 5e3,
  'PSwidth' => 3e3,
  'PSrIn' => 2e3,
  'PSrOut' => 5e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}

OuterPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 300e3,
  'cellSizeY' => 100e3,
  'nX' => 1,
  'nY' => 79,
  'dX' => 0,
  'dY' => 100e3,
#   IMPLANT
  'implantSizeX' => 248e3,
  'implantSizeY' => 48e3,
  'metalOH' => 3e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -12.0e3,
  'viaDia' => 7e3,
#   BUMP PAD
  'bPX0' => 50e3,
  'bPY0' => 0e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 112.0e3, 
  'PTY0' => 12.0e3,
  'PTholeDia' => 21e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 3e3,
  'bLWidth' => 5e3,
  'bLHoleWidth' => 14e3,
  'bDotDia' => 9e3,
  'PTviaDia' => 2e3,
  'PTpStopWidth' => 3e3,
  #   PSTOP
  'PSdistX' => 12e3,
  'PSdistY' => 12e3,
  'PSwidth' => 8e3,
  'PSrIn' => 4e3,
  'PSrOut' => 12.5e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0, 
}

UpperPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 150e3,
  'cellSizeY' => 200e3,
  'nX' => 25,
  'nY' => 1,
  'dX' => 300e3,
  'dY' => 0,
#   IMPLANT
  'implantSizeX' => 98e3,
  'implantSizeY' => 148e3,
  'metalOH' => 3e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -12.0e3,
  'viaDia' => 7e3,
#   BUMP PAD
  'bPX0' => 25e3,
  'bPY0' => -50e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => -37e3, 
  'PTY0' => -62e3,
  'PTholeDia' => 21e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 3e3,
  'bLWidth' => 5e3,
  'bLHoleWidth' => 14e3,
  'bDotDia' => 9e3,
  'PTviaDia' => 2e3,
  'PTpStopWidth' => 3e3,
#   PSTOP
  'PSdistX' => 12e3,
  'PSdistY' => 12e3,
  'PSwidth' => 8e3,
  'PSrIn' => 4e3,
  'PSrOut' => 12.5e3,
  'PSopenX0' => 0,
  'PSopenY0' => 0,
  'PSopenWidth' => 0,
}

CornerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 300e3,
  'cellSizeY' => 200e3,
  'nX' => 1,
  'nY' => 1,
  'dX' => 0,
  'dY' => 0,
#   IMPLANT
  'implantSizeX' => 248e3,
  'implantSizeY' => 148e3,
  'metalOH' => 3e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -12.0e3,
  'viaDia' => 7e3,
#   BUMP PAD
  'bPX0' => 50e3,
  'bPY0' => -50e3,
  'bPDia' => 20e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 112e3, 
  'PTY0' => -62e3,
  'PTholeDia' => 21e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 3e3,
  'bLWidth' => 5e3,
  'bLHoleWidth' => 14e3,
  'bDotDia' => 9e3,
  'PTviaDia' => 2e3,
  'PTpStopWidth' => 3e3,
#   PSTOP
  'PSdistX' => 12e3,
  'PSdistY' => 12e3,
  'PSwidth' => 8e3,
  'PSrIn' => 4e3,
  'PSrOut' => 12.5e3,
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