InnerImplant = {

    'sizeX' => 98e3,
    'sizeY' => 48e3,
    'metalOH' => -1.5e3  
}

OuterImplant = {

    'sizeX' => 248e3,
    'sizeY' => 48e3,
    'metalOH' => -1.5e3,  
}

UpperImplant = {

    'sizeX' => 98e3,
    'sizeY' => 148e3,
    'metalOH' => -1.5e3,  
}

CornerImplant = {

    'sizeX' => 248e3,
    'sizeY' => 148e3,
    'metalOH' => -1.5e3,  
}

InnerImplantPT = {

    'x0' => -25e3, 
    'y0' => 0,
    'holeDia' => 3e4,
    'implantDia' => 1e4,
    'biasLineWidth' => 1e3,
    'biasLineHoleWidth' => 2e3,
    'biasDotDia' => 5e3,
    'pStopRIn' => 15e3,
    'pStopROut' => 2e4,
}

PixelGrid = {

    'sizeX' => 8100e3,
    'sizeY' => 8100e3
}

InnerPixelGrid = {
  
    'sizeX' => 150e3,
    'sizeY' => 100e3,
    'nX' => 25,
    'nY' => 79,
    'dX' => 300e3,
    'dY' => 100e3 
}

OuterPixelGrid = {

    'sizeX' => 300e3,
    'sizeY' => 100e3,
    'nX' => 1,
    'nY' => 79,
    'dX' => 0,
    'dY' => 100e3
}

UpperPixelGrid = {

    'sizeX' => 150e3,
    'sizeY' => 200e3,
    'nX' => 25,
    'nY' => 1,
    'dX' => 300e3,
    'dY' => 0
}

CornerPixelGrid = {

    'sizeX' => 300e3,
    'sizeY' => 200e3,
    'nX' => 1,
    'nY' => 1,
    'dX' => 0,
    'dY' => 0  
}

InnerPStop = {

    'distX' => 12e3,
    'distY' => 12e3,
    'width' => 8e3,
    'rIn' => 4e3,
    'rOut' => 12.5e3,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

OuterPStop = {
  
    'distX' => 12e3,
    'distY' => 12e3,
    'width' => 8e3,
    'rIn' => 4e3,
    'rOut' => 12.5e3,
    'openX0' => 61e3,
    'openY0' => 36e3,
    'openWidth' => 28e3, 
}

UpperPStop = {

    'distX' => 12e3,
    'distY' => 12e3,
    'width' => 8e3,
    'rIn' => 4e3,
    'rOut' => 12.5e3,
    'openX0' => 61e3,
    'openY0' => -39e3,
    'openWidth' => 28e3,
}

CornerPStop = {

    'distX' => 12e3,
    'distY' => 12e3,
    'width' => 8e3,
    'rIn' => 4e3,
    'rOut' => 12.5e3,
    'openX0' => -89e3,
    'openY0' => -94e3,
    'openWidth' => 28e3,
}

Via = {

    'sizeX' => 24e3,
    'sizeY' => 24e3
}

BumpPad = {

    'dia' => 30e3   
}

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