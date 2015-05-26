module FCP130100x30b
  
  include RBA

  # Creates bricked 100x30 FCP130 pattern sensor
  # @return [cell] Returns the cell with all structures

  def FCP130100x30b.create(layout,sensor)
    
    $sensor = layout.create_cell("FCP130120x30b")
    
    innerPixelCell1 = layout.create_cell("InnerPixel1")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel1['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel1['bPX0'],InnerPixel['bPY0'])
    Pixel.ptVia($layerAluVia,-InnerPixel1['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel1['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell2 = layout.create_cell("InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel2['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel2['bPX0'],InnerPixel['bPY0'])
    Pixel.ptVia($layerAluVia,-InnerPixel2['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel2['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell3 = layout.create_cell("InnerPixel3")      
    Pixel.init(innerPixelCell3)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel3['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel3['bPX0'],InnerPixel['bPY0'])
    Pixel.ptVia($layerAluVia,-InnerPixel3['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel3['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    outerPixelCell1 = layout.create_cell("OuterPixel1")      
    Pixel.init(outerPixelCell1)
    Pixel.ptImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'],0,-OuterPixel['shiftX'])
    Pixel.ptImplant($layerAlu,OuterPixel['implantSizeX']+2.0*OuterPixel['metalOH'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['innerPTmetalOH'],-OuterPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,OuterPixel['bPDiaPassivation'],OuterPixel1['bPX0'],OuterPixel['bPY0'])
    Pixel.bumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel1['bPX0'],OuterPixel['bPY0'])
    Pixel.ptVia($layerAluVia,-OuterPixel1['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.ptVia($layerAluVia,OuterPixel1['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.pStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)
    
    outerPixelCell2 = layout.create_cell("OuterPixel2")
    Pixel.init(outerPixelCell2)
    Pixel.ptImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'],0,-OuterPixel['shiftX'])
    Pixel.ptImplant($layerAlu,OuterPixel['implantSizeX']+2.0*OuterPixel['metalOH'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['innerPTmetalOH'],-OuterPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,OuterPixel['bPDiaPassivation'],OuterPixel2['bPX0'],OuterPixel['bPY0'])
    Pixel.bumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel2['bPX0'],OuterPixel['bPY0'])
    Pixel.ptVia($layerAluVia,-OuterPixel2['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.ptVia($layerAluVia,OuterPixel2['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.pStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)
    
    

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
#     from left to right
#     1st row
    Pixel.grid(outerPixelCell1,OuterPixel['nX'], OuterPixel['nY'], OuterPixel['dX'], OuterPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+OuterPixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell3,InnerPixel['nX']-1, InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    
#     2nd row
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+3*InnerPixel['cellSizeY']/2,180)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX']-1, InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+3*InnerPixel['cellSizeY']/2)
    
    Pixel.grid(outerPixelCell2,OuterPixel['nX'], OuterPixel['nY'], OuterPixel['dX'], OuterPixel['dY'], -PixelGrid['sizeX']/2+(2*InnerPixel['nX']-1)*InnerPixel['cellSizeX']+OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+3*OuterPixel['cellSizeY']/2)
    
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
    
    textCell = Text.create(layout, $layerPassOpen, sensor , -4000e3, 4500e3)
    Merge.cells(periCell, textCell)
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
