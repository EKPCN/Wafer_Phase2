module Roc4Sens100x25
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  
  def Roc4Sens100x25.create(layout,sensor)
          
    rocType = "R4S"
          
    topCell = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell = layout.create_cell(name+"InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.roundBox($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],0,0,InnerImplant['radius'])
    Pixel.implantRouting($layerAlu,ImplantRouting['sizeX'],ImplantRouting['sizeY'],BumpPad['x0'],BumpPad['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])
	
    rightPixelCell = layout.create_cell(name+"RightPixel")      
    Pixel.init(rightPixelCell)
    Pixel.roundBox($layerNp,RightImplant['sizeX'],RightImplant['sizeY'],0,0,InnerImplant['radius'])
    Pixel.implantRouting($layerAlu,RightImplantRouting['sizeX'],RightImplantRouting['sizeY'],BumpPad['x0'],BumpPad['x0']/2-12.5e3,0)
    Pixel.via($layerAluVia, RightVia['sizeX'],RightVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, RightVia['sizeX'],RightVia['sizeY'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['x0']/2-12.5e3)
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['x0']/2-12.5e3)
    Pixel.pStop($layerPp, RightImplant['sizeX']+2*InnerPStop['distX'], RightImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2,180)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+3*InnerPixelGrid['sizeY']/2,0,true)
    Pixel.grid(rightPixelCell,RightPixelGrid['nX'], RightPixelGrid['nY'], RightPixelGrid['dX'], RightPixelGrid['dY'], PixelGrid['sizeX']/2-(RightPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(RightPixelGrid['sizeY']/2),0,true)
  
    Pixel.pStop($layerPp,PixelGrid['sizeX']-(PixelUnitCell['sizeX']-InnerImplant['sizeX']-2*InnerPStop['distX']), PixelGrid['sizeY']-(PixelUnitCell['sizeY']-InnerImplant['sizeY']-2*InnerPStop['distY']), GridPStop['width'], GridPStop['rOut'], GridPStop['rIn'])
    
    Merge.cells(topCell, pixelGridCell)
	
    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    # Bias Ring
    Periphery.asymRing($layerNp,PixelGrid['sizeX']+2*BiasRing['distX'],PixelGrid['sizeY']+2*BiasRing['distY'],PixelGrid['sizeX']+2*BiasRing['distX']+2*BiasRing['width'],BiasRing['outerY'],BiasRing['rIn'],BiasRing['rOut'],0,-65e3)
    Periphery.asymRing($layerAlu,PixelGrid['sizeX']+2*BiasRing['aluDistX'],PixelGrid['sizeY']+2*BiasRing['aluDistY'],PixelGrid['sizeX']+2*BiasRing['aluDistX']+2*BiasRing['aluWidth'],BiasRing['aluOuterY'],BiasRing['rIn'],BiasRing['aluROut'],0,-65e3)
    # Bias Vias
    Pixel.viaGrid($layerAluVia,6e3,6e3,(PixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-PixelGrid['sizeX']/2,-PixelGrid['sizeY']/2-BiasRing['width']/2)#+10e3)
    Pixel.viaGrid($layerAluVia,6e3,6e3,(PixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-PixelGrid['sizeX']/2,PixelGrid['sizeY']/2+BiasRing['width']/2)    
    Pixel.viaGrid($layerAluVia,6e3,6e3,1,(PixelGrid['sizeY']/74.5e3).round,0,74.5e3,-PixelGrid['sizeX']/2-BiasRing['width']/2,-PixelGrid['sizeY']/2)   
    Pixel.viaGrid($layerAluVia,6e3,6e3,1,(PixelGrid['sizeY']/74.5e3).round,0,74.5e3,PixelGrid['sizeX']/2+BiasRing['width']/2,-PixelGrid['sizeY']/2)
    # Bias Pass opening and bump bad
    Periphery.passOpening($layerPassOpen,PixelGrid['sizeX']-600e3,BiasRing['width']-23e3,0,-PixelGrid['sizeY']/2-BiasRing['distY']-BiasRing['width']/2-55e3)
    Periphery.bumpPad($layerPassOpen,BiasRing['bumpDia'],-PixelGrid['sizeX']/2+BiasRing['bumpX0'],-PixelGrid['sizeY']/2+BiasRing['bumpY0'])
    Periphery.bumpPad($layerAlu,20e3,-PixelGrid['sizeX']/2+BiasRing['bumpX0'],-PixelGrid['sizeY']/2+BiasRing['bumpY0'])
    # Rest of periphery
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,DummyBiasRing,GuardRing,PixelEdge,rocType)

    textCell = Text.create(layout, $layerAlu, sensor ,-1500e3, 4590e3, 240) 
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3138e3, -4830e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)  
    Merge.cells(periCell, textCell)
	
    Merge.cells(topCell, periCell)

    return topCell
  end
end

