module CISWafer
  include RBA

  $GLOBAL_PATH = File.dirname(__FILE__)

  # include files

  load "Wafer_Phase2/layer.rb"
  load "Wafer_Phase2/structures/basic.rb"
  load "Wafer_Phase2/structures/pixel.rb"
  load "Wafer_Phase2/structures/periphery.rb"
  load "Wafer_Phase2/utils/merge.rb"
  load "Wafer_Phase2/utils/cut.rb"
  load "Wafer_Phase2/utils/gds.rb"

  # create mainWindow and layout
  
  mw = Application.instance.main_window
  layout = mw.create_layout(0).layout
  layoutView = mw.current_view  

  # standard parameters

  layout.dbu = 0.001 #µm -> dbu = 1nm

  # Layer

  Layer.insert(layout)
  
  # wafer
  
  waferCell = layout.create_cell("Wafer")  
  waferOuterDia = 150e6
  waferInnerDia = 140e6  
  Basic.wafer($layerP, waferCell, waferInnerDia, waferOuterDia)

  # Get SensorList from file

  sensors = []
  
  f = File.open($GLOBAL_PATH + "/sensors/sensorList.txt")
  f.each_line{ 
    |line| sensors << line.delete("\n") 
  }   
  f.close

  # Set default position on wafer

  x0 = 0
  y0 = 0

  # Check if gds file ist present and if not, create one
  
  sensors.each{ |sensor|   
    
    if !File.exist?($GLOBAL_PATH + "/gds/" + sensor + ".gds")     
      Gds.create(sensor)
    end

    if File.exist?($GLOBAL_PATH + "/gds/" + sensor + ".gds") 
    
      # Merge gds files
  
      loadCell = layout.create_cell(sensor)
      importLayout = Layout.new
    
      importLayout.read($GLOBAL_PATH + "/gds/" + sensor + ".gds") 
      loadCell.copy_tree(importLayout.top_cell)
  
      Merge.cells(waferCell,loadCell,x0,y0)
      y0 += 10e6 
  
    end
    
  }
  
  # end

  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  

end