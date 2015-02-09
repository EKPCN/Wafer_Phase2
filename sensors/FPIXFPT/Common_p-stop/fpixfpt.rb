module FPixFPT_cpst
  
  include RBA

  # Creates the FPIXFPT sensor
  # @return [cell] Returns the cell with all structures

  def FPixFPT_cpst.create()
  
    load "Wafer_Phase2/sensors/FPIXFPT/Common_p-stop/fpixfpt_para.rb"
        
    $fPixFCell = $layout.create_cell("FPixFPT")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createPTImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],InnerPixel['PTminDistToEdge'])
    Pixel.createPTMetal($layerAlu,InnerPixel['implantSizeX']+InnerPixel['metalOH']+InnerPixel['metalOHatPTside'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0']-(InnerPixel['metalOH']-InnerPixel['metalOHatPTside'])/2,InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],InnerPixel['bLHoleWidth'],InnerPixel['PTminDistToEdge']+InnerPixel['metalOH']+InnerPixel['innerPTmetalOH'],(InnerPixel['metalOH']-InnerPixel['metalOHatPTside'])/2)
    Pixel.createPTVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'],InnerPixel['globalBLWidth'])
    Pixel.createPTPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'],$layerPassivation,InnerPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],-1*InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    outerPixelCell = $layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.createPTImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'])
    Pixel.createPTMetal($layerAlu,OuterPixel['implantSizeX']+OuterPixel['metalOH']+OuterPixel['metalOHatPTside'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0']+(OuterPixel['metalOH']-OuterPixel['metalOHatPTside'])/2,OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['innerPTmetalOH'],OuterPixel['bLHoleWidth'],OuterPixel['PTminDistToEdge']+OuterPixel['metalOH']+OuterPixel['innerPTmetalOH'],-1*(OuterPixel['metalOH']-OuterPixel['metalOHatPTside'])/2)
    Pixel.createPTVia($layerAluVia,OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,OuterPixel['cellSizeX'],OuterPixel['cellSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['bDotDia'],OuterPixel['bLWidth'],OuterPixel['globalBLWidth'])
    Pixel.createPTPStop($layerPp,OuterPixel['PTX0'],OuterPixel['PTY0'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0-OuterPixel['PTpStopWidth'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0+OuterPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel['bPX0'],OuterPixel['bPY0'],$layerPassivation,OuterPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,OuterPixel['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,OuterPixel['viaX0'],-1*OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.createPStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)

    upperPixelCell = $layout.create_cell("UpperPixel")
    Pixel.init(upperPixelCell)
    Pixel.createPTImplant($layerNp,UpperPixel['implantSizeX'],UpperPixel['implantSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTholeDia'],UpperPixel['PTimplantDia'])
    Pixel.createPTMetal($layerAlu,UpperPixel['implantSizeX']+UpperPixel['metalOH']+UpperPixel['metalOHatPTside'],UpperPixel['implantSizeY']+2.0*UpperPixel['metalOH'],UpperPixel['PTX0']-(UpperPixel['metalOH']-UpperPixel['metalOHatPTside'])/2,UpperPixel['PTY0'],UpperPixel['PTholeDia']-2.0*UpperPixel['innerPTmetalOH'],UpperPixel['bLHoleWidth'],UpperPixel['PTminDistToEdge']+UpperPixel['metalOH']+UpperPixel['innerPTmetalOH'],(UpperPixel['metalOH']-UpperPixel['metalOHatPTside'])/2)
    Pixel.createPTVia($layerAluVia,UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,UpperPixel['cellSizeX'],UpperPixel['cellSizeY'],UpperPixel['PTX0'],UpperPixel['PTY0'],UpperPixel['bDotDia'],UpperPixel['bLWidth'],UpperPixel['globalBLWidth'])
    Pixel.createPTPStop($layerPp,UpperPixel['PTX0'],UpperPixel['PTY0'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0-UpperPixel['PTpStopWidth'],(UpperPixel['bDotDia']+UpperPixel['PTholeDia']-2.0*UpperPixel['metalOH'])/2.0+UpperPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,UpperPixel['bPDia'],UpperPixel['bPX0'],UpperPixel['bPY0'],$layerPassivation,UpperPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,UpperPixel['viaX0'],UpperPixel['viaY0'],UpperPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,UpperPixel['viaX0'],-1*UpperPixel['viaY0'],UpperPixel['viaDia'])
    Pixel.createPStop($layerPp, UpperPixel['implantSizeX']+2*UpperPixel['PSdistX'], UpperPixel['implantSizeY']+2*UpperPixel['PSdistY'], UpperPixel['PSwidth'], UpperPixel['PSrOut'] , UpperPixel['PSrIn'], UpperPixel['PSopenX0'], UpperPixel['PSopenY0'], UpperPixel['PSopenWidth'],false)

    cornerPixelCell = $layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.createPTImplant($layerNp,CornerPixel['implantSizeX'],CornerPixel['implantSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTholeDia'],CornerPixel['PTimplantDia'])
    Pixel.createPTMetal($layerAlu,CornerPixel['implantSizeX']+CornerPixel['metalOH']+CornerPixel['metalOHatPTside'],CornerPixel['implantSizeY']+2.0*CornerPixel['metalOH'],CornerPixel['PTX0']+(CornerPixel['metalOH']-CornerPixel['metalOHatPTside'])/2,CornerPixel['PTY0'],CornerPixel['PTholeDia']-2.0*CornerPixel['innerPTmetalOH'],CornerPixel['bLHoleWidth'],CornerPixel['PTminDistToEdge']+CornerPixel['metalOH']+CornerPixel['innerPTmetalOH'],-1*(CornerPixel['metalOH']-CornerPixel['metalOHatPTside'])/2)
    Pixel.createPTVia($layerAluVia,CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,CornerPixel['cellSizeX'],CornerPixel['cellSizeY'],CornerPixel['PTX0'],CornerPixel['PTY0'],CornerPixel['bDotDia'],CornerPixel['bLWidth'],CornerPixel['globalBLWidth'])
    Pixel.createPTPStop($layerPp,CornerPixel['PTX0'],CornerPixel['PTY0'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0-CornerPixel['PTpStopWidth'],(CornerPixel['bDotDia']+CornerPixel['PTholeDia']-2.0*CornerPixel['metalOH'])/2.0+CornerPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu, CornerPixel['bPDia'],CornerPixel['bPX0'],CornerPixel['bPY0'],$layerPassivation,CornerPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,CornerPixel['viaX0'],CornerPixel['viaY0'],CornerPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,CornerPixel['viaX0'],-1*CornerPixel['viaY0'],CornerPixel['viaDia'])
    Pixel.createPStop($layerPp, CornerPixel['implantSizeX']+2*CornerPixel['PSdistX'], CornerPixel['implantSizeY']+2*CornerPixel['PSdistY'], CornerPixel['PSwidth'], CornerPixel['PSrOut'] , CornerPixel['PSrIn'], CornerPixel['PSopenX0'], CornerPixel['PSopenY0'], CornerPixel['PSopenWidth'],true)

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)
    
    Pixel.createGrid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2))
    
    Pixel.createGrid(outerPixelCell,OuterPixel['nX'],OuterPixel['nY'],OuterPixel['dX'],OuterPixel['dY'], PixelGrid['sizeX']/2-OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+(OuterPixel['cellSizeY']/2),180,true)
    
    Pixel.createGrid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2)
    
    Pixel.createGrid(upperPixelCell,UpperPixel['nX'],UpperPixel['nY'],UpperPixel['dX'],UpperPixel['dY'],-PixelGrid['sizeX']/2+OuterPixel['cellSizeX']+(3*UpperPixel['cellSizeX']/2), PixelGrid['sizeY']/2-UpperPixel['cellSizeY']/2,180,true)
    
    Pixel.createGrid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'],-PixelGrid['sizeX']/2+CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2))
    
    Pixel.createGrid(cornerPixelCell,CornerPixel['nX'],CornerPixel['nY'],CornerPixel['dX'],CornerPixel['dY'], PixelGrid['sizeX']/2-CornerPixel['cellSizeX']/2, PixelGrid['sizeY']/2-(CornerPixel['cellSizeY']/2),180,true)
    
    
    #OUTER PSTOP
    Periphery.createRing($layerPp,PixelGrid['sizeX'],PixelGrid['sizeY'],InnerPixel['PSwidth'],0,InnerPixel['PSrIn']+2*InnerPixel['PSwidth'])
    
    Merge.cells($fPixFCell, pixelGridCell)
    
    

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($fPixFCell, periCell)

    return $fPixFCell
  end
end
