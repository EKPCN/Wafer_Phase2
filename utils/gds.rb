module Gds

  include RBA

  def Gds.create(sensor)
      
    layout = Layout.new
    Layer.insert(layout)

    Roc4Sens50x50b.create(layout)
  
    path = $GLOBAL_PATH + "/gds/" + sensor + ".gds"
  
    layout.write(path)

  end

end