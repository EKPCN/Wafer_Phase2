module Roc4Sens100x25_ptcpst
  
  include RBA

  # Creates a sensor with a pitch of 25x100 µm² for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens100x25_ptcpst.create()
  
    load "Wafer_Phase2/sensors/Roc4Sens100x25/Common_p-stop/roc4sens100x25_para.rb"
        
    $roc4Sens100x25 = $layout.create_cell("Roc4Sens100x25")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createPTImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],InnerPixel['PTminDistToEdge'])
    Pixel.createPTMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'],InnerPixel['bLHoleWidth'],InnerPixel['PTminDistToEdge']+2*InnerPixel['metalOH'])
    Pixel.createPTVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.createPTBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'])
    Pixel.createPTPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.createBumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'],$layerPassivation,InnerPixel['bPDiaPassivation'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPTVia($layerAluVia,InnerPixel['viaX0'],-1*InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.createPStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
  
    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(3*InnerPixel['cellSizeY']/2),180)


    #OUTER PSTOP
    Periphery.createRing($layerPp,PixelGrid['sizeX'],PixelGrid['sizeY'],InnerPixel['PSwidth'],0,InnerPixel['PSrIn']+2*InnerPixel['PSwidth'])

    Merge.cells($roc4Sens100x25, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($roc4Sens100x25, periCell)

    return $roc4Sens100x25
  end
end
