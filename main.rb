module CISWafer
  include RBA

  $GLOBAL_PATH = File.dirname(__FILE__)

  # include files

  load "Wafer_Phase2/structures/basic.rb"
  load "Wafer_Phase2/structures/pixel.rb"
  load "Wafer_Phase2/structures/periphery.rb"
  load "Wafer_Phase2/utils/merge.rb"
  load "Wafer_Phase2/utils/cut.rb"

  load File.expand_path($GLOBAL_PATH + "/utils/MiscTools.rb", $PHTOOLS)
  # create mainWindow and layout
  
  mw = Application.instance.main_window
  $layout = mw.create_layout(0).layout
  layoutView = mw.current_view  

  # standard parameters

  $layout.dbu = 0.001 #µm -> dbu = 1nm

  # Layer
  
  $layerP = $layout.insert_layer(LayerInfo.new(0,0,"p substrate"))
  $layerPp = $layout.insert_layer(LayerInfo.new(1,0,"p+"))
  $layerPpe19 = $layout.insert_layer(LayerInfo.new(2,0,"p+ e19"))
  $layerNp = $layout.insert_layer(LayerInfo.new(3,0,"n+"))
  $layerAlu = $layout.insert_layer(LayerInfo.new(4,0,"Alu"))
  $layerAluVia = $layout.insert_layer(LayerInfo.new(5,0,"Alu via"))
  $layerPassOpen = $layout.insert_layer(LayerInfo.new(6,0,"Passivation Opening"))
  
  # wafer
  
  waferCell = $layout.create_cell("Wafer")  
  waferOuterDia = 150e6
  waferInnerDia = 140e6  
  Basic.createWafer($layerP, waferCell, waferInnerDia, waferOuterDia)

  
  # draw designs on wafer

  # --- PSTOP ---
  
  load "Wafer_Phase2/sensors/pstop/sensorList.rb"
  

  #final

 # Merge.cells(waferCell,Roc4Sens50x50.create(),5e6,0)
  
=begin
  Merge.cells(waferCell,Roc4Sens50x50wide.create(),15e6,0)
  Merge.cells(waferCell,Roc4Sens50x50b.create(),25e6,0)
  Merge.cells(waferCell,Roc4Sens50x50bwide.create(),35e6,0)
  
  Merge.cells(waferCell,FPixF.create(),5e6,30e6)
  Merge.cells(waferCell,FPixFPT.create(),15e6,30e6)   
=end

  
=begin
  Merge.cells(waferCell,Roc4Sens100x25.create(),5e6)
  Merge.cells(waferCell,Roc4Sens100x25wide.create(),15e6)

  Merge.cells(waferCell,Roc4Sens100x25s.create(),5e6,30e6)
  Merge.cells(waferCell,Roc4Sens100x25s2.create(),10e6,30e6)
=end


  # --- PSPRAY ---

  load "Wafer_Phase2/sensors/pspray/sensorList.rb"

=begin

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
  
=end

=begin  
  layoutView.transaction("Bring in external file")
    begin

      #layout = Application.instance.main_window.current_view.active_cellview.layout
      file = "/home/schell/test.gds"
      
      unless file.nil?
        load File.expand_path(file)

        layout_to_grab = Layout.new
        layout_to_grab.read(file) unless file.nil?

        lmap = {}
        linfo_to_index = {}

        layout_to_grab.layer_indices.each { |l|
          linfo = layout_to_grab.get_info(l)
          layer = $layout.layer(linfo)
          lmap[l] = layer;
          linfo_to_index[linfo.to_s] = layer
        }

        layout_to_grab_top = MiscTools.copy_cells(layout_to_grab, $layout, lmap)
        #$layout.cell(waferCell).insert(CellInstArray.new(layout_to_grab_top, Trans.new)) #Do this line if you want to instantiate the cell in the "top" cell
      end

    ensure 
      layoutView.commit
    end
=end

  # Read the first layout
  layout = RBA::Layout.new
  lmap = layout.read($file1)

  # read the second file which basically performs the merge
  load_layout_options = RBA::LoadLayoutOptions.new
  load_layout_options.set_layer_map(lmap, true)
  layout.read($file2, load_layout_options)
  

  # end
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end