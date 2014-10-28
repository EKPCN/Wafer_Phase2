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
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],implants['implantSizeX']-12000-via['pixelViaSizeX'],12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],9000,(48000-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],true, -20000, -20000)
    
    innerPixelGridCell2 = $layout.create_cell("InnerPixelGrid2")
    Pixel.init(innerPixelGridCell2)
    Pixel.createGrid(innerPixelCell2,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],pixelGrid['pixelGriddY']) 
    Merge.cells($fPixFCell,innerPixelGridCell2,1336000+150000,1336000)    

    # outerPixelGrid1

    implants = OuterImplants
    pStop = OuterPStop1
    pixelGrid = OuterPixelGrid
    
    outerPixelCell1 = $layout.create_cell("outerPixelCell1")  
    Pixel.init(outerPixelCell1)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],implants['implantSizeX']-12000-via['pixelViaSizeX'],12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],implants['implantSizeX']-59000-30000,(implants['implantSizeY']-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],true, -20000, -20000)
    
    outerPixelGridCell1 = $layout.create_cell("OuterPixelGrid1")   
    Pixel.init(outerPixelGridCell1)
    Pixel.createGrid(outerPixelCell1,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],0,pixelGrid['pixelGriddY'])
    Merge.cells($fPixFCell,outerPixelGridCell1,584000+452000,884000+452000)
  
    # outerPixelGrid2  
  
    pStop = OuterPStop2
    
    outerPixelCell2 = $layout.create_cell("outerPixelCell2")  
    Pixel.init(outerPixelCell2)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],12000,12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],59000,(implants['implantSizeY']-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],true, -20000, -20000)
    
    outerPixelGridCell2 = $layout.create_cell("OuterPixelGrid2")   
    Pixel.init(outerPixelGridCell2)
    Pixel.createGrid(outerPixelCell2,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],0,pixelGrid['pixelGriddY'])
    Merge.cells($fPixFCell,outerPixelGridCell2,1036000+7800000,1336000)    
    
    # upperPixelGrid1
    
    implants = UpperImplants
    pixelGrid = UpperPixelGrid
    pStop = UpperPStop
    
    upperPixelCell1 = $layout.create_cell("upperPixelCell1")  
    Pixel.init(upperPixelCell1)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],12000,12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],98000-9000-30000,(48000-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],false, -20000, -20000)
    
    upperPixelGridCell1 = $layout.create_cell("UpperPixelGrid1")   
    Pixel.init(upperPixelGridCell1)
    Pixel.createGrid(upperPixelCell1,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],0)
    Merge.cells($fPixFCell,upperPixelGridCell1,1336000,9236000) 

    # upperPixelGrid2
    
    upperPixelCell2 = $layout.create_cell("upperPixelCell2")  
    Pixel.init(upperPixelCell2)
    Pixel.createImplant($layerNp,implants['implantSizeX'],implants['implantSizeY'])
    Pixel.createImplant($layerAlu,implants['implantAluSizeX'],implants['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,via['pixelViaSizeX'],via['pixelViaSizeY'],implants['implantSizeX']-12000-via['pixelViaSizeX'],12000)
    Pixel.createBumpPad($layerAlu,bumpPad['bumpPadDiameter'],9000,(48000-30000)/2)
    Pixel.createPStop($layerPp, pStop['pStopSizeX'], pStop['pStopSizeY'], pStop['pStopWidth'], pStop['pStopCornerRout'] , pStop['pStopCornerRin'], pStop['pStopOpenX0'], pStop['pStopOpenY0'], pStop['pStopOpenWidth'],false, -20000, -20000)
    
    upperPixelGridCell2 = $layout.create_cell("UpperPixelGrid2")   
    Pixel.init(upperPixelGridCell2)
    Pixel.createGrid(upperPixelCell2,pixelGrid['pixelGridnX'],pixelGrid['pixelGridnY'],pixelGrid['pixelGriddX'],0)
    Merge.cells($fPixFCell,upperPixelGridCell2,1336000+150000,9236000) 
    
    return $fPixFCell
  end
end