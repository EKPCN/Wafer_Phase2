module Basic
  
    include RBA
  
  
  def Basic.createWafer(layer,cell, diaInner, diaOuter)
    waferOuterPoly = Polygon.new([Point.new(diaOuter/2,diaOuter/2),Point.new(-diaOuter/2,diaOuter/2), Point.new(-diaOuter/2,-diaOuter/2), Point.new(diaOuter/2,-diaOuter/2)])
    waferOuterLayer = waferOuterPoly.round_corners(0,diaOuter/2,50)
  
    waferInnerPoly = Polygon.new([Point.new(diaInner/2,diaInner/2),Point.new(-diaInner/2,diaInner/2), Point.new(-(diaInner/2),-diaInner/2), Point.new(diaInner/2,-(diaInner/2))])
    waferInnerLayer = waferInnerPoly.round_corners(0,diaInner/2,50)    
    
    cell.shapes(layer).insert(waferOuterLayer)
    cell.shapes(layer).insert(waferInnerLayer)     
  
  end

  def Basic.createRoundBox(x,y,x0=0,y0=0,r=5000)
    box = Polygon.new(Box.new(0,0,x,y))
    roundBox = box.round_corners(0,r,32) 
    roundBox.move(x0,y0)
    
    box.destroy
    return roundBox    
  end


  def Basic.createOctagon(dia,x0=0,y0=0)
    a = 2*(dia/2.0)/(1.0+Math.sqrt(2.0))
    sin = 1/Math.sqrt(2.0)
    octagon = Polygon.new([Point.new(0,sin*a),Point.new(0,sin*a+a),Point.new(sin*a,dia),Point.new(sin*a+a,dia),Point.new(dia,sin*a+a),Point.new(dia,sin*a),Point.new(sin*a+a,0),Point.new(sin*a,0)])
    octagon.move(x0,y0)
    
    return octagon
  end

  def Basic.createRing(x,y,width,rIn=0,rOut=0,x0=0,y0=0)
    
    outerRing = Polygon.new(Box.new(0,0,x,y))
    innerRing = Polygon.new(Box.new(width,width,x-width,y-width))
    
    ringPoly = Cut.polyVector([outerRing,innerRing])
    ring = ringPoly.round_corners(rIn,rOut,32)
    ring.move(x0,y0)
    
    return ring
  end

end