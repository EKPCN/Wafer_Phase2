PixelUnitCell = {

    'sizeX' => 100e3,
    'sizeY' => 25e3,
}

InnerImplant = {

    'sizeX' => 85e3,
    'sizeY' => 10e3,
    'radius' => 4e3,
    'metalOH' => 2.5e3  
}

PixelGrid = {

    'sizeX' => 7800e3,
    'sizeY' => 8000e3
}

InnerPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nX' => 76,
    'nY' => 160,
    'dX' => 100e3,
    'dY' => 50e3 
}

OuterPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nX' => 1,
    'nY' => 160,
    'dX' => 7700e3,
    'dY' => 50e3 
}

RightImplant = {

    'sizeX' => 85e3,
    'sizeY' => 35e3,
    'radius' => 4e3,
    'metalOH' => 2.5e3  
}

RightPixelGrid = {
  
    'sizeX' => 100e3,
    'sizeY' => 50e3,
    'nX' => 1,
    'nY' => 160,
    'dX' => 7700e3,
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

    'distX' => 0,
    'distY' => 0,
    'width' => 0,
    'rOut' => 0,
    'rIn' => 0,
    
    'aluDistX' => 0,
    'aluDistY' => 0,
    'aluWidth' => 0,
    'aluROut' => 0e3,
    'aluRIn' => 0
} 

GuardRing = {

    'distX' => 0e3,
    'distY' => 0,
    'width' => 0,
    'rIn' => 0,
    'rOut' => 0,
    
    'aluDistX' => 0,
    'aluDistY' => 0.0,
    'aluWidth' => 0,
    'aluROut' => 0.0e3,
    'aluRIn' => 0e3
}

PixelEdge = {
    
    'distX' => 799.5e3,
    'distY' => 799.5e3,
    'sizeX' => 9960e3,
    'sizeY' => 10150e3,

    'aluDistX' => 749.5e3,
    'aluDistY' => 749.5e3,
    'aluSizeX' => 9880e3,

    'aluSizeY' => 10070e3,

    'outerX0'    => 0,
    'outerY0'    => 0e3
}
