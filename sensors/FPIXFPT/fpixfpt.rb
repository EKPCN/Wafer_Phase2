module FPixFPT
  
  include RBA
  
  def FPixFPT.create()
  
	# create different architectures
	#load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt_para_PT_individualPStop.rb"
    load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt_para_PT_commonPStop.rb"
    #load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt_para_PT_PSpray.rb"
	#load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt_para_PSpray.rb"
	#load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt_para_individualPStop.rb"
	
	
    $fPixFCell = $layout.create_cell("FPIXF")
    par = Defaults
    
    
#     Coordinates of lower left corner pixel (origin for the grid)
    pixX = 1010e3
    pixY = 1310e3
    
  
#     lower left corner of pixel metal/implant
#     metal
    posmx = par['pStopSizeX']/2 - par['implantSizeX']/2 - par['metaloverhang']
    posmy = par['pStopSizeY']/2 - par['implantSizeY']/2 - par['metaloverhang']
#     implant
    posix = par['pStopSizeX']/2 - par['implantSizeX']/2
    posiy = par['pStopSizeY']/2 - par['implantSizeY']/2
    

#     Punch through parameters
#     radii of n implant
    rinnern = par['implantptdia']/2
    if par['implantptdia']>0
      routern = 2*par['distmetaltopstopwidth'] + par['pstopptwidth'] + par['implantptdia']/2 + 2*par['metaloverhang']
    else
      routern = 0
    end
#     position of n implant
#     posnx = 
#     posny = 
#     radii of metal
    if par['implantptdia']>0
      rinnerm = rinnern + par['metaloverhang']
      routerm = routern - par['metaloverhang']
    else
      rinnerm = 0
      routerm = 0
    end
#     radii of inner pstop
    rinnerps = (rinnerm + routerm - par['pstopptwidth'])/2
    routerps = (routerm + rinnerm + par['pstopptwidth'])/2
#     Center of Punch through and Position of Via
    poscenterptx = par['thicknessofremainingpadimplant'] + routern
    poscenterpty = par['implantSizeY']/2
    
	# parameters for via generation
	# center of punch through relative to lower left corner of pstop
    posptx = poscenterptx+posix
    pospty = poscenterpty+posiy
	# center of bump pad relative to pstop
    posbpx = posix + par['pStopSizeX'] - par['distancebumppadtoedgeSTD'] - par['bumpPadDiameter']/2
    posbpy = posiy + (par['implantSizeY']- par['bumpPadDiameter'])/2
	# x coordinate for vias
    vx = posptx + routern + (posbpx - par['bumpPadDiameter']/2 - posptx - routern)/2
	# y coordinate for vias
    if par['bumpPadDiameter']/2 > routern
      vy1 = posiy + (par['implantSizeY'] - par['bumpPadDiameter'])/4
      vy2 = posiy + par['bumpPadDiameter'] + 3*(par['implantSizeY'] - par['bumpPadDiameter'])/4
    else
      vy1 = posiy + (par['implantSizeY']-2*routern)/4
      vy2 = posiy + 2*routern + 3*(par['implantSizeY']-2*routern)/4
    end
    
    
    
    
    
    
	
	
	
    
    # innerPixelPTGrid1    
    innerPixelPTCell1 = $layout.create_cell("innerPixelPTCell1")  
    PixelPT.init(innerPixelPTCell1)
    PixelPT.createImplant($layerNp,par['implantSizeX'],par['implantSizeY'],rinnern,routern,poscenterptx,poscenterpty,posix,posiy)
    PixelPT.createImplant($layerAlu,par['implantSizeX'] + 2*par['metaloverhang'],par['implantSizeY'] + 2*par['metaloverhang'],rinnerm,routerm,poscenterptx+par['metaloverhang'],poscenterpty+par['metaloverhang'],posmx,posmy, par['biaslinewidth']+ 2*par['distbetweenbiaslineandpad'],par['biaslinewidth'],par['biaslineoverlap'])
    PixelPT.createCircle($layerAluVia,par['viaptdia']/2,poscenterptx+posix,poscenterpty+posiy)
    PixelPT.createCRing($layerPp,rinnerps,routerps,poscenterptx+posix,poscenterpty+posiy)
#     PixelPT.createVia($layerAluVia,par['pixelViaSizeX'],par['pixelViaSizeY'],posix + par['implantSizeX']/2-par['pixelViaSizeX']/2,posiy + par['implantSizeY']/2 - par['pixelViaSizeY']/2)
    PixelPT.createSeveralRoundVia($layerAluVia,par['viadia'],vx,vy1,vy2,posix,posiy,posix+par['implantSizeX'],posix+par['implantSizeY'])
    PixelPT.createBumpPad($layerAlu,par['bumpPadDiameter'], par['pStopSizeX'] - par['distancebumppadtoedgeSTD'] - par['bumpPadDiameter']/2,posiy + (par['implantSizeY']- par['bumpPadDiameter'])/2)
    PixelPT.createPStop($layerPp, par['distedgetopspray'], par['pStopSizeX'], par['pStopSizeY'], par['pStopWidth'], par['pStopCornerRout'] , par['pStopCornerRin'], par['pStopOpenX0'], par['pStopOpenY0'], par['pStopOpenWidth'],true)
    
    innerPixelPTGridCell1 = $layout.create_cell("InnerPixelPTGrid1")
    PixelPT.init(innerPixelPTGridCell1)
    PixelPT.createCellGrid(innerPixelPTCell1, par['pixelGridnX'], par['pixelGridnY'], par['pixelGriddX'], par['pixelGriddY']) 
    Merge.cells($fPixFCell,innerPixelPTGridCell1,pixX + par['pStopSizeOuterX'],pixY)
     
    
    
    
  #  innerPixelPTGrid2  
#     ROTATE AND MOVE CELL
    innerPixelPTCell2rotated = $layout.create_cell("innerPixelPTCell2rotated")
    inst = RBA::CellInstArray::new( innerPixelPTCell1.cell_index, RBA::Trans::new(2, true, par['pStopSizeX'], 0) )  
    innerPixelPTCell2rotated.insert(inst)
	
    innerPixelPTGridCell2 = $layout.create_cell("InnerPixelPTGrid1")
    PixelPT.init(innerPixelPTGridCell2)
    PixelPT.createCellGrid(innerPixelPTCell2rotated, par['pixelGridnX'], par['pixelGridnY'], par['pixelGriddX'], par['pixelGriddY'])
    Merge.cells($fPixFCell,innerPixelPTGridCell2,pixX + par['pStopSizeOuterX'] + par['pStopSizeX'],pixY)
    
    
    
    
    
    
    
    
#     create outerPixelGrid1
    outerPixelCell1 = $layout.create_cell("outerImplantCell1")    
    PixelPT.init(outerPixelCell1)
    PixelPT.createImplant($layerNp,par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']) , par['implantSizeY'],rinnern,routern,poscenterptx,poscenterpty,posix,posiy)
    PixelPT.createImplant($layerAlu,par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']) + 2*par['metaloverhang'],par['implantSizeY'] + 2*par['metaloverhang'],rinnerm,routerm,poscenterptx+par['metaloverhang'],poscenterpty+par['metaloverhang'],posmx,posmy, par['biaslinewidth']+ 2*par['distbetweenbiaslineandpad'],par['biaslinewidth'],par['biaslineoverlap'])
    PixelPT.createCircle($layerAluVia,par['viaptdia']/2,poscenterptx+posix,poscenterpty+posiy)
    PixelPT.createCRing($layerPp,rinnerps,routerps,poscenterptx+posix,poscenterpty+posiy)
#     PixelPT.createVia($layerAluVia,par['pixelViaSizeX'],par['pixelViaSizeY'],posix + par['implantSizeX']/2-par['pixelViaSizeX']/2,posiy + par['implantSizeY']/2 - par['pixelViaSizeY']/2)
    PixelPT.createSeveralRoundVia($layerAluVia,par['viadia'],vx,vy1,vy2,posix,posiy,posix+par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']),posix+par['implantSizeY'])
    PixelPT.createBumpPad($layerAlu,par['bumpPadDiameter'], par['pStopSizeX']- par['distancebumppadtoedgeSTD']- par['bumpPadDiameter']/2, posiy + (par['implantSizeY']- par['bumpPadDiameter'])/2)
    PixelPT.createPStop($layerPp, par['distedgetopspray'], par['pStopSizeOuterX'], par['pStopSizeY'], par['pStopWidth'], par['pStopCornerRout'] , par['pStopCornerRin'], par['pStopOpenX0'], par['pStopOpenY0'], par['pStopOpenWidth'],true)
    
    #     ROTATE AND MOVE CELL
    outerPixelCell1rotated = $layout.create_cell("outerPixelCell1rotated")
    inst = RBA::CellInstArray::new( outerPixelCell1.cell_index, RBA::Trans::new(2, false, par['pStopSizeOuterX'],par['pStopSizeY']) )  
    outerPixelCell1rotated.insert(inst)
    
    outerPixelGridCell = $layout.create_cell("OuterPixelGrid1")   
    PixelPT.init(outerPixelGridCell)
    PixelPT.createCellGrid(outerPixelCell1rotated, 1, par['pixelGridnY'], par['pixelGriddX'], par['pixelGriddY'])
    Merge.cells($fPixFCell,outerPixelGridCell,pixX , pixY)
	
	
    
#     create outerPixelGrid2
    outerPixelGridCell2 = $layout.create_cell("OuterPixelGrid2")   
    PixelPT.init(outerPixelGridCell2)
    PixelPT.createCellGrid(outerPixelCell1, 1, par['pixelGridnY'], par['pixelGriddX'], par['pixelGriddY'])
    Merge.cells($fPixFCell,outerPixelGridCell2,pixX + par['pStopSizeOuterX'] + par['pStopSizeX']*2*par['pixelGridnX'],pixY) 

    
    
    
    
    
    
    #create upperPixelGrid1
    posopeny = par['pStopSizeUpperY'] - par['distedgetopspray']
    
    upperPixelCell1 = $layout.create_cell("UpperPixel1")
    PixelPT.init(upperPixelCell1)
    PixelPT.createImplant($layerNp,par['implantSizeX'] , par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']), rinnern,routern,poscenterptx,poscenterpty,posix,posiy)
    PixelPT.createImplant($layerAlu,par['implantSizeX'] + 2*par['metaloverhang'],par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']) + 2*par['metaloverhang'], rinnerm,routerm,poscenterptx+par['metaloverhang'],poscenterpty+par['metaloverhang'],posmx,posmy, par['biaslinewidth']+ 2*par['distbetweenbiaslineandpad'],par['biaslinewidth'],par['biaslineoverlap'])
    PixelPT.createCircle($layerAluVia,par['viaptdia']/2,poscenterptx+posix,poscenterpty+posiy)
    PixelPT.createCRing($layerPp,rinnerps,routerps,poscenterptx+posix,poscenterpty+posiy)    
#     PixelPT.createVia($layerAluVia,par['pixelViaSizeX'],par['pixelViaSizeY'],posix + par['implantSizeX']/2-par['pixelViaSizeX']/2,posiy + par['implantSizeY']/2 - par['pixelViaSizeY']/2)
    PixelPT.createSeveralRoundVia($layerAluVia,par['viadia'],vx,vy1,vy2,posix,posiy,posix+par['implantSizeX'],posix+par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']))
    PixelPT.createBumpPad($layerAlu,par['bumpPadDiameter'], par['pStopSizeX'] - par['distancebumppadtoedgeSTD']- par['bumpPadDiameter']/2, par['distancebumppadtoedgeSTD'] - par['bumpPadDiameter']/2)
    PixelPT.createPStop($layerPp, par['distedgetopspray'], par['pStopSizeX'], par['pStopSizeUpperY'], par['pStopWidth'], par['pStopCornerRout'] , par['pStopCornerRin'], par['pStopOpenX0'], posopeny, par['pStopOpenWidth'],true)
    
	
    upperPixelGridCell1 = $layout.create_cell("UpperPixelGrid1")
    PixelPT.init(upperPixelGridCell1)
    PixelPT.createCellGrid(upperPixelCell1,par['pixelGridnX'],1,par['pixelGriddX'],par['pixelGriddY'])
    Merge.cells($fPixFCell,upperPixelGridCell1,pixX + par['pStopSizeOuterX'], pixY + par['pStopSizeY']*par['pixelGridnY'])

    
    
    
#     create upperPixelGrid2
  #     ROTATE AND MOVE CELL
  #TODO: implement mirroring (see inner pixel true/false statement)
  
    upperPixelCell1rotated = $layout.create_cell("outerPixelCell1rotated")
    inst = RBA::CellInstArray::new( upperPixelCell1.cell_index, RBA::Trans::new(2, true, par['pStopSizeX'],0) )  
    upperPixelCell1rotated.insert(inst) 
     
    upperPixelGridCell2 = $layout.create_cell("UpperPixelGrid2")
    PixelPT.init(upperPixelGridCell2)
    PixelPT.createCellGrid(upperPixelCell1rotated,par['pixelGridnX'],1,par['pixelGriddX'],par['pixelGriddY'])
    Merge.cells($fPixFCell,upperPixelGridCell2,pixX + par['pStopSizeOuterX'] + par['pStopSizeX'], pixY + par['pStopSizeY']*par['pixelGridnY'])



    
    
    
    
#     create cornerPixel1
    cornerPixelCell2 = $layout.create_cell("CornerPixel2")
    PixelPT.init(cornerPixelCell2)
    PixelPT.createImplant($layerNp,par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']) , par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']), rinnern,routern,poscenterptx,poscenterpty,posix,posiy)
    PixelPT.createImplant($layerAlu,par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']) + 2*par['metaloverhang'],par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']) + 2*par['metaloverhang'], rinnerm,routerm,poscenterptx+par['metaloverhang'],poscenterpty+par['metaloverhang'],posmx,posmy, par['biaslinewidth']+ 2*par['distbetweenbiaslineandpad'],par['biaslinewidth'],par['biaslineoverlap'])
    PixelPT.createCircle($layerAluVia,par['viaptdia']/2,poscenterptx+posix,poscenterpty+posiy)
    PixelPT.createCRing($layerPp,rinnerps,routerps,poscenterptx+posix,poscenterpty+posiy)
    #PixelPT.createVia($layerAluVia,par['pixelViaSizeX'],par['pixelViaSizeY'],posix + par['implantSizeX']/2-par['pixelViaSizeX']/2,posiy + par['implantSizeY']/2 - par['pixelViaSizeY']/2)
    PixelPT.createSeveralRoundVia($layerAluVia,par['viadia'],vx,vy1,vy2,posix,posiy,posix+par['pStopSizeOuterX'] - (par['pStopSizeX']-par['implantSizeX']),posix+par['pStopSizeUpperY'] - (par['pStopSizeY'] - par['implantSizeY']))    
    PixelPT.createBumpPad($layerAlu,par['bumpPadDiameter'], par['pStopSizeX'] - par['distancebumppadtoedgeSTD']- par['bumpPadDiameter']/2, par['distancebumppadtoedgeSTD'] - par['bumpPadDiameter']/2)
    PixelPT.createPStop($layerPp, par['distedgetopspray'], par['pStopSizeOuterX'], par['pStopSizeUpperY'], par['pStopWidth'], par['pStopCornerRout'] , par['pStopCornerRin'], par['pStopOpenX0'], posopeny, par['pStopOpenWidth'],true)
   
   
    #     ROTATE AND MOVE CELL
    cornerPixelCell1 = $layout.create_cell("outerPixelCell1")
    inst = RBA::CellInstArray::new( cornerPixelCell2.cell_index, RBA::Trans::new(2, true, par['pStopSizeOuterX'],0) )  
    cornerPixelCell1.insert(inst)
    
    Merge.cells($fPixFCell,cornerPixelCell1, pixX, pixY + par['pStopSizeY']*par['pixelGridnY'] )
    
#     create cornerPixel2
    Merge.cells($fPixFCell,cornerPixelCell2,pixX + par['pStopSizeOuterX'] + 2*par['pStopSizeX']*par['pixelGridnX'], pixY + par['pStopSizeY']*par['pixelGridnY'])
    
    
    
    
    
    
#     create outer pstop ring for punch through design
    if par['createouterpstopring']
#       size of pixel array
      pixelactivesizex = 2*par['pStopSizeOuterX'] + 2*par['pStopSizeX']*par['pixelGridnX']
      pixelactivesizey = par['pStopSizeY']*par['pixelGridnY'] + par['pStopSizeUpperY']
	  # center of pixel array
      pixelcenterx = pixX + (pixelactivesizex)/2
      pixelcentery = pixY + (pixelactivesizey)/2
      # inner radius (only for individual pstop)
      outerpsrin = 0
      if par['distedgetopspray']!=0
        outerpsrin = par['pStopCornerRin']+par['pStopWidth']
      end
      
      
      outerPstopCell = $layout.create_cell("outerPstop")
      
      outerpstopring = NFunc.create_emptybox(pixelactivesizex ,pixelactivesizey ,pixelactivesizex+2*par['pStopWidth'],pixelactivesizey+2*par['pStopWidth'],outerpsrin,par['pStopCornerRin']+2*par['pStopWidth'])
      
      outerPstopCell.shapes($layerPp).insert(outerpstopring)
      Merge.cells($fPixFCell,outerPstopCell, pixelcenterx, pixelcentery)
    end
    
    
    
    
    
    
	# TODO: MAKE STUFF INTERACTIVE
	
    
    #create biasRing
    
    viaSizeX = 6000
    viaSizeY = 6000    
    viaNx = 2
    viaNy = 82
    viaDistX = 8164000
    viaDistY = 100000
    
    biasRingCell = $layout.create_cell("BiasRing")   
    Geometries.init(biasRingCell)
    Geometries.createRing($layerNp,8312000,8312000,88000,79000,0)
    Geometries.createRing($layerAlu,8357000,8357000,123000,101500,0,-22500,-22500)
    
    Pixel.createViaGrid($layerAluVia,viaSizeX,viaSizeY,viaNx,viaNy,viaDistX,viaDistY,71000,103000)
    
    viaNx = 107
    viaNy = 2
    viaDistX = 74500
    viaDistY = 8164000
 #   Pixel.createViaGrid($layerAluVia,viaSizeX,viaSizeY,viaNx,viaNy,viaDistX,viaDistY,253000,71000)
    Pixel.createViaGrid($layerAluVia,viaSizeX,viaSizeY,viaNx,viaNy,viaDistX,viaDistY,202000,71000)
    Merge.cells($fPixFCell,biasRingCell,904000,1204000)
    
    # create guardRing
    
    visSizeX = 6000
    viaSizeY = 6000
    viaNx = 107
    viaNy = 2
    viaDistX = 74500
    viaDistY = 8444000
    
    
    guardRingCell = $layout.create_cell("GuardRing")    
    Geometries.init(guardRingCell)
    Geometries.createRing($layerNp,8472000,8472000,28000,159000,131000)
    Geometries.createRing($layerAlu,8537000,8537000,73000,191500,118500,-32500,-32500)
    Pixel.createViaGrid($layerAluVia,viaSizeX,viaSizeY,viaNx,viaNy,viaDistX,viaDistY,283000,11000)
    
    viaNx = 2
    viaNy = 82
    viaDistX = 8444000
    viaDistY = 100000
    
    Pixel.createViaGrid($layerAluVia,viaSizeX,viaSizeY,viaNx,viaNy,viaDistX,viaDistY,11000,183000)
    
    Merge.cells($fPixFCell,guardRingCell,584000+240000,884000+240000)
    
    
    # create edge
    
    edgeCell = $layout.create_cell("Edge") 
    Geometries.init(edgeCell)
    Geometries.createEdge($layerPpe19,10120000,10420000,584000,884000,10120000-584000,10420000-584000)
    Geometries.createEdge($layerAlu,9960000,10260000,554000,854000,9960000-554000,10260000-554000,80000,80000)
    Geometries.createEdge($layerAluVia,10120000,10420000,90000,90000,10120000-90000,10420000-90000)
    Merge.cells($fPixFCell,edgeCell,0,0)
    
    
    
    
    return $fPixFCell
  end
end