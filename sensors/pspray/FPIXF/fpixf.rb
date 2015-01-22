module FPixF
  
  include RBA

  # Creates the FPIXF sensor
  # @return [cell] Returns the cell with all structures

  def FPixF.create()
  
    load "Wafer_Phase2/sensors/pspray/FPIXF/fpixf_para.rb"
        
    $sensor = $layout.create_cell("FPIXFSpray")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'],-25e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3)
    
    outerPixelCell = $layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.createImplant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'],$layerAlu,OuterImplant['metalOH'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],100e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],50e3)
    

    upperPixelCell1 = $layout.create_cell("UpperPixel1")
    Pixel.init(upperPixelCell1)
    Pixel.createImplant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'],$layerAlu,UpperImplant['metalOH'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],-25e3,-50e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3,-50e3)
    

    upperPixelCell2 = $layout.create_cell("UpperPixel2")
    Pixel.init(upperPixelCell2)
    Pixel.createImplant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'],$layerAlu,UpperImplant['metalOH'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],25e3,-50e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],-25e3,-50e3)
  

    cornerPixelCell = $layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.createImplant($layerNp, CornerImplant['sizeX'], CornerImplant['sizeY'],$layerAlu,CornerImplant['metalOH'])
    Pixel.createVia($layerAluVia, Via['sizeX'], Via['sizeY'],100e3,-50e3)
    Pixel.createBumpPad($layerAlu, BumpPad['dia'],50e3,-50e3)
  

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2),180,true)
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'], PixelGrid['sizeX']/2-OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2),180,true)
    Pixel.createGrid(upperPixelCell1,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(InnerPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2)
    Pixel.createGrid(upperPixelCell2,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*InnerPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2)
    Pixel.createGrid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'],-PixelGrid['sizeX']/2+CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2))
    Pixel.createGrid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'], PixelGrid['sizeX']/2-CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2),180,true)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($sensor, periCell)

    return $sensor
  end
end
