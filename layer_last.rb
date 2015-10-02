module Layer

  include RBA

  def Layer.insert(layout)
  
    $layerA = layout.insert_layer(LayerInfo.new(1,0,"Alignment"))
    $layerNp = layout.insert_layer(LayerInfo.new(2,0,"Implant"))
    $layerPp = layout.insert_layer(LayerInfo.new(3,0,"Surface"))
    $layerAluVia = layout.insert_layer(LayerInfo.new(4,0,"Contact"))
    $layerB = layout.insert_layer(LayerInfo.new(5,0,"BiasResistor"))
    $layerAlu = layout.insert_layer(LayerInfo.new(6,0,"Metal"))
    $layerPassOpen = layout.insert_layer(LayerInfo.new(7,0,"Passivation"))
    $layerPpe19 = layout.insert_layer(LayerInfo.new(8,0,"Pplus"))
    $layerBSM = layout.insert_layer(LayerInfo.new(9,0,"BacksideMetal"))
    
  end
  
end