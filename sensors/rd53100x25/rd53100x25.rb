module RD53100x25
  
  include RBA

  def RD53100x25.create(layout,sensor)
        
    $sensor = layout.create_cell(sensor)
    
    pixelCell1 = layout.create_cell("Pixel1")
    Pixel.init(pixelCell1)
    Pixel.roundBox($layerNp,Implant['sizeX'],Implant['sizeY'],0,0,Implant['radius'])
    Pixel.pStop($layerPp, Implant['sizeX']+2*InnerPStop['distX'], Implant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])
    Pixel.roundBox($layerAlu,ImplantAlu1['sizeX'],ImplantAlu1['sizeY'],ImplantAlu1['x0'],ImplantAlu1['y0'],ImplantAlu1['radius'])
    Pixel.bumpPad($layerPassOpen,BumpPad1['dia'],BumpPad1['x0'],BumpPad1['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad1['x0'],BumpPad1['y0'])
    Pixel.ptVia($layerAluVia,Via10['x0'],Via10['y0'],Via10['sizeX'])
    Pixel.ptVia($layerAluVia,Via11['x0'],Via11['y0'],Via11['sizeX'])
    
    
    pixelCell2 = layout.create_cell("Pixel2")
    Pixel.init(pixelCell2)    
    Pixel.roundBox($layerNp,Implant['sizeX'],Implant['sizeY'],0,0,Implant['radius'])
    Pixel.implantRouting($layerAlu,Implant['sizeX']+6e3,Implant['sizeY']+6e3,BumpPad2['x0'],BumpPad2['y0'])    
    Pixel.pStop($layerPp, Implant['sizeX']+2*InnerPStop['distX'], Implant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])
    Pixel.bumpPad($layerPassOpen,BumpPad2['dia'],BumpPad2['x0'],BumpPad2['y0'])
    Pixel.bumpPad($layerAlu,20e3,BumpPad2['x0'],BumpPad2['y0'])
    Pixel.ptVia($layerAluVia,0,0,Via2['sizeX'])
    Pixel.ptVia($layerAluVia,Via2['x0'],Via2['y0'],Via2['sizeX'])
    Pixel.ptVia($layerAluVia,-Via2['x0'],Via2['y0'],Via2['sizeX'])

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(pixelCell1,PixelGrid1['nX'], PixelGrid1['nY'], PixelGrid1['dX'], PixelGrid1['dY'], -PixelGrid['sizeX']/2+(PixelGrid1['sizeX']/2), -PixelGrid['sizeY']/2+PixelGrid1['sizeY']/2)
    Pixel.grid(pixelCell2,PixelGrid1['nX'], PixelGrid1['nY'], PixelGrid1['dX'], PixelGrid1['dY'], -PixelGrid['sizeX']/2+(PixelGrid1['sizeX']/2), -PixelGrid['sizeY']/2+3*PixelGrid1['sizeY']/2)
    Periphery.ring($layerPp,PixelGrid['sizeX']-5e3,PixelGrid['sizeY']-5e3, InnerPStop['width'], InnerPStop['rIn'] , InnerPStop['rOut'])
      
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
  
    #textCell = Text.create(layout, $layerAlu, sensor , -2500e3, 10485e3) 
    textCell = Text.create(layout, $layerAlu, sensor , -2500e3, 5272.5e3) 
    Merge.cells(periCell, textCell) 
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
