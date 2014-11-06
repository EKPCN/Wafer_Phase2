module Cut
include RBA
  
  def Cut.polyVector(polyVec,bool1=false,bool2=false,int=0)
    edgeProc = EdgeProcessor.new
    poly = Array.new(1,polyVec[0])
           
    for i in 0..(polyVec.size-2)
       poly += edgeProc.simple_merge_p2p([poly[i],polyVec[i+1]],bool1,bool2,int)
    end
      
    return poly[polyVec.size-1]
  end

end