module Roc4Sens100x25s2_ptcpst
  
  include RBA

  # Creates a sensor with a pitch of 25x100 µm² for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens100x25s2_ptcpst.create()
  
    load "Wafer_Phase2/sensors/Roc4Sens100x25s2/Common_p-stop/roc4sens100x25s2_para.rb"
        
    $roc4Sens100x25s2 = $layout.create_cell("Roc4Sens100x25s2")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createPTImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],InnerPixel['PTminDistToEdge'])
    Pixel.createPTMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'],OuterPixel['bLHoleWidth'],InnerPixel['PTminDistToEdge']+2*InnerPixel['metalOH'])
    Pixel.createPTVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'])
    Pixel.createPTPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'],$layerPassivation,InnerPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],-1*InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)

    outerPixelCell = $layout.create_cell("OuterCell")
    Pixel.init(outerPixelCell)
    Pixel.createPTImplant($layerNp,OuterPixel['implantSizeX'],OuterPixel['implantSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia'],OuterPixel['PTimplantDia'],OuterPixel['PTminDistToEdge'])
    Pixel.createPTMetal($layerAlu,OuterPixel['implantSizeX']+2.0*OuterPixel['metalOH'],OuterPixel['implantSizeY']+2.0*OuterPixel['metalOH'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'],OuterPixel['bLHoleWidth'],OuterPixel['PTminDistToEdge']+2*OuterPixel['metalOH'])
    Pixel.createPTVia($layerAluVia,OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,OuterPixel['cellSizeX'],OuterPixel['cellSizeY'],OuterPixel['PTX0'],OuterPixel['PTY0'],OuterPixel['bDotDia'],OuterPixel['bLWidth'])
    Pixel.createPTPStop($layerPp,OuterPixel['PTX0'],OuterPixel['PTY0'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0-OuterPixel['PTpStopWidth'],(OuterPixel['bDotDia']+OuterPixel['PTholeDia']-2.0*OuterPixel['metalOH'])/2.0+OuterPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,OuterPixel['bPDia'],OuterPixel['bPX0'],OuterPixel['bPY0'],$layerPassivation,OuterPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,OuterPixel['viaX0'],OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,OuterPixel['viaX0'],-1*OuterPixel['viaY0'],OuterPixel['viaDia'])
    Pixel.createPStop($layerPp, OuterPixel['implantSizeX']+2*OuterPixel['PSdistX'], OuterPixel['implantSizeY']+2*OuterPixel['PSdistY'], OuterPixel['PSwidth'], OuterPixel['PSrOut'] , OuterPixel['PSrIn'], OuterPixel['PSopenX0'], OuterPixel['PSopenY0'], OuterPixel['PSopenWidth'],true)

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2+OuterPixel['cellSizeY'],180,true)
    Pixel.createGrid(outerPixelCell,OuterPixel['nX'], OuterPixel['nY'], OuterPixel['dX'], OuterPixel['dY'], -PixelGrid['sizeX']/2+3*OuterPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+OuterPixel['cellSizeY']/2,180)
    Pixel.createGrid(outerPixelCell,OuterPixel['nX'], OuterPixel['nY'], OuterPixel['dX'], OuterPixel['dY'], -PixelGrid['sizeX']/2+OuterPixel['cellSizeX']/2, PixelGrid['sizeY']/2-OuterPixel['cellSizeY']/2,0)
 
 
    #OUTER PSTOP
    Periphery.createRing($layerPp,PixelGrid['sizeX'],PixelGrid['sizeY'],InnerPixel['PSwidth'],0,InnerPixel['PSrIn']+2*InnerPixel['PSwidth'])
 
    Merge.cells($roc4Sens100x25s2, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($roc4Sens100x25s2, periCell)

    return $roc4Sens100x25s2
  end
end
