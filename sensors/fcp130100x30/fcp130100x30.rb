module FCP130100x30
  
  include RBA

  # Creates 100x30 FCP130 pattern sensor
  # @return [cell] Returns the cell with all structures

  def FCP130100x30.create(layout,sensor)
    
    $sensor = layout.create_cell("FCP130120x30")
    
    innerPixelCell1 = layout.create_cell("InnerPixel1")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel1['bPDiaPassivation'],InnerPixel1['bPX0'],InnerPixel1['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel1['bPDia'],InnerPixel1['bPX0'],InnerPixel1['bPY0'])
    Pixel.ptVia($layerAluVia,InnerPixel1['viaX0'],InnerPixel1['viaY0'],InnerPixel1['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell2 = layout.create_cell("InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel2['bPDiaPassivation'],InnerPixel2['bPX0'],InnerPixel2['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel2['bPDia'],InnerPixel2['bPX0'],InnerPixel2['bPY0'])
    Pixel.ptVia($layerAluVia,InnerPixel2['viaX0'],InnerPixel2['viaY0'],InnerPixel2['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], (-PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2)), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),0,true)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),180)
    
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
    
    textCell = Text.create(layout, $layerAlu, sensor , -2700e3, 3100e3)
	lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-2800e3, PixelEdge['outerY0'] + -(PixelGrid['sizeY']+2*PixelEdge['aluDistY'])/2-(PixelEdge['aluSizeY']-(PixelGrid['sizeY']+2*PixelEdge['aluDistY']))/4, 300)    
    
    Merge.cells(periCell, textCell)
    Merge.cells(periCell, lowerTextCell)
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
