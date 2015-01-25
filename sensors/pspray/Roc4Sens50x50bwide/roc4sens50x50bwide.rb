module Roc4Sens50x50bwide
  
  include RBA

  # Creates a sensor with a staggered pitch of 50x50 µm² and additional bigger pixels at the edge for the roc4sens pattern
  # @return [cell] Returns the cell with all structures

  def Roc4Sens50x50bwide.create()
  
    load "Wafer_Phase2/sensors/pspray/Roc4Sens50x50bwide/roc4sens50x50bwide_para.rb"
        
    $sensor = $layout.create_cell("Roc4Sens50x50bwide")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'],0,0,InnerImplant['radius'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'],-10e3,-10e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'])

    outerPixelCell = $layout.create_cell("OuterPixel")      
    Pixel.init(outerPixelCell)
    Pixel.createImplant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'],$layerAlu,OuterImplant['metalOH'],0,0,OuterImplant['radius'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'],-10e3,-10e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],0,12.5e3)

    pixelGridCell = $layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.createGrid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+2*InnerPixelGrid['sizeY'])
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(3*OuterPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.createGrid(outerPixelCell,OuterPixelGrid['nX'], OuterPixelGrid['nY'], OuterPixelGrid['dX'], OuterPixelGrid['dY'], -PixelGrid['sizeX']/2+(OuterPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-OuterPixelGrid['sizeY']/2,180)
    
    Merge.cells($sensor, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)

    Merge.cells($sensor, periCell)

    return $sensor
  end
end
