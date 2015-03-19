module Cut
include RBA

  # Cut overlapping parts out and create new polygon
  # @param polyVec [Array<Polygons>] Array of polygons
  # @return [Polygon] Returns the final polygon

  def Cut.polyVector(polyVec)
  
    edgeProc = EdgeProcessor.new
    poly = Array.new(1,polyVec[0])
           
    for i in 0..(polyVec.size-2)
       poly += edgeProc.simple_merge_p2p([poly[i],polyVec[i+1]],false,false,0)
    end
      
    return poly[polyVec.size-1]
  end

  def Cut.multiple(polyVec)

    edgeProc = EdgeProcessor.new
    poly = Array.new(1,polyVec[0])
           
    for i in 0..(polyVec.size-2)
       poly += edgeProc.simple_merge_p2p([poly[0],polyVec[i+1]],false,false,0)
    end
      
    return poly[polyVec.size-1]
  end

end
