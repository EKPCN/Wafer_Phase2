module Geometries
  include RBA
  
  def Geometries.init(cell)
    $Cell = cell
  end

  def Geometries.createRing(layer,x,y,width,rOut,rIn,x0=0,y0=0)
    outerRingPoly = Polygon.new(Box.new(x0,y0,x0+x,y0+y))
    outerRing = outerRingPoly.round_corners(0,rOut,50)
    innerRingPoly = Polygon.new(Box.new(x0+width,y0+width,x0+x-width,y0+y-width))
    innerRing = innerRingPoly.round_corners(0,rIn,50)
    
    ring = Cut.polyVector([outerRing,innerRing])
    
    $Cell.shapes(layer).insert(ring)
  end


  def Geometries.createEdge(layer,x,y,xh0,yh0,xh1,yh1,x0=0,y0=0)
    edge = Polygon.new(Box.new(x0,y0,x0+x,y0+y))
    hole = edge.insert_hole([Point.new(x0+xh0,y0+yh0), Point.new(x0+xh1,y0+yh0), Point.new(x0+xh1,y0+yh1), Point.new(x0+xh0,y0+yh1)])
    $Cell.shapes(layer).insert(edge)  
  end

end