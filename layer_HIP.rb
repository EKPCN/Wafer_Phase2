module Layer

  include RBA

  def Layer.insert(layout)
  
    $layerNp = layout.insert_layer(LayerInfo.new(1,0,"Implant"))
    $layerAluVia = layout.insert_layer(LayerInfo.new(2,0,"Contact"))
	$layerBias = layout.insert_layer(LayerInfo.new(3,0,"Bias resistor"))
	$layerAlu = layout.insert_layer(LayerInfo.new(4,0,"Alu"))
    $layerPassOpen = layout.insert_layer(LayerInfo.new(5,0,"Passivation"))
    
  end
  
end