module CISWafer
  include RBA

  # include files

  load "Wafer_Phase2/structures/basic.rb"
  load "Wafer_Phase2/structures/pixel.rb"
  load "Wafer_Phase2/structures/periphery.rb"
  load "Wafer_Phase2/utils/merge.rb"
  load "Wafer_Phase2/utils/cut.rb"

  # sensors

  load "Wafer_Phase2/sensors/FPIXF/fpixf.rb"
  load "Wafer_Phase2/sensors/FPIXFPT/fpixfpt.rb"
   
  # create mainWindow and layout
  
  mw = Application.instance.main_window
  $layout = mw.create_layout(0).layout
  layoutView = mw.current_view  

  # standard parameters

  $layout.dbu = 0.001 #µm -> dbu = 1nm
  $minDist = 5e3

  # Layer
  
  $layerP = $layout.insert_layer(LayerInfo.new(40,0,"p substrate"))
  $layerPp = $layout.insert_layer(LayerInfo.new(1,0,"p+"))
  $layerPpe19 = $layout.insert_layer(LayerInfo.new(1,1,"p+ e19"))
  $layerNp = $layout.insert_layer(LayerInfo.new(2,0,"n+"))
  $layerAlu = $layout.insert_layer(LayerInfo.new(3,0,"Alu"))
  $layerAluVia = $layout.insert_layer(LayerInfo.new(4,0,"Alu via"))
  
  # wafer
  
  waferCell = $layout.create_cell("Wafer")  
  waferOuterDia = 150e6
  waferInnerDia = 140e6  
  Basic.createWafer($layerP, waferCell, waferInnerDia, waferOuterDia)
  
  # pixel designs
  
  #fPixFCell=FPixF.create()
  fPixFPTCell = FPixFPT.create()
  
  # draw designs on wafer
  
  #Merge.cells(waferCell,fPixFCell,0,0)
  Merge.cells(waferCell,fPixFPTCell)
  
  # end
  
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end