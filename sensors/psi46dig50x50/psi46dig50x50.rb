module PSI46DIG50x50
  
  include RBA

  # Creates 100x30 FCP130 pattern sensor with common punch-thru
  # @return [cell] Returns the cell with all structures

  def PSI46DIG50x50.create(layout,sensor)
    
    $sensor = layout.create_cell("PSI46DIG100x25")
    
    
    pixel1Cell = layout.create_cell("Pixel1")      
    Pixel.init(pixel1Cell)
    Pixel.routingImplant($layerNp,Pixel1['implantSizeX'],Pixel1['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'])
    Pixel.routingImplant($layerAlu,Pixel1['implantSizeX']+2.0*AllPixel['metalOH'],Pixel1['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'])
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel1['bPX0'],Pixel1['bPY0'])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel1['bPX0'],Pixel1['bPY0'])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=Pixel1['implantSizeX']-2*AllPixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,AllPixel['viaX0']+i*dist-Pixel1['implantSizeX']/2,sign*AllPixel['viaY0'],AllPixel['viaDia'])
      i+=1
      if sign==1 && i*dist>Pixel1['implantSizeX']-2*AllPixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, Pixel1['implantSizeX']+2*AllPixel['PSdistX'], Pixel1['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
    
    
    pixel3Cell = layout.create_cell("Pixel3")      
    Pixel.init(pixel3Cell)
    Pixel.routingImplant($layerNp,Pixel3['implantSizeX'],Pixel3['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel3BPPar, false)
    Pixel.routingImplant($layerAlu,Pixel3['implantSizeX']+2.0*AllPixel['metalOH'],Pixel3['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel3BPPar, true)
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel3['bPX0'],Pixel3['bPY0'])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel3['bPX0'],Pixel3['bPY0'])
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel3BPPar[0],Pixel3BPPar[1])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel3BPPar[0],Pixel3BPPar[1])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=Pixel3['implantSizeX']-2*AllPixel['viaX0'] do 
      if (sign==1 && i!=2) || (sign==-1 && i!=1)
        Pixel.ptVia($layerAluVia,AllPixel['viaX0']+i*dist-Pixel3['implantSizeX']/2,sign*AllPixel['viaY0'],AllPixel['viaDia'])
      end
      i+=1
      if sign==1 && i*dist>Pixel3['implantSizeX']-2*AllPixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, Pixel3['implantSizeX']+2*AllPixel['PSdistX'], Pixel3['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
   
    
    
    pixel4Cell = layout.create_cell("Pixel2")      
    Pixel.init(pixel4Cell)
    Pixel.routingImplant($layerNp,Pixel4['implantSizeX'],Pixel4['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel4BPPar, false)
    Pixel.routingImplant($layerAlu,Pixel4['implantSizeX']+2.0*AllPixel['metalOH'],Pixel4['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel4BPPar, true)
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel4['bPX0'],Pixel4['bPY0'])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel4['bPX0'],Pixel4['bPY0'])
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel4BPPar[0],Pixel4BPPar[1])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel4BPPar[0],Pixel4BPPar[1])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=Pixel4['implantSizeX']-2*AllPixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,AllPixel['viaX0']+i*dist-Pixel4['implantSizeX']/2,sign*AllPixel['viaY0'],AllPixel['viaDia'])
      i+=1
      if sign==1 && i*dist>Pixel4['implantSizeX']-2*AllPixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, Pixel2['implantSizeX']+2*AllPixel['PSdistX'], Pixel3['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
    
    
    pixel2Cell = layout.create_cell("Pixel2")      
    Pixel.init(pixel2Cell)
    Pixel.routingImplant($layerNp,Pixel2['implantSizeX'],Pixel2['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel2BPPar, false)
    Pixel.routingImplant($layerAlu,Pixel2['implantSizeX']+2.0*AllPixel['metalOH'],Pixel2['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'], Pixel2BPPar, true)
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel2['bPX0'],Pixel2['bPY0'])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel2['bPX0'],Pixel2['bPY0'])
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],Pixel2BPPar[0],Pixel2BPPar[1])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],Pixel2BPPar[0],Pixel2BPPar[1])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=Pixel2['implantSizeX']-2*AllPixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,AllPixel['viaX0']+i*dist-Pixel2['implantSizeX']/2,sign*AllPixel['viaY0'],AllPixel['viaDia'])
      i+=1
      if sign==1 && (i+1)*dist>Pixel2['implantSizeX']-2*AllPixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, Pixel2['implantSizeX']+2*AllPixel['PSdistX'], Pixel3['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
    
    
    pixelIICell = layout.create_cell("PixelII")      
    Pixel.init(pixelIICell)
    Pixel.routingImplant($layerNp,PixelI['implantSizeX'],PixelI['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'], PixelIIBPPar, false)
    Pixel.routingImplant($layerAlu,PixelI['implantSizeX']+2.0*AllPixel['metalOH'],PixelI['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'], PixelIIBPPar, true)
    Pixel.bumpPad($layerPassOpen,AllPixel['bPDiaPassivation'],PixelIIBPPar[0],PixelIIBPPar[1])
    Pixel.bumpPad($layerAlu,AllPixel['bPDia'],PixelIIBPPar[0],PixelIIBPPar[1])
    Pixel.ptVia($layerAluVia,PixelI['viaX0'],PixelI['viaY0'],AllPixel['viaDia'])
    Pixel.pStop($layerPp, PixelI['implantSizeX']+2*AllPixel['PSdistX'], Pixel3['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
    
    pixelICell = layout.create_cell("PixelI")      
    Pixel.init(pixelICell)
    Pixel.routingImplant($layerNp,PixelI['implantSizeX'],PixelI['implantSizeY'], AllPixel['routingdist'], AllPixel['routingwidth'], AllPixel['bPDia'])
    Pixel.routingImplant($layerAlu,PixelI['implantSizeX']+2.0*AllPixel['metalOH'],PixelI['implantSizeY']+2.0*AllPixel['metalOH'], AllPixel['routingdist']-AllPixel['metalOH'], AllPixel['routingwidth'], AllPixel['bPDia'])
    Pixel.ptVia($layerAluVia,PixelI['viaX0'],PixelI['viaY0'],AllPixel['viaDia'])
    Pixel.pStop($layerPp, PixelI['implantSizeX']+2*AllPixel['PSdistX'], Pixel3['implantSizeY']+2*AllPixel['PSdistY'], AllPixel['PSwidth'], AllPixel['PSrOut'] , AllPixel['PSrIn'], AllPixel['PSopenX0'], AllPixel['PSopenY0'], AllPixel['PSopenWidth'],true)
    
#     CREAT GRID
    
    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
#     pixels are created from lower left to right upwards in rows
#     edges
    #left
    Pixel.grid(pixel1Cell,EdgePixel['nXl'], 6*AllPixel['nY'], EdgePixel['dX'], EdgePixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel1['cellSizeY']/2,180,false)
    #right
    Pixel.grid(pixel1Cell,EdgePixel['nXr1'], 6*AllPixel['nY'], EdgePixel['dX'], EdgePixel['dY'], -PixelGrid['sizeX']/2+AllPixel['nX']*AllPixel['dX']+3*Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel1['cellSizeY']/2)
    Pixel.grid(pixel1Cell,EdgePixel['nXr2'], 6*AllPixel['nY'], EdgePixel['dX'], EdgePixel['dY'], -PixelGrid['sizeX']/2+AllPixel['nX']*AllPixel['dX']+5*Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel1['cellSizeY']/2,180,false)
    #upper
    Pixel.grid(pixel1Cell,EdgePixel['nXu1'], EdgePixel['nYu'], EdgePixel['dX'], EdgePixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+AllPixel['nY']*AllPixel['dY']+Pixel1['cellSizeY']/2,180,false)
    Pixel.grid(pixel1Cell,EdgePixel['nXu2'], EdgePixel['nYu'], EdgePixel['dX'], EdgePixel['dY'], -PixelGrid['sizeX']/2+3*Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+AllPixel['nY']*AllPixel['dY']+Pixel1['cellSizeY']/2)
#     row 1
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel1['cellSizeY']/2)
    
    Pixel.grid(pixel3Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']/2)
    
    Pixel.grid(pixel4Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']+Pixel4['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel4['cellSizeY']/2)
    
    Pixel.grid(pixel4Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']+3*Pixel4['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel4['cellSizeY']/2,180,true)
    
    Pixel.grid(pixel3Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+2*Pixel4['cellSizeX']+3*Pixel3['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']/2,180,true)
    
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+3*Pixel1['cellSizeX']/2+2*Pixel4['cellSizeX']+2*Pixel3['cellSizeX'], -PixelGrid['sizeY']/2+Pixel1['cellSizeY']/2,180)
    
#     row 2
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+3*Pixel1['cellSizeY']/2)
    
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+3*Pixel1['cellSizeX']/2+2*Pixel4['cellSizeX']+2*Pixel3['cellSizeX'], -PixelGrid['sizeY']/2+3*Pixel1['cellSizeY']/2,180)
    
#     row 3
    Pixel.grid(pixel2Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+Pixel2['cellSizeY']/2)
#     50x50 row 1
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+3*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+PixelI['cellSizeY']/2,180,true)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+5*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+7*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+PixelI['cellSizeY']/2,180,true)
#     50x50 row 2
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*PixelI['cellSizeY']/2,0,true)
    
    Pixel.grid(pixelICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+3*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+5*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+7*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*PixelI['cellSizeY']/2,180,false)
    
    Pixel.grid(pixel2Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+4*PixelI['cellSizeX']+3*Pixel2['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+Pixel2['cellSizeY']/2,180,true)

#     row 4
    Pixel.grid(pixel2Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*Pixel2['cellSizeY']/2,0,true)
#     50x50 row 3
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+5*PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+3*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+5*PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+5*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+5*PixelI['cellSizeY']/2)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+7*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+5*PixelI['cellSizeY']/2,180,true)
#     50x50 row 4
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+7*PixelI['cellSizeY']/2,0,true)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+3*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+7*PixelI['cellSizeY']/2,180,false)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+5*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+7*PixelI['cellSizeY']/2,0,true)
    
    Pixel.grid(pixelIICell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel2['cellSizeX']+7*PixelI['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+7*PixelI['cellSizeY']/2,180,false)
    
    Pixel.grid(pixel2Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+4*PixelI['cellSizeX']+3*Pixel2['cellSizeX']/2, -PixelGrid['sizeY']/2+Pixel3['cellSizeY']+3*Pixel2['cellSizeY']/2,180,false)    
    
#     row 5
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+9*Pixel1['cellSizeY']/2)
    
    Pixel.grid(pixel3Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']/2, -PixelGrid['sizeY']/2+5*Pixel3['cellSizeY']/2,0,true)
    
    Pixel.grid(pixel4Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']+Pixel4['cellSizeX']/2, -PixelGrid['sizeY']/2+5*Pixel4['cellSizeY']/2,0,true)
    
    Pixel.grid(pixel4Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+Pixel3['cellSizeX']+3*Pixel4['cellSizeX']/2, -PixelGrid['sizeY']/2+5*Pixel4['cellSizeY']/2,180,false)
    
    Pixel.grid(pixel3Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']+2*Pixel4['cellSizeX']+3*Pixel3['cellSizeX']/2, -PixelGrid['sizeY']/2+5*Pixel3['cellSizeY']/2,180,false)
    
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+3*Pixel1['cellSizeX']/2+2*Pixel4['cellSizeX']+2*Pixel3['cellSizeX'], -PixelGrid['sizeY']/2+9*Pixel1['cellSizeY']/2,180)
    
#     row 6
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+Pixel1['cellSizeX']/2, -PixelGrid['sizeY']/2+11*Pixel1['cellSizeY']/2)
    
    Pixel.grid(pixel1Cell,AllPixel['nX'], AllPixel['nY'], AllPixel['dX'], AllPixel['dY'], -PixelGrid['sizeX']/2+Pixel1['cellSizeX']+3*Pixel1['cellSizeX']/2+2*Pixel4['cellSizeX']+2*Pixel3['cellSizeX'], -PixelGrid['sizeY']/2+11*Pixel1['cellSizeY']/2,180)    
    
    Merge.cells($sensor, pixelGridCell)

    periCell = layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)
    
    textCell = Text.create(layout, $layerPassOpen, sensor , -4000e3, 4500e3)
    Merge.cells(periCell, textCell)
    
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
