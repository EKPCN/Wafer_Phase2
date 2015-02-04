class MiscTools
  # To use this, add this line to your file: load File.expand_path('Misc/Misc tools.rb', $PHTOOLS)

  # Originally from: http://klayout.de/forum/comments.php?DiscussionID=103
  def self.copy_cells(lsrc, ltarget, lmap)
    citarget = nil
    # a map for the cell indices
    cmap = {}
    lsrc.each_cell_bottom_up do |cisrc|
      # create a new cell in the target layout and add to the cell index map
      csrc = lsrc.cell(cisrc)
      citarget = ltarget.add_cell(lsrc.cell_name(cisrc))
      ctarget = ltarget.cell(citarget)
      cmap[cisrc] = citarget
      # copy the shapes
      lsrc.layer_indices.each do |lisrc|
        shtarget = ctarget.shapes(lmap[lisrc])
        csrc.shapes(lisrc).each do |shape|
          newshape = shtarget.insert(shape) 
          shtarget.replace_prop_id(newshape, 0) # clear properties
        end
      end
      # translate and copy the instances
      csrc.each_inst do |inst|
        # get the instance object and create a new one with the new cell index
        i = inst.cell_inst
        trans = i.is_complex? ? i.cplx_trans : i.trans
        cinew = cmap[i.cell_index]
        if i.is_regular_array?
          ctarget.insert(RBA::CellInstArray.new(cinew, trans, i.a, i.b, i.na, i.nb))
        else
          ctarget.insert(RBA::CellInstArray.new(cinew, trans))
        end
      end
    end
    # Return the last cell's index which (because we iterated bottom up) is a top cell
    return citarget
  end

 end