 module NFunc
   include RBA
   
   def NFunc.create_polycring(rinner,router,x0=0,y0=0)
      box = RBA::Polygon.new(RBA::Box.new(-router,-router, router, router))
      box.insert_hole(RBA::Box.new(-rinner,-rinner, rinner, rinner))
      cring = box.round_corners(rinner,router,100)
      return cring.transformed(RBA::Trans.new(0, false, x0, y0))
   end
   
   def NFunc.create_polycirc(r,x0=0,y0=0)
      box = RBA::Polygon.new(RBA::Box.new(-r,-r, r, r))
      circ = box.round_corners(0,r,100)
      return circ.transformed(RBA::Trans.new(0, false, x0, y0))
   end
   
   def NFunc.create_emptybox(xinner,yinner,xouter,youter,rinner,router,x0=0,y0=0)
     box = RBA::Polygon.new(RBA::Box.new(-xouter/2,-youter/2, xouter/2, youter/2))
     box.insert_hole(RBA::Box.new(-xinner/2,-yinner/2, xinner/2, yinner/2))
     rbox = box.round_corners(rinner,router,25)
     return rbox.transformed(RBA::Trans.new(0, false, x0, y0))
   end
 end