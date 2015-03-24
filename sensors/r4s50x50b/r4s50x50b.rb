module Roc4Sens50x50b
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens50x50b.create(layout,sensor)
  
    #load ($GLOBAL_PATH + "/sensors/r4s50x50b/" + sensor + ".rb")
        
    $sensor = layout.create_cell(sensor)
    
    innerPixelCell = layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],-InnerVia['x0'],-InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    outerPixelCell = layout.create_cell("OuterPixel")      
    Pixel.init(outerPixelCell)
    Pixel.implant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'],$layerAlu,OuterImplant['metalOH'],0,0,OuterImplant['radius'])
    Pixel.via($layerAluVia, OuterVia['sizeX'],OuterVia['sizeY'],-OuterVia['x0'],-OuterVia['y0'])
    Pixel.via($layerAluVia, OuterVia['sizeX'],OuterVia['sizeY'],OuterVia['x0'],-OuterVia['y0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],0,12.5e3)
    Pixel.pStop($layerPp, OuterImplant['sizeX']+2*InnerPStop['distX'], OuterImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])


    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+2*InnerPixelGrid['sizeY'])
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(OuterPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*OuterPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-OuterPixelGrid['sizeY']/2,180)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    textCell = Text.create(layout, $layerPassOpen, sensor , -4000e3, 4500e3)    
    Merge.cells(periCell, textCell) 

    Merge.cells($sensor, periCell)

    return $sensor
  end
end