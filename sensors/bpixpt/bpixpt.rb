module BPixPT
  
  include RBA

  # Creates the BPIXPT sensor
  # @return [cell] Returns the cell with all structures

  def BPixPT.create(layout,sensor)
    
    rocType = "PSI46"
        
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell = layout.create_cell(name+"InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],InnerPixel['PTminDistToEdge'])
    Pixel.ptMetal($layerAlu,InnerPixel['implantSizeX']+InnerPixel['metalOH']+InnerPixel['metalOHatPTside'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0']-(InnerPixel['metalOH']-InnerPixel['metalOHatPTside'])/2,InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],InnerPixel['bLHoleWidth'],InnerPixel['PTminDistToEdge']+InnerPixel['metalOH']+InnerPixel['innerPTmetalOH'],(InnerPixel['metalOH']-InnerPixel['metalOHatPTside'])/2)
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'],InnerPixel['globalBLWidth'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],InnerPixel['viaY0'])
    Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],-1*InnerPixel['viaY0'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    outerPixelCell = layout.create_cell(name+"OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.ptImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,OuterPixel['implantSizeX']+OuterPixel['metalOH']+OuterPixel['metalOHatPTside'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0']+(OuterPixel['metalOH']-OuterPixel['metalOHatPTside'])/2,OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['innerPTmetalOH'],OuterPixel['bLHoleWidth'],OuterPixel['PTminDistToEdge']+OuterPixel['metalOH']+OuterPixel['innerPTmetalOH'],-1*(OuterPixel['metalOH']-OuterPixel['metalOHatPTside'])/2)
    Pixel.ptVia($layerAluVia,OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,OuterPixel['cellSizeX'],OuterPixel['cellSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['bDotDia'],OuterPixel['bLWidth'],OuterPixel['globalBLWidth'])
    Pixel.ptPStop($layerPp,OuterPixel['PTX0'],OuterPixel['PTY0'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0-OuterPixel['PTpStopWidth'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0+OuterPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel['bPX0'],OuterPixel['bPY0'])
    Pixel.bumpPad($layerPassOpen,OuterPixel['bPDiaPassivation'],OuterPixel['bPX0'],OuterPixel['bPY0'])
    Pixel.via($layerAluVia,OuterPixel['viaDia'],OuterPixel['viaDia'],OuterPixel['viaX0'],OuterPixel['viaY0'])
    Pixel.via($layerAluVia,OuterPixel['viaDia'],OuterPixel['viaDia'],OuterPixel['viaX0'],-1*OuterPixel['viaY0'])
    Pixel.pStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)

    upperPixelCell = layout.create_cell(name+"UpperPixel")
    Pixel.init(upperPixelCell)
    Pixel.ptImplant($layerNp,UpperPixel['implantSizeX'],UpperPixel['implantSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTholeDia'],UpperPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,UpperPixel['implantSizeX']+UpperPixel['metalOH']+UpperPixel['metalOHatPTside'],UpperPixel['implantSizeY']+2.0*UpperPixel['metalOH'],UpperPixel['PTX0']-(UpperPixel['metalOH']-UpperPixel['metalOHatPTside'])/2,UpperPixel['PTY0'],UpperPixel['PTholeDia']-2.0*UpperPixel['innerPTmetalOH'],UpperPixel['bLHoleWidth'],UpperPixel['PTminDistToEdge']+UpperPixel['metalOH']+UpperPixel['innerPTmetalOH'],(UpperPixel['metalOH']-UpperPixel['metalOHatPTside'])/2)
    Pixel.ptVia($layerAluVia,UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,UpperPixel['cellSizeX'],UpperPixel['cellSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['bDotDia'],UpperPixel['bLWidth'],UpperPixel['globalBLWidth'])
    Pixel.ptPStop($layerPp,UpperPixel['PTX0'],UpperPixel['PTY0'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0-UpperPixel['PTpStopWidth'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0+UpperPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,UpperPixel['bPDia'],UpperPixel['bPX0'],UpperPixel['bPY0'])
    Pixel.bumpPad($layerPassOpen,UpperPixel['bPDiaPassivation'],UpperPixel['bPX0'],UpperPixel['bPY0'])
    Pixel.via($layerAluVia,UpperPixel['viaDia'],UpperPixel['viaDia'],UpperPixel['viaX0'],UpperPixel['viaY0'])
    Pixel.via($layerAluVia,UpperPixel['viaDia'],UpperPixel['viaDia'],UpperPixel['viaX0'],-1*UpperPixel['viaY0'])
    Pixel.pStop($layerPp, UpperPixel['implantSizeX']+2*UpperPixel['PSdistX'], UpperPixel['implantSizeY']+2*UpperPixel['PSdistY'], UpperPixel['PSwidth'], UpperPixel['PSrOut'] , UpperPixel['PSrIn'], UpperPixel['PSopenX0'], UpperPixel['PSopenY0'], UpperPixel['PSopenWidth'],false)

    cornerPixelCell = layout.create_cell(name+"CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.ptImplant($layerNp,CornerPixel['implantSizeX'],CornerPixel['implantSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTholeDia'],CornerPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,CornerPixel['implantSizeX']+CornerPixel['metalOH']+CornerPixel['metalOHatPTside'],CornerPixel['implantSizeY']+2.0*CornerPixel['metalOH'],CornerPixel['PTX0']+(CornerPixel['metalOH']-CornerPixel['metalOHatPTside'])/2,CornerPixel['PTY0'],CornerPixel['PTholeDia']-2.0*CornerPixel['innerPTmetalOH'],CornerPixel['bLHoleWidth'],CornerPixel['PTminDistToEdge']+CornerPixel['metalOH']+CornerPixel['innerPTmetalOH'],-1*(CornerPixel['metalOH']-CornerPixel['metalOHatPTside'])/2)
    Pixel.ptVia($layerAluVia,CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,CornerPixel['cellSizeX'],CornerPixel['cellSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['bDotDia'],CornerPixel['bLWidth'],CornerPixel['globalBLWidth'])
    Pixel.ptPStop($layerPp,CornerPixel['PTX0'],CornerPixel['PTY0'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0-CornerPixel['PTpStopWidth'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0+CornerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu, CornerPixel['bPDia'],CornerPixel['bPX0'],CornerPixel['bPY0'])
    Pixel.bumpPad($layerPassOpen,CornerPixel['bPDiaPassivation'],CornerPixel['bPX0'],CornerPixel['bPY0'])
    Pixel.via($layerAluVia,CornerPixel['viaDia'],CornerPixel['viaDia'],CornerPixel['viaX0'],CornerPixel['viaY0'])
    Pixel.via($layerAluVia,CornerPixel['viaDia'],CornerPixel['viaDia'],CornerPixel['viaX0'],-1*CornerPixel['viaY0'])
    Pixel.pStop($layerPp, CornerPixel['implantSizeX']+2*CornerPixel['PSdistX'], CornerPixel['implantSizeY']+2*CornerPixel['PSdistY'], CornerPixel['PSwidth'], CornerPixel['PSrOut'] , CornerPixel['PSrIn'], CornerPixel['PSopenX0'], CornerPixel['PSopenY0'], CornerPixel['PSopenWidth'],true)

    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    
    Pixel.grid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2))
    
    Pixel.grid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'], PixelGrid['sizeX']/2-OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2)
    
    Pixel.grid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2,180,true)
    
    Pixel.grid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'],-PixelGrid['sizeX']/2+CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2))
    
    Pixel.grid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'], PixelGrid['sizeX']/2-CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2),180,true)
    
    
    Merge.cells($sensor, pixelGridCell)
    
    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)

    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 4540e3, 240) 
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3138e3, -4900e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)  
    Merge.cells(periCell, textCell)
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
