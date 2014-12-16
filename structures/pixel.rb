module Pixel

  include RBA
  
  # Initialize cell in which the structures are created 
  
  def Pixel.init(cell)
    $Cell = cell
  end

  # Creates an implant 
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param layerM [layer] Material for contact metal
  # @param metalOH [int] Metal overhang
  # @param x0 [int] X postion of the center of the implant
  # @param y0 [int] Y postion of the center of the implant
  # return [Nill]

  def Pixel.createImplant(layer,x,y,layerM=nil,metalOH=0,x0=0,y0=0)
    implant = Basic.createRoundBox(x,y,x0,y0)
    metal = Basic.createRoundBox(x+2*metalOH, y+2*metalOH, x0, y0)
    $Cell.shapes(layer).insert(implant)
    $Cell.shapes(layerM).insert(metal)
  end
  
  # Creates a grid
  # @param pixel [cell] Base structure cell
  # @param nx [int] Number of pixels in x direction
  # @param ny [int] Number of pixels in y direction
  # @param distX [int] Distance between two pixel cells in x direction
  # @param distY [int] Distance between two pixel cells in y direction
  # @param x0 [int] X position of the center of the first pixel
  # @param y0 [int] Y position of the center of the first pixel
  # @param rot [deg] Angle of rotation in degree
  # @param mir [bool] Mirror the cell on the x axis
  # @return [Nill]

  def Pixel.createGrid(pixel,nx=1,ny=1,distX=0,distY=0,x0=0,y0=0,rot=0,mir=false) 
  
    for i in 0..nx-1
      for j in 0..ny-1
        Merge.cells($Cell,pixel,x0+(i*distX),y0+(j*distY),rot,mir)
      end
    end    
  end

  # Creates a via
  # @param layer [layer] Used material 
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0 [int] X postion of the center of the via
  # @param y0 [int] Y postion of the center of the via  
  # @return [Nill]

  def Pixel.createVia(layer,x,y,x0=0,y0=0)
    box = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    box.move(x0,y0)
    $Cell.shapes(layer).insert(box)
  end

  # Creates a via grid (WILL BE EDITED!!!)
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param nx [int] Number of vias in x direction
  # @param ny [int] Number of vias in y direction
  # @param distX [int] Distance between two vias in x direction
  # @param distY [int] Distance between two vias in y direction
  # @param x0 [int] X postion of the center of the first via
  # @param y0 [int] Y postion of the center of the first via  
  # @return [Nill]
  
  def Pixel.createViaGrid(layer,x,y,nx,ny,distX,distY,x0=0,y0=0)
    
    for i in 0..nx-1
      for j in 0..ny-1
        box = Polygon.new(Box.new((i*distX),(j*distY),(i*distX)+x,(j*distY)+y))
        box.move(x0,y0)
        $Cell.shapes(layer).insert(box)
      end
    end

  end

  # Creates a BumpPad
  # @param layer [layer] Used material
  # @param dia [int] Diameter of the BumpPad
  # @param x0 [int] X postion of the center of the BumpPad
  # @param y0 [int] Y postion of the center of the BumpPad
  # @return [Nill]

  def Pixel.createBumpPad(layer,dia,x0=0,y0=0)
    bump = Basic.createOctagon(dia,x0,y0)
    
    $Cell.shapes(layer).insert(bump)
  end

  # Creates a open/closed pStop
  # @param layer [layer] Used material
  # @param x [int] Size x of the inner edge of the ring
  # @param y [int] Size y of the inner edge of the ring
  # @param width [int] Width of the ring
  # @param rOut [int] Outer radius of the corner
  # @param rIn [int] Inner radius of the corner
  # @param oX [int] X position of the lower left corner of the opening
  # @param oY [int] Y position of the lower left corner of the opening
  # @param oW [int] Size of the opening
  # @param horizontal [bool] Is the opening horizontal or vertical?
  # @param x0 [int] X position of the center of the ring
  # @param y0 [int] Y position of the center of the ring
  # @return [Nill]

  def Pixel.createPStop(layer, x, y, width, rOut, rIn, oX=0, oY=0, oW=0, horizontal=true ,x0=0, y0=0)
        
    ring = Basic.createRing(x,y,width,rIn,rOut)

    if horizontal
    
      openBox = Polygon.new(Box.new(oX,oY,oX+oW,oY+width))
      ringOpen = Cut.polyVector([ring,openBox])
    
      endPoly1 = Polygon.new(Box.new(oX-(width/2.0),oY,oX+(width/2.0),oY+width))
      endCirc1 = endPoly1.round_corners(0,(width/2.0),32)
    
      endPoly2 = Polygon.new(Box.new(oX+oW-(width/2.0),oY,oX+oW+(width/2.0),oY+width))
      endCirc2 = endPoly2.round_corners(0,(width/2.0),32)
      
    else
      
      openBox = Polygon.new(Box.new(oX,oY,oX+width,oY+oW))
      ringOpen = Cut.polyVector([ring,openBox])
    
      endPoly1 = Polygon.new(Box.new(oX,oY-(width/2.0),oX+width,oY+(width/2.0)))
      endCirc1 = endPoly1.round_corners(0,(width/2.0),32)
    
      endPoly2 = Polygon.new(Box.new(oX,oY+oW-(width/2.0),oX+width,oY+oW+(width/2.0)))
      endCirc2 = endPoly2.round_corners(0,(width/2.0),32)      
         
    end
     
    pStop = Merge.polyVector([ringOpen,endCirc1,endCirc2])
    pStop.move(x0,y0)
    
    $Cell.shapes(layer).insert(pStop)
   
  end


end