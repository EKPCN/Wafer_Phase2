InnerPixel = {
  
#   PIXEL GRID
  'cellSizeX' => 150e3,
  'cellSizeY' => 100e3,
  'nX' => 25,
  'nY' => 79,
  'dX' => 300e3,
  'dY' => 100e3,
#   IMPLANT
  'implantSizeX' => 114e3,
  'implantSizeY' => 64e3,
  'metalOH' => 5e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -21.0e3,
  'viaDia' => 8e3,
#   BUMP PAD
  'bPX0' => 25e3,
  'bPY0' => 0e3,
  'bPDia' => 30e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => -25e3, 
  'PTY0' => 0e3,
  'PTholeDia' => 48e3,	#minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 12e3,
  'bLWidth' => 13e3,	#bias line
  'bLHoleWidth' => 29e3,
  'bDotDia' => 22e3,	#bias dot
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 4e3,
  'PTminDistToEdge' => 3e3,
#   extra parameters needed to reproduce FPIXF
  'innerPTmetalOH' => 5.0e3,
  'metalOHatPTside' => 2.5e3,
  'globalBLWidth' => 15.0e3,
#   PSTOP
  'PSdistX' => 16e3,
  'PSdistY' => 16e3,
  'PSwidth' => 2e3,
  'PSrIn' => 2e3,
  'PSrOut' => 0e3,
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
  'implantSizeX' => 264e3,
  'implantSizeY' => 64e3,
  'metalOH' => 5e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -21.0e3,
  'viaDia' => 8e3,
#   BUMP PAD
  'bPX0' => 50e3,
  'bPY0' => 0e3,
  'bPDia' => 30e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 100.0e3, 
  'PTY0' => 0e3,
  'PTholeDia' => 48e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 12e3,
  'bLWidth' => 13e3,
  'bLHoleWidth' => 29e3,
  'bDotDia' => 22e3,
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 4e3,
  'PTminDistToEdge' => 3e3,
#   extra parameters needed to reproduce FPIXF
  'innerPTmetalOH' => 5.0e3,
  'metalOHatPTside' => 2.5e3,
  'globalBLWidth' => 15.0e3,
#   PSTOP
  'PSdistX' => 16e3,
  'PSdistY' => 16e3,
  'PSwidth' => 2e3,
  'PSrIn' => 2e3,
  'PSrOut' => 0e3,
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
  'implantSizeX' => 114e3,
  'implantSizeY' => 165.5e3,
  'metalOH' => 5e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -21.0e3,
  'viaDia' => 8e3,
#   BUMP PAD
  'bPX0' => 25e3,
  'bPY0' => -50e3,
  'bPDia' => 30e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => -25e3, 
  'PTY0' => 50e3,
  'PTholeDia' => 48e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 12e3,
  'bLWidth' => 13e3,
  'bLHoleWidth' => 29e3,
  'bDotDia' => 22e3,
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 4e3,
  'PTminDistToEdge' => 3e3,
#   extra parameters needed to reproduce FPIXF
  'innerPTmetalOH' => 5.0e3,
  'metalOHatPTside' => 2.5e3,
  'globalBLWidth' => 15.0e3,
#   PSTOP
  'PSdistX' => 16e3,
  'PSdistY' => 15.25e3,
  'PSwidth' => 2e3,
  'PSrIn' => 2e3,
  'PSrOut' => 0e3,
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
  'implantSizeX' => 264e3,
  'implantSizeY' => 164e3,
  'metalOH' => 5e3,
#   VIA
  'viaX0' => 12.0e3, 
  'viaY0' => -21.0e3,
  'viaDia' => 8e3,
#   BUMP PAD
  'bPX0' => 50e3,
  'bPY0' => -50e3,
  'bPDia' => 30e3,
  'bPDiaPassivation' => 10e3,
#   PUNCH THROUGH STRUCTURE
  'PTX0' => 100e3, 
  'PTY0' => 50e3,
  'PTholeDia' => 48e3, #minimum biasDotDia+2*metalOH (+2*PTpStopWidth)
  'PTimplantDia' => 12e3,
  'bLWidth' => 13e3,
  'bLHoleWidth' => 29e3,
  'bDotDia' => 22e3,
  'PTviaDia' => 5e3,
  'PTpStopWidth' => 4e3,
  'PTminDistToEdge' => 3e3,
#   extra parameters needed to reproduce FPIXF
  'innerPTmetalOH' => 5.0e3,
  'metalOHatPTside' => 2.5e3,
  'globalBLWidth' => 15.0e3,
#   PSTOP
  'PSdistX' => 16e3,
  'PSdistY' => 16e3,
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