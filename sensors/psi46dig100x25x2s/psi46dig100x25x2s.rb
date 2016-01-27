module PSI46DIG100x25x2noedge
  
  include RBA

  # Creates 100x30 FCP130 pattern sensor with common punch-thru
  # @return [cell] Returns the cell with all structures

  def PSI46DIG100x25x2noedge.create(layout,sensor)
    
    $sensor = layout.create_cell("PSI46DIG100x25")
    
    innerPixelCell1 = layout.create_cell("InnerPixel1")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],-InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    innerPixelCell2 = layout.create_cell("InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],-InnerPixel['viaY0'],InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)    
    
    largePixelCell = layout.create_cell("LargePixel")      
    Pixel.init(largePixelCell)
    Pixel.routingImplant($layerNp,LargePixel['implantSizeX'],LargePixel['implantSizeY'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, false)
    Pixel.routingImplant($layerAlu,LargePixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, true)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel1['bPX0'],LargePixel1['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel1['bPX0'],LargePixel1['bPY0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel2['bPX0'],LargePixel2['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel2['bPX0'],LargePixel2['bPY0'])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LargePixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LargePixel['implantSizeX']/2,sign*LargePixel['viaY0'],LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LargePixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LargePixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    
    
#     large pixel w/o routing
    largePixelCell1 = layout.create_cell("LargePixel1")      
    Pixel.init(largePixelCell1)
    Pixel.routingImplant($layerNp,LargePixel['implantSizeX'],LargePixel['implantSizeY'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'])
    Pixel.routingImplant($layerAlu,LargePixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel3['bPX0'],LargePixel3['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel3['bPX0'],LargePixel3['bPY0'])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LargePixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LargePixel['implantSizeX']/2,sign*LargePixel['viaY0'],LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LargePixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LargePixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    
    
    
    
    
   
    
#     CREAT GRID
    
    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
#     pixels are created from left to right
    Pixel.grid(largePixelCell,LargePixel['nX'], LargePixel['nY'], LargePixel['dX'], LargePixel['dY'], -PixelGrid['sizeX']/2+LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX1'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LargePixel['cellSizeX']+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX1'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LargePixel['cellSizeX']+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(largePixelCell1,LargePixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LargePixel['cellSizeX']+2*InnerPixel['cellSizeX']+LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    
    
    
    
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
