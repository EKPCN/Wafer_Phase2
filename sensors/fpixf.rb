module FPixF
  
  include RBA
  
  def FPixF.create()
  
    load "Wafer_Phase2/sensors/FPIXF/fpixf_para.rb"
        
    $fPixFCell = $layout.create_cell("FPIXF")
  
    # innerPixelGrid1

    implants = InnerImplants
    pixelGrid = InnerPixelGrid
    pStop = InnerPStop
    via = Via
    bumpPad = BumpPad
    
    innerPixelCell1 = $layout.create_cell("innerPixelCell1")  
    Pixel.init(innerPixelCell1)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],12000,12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],98000-9000-30000,(48000-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],true, -20000, -20000)
    
    innerPixelGridCell1 = $layout.create_cell("InnerPixelGrid1")
    Pixel.init(innerPixelGridCell1)
    Pixel.createGrid(innerPixelCell1,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],pixelGrid['pixelGriddY']) 
    Merge.cells($fPixFCell,innerPixelGridCell1,1336000,1336000)
     
    # innerPixelGrid2  
    
    innerPixelCell2 = $layout.create_cell("innerPixelCell2")  
    Pixel.init(innerPixelCell2)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,Via['pixelViaSizeX'],Via['pixelViaSizeY'],implants['implantSizeX']-12000-Via['pixelViaSizeX'],12000)
    Pixel.createBumpPad($layerAlu,BumpPad['bumpPadDiameter'],9000,(48000-30000)/2)
    Pixel.createPStop($layerPp, PStop['pStopSizeX'], PStop['pStopSizeY'], PStop['pStopWidth'], PStop['pStopCornerRout'] , PStop['pStopCornerRin'], PStop['pStopOpenX0'], PStop['pStopOpenY0'], PStop['pStopOpenWidth'],true, -20000, -20000)
    
    innerPixelGridCell2 = $layout.create_cell("InnerPixelGrid2")
    Pixel.init(innerPixelGridCell2)
    Pixel.createGrid(innerPixelCell2,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],pixelGrid['pixelGriddY']) 
    Merge.cells($fPixFCell,innerPixelGridCell2,1336000+150000,1336000)    

    # outerPixelGrid1

    implants = OuterImplants
    pStop = OuterPStop
    pixelGrid = OuterPixelGrid1
    
    outerPixelCell1 = $layout.create_cell("outerPixelCell1")  
    Pixel.init(outerPixelCell1)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],implants['implantSizeX']-12000-via['pixelViaSizeX'],12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],implants['implantSizeX']-59000-30000,(implants['implantSizeY']-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],true, -20000, -20000)
    
    outerPixelGridCell1 = $layout.create_cell("OuterPixelGrid1")   
    Pixel.init(outerPixelGridCell1)
    Pixel.createGrid(outerPixelCell1,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],pixelGrid['pixelGriddY'])
    Merge.cells($fPixFCell,outerPixelGridCell1,584000+452000,884000+452000)
    
    
    return $fPixFCell
  end
end