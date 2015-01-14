module Roc4Sense1
  
  include RBA

  # Creates the FPIXF sensor
  # @return [cell] Returns the cell with all structures

  def Roc4Sense1.create()
  
    load "Wafer_Phase2/sensors/Roc4Sense_1/roc4sense_1_para.rb"
        
    $roc4Sense1 = $layout.create_cell("Roc4Sense_1")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'])
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],12.5e3,12.5e3)
    Pixel.createPStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'])

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2),-90)

    Merge.cells($roc4Sense1, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($roc4Sense1, periCell)

    return $roc4Sense1
  end
end
