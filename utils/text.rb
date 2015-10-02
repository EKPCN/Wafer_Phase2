module Gds

  include RBA
  
  def Text.create(layout, layer, text, x0=0, y0=0)
  
    textCell = layout.create_cell("Label")

    # find the lib
    lib = RBA::Library.library_by_name("Basic")
    lib || raise("Unknown lib 'Basic'")

    # find the pcell
    pcell_decl = lib.layout.pcell_declaration("TEXT")
    pcell_decl || raise("Unknown PCell 'TEXT'")

    # set the parameters
    param = { "text" => text, "layer" => 
    LayerInfo::new(layer+1, 0), "mag" => 500}

    #, "inverse" => true
    # build a param array using the param hash as a source
    pv = pcell_decl.get_parameters.collect do |p|
      param[p.name] || p.default
    end
    
    pcell_var = layout.add_pcell_variant(lib,pcell_decl.id,pv)
    pcell_inst = textCell.insert(CellInstArray::new(pcell_var,CplxTrans::new(1,0,false,DPoint::new(x0,y0))))

    # flatten cell to receive polygon objects

    textCell.flatten(-1,true)
    
    return textCell
  
  end
end