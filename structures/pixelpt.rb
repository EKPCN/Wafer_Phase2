module PixelPT
  include RBA
  
  def PixelPT.init(cell)
    $Cell = cell
  end



  def PixelPT.createImplant(layer, x, y, rinner=0, router=0, positionx=0, positiony=0, x0=0, y0=0, windowwidthinmetalforbiasline=0, biaslinewidth=0, biaslineoverlap = 0)
#     
# 		Create pixel implant or the metal over the implant
 
#		layer
#		 -> the layer for the shapes created (in this case implant or metal) 
# 		x/y
#		-> are the dimensions of the pixel (i.e. implantSizeX for implant and implantSizeX+2*metaloverhang for metal

#		all other parameters only for punch through biasing scheme
#		the punch through and biasline are always created at the left side of the pixel. the pixel cell can later be rotated with i.e.:
	# cellRotated = $layout.create_cell("cellRotated")
    # inst = RBA::CellInstArray::new( cellNotRotated.cell_index, RBA::Trans::new(2, false, par['pStopSizeX'], par['pStopSizeY']) )  # cell has to be shifted after (point) rotation!!
    # cellRotated.insert(inst)

#		rinner/router
#		-> are the radii of the punch through inner circle (rinner) and the hole (router) in the implant/metal 
#		positionx/y 
# 		-> the coordinates of the center of the punch through relative to the lower left corner of the implant/metal
#		x0/y0
#		-> the coordinates of the lower left corner of the implant/metal relative to the lower left corner of the pstop implant
#		windowwidthinmetalforbiasline
# 		-> vertical size of the window in the metal for the biasline
#		biaslinewidth
#		-> width of the biasline
#     biaslineoverlap
#		-> overlap to next cell for connection of the biasline to the bias ring. has to be at least pstopradius + the distance from pstop to the bias ring
#     
#     
#    standard
    implantPoly = Polygon.new(Box.new(0,0,x,y))
    
#     introduce window in metal for the biasline
    if windowwidthinmetalforbiasline!=0
      #std hole
      hole = Polygon.new(Box.new(0,positiony-windowwidthinmetalforbiasline/2,positionx-rinner,positiony+windowwidthinmetalforbiasline/2))
      tmp = Cut.polyVector([hole,implantPoly])
#      TODO make edges round at transition to inner circle
      implantPoly = tmp
    end
    
	# TODO make pixel corner radius interactive
    implanttmp = implantPoly.round_corners(0,5e3,50)
    
    
    
    
#     hole for punch through in implant
    if router>0
      hole = NFunc.create_polycirc(router,positionx,positiony)
      
      
#       PROBLEM HERE: two points remaining in the hole...
      tmp = Merge.polyVector([hole,implanttmp])
      implant = Cut.polyVector([hole,tmp])
      
      #hole = Polygon.new(Box.new(0,positiony-windowwidthinmetalforbiasline/2,positionx-rinner,positiony+windowwidthinmetalforbiasline/2))
      #implant = Cut.polyVector([hole,tmp],false,true,-1)
      if windowwidthinmetalforbiasline!=0
        cornerx = positionx - Math.sqrt(router*router-windowwidthinmetalforbiasline*windowwidthinmetalforbiasline/4)
        cornery1 = positiony - windowwidthinmetalforbiasline/2
        cornery2 = positiony + windowwidthinmetalforbiasline/2
        tmp = implant
        hole = NFunc.create_polycirc(1e3,cornerx,cornery1)
        implant = Merge.polyVector([hole,tmp])
        
        tmp = implant
        implant = Cut.polyVector([hole,tmp])
        
#        cornerx = positionx - Math.sqrt(router*router-windowwidthinmetalforbiasline*windowwidthinmetalforbiasline/4)
      end
    else
		# do nothing
      implant = implanttmp
    end
    
	# insert the implant/metal into the pixel cell at position (x0,y0)
    implstd = implant.transformed(Trans.new(0, false, x0, y0))
    $Cell.shapes(layer).insert(implstd)
    
	
	
#     create inner punch through circle implant / metal and bias line
    if rinner>0
      ptimplant = NFunc.create_polycirc(rinner,positionx,positiony)
      pti = ptimplant.transformed(Trans.new(0, false, x0, y0))
      if biaslinewidth==0
        #no bias line (for implant)
        $Cell.shapes(layer).insert(pti)
      else
        #create biasline (for metal)
		# horizontal part
        padtobiasline = Polygon.new(Box.new(0,y0+positiony-biaslinewidth/2,x0+positionx,y0+positiony+biaslinewidth/2))
		# vertical part
        biasline = Polygon.new(Box.new(0,-biaslineoverlap,biaslinewidth,2*y0+y+biaslineoverlap))
		# merge both with punch through dot
        biasmetal = Merge.polyVector([padtobiasline,biasline,pti])
        $Cell.shapes(layer).insert(biasmetal)
      end
    end
  end
  


  def PixelPT.createGrid(pixel,nx,ny,distX,distY,x0=0,y0=0)   
    
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

  def PixelPT.createGridInstance(pixel,nx,ny,distX,distY)
    for i in 0..nx
      instArray = CellInstArray.new(pixel.cell_index,CplxTrans.new(distX,distY))
      $Cell.insert(instArray)
    end
  end


  def PixelPT.createCellGrid(pixel,nx,ny,distX,distY,x0=0,y0=0) 
  
    for i in 0..nx-1
      for j in 0..ny-1
        Merge.cells($Cell,pixel,x0+(i*distX),y0+(j*distY))
      end
    end
  end


  def PixelPT.createVia(layer,x,y,x0=0,y0=0)
    box = Polygon.new(Box.new(0,0,x,y))
    box.move(x0,y0)
    $Cell.shapes(layer).insert(box)
  end
  
  
  def PixelPT.createSeveralRoundVia(layer,rad,x,y1,y2,implantx1,implanty1,implantx2,implanty2)
#     std vias
    circ = NFunc.create_polycirc(rad)
    
#     positive direction
    i=1
    
    while i*x + rad < implantx2 do
      j=1
      
      while j*y2 + rad < implanty2 do
	
	via1 = circ.transformed(RBA::Trans.new(0, false, x*i, y1+y2*(j-1)))
	via2 = circ.transformed(RBA::Trans.new(0, false, x*i, y2*j))
	$Cell.shapes(layer).insert(via1)
	$Cell.shapes(layer).insert(via2)
	j+=1
      end
      i+=1
    end
      
#       negative direction
    i=0
    
    while i*x - rad > implantx1 do
      j=-1
      
      while j*y2 - rad > implanty1 do
	
	via1 = circ.transformed(RBA::Trans.new(0, false, x*i, -y1+y2*(j+1)))
	via2 = circ.transformed(RBA::Trans.new(0, false, x*i, y2*j))
	$Cell.shapes(layer).insert(via1)
	$Cell.shapes(layer).insert(via2)
	j-=1
      end
      i-=1
    end
  end
  
  
  
  def PixelPT.createCircle(layer,rad,x0=0,y0=0)
    circ = NFunc.create_polycirc(rad,x0,y0)
    $Cell.shapes(layer).insert(circ)
  end


  def PixelPT.createCRing(layer,rinner,router,x0=0,y0=0)
    cring = NFunc.create_polycring(rinner,router,x0,y0)
    $Cell.shapes(layer).insert(cring)
  end

  
  def PixelPT.createViaGrid(layer,x,y,nx,ny,distX,distY,x0=0,y0=0)
    
    for i in 0..nx-1
      for j in 0..ny-1
        box = Polygon.new(Box.new((i*distX),(j*distY),(i*distX)+x,(j*distY)+y))
        box.move(x0,y0)
        $Cell.shapes(layer).insert(box)
      end
    end

  end


  def PixelPT.createBumpPad(layer,dia,x0=0,y0=0)
    bump = Basic.createOctagon(dia,x0,y0)
    
    $Cell.shapes(layer).insert(bump)
  end


  def PixelPT.createPStop(layer, x, y, width, rOut, rIn, oX, oY, oW, horizontal=true ,x0=0, y0=0)
    
    outerRingPoly = Polygon.new(Box.new(0,0,x,y))
    outerRing = outerRingPoly.round_corners(0,rOut,32)
    innerRingPoly = Polygon.new(Box.new(width,width,x-width,y-width))
    innerRing = innerRingPoly.round_corners(0,rIn,32)
    
    ring = Cut.polyVector([outerRing,innerRing])
    
    if horizontal==true
    
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