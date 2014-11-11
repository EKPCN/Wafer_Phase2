module Merge
  include RBA

  # Merge two polygons that touch eachother
  # @param poly1 [Polygon] Polygon 1
  # @param poly2 [Polygon] Polygon 2
  # @return [Polygon] Returns merged polygon

  def Merge.polyPair(poly1,poly2)
  
    edgeProc = EdgeProcessor.new
    endPoly = edgeProc.simple_merge_p2p([poly1,poly2],false,false,1)
  
    return endPoly[0]
  end

  # Merge a array of polygons where neigboring polygon entries touch eachother
  # @param polyVec [Array<Polygon>] Array of polygons
  # @return [Polygon] Returns the merged polygon

  def Merge.polyVector(polyVec)
  
    edgeProc = EdgeProcessor.new
    poly = Array.new(1,polyVec[0])
           
    for i in 0..(polyVec.size-2)
       poly += edgeProc.simple_merge_p2p([poly[i],polyVec[i+1]],false,false,1)
    end
      
    return poly[polyVec.size-1]
  end

  # Insert one cell into another
  # @param cell1 [Cell] cell that contains cell2
  # @param cell2 [Cell] cell that will be placed into cell1
  # @param x0 [Int] x coordinate where the lower left corner of cell2 will be placed in cell1
  # @param y0 [Int] y coordinate where the lower left corner of cell2 will be placed in cell1
  # @return [Nill]

  def Merge.cells(cell1,cell2,x0=0,y0=0,rot=0,mir=false)
    cell1.insert(CellInstArray::new(cell2.cell_index,CplxTrans::new(1,rot,mir,DPoint::new(x0,y0))))
  end

end
