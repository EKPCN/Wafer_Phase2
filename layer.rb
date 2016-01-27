module Layer

  include RBA

  def Layer.insert(layout)
  
    # Daniel
    
    $layerPp = layout.insert_layer(LayerInfo.new(1,0,"p+"))
    $layerPpe19 = layout.insert_layer(LayerInfo.new(2,0,"p+ e19"))
    $layerNp = layout.insert_layer(LayerInfo.new(3,0,"n+"))
    $layerAlu = layout.insert_layer(LayerInfo.new(4,0,"Alu"))
    $layerAluVia = layout.insert_layer(LayerInfo.new(5,0,"Alu via"))
    $layerPassOpen = layout.insert_layer(LayerInfo.new(6,0,"Passivation Opening"))

    # Christian
    
    #$layerNp = layout.insert_layer(LayerInfo.new(1,0,"Implant"))
    #$layerAluVia = layout.insert_layer(LayerInfo.new(2,0,"Contact"))
    #$layerBias = layout.insert_layer(LayerInfo.new(3,0,"Bias resistor"))
    #$layerAlu = layout.insert_layer(LayerInfo.new(4,0,"Alu"))
    #$layerPassOpen = layout.insert_layer(LayerInfo.new(5,0,"Passivation"))
    
  end
  
end
