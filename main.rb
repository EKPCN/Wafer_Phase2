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

# Builds a layout from separate files
# To use: Make a new layout with at least one cell, called "TOP"
# Modify the INPUTS accordingly.
# This script will instance other gds/oas files under "TOP".



begin

  # INPUTS:

  top_cell_name = "Wafer" # The name of the cell you will instantiate the imported files in to

  # Get relevant handles
  app = Application.instance
  mw = app.main_window
  lv = mw.current_view
  if lv == nil; raise "No view selected"; end
  master_layout = lv.active_cellview.layout
  top_cell_idx = lv.active_cellview.cell.cell_index

  # Ask the user for the files
  dialog = QFileDialog::new(mw)
  dialog.setDirectory(QDir::homePath())
  dialog.setFileMode(QFileDialog::ExistingFiles)
  if (dialog.exec())
    files = dialog.selectedFiles()
  end

  # Create a progress bar
  progress = RelativeProgress::new("Loading...", files.length)

  # Loop through each file and instantiate it under the parent cell
  files.each_with_index { |f,i|
    p "Reading #{f}"
    master_layout.read(f) # This reads it in but instantiates it as new top cells rather than child cells under the parent cell.

    # Find the just-read-in layout
    top_cells = master_layout.top_cells
    top_cells.each { |cell|
      next if cell.name == top_cell_name # Skip the parent cell

      # Figure out where to place each one. You can modify this line.
      trans = Trans.new(Point.new(0,0))

      # Instantiate the other cells under the parent cell
      master_layout.cell(top_cell_idx).insert(CellInstArray.new(cell.cell_index, trans))

    }

    progress.inc
  }

ensure
  progress.destroy
end
  
  
  

  # end
  layoutView.select_cell(waferCell.cell_index, 0)
  layoutView.max_hier_levels=(waferCell.hierarchy_levels+1)
  layoutView.add_missing_layers
  layoutView.zoom_fit  
  
end