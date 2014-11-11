module FPixF
  
  include RBA

  # Creates the FPIXF sensor
  # @return [cell] Returns the cell with all structures

  def FPixF.create()
  
    load "Wafer_Phase2/sensors/FPIXF/fpixf_para.rb"
        
    $fPixFCell = $layout.create_cell("FPIXF")
    
    innerPixelCell = $layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.createImplant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'])
    Pixel.createImplant($layerAlu,InnerImplant['aluSizeX'],InnerImplant['aluSizeY'])
    Pixel.createVia($layerAluVia, Via['sizeX'],Via['sizeY'],-25e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3)
    Pixel.createPStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)

    outerPixelCell = $layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.createImplant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'])
    Pixel.createImplant($layerAlu,OuterImplant['aluSizeX'],OuterImplant['aluSizeY'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],100e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],50e3)
    Pixel.createPStop($layerPp, OuterImplant['sizeX']+2*OuterPStop['distX'], OuterImplant['sizeY']+2*OuterPStop['distY'], OuterPStop['width'], OuterPStop['rOut'] , OuterPStop['rIn'], OuterPStop['openX0'], OuterPStop['openY0'], OuterPStop['openWidth'],true)

    upperPixelCell1 = $layout.create_cell("UpperPixel1")
    Pixel.init(upperPixelCell1)
    Pixel.createImplant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'])
    Pixel.createImplant($layerAlu,UpperImplant['aluSizeX'],UpperImplant['aluSizeY'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],-25e3,-50e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],25e3,-50e3)
    Pixel.createPStop($layerPp, UpperImplant['sizeX']+2*UpperPStop1['distX'], UpperImplant['sizeY']+2*UpperPStop1['distY'], UpperPStop1['width'], UpperPStop1['rOut'] , UpperPStop1['rIn'], UpperPStop1['openX0'], UpperPStop1['openY0'], UpperPStop1['openWidth'],false)

    upperPixelCell2 = $layout.create_cell("UpperPixel2")
    Pixel.init(upperPixelCell2)
    Pixel.createImplant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'])
    Pixel.createImplant($layerAlu,UpperImplant['aluSizeX'],UpperImplant['aluSizeY'])
    Pixel.createVia($layerAluVia,Via['sizeX'],Via['sizeY'],25e3,-50e3)
    Pixel.createBumpPad($layerAlu,BumpPad['dia'],-25e3,-50e3)
    Pixel.createPStop($layerPp, UpperImplant['sizeX']+2*UpperPStop2['distX'], UpperImplant['sizeY']+2*UpperPStop2['distY'], UpperPStop2['width'], UpperPStop2['rOut'] , UpperPStop2['rIn'], UpperPStop2['openX0'], UpperPStop2['openY0'], UpperPStop2['openWidth'],false)

    cornerPixelCell = $layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.createImplant($layerNp, CornerImplant['sizeX'], CornerImplant['sizeY'])
    Pixel.createImplant($layerAlu, CornerImplant['aluSizeX'], CornerImplant['aluSizeY'])
    Pixel.createVia($layerAluVia, Via['sizeX'], Via['sizeY'],100e3,-50e3)
    Pixel.createBumpPad($layerAlu, BumpPad['dia'],50e3,-50e3)
    Pixel.createPStop($layerPp, CornerImplant['sizeX']+2*CornerPStop['distX'], CornerImplant['sizeY']+2*CornerPStop['distY'], CornerPStop['width'], CornerPStop['rOut'] , CornerPStop['rIn'], CornerPStop['openX0'], CornerPStop['openY0'], CornerPStop['openWidth'],true)

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
    
    Merge.cells($fPixFCell, pixelGridCell)

    periCell = $layout.create_cell("Periphery")
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPpe19,PixelGrid,BiasRing,GuardRing,PixelEdge)
    Merge.cells($fPixFCell, periCell)

    return $fPixFCell
  end
end
