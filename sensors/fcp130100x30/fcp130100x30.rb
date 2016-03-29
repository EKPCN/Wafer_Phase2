module FCP130100x30
  
  include RBA

  # Creates 100x30 FCP130 pattern sensor
  # @return [cell] Returns the cell with all structures

  def FCP130100x30.create(layout,sensor)
 
    rocType = "FCP130"
       
    $sensor = layout.create_cell(sensor)
    name = sensor + "."    
    
    innerPixelCell1 = layout.create_cell(name+"InnerPixel1")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel1['bPDiaPassivation'],InnerPixel1['bPX0'],InnerPixel1['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel1['bPDia'],InnerPixel1['bPX0'],InnerPixel1['bPY0'])
    Pixel.via($layerAluVia,InnerPixel1['sizeX'],InnerPixel1['sizeY'],InnerPixel1['viaX0'],InnerPixel1['viaY0'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell2 = layout.create_cell(name+"InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel2['bPDiaPassivation'],InnerPixel2['bPX0'],InnerPixel2['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel2['bPDia'],InnerPixel2['bPX0'],InnerPixel2['bPY0'])
    Pixel.via($layerAluVia,InnerPixel2['sizeX'],InnerPixel2['sizeY'],InnerPixel2['viaX0'],InnerPixel2['viaY0'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], -(InnerPixel['implantSizeY']+InnerPixel['PSopenY0']-InnerPixel['PSdistY'])-1e3, InnerPixel['PSopenWidth'],true)
  
    

    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], (-PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2)), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),0,true)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),180)
    
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)

    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 3190e3, 240) 
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-2670e3, -3415e3, 210,sensor)        
    Merge.cells(periCell, lowerTextCell)  
    Merge.cells(periCell, textCell)    
  
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
