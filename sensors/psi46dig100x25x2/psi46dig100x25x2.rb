module PSI46DIG100x25x2
  
  include RBA

  # Creates 100x30 FCP130 pattern sensor with common punch-thru
  # @return [cell] Returns the cell with all structures

  def PSI46DIG100x25x2.create(layout,sensor)
    
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
    
    
    
    leftPixelCell = layout.create_cell("LeftPixel")
    Pixel.init(leftPixelCell)
    LargePixelBPPar[0]+=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    LargePixelBPPar[2]+=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    Pixel.routingImplant($layerNp,LeftPixel['implantSizeX'],LargePixel['implantSizeY'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, false)
    Pixel.routingImplant($layerAlu,LeftPixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, true)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel1['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel1['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel1['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel1['bPY0'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel2['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel2['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel2['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel2['bPY0'])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LeftPixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LeftPixel['implantSizeX']/2,sign*LargePixel['viaY0'],LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LeftPixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LeftPixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    LargePixelBPPar[0]-=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    LargePixelBPPar[2]-=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    
    
    rightPixelCell = layout.create_cell("RightPixel")
    Pixel.init(rightPixelCell)
    Pixel.ptImplant($layerNp,RightPixel['implantSizeX'],InnerPixel['implantSizeY'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,RightPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel3['bPX0']-(RightPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel3['bPY0'])
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel3['bPX0']-(RightPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel3['bPY0'])
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=RightPixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-RightPixel['implantSizeX']/2,sign*LargePixel['viaY0'],LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>RightPixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, RightPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    
    
    
    
    #     upper pixel row
    uinnerPixelCell1 = layout.create_cell("uInnerPixel1")      
    Pixel.init(uinnerPixelCell1)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY']+UpperRow['Yplus'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+UpperRow['Yplus']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation']-2e3,InnerPixel['bPX0'],InnerPixel['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],InnerPixel['bPX0'],InnerPixel['bPY0']-UpperRow['Yplus']/2)
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0']-UpperRow['Yplus']/2,InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],-InnerPixel['viaY0']-UpperRow['Yplus']/2,InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+UpperRow['Yplus']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    uinnerPixelCell2 = layout.create_cell("uInnerPixel2")      
    Pixel.init(uinnerPixelCell2)
    Pixel.ptImplant($layerNp,InnerPixel['implantSizeX'],InnerPixel['implantSizeY']+UpperRow['Yplus'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,InnerPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+UpperRow['Yplus']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],InnerPixel['viaY0']-UpperRow['Yplus']/2,InnerPixel['viaDia'])
    Pixel.ptVia($layerAluVia,InnerPixel['viaX0'],-InnerPixel['viaY0']-UpperRow['Yplus']/2,InnerPixel['viaDia'])
    Pixel.pStop($layerPp, InnerPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+UpperRow['Yplus']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)    
    
    ulargePixelCell = layout.create_cell("uLargePixel")      
    Pixel.init(ulargePixelCell)
    LargePixelBPPar[1]-=UpperRow['Yplus']/2
    LargePixelBPPar[3]-=UpperRow['Yplus']/2
    Pixel.routingImplant($layerNp,LargePixel['implantSizeX'],LargePixel['implantSizeY']+UpperRow['Yplus'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, false)
    Pixel.routingImplant($layerAlu,LargePixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+UpperRow['Yplus']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, true)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel1['bPX0'],LargePixel1['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel1['bPX0'],LargePixel1['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel2['bPX0'],LargePixel2['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel2['bPX0'],LargePixel2['bPY0']-UpperRow['Yplus']/2)
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LargePixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LargePixel['implantSizeX']/2,sign*LargePixel['viaY0']-UpperRow['Yplus']/2,LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LargePixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LargePixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+UpperRow['Yplus']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    
    
#     large pixel w/o routing
    ulargePixelCell1 = layout.create_cell("uLargePixel1")      
    Pixel.init(ulargePixelCell1)
    Pixel.routingImplant($layerNp,LargePixel['implantSizeX'],LargePixel['implantSizeY']+UpperRow['Yplus'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'])
    Pixel.routingImplant($layerAlu,LargePixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+UpperRow['Yplus']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel3['bPX0'],LargePixel3['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel3['bPX0'],LargePixel3['bPY0']-UpperRow['Yplus']/2)
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LargePixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LargePixel['implantSizeX']/2,sign*LargePixel['viaY0']-UpperRow['Yplus']/2,LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LargePixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LargePixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+UpperRow['Yplus']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    
    
    
    uleftPixelCell = layout.create_cell("uLeftPixel")
    Pixel.init(uleftPixelCell)
    LargePixelBPPar[0]+=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    LargePixelBPPar[2]+=(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2
    Pixel.routingImplant($layerNp,LeftPixel['implantSizeX'],LargePixel['implantSizeY']+UpperRow['Yplus'], LargePixel['routingdist'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, false)
    Pixel.routingImplant($layerAlu,LeftPixel['implantSizeX']+2.0*LargePixel['metalOH'],LargePixel['implantSizeY']+UpperRow['Yplus']+2.0*LargePixel['metalOH'], LargePixel['routingdist']-LargePixel['metalOH'], LargePixel['routingwidth'], BumpPad['bPDia'], LargePixelBPPar, true)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel1['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel1['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel1['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel1['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel2['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel2['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel2['bPX0']+(LeftPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel2['bPY0']-UpperRow['Yplus']/2)
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=LeftPixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-LeftPixel['implantSizeX']/2,sign*LargePixel['viaY0']-UpperRow['Yplus']/2,LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>LeftPixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, LeftPixel['implantSizeX']+2*LargePixel['PSdistX'], LargePixel['implantSizeY']+UpperRow['Yplus']+2*LargePixel['PSdistY'], LargePixel['PSwidth'], LargePixel['PSrOut'] , LargePixel['PSrIn'], LargePixel['PSopenX0'], LargePixel['PSopenY0'], LargePixel['PSopenWidth'],true)
    
    
    urightPixelCell = layout.create_cell("uRightPixel")
    Pixel.init(urightPixelCell)
    Pixel.ptImplant($layerNp,RightPixel['implantSizeX'],InnerPixel['implantSizeY']+UpperRow['Yplus'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia'],InnerPixel['PTimplantDia'],0,-InnerPixel['shiftX'])
    Pixel.ptImplant($layerAlu,RightPixel['implantSizeX']+2.0*InnerPixel['metalOH'],InnerPixel['implantSizeY']+UpperRow['Yplus']+2.0*InnerPixel['metalOH'],InnerPixel['PTX0'],InnerPixel['PTY0'],InnerPixel['PTholeDia']-2.0*InnerPixel['innerPTmetalOH'],-InnerPixel['shiftX'])
    Pixel.bumpPad($layerPassOpen,BumpPad['bPDiaPassivation'],LargePixel3['bPX0']-(RightPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel3['bPY0']-UpperRow['Yplus']/2)
    Pixel.bumpPad($layerAlu,BumpPad['bPDia'],LargePixel3['bPX0']-(RightPixel['implantSizeX']-LargePixel['implantSizeX'])/2,LargePixel3['bPY0']-UpperRow['Yplus']/2)
    # create via grid
    i = 0
    sign = 1
    # distance between vias
    dist = 50e3
    while i*dist<=RightPixel['implantSizeX']-2*LargePixel['viaX0'] do 
      Pixel.ptVia($layerAluVia,LargePixel['viaX0']+i*dist-RightPixel['implantSizeX']/2,sign*LargePixel['viaY0']-UpperRow['Yplus']/2,LargePixel['viaDia'])
      i+=1
      if sign==1 && i*dist>RightPixel['implantSizeX']-2*LargePixel['viaX0']
        sign = -1
        i = 0
      end
    end
    Pixel.pStop($layerPp, RightPixel['implantSizeX']+2*InnerPixel['PSdistX'], InnerPixel['implantSizeY']+UpperRow['Yplus']+2*InnerPixel['PSdistY'], InnerPixel['PSwidth'], InnerPixel['PSrOut'] , InnerPixel['PSrIn'], InnerPixel['PSopenX0'], InnerPixel['PSopenY0'], InnerPixel['PSopenWidth'],true)
    
    
#     CREAT GRID
    
    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
#     pixels are created from left to right
    Pixel.grid(leftPixelCell,LeftPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell2,InnerPixel['nX1'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(innerPixelCell1,InnerPixel['nX1'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(largePixelCell1,InnerPixel['nX2'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+2*InnerPixel['cellSizeX']+LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(largePixelCell,LargePixel['nX'], LargePixel['nY'], LargePixel['dX'], LargePixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+2*InnerPixel['cellSizeX']+3*LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    Pixel.grid(rightPixelCell,RightPixel['nX'], InnerPixel['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+RightPixel['cellSizeX']/2+(InnerPixel['nX1']-1)*InnerPixel['dX']+2*InnerPixel['cellSizeX'], -PixelGrid['sizeY']/2+LargePixel['cellSizeY']/2)
    
    
#    upper pixel row
    
    Pixel.grid(uleftPixelCell,LeftPixel['nX'], UpperRow['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    Pixel.grid(uinnerPixelCell2,InnerPixel['nX1'], UpperRow['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    Pixel.grid(uinnerPixelCell1,InnerPixel['nX1'], UpperRow['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+3*InnerPixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    Pixel.grid(ulargePixelCell1,InnerPixel['nX2'], UpperRow['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+2*InnerPixel['cellSizeX']+LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    Pixel.grid(ulargePixelCell,LargePixel['nX'], UpperRow['nY'], LargePixel['dX'], LargePixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+2*InnerPixel['cellSizeX']+3*LargePixel['cellSizeX']/2, -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    Pixel.grid(urightPixelCell,RightPixel['nX'], UpperRow['nY'], InnerPixel['dX'], InnerPixel['dY'], -PixelGrid['sizeX']/2+LeftPixel['cellSizeX']+RightPixel['cellSizeX']/2+(InnerPixel['nX1']-1)*InnerPixel['dX']+2*InnerPixel['cellSizeX'], -PixelGrid['sizeY']/2+InnerPixel['nY']*InnerPixel['cellSizeY']+(UpperRow['Yplus']+InnerPixel['cellSizeY'])/2)
    
    
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
