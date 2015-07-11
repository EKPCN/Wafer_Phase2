PixelUnitCell = {

    'sizeX' => 100e3,
    'sizeY' => 25e3,
}

InnerImplant = {

    'sizeX' => 90e3,
    'sizeY' => 15e3,
    'radius' => 4e3,
    'metalOH' => 1e3  
}

PixelGrid = {

    'sizeX' => 8000e3,
    'sizeY' => 8000e3
}

InnerPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nX' => 78,
    'nY' => 160,
    'dX' => 100e3,
    'dY' => 50e3 
}

OuterPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nX' => 2,
    'nY' => 160,
    'dX' => 7900e3,
    'dY' => 50e3 
}

GridPStop = {

    'distX' => 5e3,
    'distY' => 5e3,
    'width' => 0,
    'rIn' => 4e3,
    'rOut' => 9e3,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

InnerPStop = {

    'distX' => 5e3,
    'distY' => 5e3,
    'width' => 0,
    'rIn' => 4e3,
    'rOut' => 0e3,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

OuterPStop = {

    'distX' => 5e3,
    'distY' => 5e3,
    'width' => 0,
    'rIn' => 4e3,
    'rOut' => 9e3,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

InnerVia = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => -25e3,
    'y0'    => 0e3,
}

OuterVia = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => 50e3,
    'y0'    => 0,
}

BumpPad = {

    'dia' => 12e3,   
    'x0'  => 25e3,
    'y0'  => 0
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
    'aluSizeX' => 9880e3,

    'aluSizeY' => 10180e3,

    'outerX0'    => 0,
    'outerY0'    => -150e3
}
