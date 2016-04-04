PixelUnitCell = {

    'sizeX' => 100e3,
    'sizeY' => 25e3,
}

Implant = {

    'sizeX' => 84e3,
    'sizeY' => 9e3,
    'radius' => 4e3,
    'metalOH' => 3e3  
}

ImplantAlu1 = {

#    'sizeX' => 65e3,
#    'sizeY' => 16e3,
#    'x0' => 13e3,
#    'y0' => 0,
#    'radius' => 4e3
 
    'sizeX' => 65e3,
    'sizeY' => 16e3,
    'x0' => 13e3,
    'y0' => 0,
    'radius' => 4e3
}

ImplantRouting = {
    'sizeX' => 53e3,
    'sizeY' => 15e3
}

BumpPad1 = {

    'dia' => 12e3,
    'x0'  => 25e3,
    'y0'  => 25e3   
}

BumpPad2 = {
    'dia' => 12e3,
    'x0'  => -25e3,
    'y0'  => -12.5e3  
}


PixelGrid = {

    'sizeY' => 9600e3,
    'sizeX' => 20000e3
}

PixelGrid1 = {
  
    'sizeX' => 100e3,
    'sizeY' => 25e3,
    'nY' => 192,
    'nX' => 200,
    'dX' => 100e3,
    'dY' => 50e3 
}

InnerPStop = {

    'distX' => 6e3,
    'distY' => 6e3,
    'width' => 0e3,
    'rIn' => 2e3,
    'rOut' => 2e3,
    'openX0' => 0,
    'openY0' => 0,
    'openWidth' => 0,
}

Via10 = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => -2.5e3,
    'y0'    => 0
}

Via11 = {

    'sizeX' => 5e3,
    'sizeY' => 5e3,
    'x0'    => 31.5e3,
    'y0'    => 0
}

Via2 = {

    'sizeX' => 5e3,
    'sizeY' => 4e3,
    'x0'    => 30e3,
    'y0'    => 0
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
    'sizeY' => 11800e3,
    'sizeX' => 22200e3,

    'aluDistX' => 376e3,
    'aluDistY' => 376e3,
    'aluSizeY' => 11720e3,
    'aluSizeX' => 22130e3,

    'outerX0'    => 0,
    'outerY0'    => 0
}
