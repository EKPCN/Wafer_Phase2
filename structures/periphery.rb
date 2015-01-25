module Periphery

  include RBA

  def Periphery.init(cell)
    $Cell = cell
  end


  def Periphery.create(layerImp, layerMet, layerEdge, pixelGrid, biasRing, guardRing, pixelEdge)
  
    Periphery.createRing(layerImp,pixelGrid['sizeX']+2*biasRing['distX'],pixelGrid['sizeY']+2*biasRing['distY'],biasRing['width'],biasRing['rIn'],biasRing['rOut'])
    Periphery.createRing(layerMet,pixelGrid['sizeX']+2*biasRing['aluDistX'],pixelGrid['sizeY']+2*biasRing['aluDistY'],biasRing['aluWidth'],biasRing['aluRIn'],biasRing['aluROut'])
              
    Periphery.createRing(layerImp,pixelGrid['sizeX']+2*guardRing['distX'],pixelGrid['sizeY']+2*guardRing['distY'],guardRing['width'],guardRing['rIn'],guardRing['rOut'])
    Periphery.createRing(layerMet,pixelGrid['sizeX']+2*guardRing['aluDistX'],pixelGrid['sizeY']+2*guardRing['aluDistY'],guardRing['aluWidth'],guardRing['aluRIn'],guardRing['aluROut'])
  
    Periphery.createEdge(layerEdge,pixelGrid['sizeX']+2*pixelEdge['distX'],pixelGrid['sizeY']+2*pixelEdge['distY'],pixelEdge['sizeX'],pixelEdge['sizeY'],pixelEdge['outerX0'],pixelEdge['outerY0'])
    Periphery.createEdge(layerMet,pixelGrid['sizeX']+2*pixelEdge['aluDistX'],pixelGrid['sizeY']+2*pixelEdge['aluDistY'],pixelEdge['aluSizeX'],pixelEdge['aluSizeY'],pixelEdge['outerX0'],pixelEdge['outerY0'])
  end


  def Periphery.createRing(layer,x,y,width,rIn,rOut,x0=0,y0=0)

    ring = Basic.createRing(x,y,width,rIn,rOut,x0,y0)
    $Cell.shapes(layer).insert(ring)
  end


  def Periphery.createEdge(layer,xi,yi,xo,yo,x0=0,y0=0)
    innerBox = Polygon.new(Box.new(-xi/2,-yi/2,xi/2,yi/2))
    outerBox = Polygon.new(Box.new(-xo/2,-yo/2,xo/2,yo/2))
    outerBox.move(x0,y0)
    
    edge = Cut.polyVector([outerBox,innerBox])
    $Cell.shapes(layer).insert(edge)
  end

end