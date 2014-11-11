Defaults = {

    # Parameters
  
    'implantSizeX' => 114e3,
    'implantSizeY' => 64e3,
    
    'bumpPadDiameter' => 30000,
    
    #actually the cell size. pstop size is pStopSizeX/Y - 2*distedgetopspray
    'pStopSizeX' => 150e3,
    'pStopSizeY' => 100e3,
    # for pspray design remember outerpstopring and pstopwidth for punch through
    'pStopWidth' => 0e3,
    #cornerrout should be ==0 for common pstop and 2*Rin for individual pstop
    #TODO: remove parameter and automatize
    'pStopCornerRout' => 0,
    'pStopCornerRin' => 2e3,
    'pStopOpenX0' => 55000,
    'pStopOpenY0' => 98e3,
    'pStopOpenWidth' => 0, 
    
    'pixelGridnX' => 25,
    'pixelGridnY' => 79,
    'pixelGriddX' => 300000,
    'pixelGriddY' => 100000,
    
    'pixelViaSizeX' => 12000,
    'pixelViaSizeY' => 24000,
  
    
  ###############
  #####ADDED#####
  ###############
  
    # half of the distance between individual pstops (if ==0 common pstop)
    'distedgetopspray' => 0,
  
    'distancebumppadtoedgeSTD' => 50e3,
    'distancebumppadtoedgeOUTER' => 100e3,
  
    'pStopSizeOuterX' => 300e3,
  
    'pStopSizeUpperY' => 200e3,
  
    'viadia' => 3e3,
  
  
    'thicknessofremainingpadimplant' => 0e3,
    'implantptdia' => 0e3,
    'viaptdia' => 0e3,
    'pstopptwidth' => 0e3,
    'distmetaltopstopwidth' => 0e3,
	# used not only for punch through
    'metaloverhang' => 2e3,
	
    'biaslinewidth' => 0e3,
    'distbetweenbiaslineandpad' => 0e3,
    'biaslineoverlap' => 10e3,
    
    'createouterpstopring' => false

}