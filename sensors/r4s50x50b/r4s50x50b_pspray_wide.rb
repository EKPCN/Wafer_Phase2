PixelUnitCell = {

    'sizeX' => 50e3,
    'sizeY' => 50e3,
}

InnerImplant = {

    'sizeX' => 40e3,
    'sizeY' => 40e3,
    'radius' => 4e3,
    'metalOH' => 3e3  
}

OuterImplant = {
  
    'sizeX' => 40e3,
    'sizeY' => 65e3,
    'radius' => 4e3,
    'metalOH' => 3e3 
         
}

PixelGrid = {

    'sizeX' => 7750e3,
    'sizeY' => 8025e3
}

InnerPixelGrid = {
  
    'sizeX' => 50e3,
    'sizeY' => 50e3,
    'nX' => 77,
    'nY' => 159,
    'dX' => 100e3,
    'dY' => 50e3 
}

OuterPixelGrid = {

    'sizeX' => 50e3,
    'sizeY' => 75e3,
    'nX' => 77,
    'nY' => 1,
    'dX' => 100e3,
    'dY' => 0
}

InnerPStop = {

    'distX' => 0,
    'distY' => 0,
    'width' => 0,
    'rIn' => 0,
    'rOut' => 0,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

InnerVia = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => 12e3,
    'y0'    => 10e3,
}

OuterVia = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => 12e3,
    'y0'    => 10e3,
}

BumpPad = {

    'bPDia' => 20e3,
    'bPDiaPassivation' => 12e3,  
}

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
    'bumpY0' => -200e3,
    
} 

GuardRing = {

    'distX' => 158e3,
    'distY' => 158e3+52.5e3,
    'width' => 28e3,
    'rIn' => 131e3,
    'rOut' => 159e3,
    
    'aluDistX' => 145.5e3,
    'aluDistY' => 145.5e3+52.5e3,
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