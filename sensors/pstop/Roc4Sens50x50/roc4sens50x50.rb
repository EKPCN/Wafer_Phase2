module Roc4Sens50x50
  
  include RBA

  # Creates a sensor with an regular pitch of 50x50 µm² for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens50x50.create()
  
    load "Wafer_Phase2/sensors/pstop/Roc4Sens50x50/roc4sens50x50_para.rb"
        
    $roc4Sens50x50 = $layout.create_cell("Roc4Sens50x50")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'])
    Pixel.createBumpPad($layerPassOpen,BumpPad['dia'],-12.5e3,-12.5e3)
    Pixel.createPStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2),-90)

    Merge.cells($roc4Sens50x50, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($roc4Sens50x50, periCell)

    return $roc4Sens50x50
  end
end
