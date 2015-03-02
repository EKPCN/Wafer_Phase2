module R4S50x50cPT
  
  include RBA

  # Creates 50x50 roc4sens pattern sensor with common punch-thru
  # @return [cell] Returns the cell with all structures

  def R4S50x50cPT.create(layout,sensor)
  
    #load "Wafer_Phase2/sensors/Roc4Sens50x50cPT/R4S50x50PT_para.rb"
        
    $sensor = layout.create_cell("R4S50x50PT")
    
    innerPixelCell1 = layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'])
    Pixel.cptMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'])
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'])#,$layerPassivation,InnerPixel['bPDiaPassivation'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell2 = layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'])
    Pixel.cptMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'])
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDia'],InnerPixel['bPX0'],-InnerPixel['bPY0'])#,$layerPassivation,InnerPixel['bPDiaPassivation'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],-InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)    
    

    outerPixelCell = layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.ptImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,OuterPixel['implantSizeX']+2.0*OuterPixel['metalOH'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'],OuterPixel['bLHoleWidth'])
    Pixel.ptVia($layerAluVia,OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,OuterPixel['cellSizeX'],OuterPixel['cellSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['bDotDia'],OuterPixel['bLWidth'])
    Pixel.ptPStop($layerPp,OuterPixel['PTX0'],OuterPixel['PTY0'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0-OuterPixel['PTpStopWidth'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0+OuterPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel['bPX0'],OuterPixel['bPY0'])#,$layerPassivation,OuterPixel['bPDiaPassivation'])
    Pixel.ptVia($layerAluVia,OuterPixel['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.pStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)

    upperPixelCell = layout.create_cell("UpperPixel")
    Pixel.init(upperPixelCell)
    Pixel.ptImplant($layerNp,UpperPixel['implantSizeX'],UpperPixel['implantSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTholeDia'],UpperPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,UpperPixel['implantSizeX']+2.0*UpperPixel['metalOH'],UpperPixel['implantSizeY']+2.0*UpperPixel['metalOH'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'],UpperPixel['bLHoleWidth'])
    Pixel.ptVia($layerAluVia,UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,UpperPixel['cellSizeX'],UpperPixel['cellSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['bDotDia'],UpperPixel['bLWidth'])
    Pixel.ptPStop($layerPp,UpperPixel['PTX0'],UpperPixel['PTY0'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0-UpperPixel['PTpStopWidth'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0+UpperPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,UpperPixel['bPDia'],UpperPixel['bPX0'],UpperPixel['bPY0'])#,$layerPassivation,UpperPixel['bPDiaPassivation'])
    Pixel.ptVia($layerAluVia,UpperPixel['viaX0'],UpperPixel['viaY0'],UpperPixel['viaDia'])
    Pixel.pStop($layerPp, UpperPixel['implantSizeX']+2*UpperPixel['PSdistX'], UpperPixel['implantSizeY']+2*UpperPixel['PSdistY'], UpperPixel['PSwidth'], UpperPixel['PSrOut'] , UpperPixel['PSrIn'], UpperPixel['PSopenX0'], UpperPixel['PSopenY0'], UpperPixel['PSopenWidth'],false)

    cornerPixelCell = layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.ptImplant($layerNp,CornerPixel['implantSizeX'],CornerPixel['implantSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTholeDia'],CornerPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,CornerPixel['implantSizeX']+2.0*CornerPixel['metalOH'],CornerPixel['implantSizeY']+2.0*CornerPixel['metalOH'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'],CornerPixel['bLHoleWidth'])
    Pixel.ptVia($layerAluVia,CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,CornerPixel['cellSizeX'],CornerPixel['cellSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['bDotDia'],CornerPixel['bLWidth'])
    Pixel.ptPStop($layerPp,CornerPixel['PTX0'],CornerPixel['PTY0'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0-CornerPixel['PTpStopWidth'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0+CornerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu, CornerPixel['bPDia'],CornerPixel['bPX0'],CornerPixel['bPY0'])#,$layerPassivation,CornerPixel['bPDiaPassivation'])
    Pixel.ptVia($layerAluVia,CornerPixel['viaX0'],CornerPixel['viaY0'],CornerPixel['viaDia'])
    Pixel.pStop($layerPp, CornerPixel['implantSizeX']+2*CornerPixel['PSdistX'], CornerPixel['implantSizeY']+2*CornerPixel['PSdistY'], CornerPixel['PSwidth'], CornerPixel['PSrOut'] , CornerPixel['PSrIn'], CornerPixel['PSopenX0'], CornerPixel['PSopenY0'], CornerPixel['PSopenWidth'],true)

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], (-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(InnerPixel['cellSizeX']/2)), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),0,true)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),180)
    
    Pixel.grid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2))
    
    Pixel.grid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'], PixelGrid['sizeX']/2-OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2),180,true)
    
    Pixel.grid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2)
    
    Pixel.grid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2,180,true)
    
    Pixel.grid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'],-PixelGrid['sizeX']/2+CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2))
    
    Pixel.grid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'], PixelGrid['sizeX']/2-CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2),180,true)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($sensor, periCell)

    return $sensor
  end
end
