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
  load "Wafer_Phase2/sensors/Roc4Sens50x50/roc4sens50x50.rb"
  load "Wafer_Phase2/sensors/Roc4Sens50x50staggered/roc4sens50x50s.rb" 
  load "Wafer_Phase2/sensors/Roc4Sens50x50staggered_2/roc4sens50x50s2.rb"     
  load "Wafer_Phase2/sensors/Roc4Sens100x25/roc4sens100x25.rb"
  load "Wafer_Phase2/sensors/Roc4Sens100x25s/roc4sens100x25s.rb"  
  load "Wafer_Phase2/sensors/Roc4Sens100x25s2/roc4sens100x25s2.rb"    
  
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
  
  fPixFCell = FPixF.create()
  fPixFPTCell = FPixFPT.create()
  roc4Sens50x50 = Roc4Sens50x50.create()
  roc4Sens100x25 = Roc4Sens100x25.create()  
  roc4Sens100x25s = Roc4Sens100x25s.create()
  roc4Sens100x25s2 = Roc4Sens100x25s2.create()
  roc4Sens50x50staggered = Roc4Sens50x50s.create()
  roc4Sens50x50staggered2 = Roc4Sens50x50s2.create()
  
  # draw designs on wafer
  
  Merge.cells(waferCell,fPixFCell)
  Merge.cells(waferCell,fPixFPTCell,10e6)  
  
  Merge.cells(waferCell,roc4Sens50x50,0,10e6)
  Merge.cells(waferCell,roc4Sens50x50staggered,10e6,10e6)
  Merge.cells(waferCell,roc4Sens50x50staggered2,20e6,10e6)
  
  Merge.cells(waferCell,roc4Sens100x25,0,20e6)
  Merge.cells(waferCell,roc4Sens100x25s,10e6,20e6)
  Merge.cells(waferCell,roc4Sens100x25s2,20e6,20e6)
  # end
  
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end