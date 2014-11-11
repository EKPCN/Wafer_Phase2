module Basic
  
    include RBA
  
  # Creates a wafer with an area where no structures can be placed on
  # @param layer [layer] Wafer material
  # @param cell [cell] Cell container in which the wafer is drawn
  # @param diaInner [int] Inner diameter in um
  # @param diaOuter [int] Outer diamert in um
  # @return [Nill]

  def Basic.createWafer(layer,cell, diaInner, diaOuter)
    waferOuterPoly = Polygon.new([Point.new(diaOuter/2,diaOuter/2),Point.new(-diaOuter/2,diaOuter/2), Point.new(-diaOuter/2,-diaOuter/2), Point.new(diaOuter/2,-diaOuter/2)])
    waferOuterLayer = waferOuterPoly.round_corners(0,diaOuter/2,50)
  
    waferInnerPoly = Polygon.new([Point.new(diaInner/2,diaInner/2),Point.new(-diaInner/2,diaInner/2), Point.new(-(diaInner/2),-diaInner/2), Point.new(diaInner/2,-(diaInner/2))])
    waferInnerLayer = waferInnerPoly.round_corners(0,diaInner/2,50)    
    
    cell.shapes(layer).insert(waferOuterLayer)
    cell.shapes(layer).insert(waferInnerLayer)     
  
  end

  # Creates a Box with round corners. 8 points per corner
  # @param x [int] Size in x direction
  # @param y [int] Size in y direction
  # @param x0 [int] X postion of the lower left corner of the object
  # @param y0 [int] Y postion of the lower left corner of the object
  # @param r [int] Radius of corner circle
  # @return [Polygon] The polygon object

  def Basic.createRoundBox(x,y,x0=0,y0=0,r=5000)
    box = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    roundBox = box.round_corners(0,r,32) 
    roundBox.move(x0,y0)
    
    box.destroy
    return roundBox    
  end

  # Creates a octagon (e.g. for bump pads)
  # @param dia [int] Diameter of the octagon
  # @param x0 [int] X postion of the lower left corner of the object
  # @param y0 [int] Y postion of the lower left corner of the object
  # @return [Polygon] The polygon object

  def Basic.createOctagon(dia,x0=0,y0=0)
    a = 2*(dia/2.0)/(1.0+Math.sqrt(2.0))
    octagon = Polygon.new([Point.new(a/2.0,dia/2.0),Point.new(dia/2.0,a/2.0),Point.new(dia/2.0,-a/2.0),Point.new(a/2.0,-dia/2.0),Point.new(-a/2.0,-dia/2.0),Point.new(-dia/2.0,-a/2.0),Point.new(-dia/2.0,a/2.0),Point.new(-a/2.0,dia/2.0)])
    octagon.move(x0,y0)
    
    return octagon
  end

  # Creates a Ring (e.g. for guard rings)
  # @param x [int] Size of the ring in x direction
  # @param y [int] Size of the ring in y direction
  # @param width [int] Width of the ring
  # @param rIn [int] Inner radius of the corner
  # @param rOut [int] Outer radius of the corner
  # @param x0 [int] X postion of the lower left corner of the object
  # @param y0 [int] Y postion of the lower left corner of the object
  # @return [Polygon] The polygon object

  def Basic.createRing(x,y,width,rIn=0,rOut=0,x0=0,y0=0)
    
    innerRing = Polygon.new(Box.new(-x/2,-y/2,x/2,y/2))
    outerRing = Polygon.new(Box.new((-x/2)-width,(-y/2)-width,(x/2)+width,(y/2)+width))
    
    ringPoly = Cut.polyVector([outerRing,innerRing])
    ring = ringPoly.round_corners(rIn,rOut,32)
    ring.move(x0,y0)
    
    return ring
  end

end
