module R4S50x50PT
  
  include RBA

  # Creates the FPIXFPT sensor
  # @return [cell] Returns the cell with all structures

  def R4S50x50PT.create(layout,sensor)
          
    rocType = "R4S"
          
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell = layout.create_cell(name+"InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'])
    Pixel.ptMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'],InnerPixel['bLHoleWidth'])
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['bDotDia']+InnerPixel['PTholeDia']-2.0*InnerPixel['metalOH'])/2.0+InnerPixel['PTpStopWidth'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    Pixel.grid(innerPixelCell,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2,0,true)

    # Last Pixel Row
    
    Pixel.grid(innerPixelCell,1, InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], PixelGrid['sizeX']/2-InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    #Pixel.grid(innerPixelCell,1, InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], PixelGrid['sizeX']/2-InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+3*InnerPixel['cellSizeY']/2,0,true)
      
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")

 
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)
    
    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 4590e3, 240) 
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3138e3, -4830e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)  
    Merge.cells(periCell, textCell)
 
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
