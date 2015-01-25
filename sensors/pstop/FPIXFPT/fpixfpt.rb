module FPixFPT
  
  include RBA

  # Creates the FPIXFPT sensor
  # @return [cell] Returns the cell with all structures

  def FPixFPT.create()
  
    load "Wafer_Phase2/sensors/pstop/FPIXFPT/fpixfpt_para.rb"
        
    $fPixFCell = $layout.create_cell("FPIXFPT")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createPTImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],InnerImplantPT['x0'],InnerImplantPT['y0'],InnerImplantPT['holeDia'],InnerImplantPT['implantDia'])
    Pixel.createPTMetal($layerAlu,InnerImplant['sizeX']+InnerImplant['metalOH'],InnerImplant['sizeY']+InnerImplant['metalOH'],InnerImplantPT['x0'],InnerImplantPT['y0'],InnerImplantPT['holeDia']-InnerImplant['metalOH'],InnerImplantPT['biasLineHoleWidth'])
    Pixel.createPTVia($layerAluVia,InnerImplantPT['x0'],InnerImplantPT['y0'],InnerImplantPT['viaDia'])
    Pixel.createPTBiasLine($layerAlu,InnerImplant['sizeX'],InnerImplant['sizeY'],InnerImplantPT['x0'],InnerImplantPT['y0'],InnerImplantPT['biasDotDia'],InnerImplantPT['biasLineLength'],InnerImplantPT['biasLineWidth'])
    Pixel.createPTPStop($layerPp,InnerImplantPT['x0'],InnerImplantPT['y0'],InnerImplantPT['pStopRIn'],InnerImplantPT['pStopROut'])
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3)
    Pixel.createPStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)
    
    outerPixelCell = $layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.createPTImplant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'],OuterImplantPT['x0'],OuterImplantPT['y0'],OuterImplantPT['holeDia'],OuterImplantPT['implantDia'])
    Pixel.createPTMetal($layerAlu,OuterImplant['sizeX']+OuterImplant['metalOH'],OuterImplant['sizeY']+OuterImplant['metalOH'],OuterImplantPT['x0'],OuterImplantPT['y0'],OuterImplantPT['holeDia']-OuterImplant['metalOH'],OuterImplantPT['biasLineHoleWidth'])
    Pixel.createPTVia($layerAluVia,OuterImplantPT['x0'],OuterImplantPT['y0'],OuterImplantPT['viaDia'])
    Pixel.createPTBiasLine($layerAlu,OuterImplant['sizeX'],OuterImplant['sizeY'],OuterImplantPT['x0'],OuterImplantPT['y0'],OuterImplantPT['biasDotDia'],OuterImplantPT['biasLineLength'],OuterImplantPT['biasLineWidth'])
    Pixel.createPTPStop($layerPp,OuterImplantPT['x0'],OuterImplantPT['y0'],OuterImplantPT['pStopRIn'],OuterImplantPT['pStopROut'])
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],50e3)
    Pixel.createPStop($layerPp, OuterImplant['sizeX']+2*OuterPStop['distX'], OuterImplant['sizeY']+2*OuterPStop['distY'], OuterPStop['width'], OuterPStop['rOut'] , OuterPStop['rIn'], OuterPStop['openX0'], OuterPStop['openY0'], OuterPStop['openWidth'],true)

    upperPixelCell = $layout.create_cell("UpperPixel")
    Pixel.init(upperPixelCell)
    Pixel.createPTImplant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'],UpperImplantPT['x0'],UpperImplantPT['y0'],UpperImplantPT['holeDia'],UpperImplantPT['implantDia'])
    Pixel.createPTMetal($layerAlu,UpperImplant['sizeX']+UpperImplant['metalOH'],UpperImplant['sizeY']+UpperImplant['metalOH'],UpperImplantPT['x0'],UpperImplantPT['y0'],UpperImplantPT['holeDia']-UpperImplant['metalOH'],UpperImplantPT['biasLineHoleWidth'])
    Pixel.createPTVia($layerAluVia,UpperImplantPT['x0'],UpperImplantPT['y0'],UpperImplantPT['viaDia'])
    Pixel.createPTBiasLine($layerAlu,UpperImplant['sizeX'],UpperImplant['sizeY'],UpperImplantPT['x0'],UpperImplantPT['y0'],UpperImplantPT['biasDotDia'],UpperImplantPT['biasLineLength'],UpperImplantPT['biasLineWidth'])
    Pixel.createPTPStop($layerPp,UpperImplantPT['x0'],UpperImplantPT['y0'],UpperImplantPT['pStopRIn'],UpperImplantPT['pStopROut'])
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3,-50e3)
    Pixel.createPStop($layerPp, UpperImplant['sizeX']+2*UpperPStop['distX'], UpperImplant['sizeY']+2*UpperPStop['distY'], UpperPStop['width'], UpperPStop['rOut'] , UpperPStop['rIn'], UpperPStop['openX0'], UpperPStop['openY0'], UpperPStop['openWidth'],false)

    cornerPixelCell = $layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.createPTImplant($layerNp,CornerImplant['sizeX'],CornerImplant['sizeY'],CornerImplantPT['x0'],CornerImplantPT['y0'],CornerImplantPT['holeDia'],CornerImplantPT['implantDia'])
    Pixel.createPTMetal($layerAlu,CornerImplant['sizeX']+CornerImplant['metalOH'],CornerImplant['sizeY']+CornerImplant['metalOH'],CornerImplantPT['x0'],CornerImplantPT['y0'],CornerImplantPT['holeDia']-CornerImplant['metalOH'],CornerImplantPT['biasLineHoleWidth'])
    Pixel.createPTVia($layerAluVia,CornerImplantPT['x0'],CornerImplantPT['y0'],CornerImplantPT['viaDia'])
    Pixel.createPTBiasLine($layerAlu,CornerImplant['sizeX'],CornerImplant['sizeY'],CornerImplantPT['x0'],CornerImplantPT['y0'],CornerImplantPT['biasDotDia'],CornerImplantPT['biasLineLength'],CornerImplantPT['biasLineWidth'])
    Pixel.createPTPStop($layerPp,CornerImplantPT['x0'],CornerImplantPT['y0'],CornerImplantPT['pStopRIn'],CornerImplantPT['pStopROut'])
    Pixel.createBumpPad($layerAlu, BumpPad['dia'],50e3,-50e3)
    Pixel.createPStop($layerPp, CornerImplant['sizeX']+2*CornerPStop['distX'], CornerImplant['sizeY']+2*CornerPStop['distY'], CornerPStop['width'], CornerPStop['rOut'] , CornerPStop['rIn'], CornerPStop['openX0'], CornerPStop['openY0'], CornerPStop['openWidth'],true)

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2),180,true)
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'], PixelGrid['sizeX']/2-OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2),180,true)
    Pixel.createGrid(upperPixelCell,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(UpperPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2)
    Pixel.createGrid(upperPixelCell,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*UpperPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2,180,true)
    Pixel.createGrid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'],-PixelGrid['sizeX']/2+CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2))
    Pixel.createGrid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'], PixelGrid['sizeX']/2-CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2),180,true)
    
    Merge.cells($fPixFCell, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($fPixFCell, periCell)

    return $fPixFCell
  end
end
