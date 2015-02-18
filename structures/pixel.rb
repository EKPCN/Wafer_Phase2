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

  def Pixel.createImplant(layer,x,y,layerM=nil,metalOH=0,x0=0,y0=0,r=5000)
    implant = Basic.createRoundBox(x,y,x0,y0,r)
    metal = Basic.createRoundBox(x+2*metalOH, y+2*metalOH, x0, y0, r)
    $Cell.shapes(layer).insert(implant)
    $Cell.shapes(layerM).insert(metal)
  end
  
  # Create a punch through implant (implant with hole)
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param d [int] diameter of PT hole
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.createPTImplant(layer,x,y,x0PT,y0PT,dHole,dImplant=0,x0=0,y0=0)
  
    implant = Basic.createRoundBox(x,y,x0,y0)
    ptHole = Basic.createCircle(dHole,x0PT,y0PT)
    implantHole = Cut.polyVector([implant,ptHole])
    ptImplant = Basic.createCircle(dImplant,x0PT,y0PT)
    
    $Cell.shapes(layer).insert(ptImplant)
    $Cell.shapes(layer).insert(implantHole)
      
  end
  
  # Creates the punch through metal 
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param d [int] diameter of PT hole
  # @param blHoleWidth [int] Width of the cut in the metal layer for the bias line
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.createPTMetal(layer,x,y,x0PT,y0PT,d,blHoleWidth,x0=0,y0=0)

    implantPoly = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    
    if x0PT < 0
      biasLineHole = Polygon.new(Box.new(-x/2,y0PT-blHoleWidth/2,x0PT-d/2,y0PT+blHoleWidth/2))
    else
      biasLineHole = Polygon.new(Box.new(x0PT+d/2,y0PT-blHoleWidth/2,x/2,y0PT+blHoleWidth/2))
    end
    
    ptHole = Basic.createCircle(d,x0PT,y0PT,40)
    
    implant = Cut.polyVector([biasLineHole,implantPoly,ptHole])
    implantBLPT = implant.round_corners(0,5e3,32)
    
    dy = 3e3
    
    # some mathematics
    
    alpha = Math.asin((blHoleWidth/2.0+dy)/(d/2.0))
    rTrans = dy/(1.0-Math.sin(alpha))
    dx = Math.cos(alpha)*rTrans
    
    # cuts
    
    if x0PT < 0
      upperCutPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(d/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(d/2),y0PT+(blHoleWidth/2.0)+dy))  
      lowerCutPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(d/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(d/2),y0PT-(blHoleWidth/2.0)-dy))       
      upperCirc = Basic.createCircle(2*rTrans,x0PT-Math.cos(alpha)*(d/2.0)-dx,y0PT+(blHoleWidth/2.0)+rTrans,40)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT-Math.cos(alpha)*(d/2.0)-dx,y0PT-(blHoleWidth/2.0)-rTrans,40)
    else
      upperCutPoly = Polygon.new(Box.new(x0PT+Math.cos(alpha)*(d/2.0),y0PT,x0PT+Math.cos(alpha)*(d/2)+dx,y0PT+(blHoleWidth/2.0)+dy))  
      lowerCutPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(d/2.0),y0PT,x0PT+Math.cos(alpha)*(d/2)+dx,y0PT-(blHoleWidth/2.0)-dy))       
      upperCirc = Basic.createCircle(2*rTrans,x0PT+Math.cos(alpha)*(d/2.0)+dx,y0PT+(blHoleWidth/2.0)+rTrans,40)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT+Math.cos(alpha)*(d/2.0)+dx,y0PT-(blHoleWidth/2.0)-rTrans,40)
    end
    
    tmp = Merge.polyVector([lowerCutPoly,implantBLPT,upperCutPoly])
    tmpImplant = Cut.polyVector([lowerCutPoly,tmp,upperCutPoly])
    
    implant = Merge.polyVector([upperCirc,tmpImplant,lowerCirc])
    
    $Cell.shapes(layer).insert(implant)
  end
  
  # Creates the bias structure for the punch throughs
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param dDot [int] Diameter of PT connection dot
  # @param blLength [int] Length of the bias line
  # @param blWidth [int] Width of the bias line 
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.createPTBiasLine(layer,x,y,x0PT,y0PT,dDot,blLength,blWidth,x0=0,y0=0)
  
    dot = Basic.createCircle(dDot,x0PT,y0PT)
    
    if x0PT < 0
      biasLine = Polygon.new(Box.new(x0PT-blLength,y0PT-blWidth/2.0,x0PT,y0PT+blWidth/2.0)) 
    else
      biasLine = Polygon.new(Box.new(x0PT,y0PT-blWidth/2.0,x0PT+blLength,y0PT+blWidth/2.0)) 
    end
    biasBase = Merge.polyVector([dot,biasLine])
    
    dy = 5e2
        
    alpha = Math.asin((blWidth/2.0+dy)/(dDot/2.0))
    rTrans = dy/(1.0-Math.sin(alpha))
    dx = Math.cos(alpha)*rTrans
    
    if x0PT < 0
      upperPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(dDot/2.0),y0PT+(blWidth/2.0)+dy))  
      lowerPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(dDot/2.0),y0PT-(blWidth/2.0)-dy)) 
      upperCirc = Basic.createCircle(2*rTrans,x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT+(blWidth/2.0)+rTrans,40)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT-(blWidth/2.0)-rTrans,40)
    else
      upperPoly = Polygon.new(Box.new(x0PT+Math.cos(alpha)*(dDot/2.0),y0PT,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT+(blWidth/2.0)+dy))  
      lowerPoly = Polygon.new(Box.new(x0PT+Math.cos(alpha)*(dDot/2.0),y0PT,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT-(blWidth/2.0)-dy)) 
      upperCirc = Basic.createCircle(2*rTrans,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT+(blWidth/2.0)+rTrans,40)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT-(blWidth/2.0)-rTrans,40)
    end
    
    biasTmp = Merge.polyVector([lowerPoly,biasBase,upperPoly])
    biasTmp2 = Merge.polyVector([upperCirc,biasTmp,lowerCirc])    
    biasTmp3 = Cut.polyVector([upperCirc,biasTmp2,lowerCirc])

    distY = 35e3
    
    if x0PT < 0
      globalBiasLine = Polygon.new(Box.new(x0PT-blLength-blWidth,-y/2.0-distY,x0PT-blLength,y/2.0+distY))
      biasTmp4 = Merge.polyVector([biasTmp3,globalBiasLine])
    else
      globalBiasLine = Polygon.new(Box.new(x0PT+blLength,-y/2.0-distY,x0PT+blLength+blWidth,y/2.0+distY))
      biasTmp4 = Merge.polyVector([biasTmp3,globalBiasLine])
    end
    
    rTrans = 13e2
    
    if x0PT < 0
      upperPoly = Polygon.new(Box.new(x0PT-blLength,y0PT+blWidth/2.0,x0PT-blLength+rTrans,y0PT+blWidth/2.0+rTrans))
      lowerPoly = Polygon.new(Box.new(x0PT-blLength,y0PT-blWidth/2.0,x0PT-blLength+rTrans,y0PT-blWidth/2.0-rTrans))
      upperCirc = Basic.createCircle(2*rTrans,x0PT-blLength+rTrans,y0PT+blWidth/2.0+rTrans)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT-blLength+rTrans,y0PT-blWidth/2.0-rTrans)
    else
      upperPoly = Polygon.new(Box.new(x0PT+blLength,y0PT+blWidth/2.0,x0PT+blLength-rTrans,y0PT+blWidth/2.0+rTrans))
      lowerPoly = Polygon.new(Box.new(x0PT+blLength,y0PT-blWidth/2.0,x0PT+blLength-rTrans,y0PT-blWidth/2.0-rTrans))
      upperCirc = Basic.createCircle(2*rTrans,x0PT+blLength-rTrans,y0PT+blWidth/2.0+rTrans)
      lowerCirc = Basic.createCircle(2*rTrans,x0PT+blLength-rTrans,y0PT-blWidth/2.0-rTrans)
    end
    biasTmp = Merge.polyVector([lowerPoly,biasTmp4,upperPoly])
    biasTmp2 = Merge.polyVector([upperCirc,biasTmp,lowerCirc])    
    bias = Cut.polyVector([upperCirc,biasTmp2,lowerCirc])
      
    $Cell.shapes(layer).insert(bias)
  end

  # Creates the pstop ring in the punch through bias scheme
  # @param layer [layer] Material
  # @param x0PT [int] X Position of the punch through center
  # @param y0PT [int] Y Position of the punch through center
  # @param dIn [int] Inner diameter of the pstop ring
  # @param dOut [int] Outer diameter of the pstop ring
  
  def Pixel.createPTPStop(layer, x0PT, y0PT, dIn, dOut)
    
    pStop = Basic.createCircRing(dIn,dOut,x0PT,y0PT)    
    $Cell.shapes(layer).insert(pStop) 
  end


  # Creates the via in the punch through bias scheme
  # @param layer [layer] Material
  # @param x0PT [int] X Position of the punch through center
  # @param y0PT [int] Y Position of the punch through center
  # @param d [int] Diameter of the via

  def Pixel.createPTVia(layer, x0PT, y0PT, d)

    via = Basic.createCircle(d,x0PT,y0PT)
    $Cell.shapes(layer).insert(via)    
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
    bumpCircle = Basic.createCircle(dia,x0,y0)
    $Cell.shapes(layer).insert(bump)
    $Cell.shapes(layer).insert(bumpCircle)
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