module RD5350x50cPT
  
  include RBA

  def RD5350x50cPT.create(layout,sensor)
    
    rocType = "RD53A"
        
    $sensor = layout.create_cell(sensor)
    name = sensor + "."
    
    innerPixelCell1 = layout.create_cell(name+"InnerPixel1")      
    Pixel.init(innerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.cptMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'],-InnerPixel['shiftX'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'],0,-InnerPixel['shiftX'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0+InnerPixel['PTpStopWidth'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0'])
    Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],InnerPixel['viaY0'])
	Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],-InnerPixel['viaY0'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true,0,0,(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0)
    
    innerPixelCell2 = layout.create_cell(name+"InnerPixel2")      
    Pixel.init(innerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.cptMetal($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.ptVia($layerAluVia,InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTviaDia'],-InnerPixel['shiftX'])
    Pixel.ptBiasLine($layerAlu,InnerPixel['cellSizeX'],InnerPixel['cellSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['bDotDia'],InnerPixel['bLWidth'],0,-InnerPixel['shiftX'])
    Pixel.ptPStop($layerPp,InnerPixel['PTX0'],InnerPixel['PTY0'],(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0-InnerPixel['PTpStopWidth'],(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0+InnerPixel['PTpStopWidth'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],InnerPixel['bPX0'],-InnerPixel['bPY0'])
    Pixel.bumpPad($layerAlu,InnerPixel['bPDia'],InnerPixel['bPX0'],-InnerPixel['bPY0'])
    Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],-InnerPixel['viaY0'])
	Pixel.via($layerAluVia,InnerPixel['viaDia'],InnerPixel['viaDia'],InnerPixel['viaX0'],InnerPixel['viaY0'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true,0,0,(InnerPixel['PTimplantDia']+InnerPixel['PTholeDia'])/2.0)    
	
	
    pixelGridCell = layout.create_cell(name+"PixelGrid")
    Pixel.init(pixelGridCell)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2))
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], (-PixelGrid['sizeX']/2+(InnerPixel['cellSizeX']/2)), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),0,true)
    Pixel.grid(innerPixelCell1,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+(InnerPixel['cellSizeY']/2),180,true)   
    Pixel.grid(innerPixelCell2,InnerPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], 2*InnerPixel['dY'], -PixelGrid['sizeX']/2+(3*InnerPixel['cellSizeX']/2), -PixelGrid['sizeY']/2+3*(InnerPixel['cellSizeY']/2),180)
	
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell(name+"Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge,rocType)
  
# Bumps on bias ring
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-199*InnerPixel['cellSizeX']-25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-198*InnerPixel['cellSizeX']-25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-197*InnerPixel['cellSizeX']-25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],-196*InnerPixel['cellSizeX']-25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],199*InnerPixel['cellSizeX']+25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],198*InnerPixel['cellSizeX']+25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],197*InnerPixel['cellSizeX']+25e3,-96*InnerPixel['cellSizeY']-25e3)
   Pixel.bumpPad($layerPassOpen,InnerPixel['bPDiaPassivation'],196*InnerPixel['cellSizeX']+25e3,-96*InnerPixel['cellSizeY']-25e3)

    
    textCell = Text.create(layout, $layerAlu, sensor ,-1000e3, 5490e3, 240)
    lowerTextCell = Text.create(layout,$layerAlu,"Place chip periphery over here",-3070e3, -5730e3, 240,sensor)        
    Merge.cells(periCell, lowerTextCell)
    
    Merge.cells(periCell, textCell) 
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
