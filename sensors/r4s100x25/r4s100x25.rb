module Roc4Sens100x25
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  # Cant load TESTSTRUCTURES
  #
  #load "TESTSTRUCTURES/guardring_cell.rb"
  
  def Roc4Sens100x25.create(layout,sensor)
          
    topCell = layout.create_cell(sensor)
    
    innerPixelCell = layout.create_cell("R4S100x25InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    outerPixelCell = layout.create_cell("R4S100x25OuterPixel")      
    Pixel.init(outerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*OuterPStop['distY'], OuterPStop['width'], OuterPStop['rOut'] , OuterPStop['rIn'])
	
    rightPixelCell = layout.create_cell("R4S100x25RightPixel")      
    Pixel.init(rightPixelCell)
    Pixel.implant($layerNp,RightImplant['sizeX'],RightImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],-BumpPad['x0']/2)
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],-BumpPad['x0']/2)
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*OuterPStop['distY'], OuterPStop['width'], OuterPStop['rOut'] , OuterPStop['rIn'])
	
	
    pixelGridCell = layout.create_cell("R4S100x25PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+3*InnerPixelGrid['sizeY']/2,180)
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(OuterPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(OuterPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+3*OuterPixelGrid['sizeY']/2,180)
    Pixel.grid(rightPixelCell,RightPixelGrid['nX'], RightPixelGrid['nY'], RightPixelGrid['dX'], RightPixelGrid['dY'], PixelGrid['sizeX']/2-(RightPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(RightPixelGrid['sizeY']/2),180)
    
  
    Pixel.pStop($layerPp,PixelGrid['sizeX']-(PixelUnitCell['sizeX']-InnerImplant['sizeX']-2*InnerPStop['distX']), PixelGrid['sizeY']-(PixelUnitCell['sizeY']-InnerImplant['sizeY']-2*InnerPStop['distY']), GridPStop['width'], GridPStop['rOut'], GridPStop['rIn'])
    
    Merge.cells(topCell, pixelGridCell)
	

    periCell = layout.create_cell("R4S100x25Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
	#bump pads for guard ring connection
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2,InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2,InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
	Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+(4*InnerPixel['nX']-2)*(InnerPixel['cellSizeX']/2),InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],-InnerPixel['bPX0']-PixelGrid['sizeX']/2+(4*InnerPixel['nX']-2)*(InnerPixel['cellSizeX']/2),InnerPixel['bPY0']-PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2)-225e3)

    textCell = Text.create(layout, $layerAlu, sensor , -4000e3, 4500e3) 
	lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3500e3, PixelEdge['outerY0'] + -(PixelGrid['sizeY']+2*PixelEdge['aluDistY'])/2-(PixelEdge['aluSizeY']-(PixelGrid['sizeY']+2*PixelEdge['aluDistY']))/4, 400)    
    Merge.cells(periCell, lowerTextCell)


    Merge.cells(periCell, textCell) 
	
    Merge.cells(topCell, periCell)

    return topCell
  end
end

