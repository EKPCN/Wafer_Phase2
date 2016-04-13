module Roc4Sens50x50
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens50x50.create(layout,sensor)
        
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell = layout.create_cell(name+"InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)
	
	innerPixelCell2 = layout.create_cell(name+"InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],-1.0*BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],-1.0*BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)
	
    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX']+1, InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    Pixel.grid(innerPixelCell2,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+3*(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
    #bump pads for guard ring connection
#    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-PixelGrid['sizeX']/2+PixelUnitCell['sizeX']/4,-PixelGrid['sizeY']/2-212.5e3)
#    Pixel.bumpPad($layerAlu,20e3,-PixelGrid['sizeX']/2+PixelUnitCell['sizeX']/4,-PixelGrid['sizeY']/2-212.5e3)
#    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-PixelGrid['sizeX']/2+(4*InnerPixelGrid['nX']+0.5)*(PixelUnitCell['sizeX']/2),-PixelGrid['sizeY']/2-212.5e3)
#    Pixel.bumpPad($layerAlu,20e3,-PixelGrid['sizeX']/2+(4*InnerPixelGrid['nX']+0.5)*(PixelUnitCell['sizeX']/2),-PixelGrid['sizeY']/2-212.5e3)
  
    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 4590e3, 240) 
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3138e3, -4830e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)  
    Merge.cells(periCell, textCell)

    Merge.cells($sensor, periCell)

    return $sensor
  end
end
