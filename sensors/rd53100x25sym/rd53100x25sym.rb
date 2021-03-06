module RD53100x25sym
  
  include RBA

  def RD53100x25sym.create(layout,sensor)

    rocType = "RD53A"
            
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    pixelCell2 = layout.create_cell(name+"Pixel2")
    Pixel.init(pixelCell2)    
    Pixel.roundBox($layerNp,Implant['sizeX'],Implant['sizeY'],0,0,Implant['radius'])
    Pixel.implantRouting($layerAlu,ImplantRouting['sizeX'],ImplantRouting['sizeY'],BumpPad2['x0'],BumpPad2['y0'])
    Pixel.pStop($layerPp, Implant['sizeX']+2*InnerPStop['distX'], Implant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)
    Pixel.bumpPad($layerPassOpen,BumpPad2['dia'],BumpPad2['x0'],BumpPad2['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad2['x0'],BumpPad2['y0'])
    Pixel.via($layerAluVia,Via2['sizeX'],Via2['sizeY'],0,0)
    Pixel.via($layerAluVia,Via2['sizeX'],Via2['sizeY'],-Via2['x0'],Via2['y0'])

    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(pixelCell2,PixelGrid1['nX'], PixelGrid1['nY'], PixelGrid1['dX'], PixelGrid1['dY'], -PixelGrid['sizeX']/2+(PixelGrid1['sizeX']/2), -PixelGrid['sizeY']/2+PixelGrid1['sizeY']/2,180)
    Pixel.grid(pixelCell2,PixelGrid1['nX'], PixelGrid1['nY'], PixelGrid1['dX'], PixelGrid1['dY'], -PixelGrid['sizeX']/2+(PixelGrid1['sizeX']/2), -PixelGrid['sizeY']/2+3*PixelGrid1['sizeY']/2)
      
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)

   # Bumps on bias ring
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-100*PixelUnitCell['sizeX']+25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-99*PixelUnitCell['sizeX']-25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-99*PixelUnitCell['sizeX']+25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-98*PixelUnitCell['sizeX']-25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],100*PixelUnitCell['sizeX']-25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],99*PixelUnitCell['sizeX']+25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],99*PixelUnitCell['sizeX']-25e3,-192*PixelUnitCell['sizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,BumpPad['dia'],98*PixelUnitCell['sizeX']+25e3,-192*PixelUnitCell['sizeY']-25e3)  

    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 5490e3, 240)
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3070e3, -5730e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)
    
    Merge.cells(periCell, textCell) 
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
