module CISWafer
  include RBA

  # include files

  load "Wafer_Phase2/structures/basic.rb"
  load "Wafer_Phase2/structures/pixel.rb"
  load "Wafer_Phase2/structures/periphery.rb"
  load "Wafer_Phase2/utils/merge.rb"
  load "Wafer_Phase2/utils/cut.rb"


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

  
  # draw designs on wafer

  # pStop
  
  load "Wafer_Phase2/sensors/pstop/sensorList.rb"
  

  #final

  Merge.cells(waferCell,Roc4Sens50x50.create(),5e6,0)
  Merge.cells(waferCell,Roc4Sens50x50wide.create(),15e6,0)
  Merge.cells(waferCell,Roc4Sens50x50b.create(),25e6,0)
  Merge.cells(waferCell,Roc4Sens50x50bwide.create(),35e6,0)
  
  Merge.cells(waferCell,FPixF.create(),5e6,30e6)
  Merge.cells(waferCell,FPixFPT.create(),15e6,30e6)   


  
=begin

  
  Merge.cells(waferCell,Roc4Sens50x50.create(),0,10e6)
  Merge.cells(waferCell,Roc4Sens50x50staggered.create(),10e6,10e6)
  Merge.cells(waferCell,Roc4Sens50x50staggered2.create(),20e6,10e6)

  Merge.cells(waferCell,Roc4Sens100x25.create(),5e6)
  Merge.cells(waferCell,Roc4Sens100x25wide.create(),15e6)

  Merge.cells(waferCell,Roc4Sens100x25s.create(),5e6,30e6)
  Merge.cells(waferCell,Roc4Sens100x25s2.create(),10e6,30e6)
=end


  # pSpray

  load "Wafer_Phase2/sensors/pspray/sensorList.rb"

  


  # final layouts

  Merge.cells(waferCell,Roc4Sens50x50.create(),-5e6,0)
  Merge.cells(waferCell,Roc4Sens50x50wide.create(),-15e6,0)
  Merge.cells(waferCell,Roc4Sens50x50b.create(),-25e6,0)
  Merge.cells(waferCell,Roc4Sens50x50bwide.create(),-35e6,0)
  Merge.cells(waferCell,Roc4Sens50x50bsmall.create(),-45e6,0)
  
  Merge.cells(waferCell,Roc4Sens100x25.create(),-5e6,15e6)
  Merge.cells(waferCell,Roc4Sens100x25wide.create(),-15e6,15e6)
  Merge.cells(waferCell,Roc4Sens100x25b.create(),-25e6,15e6)
  Merge.cells(waferCell,Roc4Sens100x25bwide.create(),-35e6,15e6)    
  



  
  # end
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end