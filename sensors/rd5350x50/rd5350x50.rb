module RD5350x50
  
  include RBA

  def RD5350x50.create(layout,sensor)
    
    rocType = "RD53A"
        
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell = layout.create_cell(name+"InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],InnerVia['x0'],InnerVia['y0'])
    Pixel.via($layerAluVia, InnerVia['sizeX'],InnerVia['sizeY'],-InnerVia['x0'],-InnerVia['y0'])
#    Pixel.ptVia($layerAluVia,InnerVia['x0'],InnerVia['y0'],InnerVia['sizeX'])
 #   Pixel.ptVia($layerAluVia,-InnerVia['x0'],-InnerVia['y0'],InnerVia['sizeX'])
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],BumpPad['x0'],BumpPad['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad['x0'],BumpPad['y0'])
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)

    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2)
    #Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+3*(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+InnerPixelGrid['sizeY']/2,90)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)
  
# Bumps on bias ring
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-199*PixelUnitCell['sizeX']-25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-198*PixelUnitCell['sizeX']-25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-197*PixelUnitCell['sizeX']-25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-196*PixelUnitCell['sizeX']-25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],199*PixelUnitCell['sizeX']+25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],198*PixelUnitCell['sizeX']+25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],197*PixelUnitCell['sizeX']+25e3,-96*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],196*PixelUnitCell['sizeX']+25e3,-96*PixelUnitCell['sizeY']-25e3)

    
    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 5490e3, 240)
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3070e3, -5730e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)
    
    Merge.cells(periCell, textCell) 
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
