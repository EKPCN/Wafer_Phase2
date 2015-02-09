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
  Basic.createWafer($layerP, waferCell, waferInnerDia, waferOuterDia)

  # --- PSPRAY ---

  load "Wafer_Phase2/sensors/sensorList.rb"
 # Gds.create("r4s50x50b")

=begin
  pstopFiles = Dir[$GLOBAL_PATH + "/gds/pstop/*.gds"]
  psprayFiles = Dir[$GLOBAL_PATH + "/gds/pspray/*.gds"]
  
  puts pstopFiles[0]
=end  

  loadCell = layout.create_cell("Roc4Sens50x50")
  importLayout = Layout.new
  importLayout.read($GLOBAL_PATH + "/gds/r4s50x50b.gds") 
  loadCell.copy_tree(importLayout.top_cell)
  
  Merge.cells(waferCell,loadCell) 



  # end

  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  

end