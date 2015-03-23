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

  def Pixel.implant(layer,x,y,layerM=nil,metalOH=0,x0=0,y0=0,r=5000)
    implant = Basic.roundBox(x,y,x0,y0,r)
    metal = Basic.roundBox(x+2*metalOH, y+2*metalOH, x0, y0, r)
    $Cell.shapes(layer).insert(implant)
    $Cell.shapes(layerM).insert(metal)
  end
  
  # Create a punch through implant (implant with hole)
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param dHole [int] diameter of PT hole
  # @param dImplant [int] diameter of inner PT implant
  # @param minDistToEdge [int] minimum distance to edge of implant
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.ptImplant(layer,x,y,x0PT,y0PT,dHole,dImplant=0,minDistToEdge=0,x0=0,y0=0)
    if (x0PT).abs+dHole/2<x/2 && (y0PT).abs+dHole/2<y/2
      #standard PT
      implant = Basic.roundBox(x,y,x0,y0)
      if minDistToEdge!=0 && ((x0PT).abs + dHole/2.0 + minDistToEdge >= x/2.0 || (y0PT).abs + dHole/2.0 + minDistToEdge >= y/2.0)
        ptAddImplant = Basic.circle(dHole + 2.0*minDistToEdge,x0PT,y0PT)
        tmp = Merge.polyVector([implant,ptAddImplant])
        implant = tmp
      end
      ptHole = Basic.circle(dHole,x0PT,y0PT)
      tmp = Merge.polyVector([implant,ptHole])
      implantHole = Cut.polyVector([tmp,ptHole])
    else
      #common PT
      implantPoly = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
      implantPoly = implantPoly.round_corners(0,5e3,32) 
      ptHole = Basic.circle(dHole,x0PT,y0PT)
      tmp = Merge.polyVector([implantPoly,ptHole])
      implant = Cut.polyVector([tmp,ptHole])
      
      #round corners
      #corner parameter
      cp = 1.0e3
      #extra parameter to account for deviation from perfect circle
      ep = 0.5e3
      
      #calculate position for left and right box
      #NOW ONLY FOR UPPER RIGHT CORNER COMMOM PUNCH-THRU
      alphal = Math.acos((cp+y0PT-y/2)*2/dHole)
      rc = cp/(1-Math.cos(alphal))
      xl = x0PT-Math.sin(alphal)*(dHole/2+rc)
      lbox = Polygon.new(Box.new(xl,y/2-cp-ep,xl+rc*Math.sin(alphal),y/2))
      lcirc = Basic.circle(2*rc,xl,y/2-rc,30)
        
      alphar = Math.asin((cp+x0PT-x/2)*2/dHole)
      rc = cp/(1-Math.sin(alphar))
      yr = y0PT-Math.cos(alphar)*(dHole/2+rc)
      rbox = Polygon.new(Box.new(x/2-cp-ep,yr,x/2,yr+rc*Math.cos(alphar)))
      rcirc = Basic.circle(2*rc,x/2-rc,yr,30)
      
      tmpl = Merge.polyVector([lbox,lcirc])
      ptml = Cut.polyVector([tmpl,lcirc])
      tmpl = Cut.polyVector([ptml,lbox])
      tmpr = Merge.polyVector([rbox,rcirc])
      ptmr = Cut.polyVector([tmpr,rcirc])
      tmpr = Cut.polyVector([ptmr,rbox])
      
      tmp = Merge.polyVector([implant,lbox,rbox])
      ptm = Cut.polyVector([tmp,lbox,rbox])
      if yr>=5e3
        #check whether the cpt starts after the rounding of the implant corners (rad = 5 um). for small implant width in the order of y = 2*rad
        implantHole = Merge.polyVector([ptm,tmpl,tmpr])
      else
        implantHole = Merge.polyVector([ptm,tmpl,rcirc])
      end
    end
    ptImplant = Basic.circle(dImplant,x0PT,y0PT)
    implantHole.move(x0,y0)
    ptImplant.move(x0,y0)
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
  # @param minDistToEdge [int] minimum distance to edge of implant
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.ptMetal(layer,x,y,x0PT,y0PT,d,blHoleWidth,minDistToEdge=0,x0=0,y0=0)
    
    implantPoly = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    
      #increase size of metal around the pt
    if minDistToEdge!=0 && ((x0PT).abs + d/2.0 + minDistToEdge >= x/2.0 || (y0PT).abs + d/2.0 + minDistToEdge >= y/2.0)
    puts 'here'
      ptAddImplant = Basic.circle(d + 2.0*minDistToEdge,x0PT,y0PT)
      tmp = Merge.polyVector([implantPoly,ptAddImplant])
      implantPoly = tmp
    end
    
      #create box to cut a path in the implant for the bias line
    if x0PT < 0
      biasLineHole = Polygon.new(Box.new(-x/2-minDistToEdge,y0PT-blHoleWidth/2,x0PT,y0PT+blHoleWidth/2.0))
    else
      biasLineHole = Polygon.new(Box.new(x0PT,y0PT-blHoleWidth/2,x/2+minDistToEdge,y0PT+blHoleWidth/2.0))
    end
    
      #create hole in implant for the actual punch through
    ptHole = Basic.circle(d,x0PT,y0PT,40)
    
    tmp = Merge.polyVector([biasLineHole,ptHole])
    tmp1 = Merge.polyVector([implantPoly,biasLineHole])
    implant = Cut.polyVector([tmp1,tmp])
      #round corners (does not always work in transition from pt hole to bias line hole)
      #diameter of corners 
      #PUT IN PARAMETER FILE???
    outercornerdia = 5e3
    implantBLPT = implant.round_corners(0,outercornerdia,32)
    

      #make transition from pt hole to bias line hole round

      #define starting values for iteration
      #dy is the depth of the transition in y direction from the edge of the bias line window
    dy = 2e3
      #depth of the transition in x direction
      #needs to be smaller than the value in implantBLPT = implant.round_corners() => while
    dx = outercornerdia + 1e3
    
      #iteration for asin()
    while ((blHoleWidth/2.0+dy)/(d/2.0)).abs > 0.99 do
      dy -= 1e1
      
      if dy < 0.0
	  puts 'error! change dy'
	  break
      end
    end
    
      #iteration for dx
    while dx > outercornerdia/2.0 do
        #angle between (d/2, 0) and transition start with (0, 0) depicting the pt hole origin
      alpha = Math.asin((blHoleWidth/2.0+dy)/(d/2.0))
        #radius of transition
      rTrans = dy/(1.0-Math.sin(alpha))
        #depth of the transition in x direction
        #needs to be smaller than the value in implantBLPT = implant.round_corners() (currently 5e3)
      dx = Math.cos(alpha)*rTrans
      dy -= 1e2
    end
    
      #strange extra size to be larger than hole diameter needed for cut and merge routines to work
    spar = 1e0
    
      #parameters
    x0ucp = Math.cos(alpha)*(d/2.0)+dx
    x1ucp = Math.cos(alpha)*(d/2.0)
    y1ucp = (blHoleWidth/2.0)+dy
    yuc = (blHoleWidth/2.0)+rTrans
    x0ubc = x0ucp-rTrans-spar
    x1ubc = x0ucp+rTrans+spar
    y0ubc = (blHoleWidth/2.0)-spar
    y1ubc = (blHoleWidth/2.0)+2.0*rTrans+spar
    y1ulc = (blHoleWidth/2.0)+1.5*dy
    
    if x0PT >= 0
      x0ucp *= -1.0
      x1ucp *= -1.0
      y1ucp *= -1.0
      yuc *= -1.0
      x0ubc *= -1.0
      x1ubc *= -1.0
      y1ubc *= -1.0
      y1ulc *= -1.0
    end
    
      #create objects for rounding transitions
      #to be removed from implant
    upperCutPoly = Polygon.new(Box.new(x0PT-x0ucp,y0PT,x0PT-x1ucp,y0PT+y1ucp))
    lowerCutPoly = Polygon.new(Box.new(x0PT-x0ucp,y0PT,x0PT-x1ucp,y0PT-y1ucp))
    tmp = Merge.polyVector([lowerCutPoly,implantBLPT,upperCutPoly])
    tmpImplant = Cut.polyVector([lowerCutPoly,tmp,upperCutPoly])
      #the transition
    upperCirc = Basic.circle(2.0*rTrans,x0PT-x0ucp,y0PT+yuc,60)
    lowerCirc = Basic.circle(2.0*rTrans,x0PT-x0ucp,y0PT-yuc,60)
    upperBoxCirc = Polygon.new(Box.new(x0PT-x0ubc,y0PT+y0ubc,x0PT-x1ubc,y0PT+y1ubc))
    upperLeaveCirc = Polygon.new(Box.new(x0PT-x0ucp,y0PT+y0ubc,x0PT-x0ubc,y0PT+y1ulc))
    lowerBoxCirc = Polygon.new(Box.new(x0PT-x0ubc,y0PT+y0ubc,x0PT-x1ubc,y0PT-y1ubc))
    lowerLeaveCirc = Polygon.new(Box.new(x0PT-x0ucp,y0PT+y0ubc,x0PT-x0ubc,y0PT-y1ulc))
    
    tmpu = Cut.polyVector([upperBoxCirc,upperLeaveCirc])
    pmtu = Merge.polyVector([tmpu,upperCirc])
    mtpu = Cut.polyVector([tmpu,pmtu])
    tmpl = Cut.polyVector([lowerBoxCirc,lowerLeaveCirc])
    pmtl = Merge.polyVector([tmpl,lowerCirc])
    mtpl = Cut.polyVector([tmpl,pmtl])
    
    implant = Merge.polyVector([tmpImplant,mtpu,mtpl])
    
    implant.move(x0,y0)
    
    $Cell.shapes(layer).insert(implant)
  end
  
  # Creates the punch through metal 
  # @param layer [layer] Used material
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param d [int] diameter of PT hole
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.cptMetal(layer,x,y,x0PT,y0PT,d,x0=0,y0=0)
    
    implantPoly = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    outercornerdia = 5e3
    implantPoly = implantPoly.round_corners(0,outercornerdia,32)
    
    #create hole in implant for the actual punch through
    ptHole = Basic.circle(d,x0PT,y0PT,40)
    
    tmp = Merge.polyVector([implantPoly,ptHole])
    implantPoly = Cut.polyVector([tmp,ptHole])
    
    #round corners
    #corner parameter
    cp = 1.0e3
    #extra parameter to account for deviation from perfect circle
    ep = 0.5e3

    #calculate position for left and right box
    #NOW ONLY FOR UPPER RIGHT CORNER COMMOM PUNCH-THRU
    alphal = Math.acos((cp+y0PT-y/2)*2/d)
    rc = cp/(1-Math.cos(alphal))
    xl = x0PT-Math.sin(alphal)*(d/2+rc)
    lbox = Polygon.new(Box.new(xl,y/2-cp-ep,xl+rc*Math.sin(alphal),y/2))
    lcirc = Basic.circle(2*rc,xl,y/2-rc,30)
    
        
    alphar = Math.asin((cp+x0PT-x/2)*2/d)
    rc = cp/(1-Math.sin(alphar))
    yr = y0PT-Math.cos(alphar)*(d/2+rc)
    rbox = Polygon.new(Box.new(x/2-cp-ep,yr,x/2,yr+rc*Math.cos(alphar)))
    rcirc = Basic.circle(2*rc,x/2-rc,yr,30)
    
    tmpl = Merge.polyVector([lbox,lcirc])
    ptml = Cut.polyVector([tmpl,lcirc])
    tmpl = Cut.polyVector([ptml,lbox])
    tmpr = Merge.polyVector([rbox,rcirc])
    ptmr = Cut.polyVector([tmpr,rcirc])
    tmpr = Cut.polyVector([ptmr,rbox])
      
    tmp = Merge.polyVector([implantPoly,lbox,rbox])
    ptm = Cut.polyVector([tmp,lbox,rbox])
    implant = Merge.polyVector([ptm,tmpl,tmpr])
    
    
    implant.move(x0,y0)
    
    $Cell.shapes(layer).insert(implant)
  end  
  
  # Creates the bias structure for the punch throughs
  # @param layer [layer] Used material
  # @param pixSizeX [int] Pixel cell size in X
  # @param pixSizeY [int] Pixel cell size in Y
  # @param x0PT [int] x position of PT
  # @param y0PT [int] y position of PT
  # @param dDot [int] Diameter of PT connection dot
  # @param blWidth [int] Width of the internal bias line
  # @param globalBLwidth [int] Optional: width of the global bias line
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.ptBiasLine(layer,pixSizeX,pixSizeY,x0PT,y0PT,dDot,blWidth,globalBLwidth=0,x0=0,y0=0)
    
    dot = Basic.circle(dDot,x0PT,y0PT)
    
    #overlap of biasline into upper and lower pixel (defined by the distance of last pixel to the current collection ring)
    #PUT IN PARAMETER FILE?? 31 um only needed for 2 corner pixels in 100x25 not bricked design
    distY = 31e3
    
    #make global bias line with same width as the inner bias line
    if globalBLwidth==0
      globalBLwidth = blWidth
    end
    
    #check if common PT
    if (x0PT).abs+dDot/2+globalBLwidth<pixSizeX/2 && (y0PT).abs+dDot/2+globalBLwidth<pixSizeY/2
      
      if x0PT < 0
	blLength = pixSizeX/2.0 - globalBLwidth/2.0 + x0PT
	biasLine = Polygon.new(Box.new(x0PT-blLength,y0PT-blWidth/2.0,x0PT,y0PT+blWidth/2.0)) 
      else
	blLength = pixSizeX/2.0 - globalBLwidth/2.0 - x0PT
	biasLine = Polygon.new(Box.new(x0PT,y0PT-blWidth/2.0,x0PT+blLength,y0PT+blWidth/2.0)) 
      end
      biasBase = Merge.polyVector([dot,biasLine])
      
      #diameter of transition between bias dot and bias line (should be <(dDot-blWidth)/3.0))
      dy = (dDot-blWidth)/4.0
      
      alpha = Math.asin((blWidth/2.0+dy)/(dDot/2.0))
      rTrans = dy/(1.0-Math.sin(alpha))
      dx = Math.cos(alpha)*rTrans
      
      if x0PT < 0
	upperPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(dDot/2.0),y0PT+(blWidth/2.0)+dy))  
	lowerPoly = Polygon.new(Box.new(x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT,x0PT-Math.cos(alpha)*(dDot/2.0),y0PT-(blWidth/2.0)-dy)) 
	upperCirc = Basic.circle(2*rTrans,x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT+(blWidth/2.0)+rTrans,60)
	lowerCirc = Basic.circle(2*rTrans,x0PT-Math.cos(alpha)*(dDot/2.0)-dx,y0PT-(blWidth/2.0)-rTrans,60)
      else
	upperPoly = Polygon.new(Box.new(x0PT+Math.cos(alpha)*(dDot/2.0),y0PT,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT+(blWidth/2.0)+dy))  
	lowerPoly = Polygon.new(Box.new(x0PT+Math.cos(alpha)*(dDot/2.0),y0PT,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT-(blWidth/2.0)-dy)) 
	upperCirc = Basic.circle(2*rTrans,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT+(blWidth/2.0)+rTrans,60)
	lowerCirc = Basic.circle(2*rTrans,x0PT+Math.cos(alpha)*(dDot/2.0)+dx,y0PT-(blWidth/2.0)-rTrans,60)
      end
      
      biasTmp = Merge.polyVector([lowerPoly,biasBase,upperPoly])
      biasTmp2 = Merge.polyVector([upperCirc,biasTmp,lowerCirc])    
      biasTmp3 = Cut.polyVector([upperCirc,biasTmp2,lowerCirc])
      
      
      #diameter of transition between horizontal and vertical ("global") biasline
      rTrans = 1.0e3
      
      if x0PT < 0
	#create global biasline
	globalBiasLine = Polygon.new(Box.new(x0PT-blLength-globalBLwidth/2.0,-pixSizeY/2.0-distY,x0PT-blLength,pixSizeY/2.0+distY))
	#make the transition
	upperPoly = Polygon.new(Box.new(x0PT-blLength,y0PT+blWidth/2.0,x0PT-blLength+rTrans,y0PT+blWidth/2.0+rTrans))
	lowerPoly = Polygon.new(Box.new(x0PT-blLength,y0PT-blWidth/2.0,x0PT-blLength+rTrans,y0PT-blWidth/2.0-rTrans))
	upperCirc = Basic.circle(2*rTrans,x0PT-blLength+rTrans,y0PT+blWidth/2.0+rTrans)
	lowerCirc = Basic.circle(2*rTrans,x0PT-blLength+rTrans,y0PT-blWidth/2.0-rTrans)
      else
	#create global biasline
	globalBiasLine = Polygon.new(Box.new(x0PT+blLength,-pixSizeY/2.0-distY,x0PT+blLength+globalBLwidth,pixSizeY/2.0+distY))
	#make the transition
	upperPoly = Polygon.new(Box.new(x0PT+blLength,y0PT+blWidth/2.0,x0PT+blLength-rTrans,y0PT+blWidth/2.0+rTrans))
	lowerPoly = Polygon.new(Box.new(x0PT+blLength,y0PT-blWidth/2.0,x0PT+blLength-rTrans,y0PT-blWidth/2.0-rTrans))
	upperCirc = Basic.circle(2*rTrans,x0PT+blLength-rTrans,y0PT+blWidth/2.0+rTrans)
	lowerCirc = Basic.circle(2*rTrans,x0PT+blLength-rTrans,y0PT-blWidth/2.0-rTrans)
      end
      biasTmp4 = Merge.polyVector([biasTmp3,globalBiasLine])
      biasTmp = Merge.polyVector([lowerPoly,biasTmp4,upperPoly])
      biasTmp2 = Merge.polyVector([upperCirc,biasTmp,lowerCirc])    
      bias = Cut.polyVector([upperCirc,biasTmp2,lowerCirc])
      
    else
      #create global biasline fot common PT design
      if x0PT < 0
	globalBiasLine = Polygon.new(Box.new(x0PT-globalBLwidth/2.0,-pixSizeY/2.0-distY,x0PT,pixSizeY/2.0+distY))
      else
	globalBiasLine = Polygon.new(Box.new(x0PT,-pixSizeY/2.0-distY,x0PT+globalBLwidth,pixSizeY/2.0+distY))
      end
      bias=Merge.polyVector([globalBiasLine,dot])
    end
    
    bias.move(x0,y0)
    
    $Cell.shapes(layer).insert(bias)
  end

  # Creates the pstop ring in the punch through bias scheme
  # @param layer [layer] Material
  # @param x0PT [int] X Position of the punch through center
  # @param y0PT [int] Y Position of the punch through center
  # @param dIn [int] Inner diameter of the pstop ring
  # @param dOut [int] Outer diameter of the pstop ring
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant

  def Pixel.ptPStop(layer, x0PT, y0PT, dIn, dOut, x0=0, y0=0)
    if dIn<dOut
      pStop = Basic.circularRing(dIn,dOut,x0PT,y0PT)    
      pStop.move(x0,y0)
      $Cell.shapes(layer).insert(pStop) 
    else
      puts 'CHECK PT PSTOP PARAMETERS'
    end
  end


  # Creates the via in the punch through bias scheme
  # @param layer [layer] Material
  # @param x0PT [int] X Position of the punch through center
  # @param y0PT [int] Y Position of the punch through center
  # @param d [int] Diameter of the via
  # @param x0 [int] center of the implant
  # @param y0 [int] center of the implant
  
  def Pixel.ptVia(layer, x0PT, y0PT, d, x0=0, y0=0)

    via = Basic.circle(d,x0PT,y0PT)
    via.move(x0,y0)
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

  def Pixel.grid(pixel,nx=1,ny=1,distX=0,distY=0,x0=0,y0=0,rot=0,mir=false) 
  
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

  def Pixel.via(layer,x,y,x0=0,y0=0)
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
  
  def Pixel.viaGrid(layer,x,y,nx,ny,distX,distY,x0=0,y0=0)
    
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

  def Pixel.bumpPad(layer,dia,x0=0,y0=0)

   # bump = Basic.octagon(dia,x0,y0)    
    bumpCircle = Basic.circle(dia,x0,y0)
   # $Cell.shapes(layer).insert(bump)
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

  def Pixel.pStop(layer, x, y, width, rOut, rIn, oX=0, oY=0, oW=0, horizontal=true ,x0=0, y0=0)
    
    if width!=0
        
      ring = Basic.ring(x,y,width,rIn,rOut)

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
    else
      puts 'CHECK PSTOP PARAMETERS'
    end
  end
  
end