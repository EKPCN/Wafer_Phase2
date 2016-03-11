module Gds

  include RBA

  def Gds.create(sensor)
  
    genFile = sensor.partition('_').first
  
    pathToGenFile = $GLOBAL_PATH + "/sensors/" + genFile + "/" + genFile + ".rb"   
    pathToParaFile = $GLOBAL_PATH + "/sensors/" + genFile + "/" + sensor + ".rb"
  
    load(pathToGenFile)
    load(pathToParaFile)
  
    layout = Layout.new
    Layer.insert(layout)
  
    puts pathToGenFile
    puts pathToParaFile

    moduleName = Object.const_get((File.open(pathToGenFile){|f| f.readline}).split.last)

    moduleName.create(layout,sensor)
  
    gdsPath = $GLOBAL_PATH + "/gds/" + sensor + ".gds"
  
    layout.write(gdsPath)
  
  end

end