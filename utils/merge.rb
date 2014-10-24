module Merge
  include RBA

  def Merge.polyPair(poly1,poly2)
  
    edgeProc = EdgeProcessor.new
    endPoly = edgeProc.simple_merge_p2p([poly1,poly2],false,false,1)
  
    return endPoly[0]
  end


  def Merge.polyVector(polyVec)
  
    edgeProc = EdgeProcessor.new
    poly = Array.new(1,polyVec[0])
           
    for i in 0..(polyVec.size-2)
       poly += edgeProc.simple_merge_p2p([poly[i],polyVec[i+1]],false,false,1)
    end
      
    return poly[polyVec.size-1]
  end


  def Merge.cells(cell1,cell2,x0=0,y0=0)
    cell1.insert(CellInstArray::new(cell2.cell_index,CplxTrans::new(1,0,false,DPoint::new(x0,y0))))
  end

end