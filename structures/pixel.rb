module Pixel

  include RBA
  
  def Pixel.init(cell)
    $Cell = cell
  end


  def Pixel.createImplant(layer,x,y,x0=0,y0=0)
    implant = Basic.createRoundBox(x,y,x0,y0)
    
    $Cell.shapes(layer).insert(implant)
  end


  def Pixel.createGrid(pixel,nx,ny,distX,distY,x0=0,y0=0)   
    
    $layout.layer_indices.each do |layer|     
      pixel.shapes(layer).each do |shape|     
        shape.transform(CplxTrans.new(x0,y0))
        for i in 0..ny-1
          for j in 0..nx-1  
            $Cell.shapes(layer).insert(shape)                 
            shape.transform(CplxTrans.new(distX,0))                     
          end   
          shape.transform(CplxTrans.new(-nx*distX,distY))      
        end          
      end
    end
    
  end

  def Pixel.createGridInstance(pixel,nx,ny,distX,distY)
    for i in 0..nx
      instArray = CellInstArray.new(pixel.cell_index,CplxTrans.new(distX,distY))
      $Cell.insert(instArray)
    end
  end


  def Pixel.createCellGrid(pixel,nx,ny,distX,distY,x0=0,y0=0) 
  
    for i in 0..nx-1
      for j in 0..ny-1
        cell = $layout.create_cell("Pixel_#{i}_#{j}")
        cell.copy_shapes(pixel)
        Merge.cells($Cell,cell,x0+(i*distX),y0+(j*distY))
      end
    end  
    
    pixel.delete
  
  end


  def Pixel.createVia(layer,x,y,x0=0,y0=0)
    box = Polygon.new(Box.new(0,0,x,y))
    box.move(x0,y0)
    $Cell.shapes(layer).insert(box)
  end


  
  def Pixel.createViaGrid(layer,x,y,nx,ny,distX,distY,x0=0,y0=0)
    
    for i in 0..nx-1
      for j in 0..ny-1
        box = Polygon.new(Box.new((i*distX),(j*distY),(i*distX)+x,(j*distY)+y))
        box.move(x0,y0)
        $Cell.shapes(layer).insert(box)
      end
    end

  end


  def Pixel.createBumpPad(layer,dia,x0=0,y0=0)
    bump = Basic.createOctagon(dia,x0,y0)
    
    $Cell.shapes(layer).insert(bump)
  end


  def Pixel.createPStop(layer, x, y, width, rOut, rIn, oX, oY, oW, horizontal=true ,x0=0, y0=0)
    
    outerRingPoly = Polygon.new(Box.new(0,0,x,y))
    outerRing = outerRingPoly.round_corners(0,rOut,50)
    innerRingPoly = Polygon.new(Box.new(width,width,x-width,y-width))
    innerRing = innerRingPoly.round_corners(0,rIn,50)
    
    ring = Cut.polyVector([outerRing,innerRing])
    
    if horizontal==true
    
      openBox = Polygon.new(Box.new(oX,oY,oX+oW,oY+width))
      ringOpen = Cut.polyVector([ring,openBox])
    
      endPoly1 = Polygon.new(Box.new(oX-(width/2.0),oY,oX+(width/2.0),oY+width))
      endCirc1 = endPoly1.round_corners(0,(width/2.0),50)
    
      endPoly2 = Polygon.new(Box.new(oX+oW-(width/2.0),oY,oX+oW+(width/2.0),oY+width))
      endCirc2 = endPoly2.round_corners(0,(width/2.0),50)
      
    else
      
      openBox = Polygon.new(Box.new(oX,oY,oX+width,oY+oW))
      ringOpen = Cut.polyVector([ring,openBox])
    
      endPoly1 = Polygon.new(Box.new(oX,oY-(width/2.0),oX+width,oY+(width/2.0)))
      endCirc1 = endPoly1.round_corners(0,(width/2.0),50)
    
      endPoly2 = Polygon.new(Box.new(oX,oY+oW-(width/2.0),oX+width,oY+oW+(width/2.0)))
      endCirc2 = endPoly2.round_corners(0,(width/2.0),50)      
         
    end
    
    
    pStop = Merge.polyVector([ringOpen,endCirc1,endCirc2])
    pStop.move(x0,y0)
    
    $Cell.shapes(layer).insert(pStop)
    
  end


end