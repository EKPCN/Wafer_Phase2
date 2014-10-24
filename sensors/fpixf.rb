module FPixF
  
  include RBA
  
  def FPixF.create()
  
    load "Wafer_Phase2/sensors/fpixf_para.rb"
    
    $fPixFCell = $layout.create_cell("FPIXF")
    para = Defaults
  
    # innerPixelGrid1
    
    innerPixelCell1 = $layout.create_cell("innerPixelCell1")  
    Pixel.init(innerPixelCell1)
    Pixel.createImplant($layerNp,para['implantSizeX'],para['implantSizeY'])
    Pixel.createImplant($layerAlu,para['implantAluSizeX'],para['implantAluSizeY'],1500,1500)
    Pixel.createVia($layerAluVia,para['pixelViaSizeX'],para['pixelViaSizeY'],12000,12000)
    Pixel.createBumpPad($layerAlu,para['bumpPadDiameter'],98000-9000-30000,(48000-30000)/2)
    Pixel.createPStop($layerPp, para['pStopSizeX'], para['pStopSizeY'], para['pStopWidth'], para['pStopCornerRout'] , para['pStopCornerRin'], para['pStopOpenX0'], para['pStopOpenY0'], para['pStopOpenWidth'],true, -20000, -20000)
    
    innerPixelGridCell1 = $layout.create_cell("InnerPixelGrid1")
    Pixel.init(innerPixelGridCell1)
    Pixel.createCellGrid(innerPixelCell1,para['pixelGridnX'],para['pixelGridnY'],para['pixelGriddX'],para['pixelGriddY']) 
    Merge.cells($fPixFCell,innerPixelGridCell1,1336000,1336000)
     
  #  innerPixelGrid2  
    
  #  innerPixelCell2 = $layout.create_cell("innerPixelCell2")  
  #  Pixel.init(innerPixelCell2)
  #  Pixel.createImplant($layerNp,implantSizeX,implantSizeY)
  #  Pixel.createImplant($layerAlu,implantAluSizeX,implantAluSizeY,1500,1500)
  #  Pixel.createVia($layerAluVia,pixelViaSizeX,pixelViaSizeY,implantSizeX-12000-pixelViaSizeX,12000)
  #  Pixel.createBumpPad($layerAlu,bumpPadDiameter,9000,(48000-30000)/2)
  #  Pixel.createPStop($layerPp, pStopSizeX, pStopSizeY, pStopWidth, pStopCornerRout , pStopCornerRin, pStopOpenX0, pStopOpenY0, pStopOpenWidth,true, -20000, -20000)
    
  #  innerPixelGridCell2 = $layout.create_cell("InnerPixelGrid2")
  #  Pixel.init(innerPixelGridCell2)
  #  Pixel.createGrid(innerPixelCell2,pixelGridnX,pixelGridnY,pixelGriddX,pixelGriddY) 
  #  Merge.cells($fPixFCell,innerPixelGridCell2,1336000+150000,1336000)    

    
    return $fPixFCell
  end
end