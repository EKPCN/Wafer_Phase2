module Layer

  include RBA

  def Layer.insert(layout)
    $layerNp = layout.insert_layer(LayerInfo.new(1,0,"NPlus"))
    $layerPpe19 = layout.insert_layer(LayerInfo.new(2,0,"PPlus"))   
    $layerPp = layout.insert_layer(LayerInfo.new(3,0,"PStop"))
    $layerAluVia = layout.insert_layer(LayerInfo.new(4,0,"Contact"))
    $layerAlu = layout.insert_layer(LayerInfo.new(5,0,"Metal"))
    $layerPassOpen = layout.insert_layer(LayerInfo.new(6,0,"PassWin"))
    $layerUBM = layout.insert_layer(LayerInfo.new(7,0,"UBM"))    
  end
  
end
