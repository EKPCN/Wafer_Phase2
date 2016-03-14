module Roc4Sens50x50
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens50x50.create(layout,sensor)
        
    $sensor = layout.create_cell(sensor)
    
    innerPixelCell = layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX']+1, InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+3*(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2,90)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
	#bump pads for guard ring connection
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+InnerPixel['cellSizeX']/2,InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+InnerPixel['cellSizeX']/2,InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
	Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+(4*InnerPixel['nX']+1)*(InnerPixel['cellSizeX']/2),InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+(4*InnerPixel['nX']+1)*(InnerPixel['cellSizeX']/2),InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
  

    textCell = Text.create(layout, $layerAlu, sensor , -4000e3, 4500e3)
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3500e3, PixelEdge['outerY0'] + -(PixelGrid['sizeY']+2*PixelEdge['aluDistY'])/2-(PixelEdge['aluSizeY']-(PixelGrid['sizeY']+2*PixelEdge['aluDistY']))/4, 400)    
    Merge.cells(periCell, lowerTextCell)
    Merge.cells(periCell, textCell) 
  
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
