module FPixF
  
  include RBA

  # Creates the FPIXF sensor
  # @return [cell] Returns the cell with all structures

  def FPixF.create(layout,sensor)

        
    $sensor = layout.create_cell("FPIXF")
    
    innerPixelCell = layout.create_cell("InnerPixel")      
    Pixel.init(innerPixelCell)
    Pixel.implant($layerNp,InnerImplant['sizeX'],InnerImplant['sizeY'],$layerAlu,InnerImplant['metalOH'])
    Pixel.via($layerAluVia, Via['sizeX'],Via['sizeY'],-25e3)
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],25e3)
    Pixel.pStop($layerPp, InnerImplant['sizeX']+2*InnerPStop['distX'], InnerImplant['sizeY']+2*InnerPStop['distY'], InnerPStop['width'], InnerPStop['rOut'] , InnerPStop['rIn'], InnerPStop['openX0'], InnerPStop['openY0'], InnerPStop['openWidth'],true)
    
    outerPixelCell = layout.create_cell("OuterPixel")
    Pixel.init(outerPixelCell)
    Pixel.implant($layerNp,OuterImplant['sizeX'],OuterImplant['sizeY'],$layerAlu,OuterImplant['metalOH'])
    Pixel.via($layerAluVia,Via['sizeX'],Via['sizeY'],100e3)
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],50e3)
    Pixel.pStop($layerPp, OuterImplant['sizeX']+2*OuterPStop['distX'], OuterImplant['sizeY']+2*OuterPStop['distY'], OuterPStop['width'], OuterPStop['rOut'] , OuterPStop['rIn'], OuterPStop['openX0'], OuterPStop['openY0'], OuterPStop['openWidth'],true)

    upperPixelCell1 = layout.create_cell("UpperPixel1")
    Pixel.init(upperPixelCell1)
    Pixel.implant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'],$layerAlu,UpperImplant['metalOH'])
    Pixel.via($layerAluVia,Via['sizeX'],Via['sizeY'],-25e3,-50e3)
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],25e3,-50e3)
    Pixel.pStop($layerPp, UpperImplant['sizeX']+2*UpperPStop['distX'], UpperImplant['sizeY']+2*UpperPStop['distY'], UpperPStop['width'], UpperPStop['rOut'] , UpperPStop['rIn'], UpperPStop['openX0'], UpperPStop['openY0'], UpperPStop['openWidth'],false)

    upperPixelCell2 = layout.create_cell("UpperPixel2")
    Pixel.init(upperPixelCell2)
    Pixel.implant($layerNp,UpperImplant['sizeX'],UpperImplant['sizeY'],$layerAlu,UpperImplant['metalOH'])
    Pixel.via($layerAluVia,Via['sizeX'],Via['sizeY'],25e3,-50e3)
    Pixel.bumpPad($layerPassOpen,BumpPad['dia'],-25e3,-50e3)
    Pixel.pStop($layerPp, UpperImplant['sizeX']+2*UpperPStop['distX'], UpperImplant['sizeY']+2*UpperPStop['distY'], UpperPStop['width'], UpperPStop['rOut'] , UpperPStop['rIn'], UpperPStop['openX0'], UpperPStop['openY0'], UpperPStop['openWidth'],false)

    cornerPixelCell = layout.create_cell("CornerPixel")
    Pixel.init(cornerPixelCell)
    Pixel.implant($layerNp, CornerImplant['sizeX'], CornerImplant['sizeY'],$layerAlu,CornerImplant['metalOH'])
    Pixel.via($layerAluVia, Via['sizeX'], Via['sizeY'],100e3,-50e3)
    Pixel.bumpPad($layerPassOpen, BumpPad['dia'],50e3,-50e3)
    Pixel.pStop($layerPp, CornerImplant['sizeX']+2*CornerPStop['distX'], CornerImplant['sizeY']+2*CornerPStop['distY'], CornerPStop['width'], CornerPStop['rOut'] , CornerPStop['rIn'], CornerPStop['openX0'], CornerPStop['openY0'], CornerPStop['openWidth'],true)

    pixelGridCell = layout.create_cell("PixelGrid")
    Pixel.init(pixelGridCell)
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2))
    Pixel.grid(innerPixelCell,InnerPixelGrid['nX'], InnerPixelGrid['nY'], InnerPixelGrid['dX'], InnerPixelGrid['dY'], -PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*InnerPixelGrid['sizeX']/2), -PixelGrid['sizeY']/2+(InnerPixelGrid['sizeY']/2),180,true)
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2))
    Pixel.grid(outerPixelCell,OuterPixelGrid['nX'],OuterPixelGrid['nY'],OuterPixelGrid['dX'],OuterPixelGrid['dY'], PixelGrid['sizeX']/2-OuterPixelGrid['sizeX']/2, -PixelGrid['sizeY']/2+(OuterPixelGrid['sizeY']/2),180,true)
    Pixel.grid(upperPixelCell1,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(InnerPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2)
    Pixel.grid(upperPixelCell2,UpperPixelGrid['nX'],UpperPixelGrid['nY'],UpperPixelGrid['dX'],UpperPixelGrid['dY'],-PixelGrid['sizeX']/2+OuterPixelGrid['sizeX']+(3*InnerPixelGrid['sizeX']/2), PixelGrid['sizeY']/2-UpperPixelGrid['sizeY']/2)
    Pixel.grid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'],-PixelGrid['sizeX']/2+CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2))
    Pixel.grid(cornerPixelCell,CornerPixelGrid['nX'],CornerPixelGrid['nY'],CornerPixelGrid['dX'],CornerPixelGrid['dY'], PixelGrid['sizeX']/2-CornerPixelGrid['sizeX']/2, PixelGrid['sizeY']/2-(CornerPixelGrid['sizeY']/2),180,true)
    

    periCell = layout.create_cell("Periphery")
    textCell = Text.create(layout, $layerPassOpen, sensor ,-4000e3, 4500e3) 
    Periphery.init(periCell)
    Periphery.create($layerNp,$layerAlu,$layerPassOpen,$layerPpe19,$layerAluVia,PixelGrid,BiasRing,GuardRing,PixelEdge)
    #textCell.delete
    
    Merge.cells(periCell, textCell) 
    Merge.cells($sensor, pixelGridCell)
    Merge.cells($sensor, periCell)

    return $sensor
  end
end
