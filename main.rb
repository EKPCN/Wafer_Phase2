module CISWafer
  include RBA

  # include files

  load "Wafer_Phase2CS/structures/basic.rb"
  load "Wafer_Phase2CS/structures/pixel.rb"
  load "Wafer_Phase2CS/structures/geometries.rb"
  load "Wafer_Phase2CS/utils/merge.rb"
  load "Wafer_Phase2CS/utils/cut.rb"
  load "Wafer_Phase2CS/sensors/fpixf.rb"
  
  #ADDED
  load "Wafer_Phase2CS/structures/pixelpt.rb"
  load "Wafer_Phase2CS/sensors/fpixfpt.rb"
  load "Wafer_Phase2CS/utils/Newfunctions.rb"
   
   
  # create mainWindow and layout
  
  mw = Application.instance.main_window
  $layout = mw.create_layout(0).layout
  layoutView = mw.current_view  

  # standard parameters

  $layout.dbu = 0.001 #µm -> dbu = 1nm
  $minDist = 5000

  # Layer
  
  $layerP = $layout.insert_layer(LayerInfo.new(40,0,"p substrate"))
  $layerPp = $layout.insert_layer(LayerInfo.new(1,0,"p+"))
  $layerPpe19 = $layout.insert_layer(LayerInfo.new(1,1,"p+ e19"))
  $layerNp = $layout.insert_layer(LayerInfo.new(2,0,"n+"))
  $layerAlu = $layout.insert_layer(LayerInfo.new(3,0,"Alu"))
  $layerAluVia = $layout.insert_layer(LayerInfo.new(4,0,"Alu via"))
  
  # wafer
  
  waferCell = $layout.create_cell("Wafer")  
  waferOuterDia = 150000000
  waferInnerDia = 140000000  
  Basic.createWafer($layerP, waferCell, waferInnerDia, waferOuterDia)
  
  # pixel designs
  
#   fPixFCell=FPixF.create()
  fPixFPTCell=FPixFPT.create()
  
  # draw designs on wafer
  
#   Merge.cells(waferCell,fPixFCell,0,0)
  Merge.cells(waferCell,fPixFPTCell,0,0)
  
  # end
  
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end