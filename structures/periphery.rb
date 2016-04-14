module Periphery

  include RBA

  def Periphery.init(cell)
    $Cell = cell
  end
  
  #standard w/o bond pads (for test structures)

  def Periphery.create(layerImp, layerMet, layerPassOpen, layerEdge, layerVia, pixelGrid, biasRing, guardRing, pixelEdge,rocType="ROC4Sens")
	
	#bias ring
      if biasRing['distX']!=0
        
        if rocType == "PSI46"    
          Periphery.asymRing(layerImp,pixelGrid['sizeX']+2*biasRing['distX'],pixelGrid['sizeY']+2*biasRing['distY'],pixelGrid['sizeX']+2*biasRing['distX']+2*biasRing['width'],8375e3,biasRing['rIn'],biasRing['rOut'],0,-69.32e3)
          Periphery.asymRing(layerMet,pixelGrid['sizeX']+2*biasRing['aluDistX'],pixelGrid['sizeY']+2*biasRing['aluDistY'],pixelGrid['sizeX']+2*biasRing['aluDistX']+2*biasRing['aluWidth'],8375e3+45e3,biasRing['rIn'],biasRing['aluROut'],0,-69.32e3) 
        else
          Periphery.ring(layerImp,pixelGrid['sizeX']+2*biasRing['distX'],pixelGrid['sizeY']+2*biasRing['distY'],biasRing['width'],biasRing['rIn'],biasRing['rOut'])
          Periphery.ring(layerMet,pixelGrid['sizeX']+2*biasRing['aluDistX'],pixelGrid['sizeY']+2*biasRing['aluDistY'],biasRing['aluWidth'],biasRing['aluRIn'],biasRing['aluROut'])
        end
          
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,-pixelGrid['sizeY']/2-biasRing['width']/2+10e3)
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,pixelGrid['sizeY']/2+biasRing['width']/2-16e3)    
          Pixel.viaGrid(layerVia,6e3,6e3,1,(pixelGrid['sizeY']/74.5e3).round,0,74.5e3,-pixelGrid['sizeX']/2-biasRing['width']/2+10e3,-pixelGrid['sizeY']/2)   
          Pixel.viaGrid(layerVia,6e3,6e3,1,(pixelGrid['sizeY']/74.5e3).round,0,74.5e3,pixelGrid['sizeX']/2+biasRing['width']/2-16e3,-pixelGrid['sizeY']/2)
        
        if rocType == "FEI4" 
          Periphery.passOpening(layerPassOpen,pixelGrid['sizeX']-2000e3,biasRing['width']-23e3,0,-pixelGrid['sizeY']/2-biasRing['distY']-biasRing['width']/2-7.5e3)          
        elsif rocType == "PSI46"
          Periphery.passOpening(layerPassOpen,pixelGrid['sizeX']-100e3,biasRing['width']-23e3,0,-pixelGrid['sizeY']/2-biasRing['distY']-biasRing['width']/2-55e3)
          Periphery.bumpPad(layerPassOpen,biasRing['bumpDia'],-pixelGrid['sizeX']/2+biasRing['bumpX0'],-pixelGrid['sizeY']/2+biasRing['bumpY0'])
          Periphery.bumpPad(layerMet,20e3,-pixelGrid['sizeX']/2+biasRing['bumpX0'],-pixelGrid['sizeY']/2+biasRing['bumpY0'])
        else
          Periphery.passOpening(layerPassOpen,pixelGrid['sizeX'],biasRing['width']-23e3,0,-pixelGrid['sizeY']/2-biasRing['distY']-biasRing['width']/2-7.5e3)
        end

        Periphery.passOpening(layerPassOpen,pixelGrid['sizeX'],biasRing['width']-23e3,0,+pixelGrid['sizeY']/2+biasRing['distY']+biasRing['width']/2+7.5e3) 
        Periphery.passOpening(layerPassOpen,biasRing['width']-23e3,pixelGrid['sizeY'],-pixelGrid['sizeX']/2-biasRing['distX']-biasRing['width']/2-7.5e3,0) 
        Periphery.passOpening(layerPassOpen,biasRing['width']-23e3,pixelGrid['sizeY'],+pixelGrid['sizeX']/2+biasRing['distX']+biasRing['width']/2+7.5e3,0)
      end
	
	#guardRing	
      if guardRing['distX']!=0
        if rocType == "PSI46"
          Periphery.ring(layerImp,pixelGrid['sizeX']+2*guardRing['distX'],pixelGrid['sizeY']+2*guardRing['distY'],guardRing['width'],guardRing['rIn'],guardRing['rOut'],guardRing['x0'],guardRing['y0'])
          Periphery.ring(layerMet,pixelGrid['sizeX']+2*guardRing['aluDistX'],pixelGrid['sizeY']+2*guardRing['aluDistY'],guardRing['aluWidth'],guardRing['aluRIn'],guardRing['aluROut'],guardRing['x0'],guardRing['y0'])   
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,-pixelGrid['sizeY']/2-guardRing['distY']-guardRing['width']/2+guardRing['y0'])
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,pixelGrid['sizeY']/2+guardRing['distY']+guardRing['width']/2+guardRing['y0'])
          Periphery.passOpening(layerPassOpen,pixelGrid['sizeX']-100e3,guardRing['aluWidth']-10e3,0,-pixelGrid['sizeY']/2-guardRing['aluDistY']-guardRing['aluWidth']/2+guardRing['y0'])
          Periphery.bumpPad(layerPassOpen,guardRing['bumpDia'],-pixelGrid['sizeX']/2+guardRing['bumpX0'],-pixelGrid['sizeY']/2+guardRing['bumpY0'])
          Periphery.bumpPad(layerMet,20e3,-pixelGrid['sizeX']/2+guardRing['bumpX0'],-pixelGrid['sizeY']/2+guardRing['bumpY0'])
        else
          Periphery.ring(layerImp,pixelGrid['sizeX']+2*guardRing['distX'],pixelGrid['sizeY']+2*guardRing['distY'],guardRing['width'],guardRing['rIn'],guardRing['rOut'])
          Periphery.ring(layerMet,pixelGrid['sizeX']+2*guardRing['aluDistX'],pixelGrid['sizeY']+2*guardRing['aluDistY'],guardRing['aluWidth'],guardRing['aluRIn'],guardRing['aluROut'])
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,pixelGrid['sizeY']/2+guardRing['distY']+guardRing['width']/2)
          Pixel.viaGrid(layerVia,6e3,6e3,(pixelGrid['sizeX']/74.5e3).round,1,74.5e3,0,-pixelGrid['sizeX']/2,-pixelGrid['sizeY']/2-guardRing['distY']-guardRing['width']/2)
          Periphery.passOpening(layerPassOpen,pixelGrid['sizeX']-250e3,guardRing['aluWidth']-10e3,0,-pixelGrid['sizeY']/2-guardRing['aluDistY']-guardRing['aluWidth']/2)
        end	
		
        Pixel.viaGrid(layerVia,6e3,6e3,1,(pixelGrid['sizeY']/74.5e3).round,0,74.5e3,-pixelGrid['sizeX']/2-guardRing['distX']-guardRing['width']/2,-pixelGrid['sizeY']/2)
        Pixel.viaGrid(layerVia,6e3,6e3,1,(pixelGrid['sizeY']/74.5e3).round,0,74.5e3,pixelGrid['sizeX']/2+guardRing['distX']+guardRing['width']/2,-pixelGrid['sizeY']/2)		
	end
	
      if rocType == "PSI46"
        Periphery.edge(layerEdge,pixelGrid['sizeX']+2*pixelEdge['distX'],pixelGrid['sizeY']+2*pixelEdge['distY'],pixelEdge['sizeX'],pixelEdge['sizeY'],pixelEdge['outerX0'],pixelEdge['outerY0'],0,0,false,false,false,rocType)  
      else
        Periphery.edge(layerEdge,pixelGrid['sizeX']+2*pixelEdge['distX'],pixelGrid['sizeY']+2*pixelEdge['distY'],pixelEdge['sizeX'],pixelEdge['sizeY'],pixelEdge['outerX0'],pixelEdge['outerY0'])   
      end
      
      Periphery.edge(layerMet,pixelGrid['sizeX']+2*pixelEdge['aluDistX'],pixelGrid['sizeY']+2*pixelEdge['aluDistY'],pixelEdge['aluSizeX'],pixelEdge['aluSizeY'],pixelEdge['outerX0'],pixelEdge['outerY0'],0,0,true,true,true,rocType)
      Periphery.edge(layerVia,pixelEdge['aluSizeX']-40e3,pixelEdge['aluSizeY']-40e3,pixelEdge['aluSizeX']+80e3,pixelEdge['aluSizeY']+80e3,0,0,pixelEdge['outerX0'],pixelEdge['outerY0'])
      Periphery.edge(layerPassOpen,pixelEdge['aluSizeX']-20e3,pixelEdge['aluSizeY']-20e3,pixelEdge['aluSizeX']+80e3,pixelEdge['aluSizeY']+80e3,0,0,pixelEdge['outerX0'],pixelEdge['outerY0'])
      
  end

  
  def Periphery.ring(layer,x,y,width,rIn,rOut,x0=0,y0=0)

    ring = Basic.ring(x,y,width,rIn,rOut,x0,y0)
    $Cell.shapes(layer).insert(ring)
  end
  
  
  def Periphery.asymRing(layer,xi,yi,xo,yo,rIn,rOut,x0,y0)
    innerBox = Basic.roundBox(xi,yi,0,0,0)
    outerBox = Basic.roundBox(xo,yo,x0,y0,rOut)
    
    ring = Cut.polyVector([outerBox,innerBox])
    
    $Cell.shapes(layer).insert(ring)
    
  end 

  def Periphery.bumpPad(layer,dia,x0=0,y0=0)
    bumpPad = Basic.circle(dia,x0,y0)
    $Cell.shapes(layer).insert(bumpPad)
  end

  def Periphery.edge(layer,xi,yi,xo,yo,x0=0,y0=0,xg0=0,yg0=0,cutfortext=false,alignmentmark=false,lowerText=false,rocType="ROC4Sens")
    
    innerBox = Polygon.new(Box.new(-xi/2,-yi/2,xi/2,yi/2))
    outerBox = Polygon.new(Box.new(-xo/2,-yo/2,xo/2,yo/2))  
    outerBox.move(x0,y0)
    
    if rocType == "PSI46"
      innerBox.move(0,-69.32e3)
    end
    
    if cutfortext
       if rocType == "FEI4"
          labelBox = Polygon.new(Box.new(-xo/2+9000e3,yo/2-400e3,xo/2-9000e3,yo/2-100e3))
       elsif  rocType == "RD53A"
          labelBox = Polygon.new(Box.new(-xo/2+8000e3,yo/2-400e3,xo/2-8000e3,yo/2-100e3))
       elsif  rocType == "FCP130"
          labelBox = Polygon.new(Box.new(-xo/2+1000e3,yo/2-400e3,xo/2-1000e3,yo/2-100e3))
       else  
          labelBox = Polygon.new(Box.new(-xo/2+2000e3,yo/2-400e3,xo/2-2000e3,yo/2-100e3))
      end      
      edge = Cut.polyVector([outerBox,innerBox,labelBox])
    else
      edge = Cut.polyVector([outerBox,innerBox])  
    end


    # place periphery here label
    if lowerText
       if rocType == "FEI4"
         labelBox = Polygon.new(Box.new(-xo/2+7605e3, -yo/2+100e3, xo/2-7605e3, -yo/2+400e3))
       elsif rocType == "RD53A"
         labelBox = Polygon.new(Box.new(-xo/2+7605e3, -yo/2+100e3, xo/2-7605e3, -yo/2+400e3)) 
       elsif rocType == "FCP130"
         labelBox = Polygon.new(Box.new(-xo/2+500e3, -yo/2+100e3, xo/2-500e3, -yo/2+400e3))     
       elsif rocType == "PSI46"
         labelBox = Polygon.new(Box.new(-xo/2+1500e3, -yo/2+75e3, xo/2-1500e3, -yo/2+375e3))     
       else  
         labelBox = Polygon.new(Box.new(-xo/2+1500e3, -yo/2+100e3, xo/2-1500e3, -yo/2+400e3))
      end      
     edge = Cut.polyVector([edge,labelBox])    
    end

# Textbox (Christian)
#
#  edg = Cut.polyVector([outerBox,innerBox])
#
#	if cutfortext
#		txtBox = Polygon.new(Box.new(-5e6/2,-110e3/2,5e6/2,110e3/2))
#		txtBox.move(x0,y0+yi/2+(yo-yi)/4)
#		edge = Cut.polyVector([edg,txtBox])
#	else
#		edge = edg
#	end
	
    if alignmentmark
      cutbox = Polygon.new(Box.new(-100e3,-100e3,100e3,100e3))
      f1 = Polygon.new(Box.new(-15e3,-70e3,15e3,70e3))
      f1.move(-45e3,0)
      f2 = Polygon.new(Box.new(-45e3,-15e3,45e3,15e3))
      f2.move(-15e3,-5e3)
      f3 = Polygon.new(Box.new(-60e3,-15e3,60e3,15e3))
      f3.move(0,55e3)
      fmark = Merge.polyVector([f1,f2,f3])
      cutbox.move(x0+xo/2-260e3,y0+yo/2-260e3) #upper left
      edg = Cut.polyVector([edge,cutbox])
      fmrk = fmark.move(x0+xo/2-260e3,y0+yo/2-260e3)
      $Cell.shapes(layer).insert(fmrk)
      cutbox.move(0,-yo+2*260e3) #lower left
      edge = Cut.polyVector([edg,cutbox])
      fmrk = fmark.move(0,-yo+2*260e3)
      $Cell.shapes(layer).insert(fmrk)
      cutbox.move(-xo+2*260e3,0) #lower right
      edg = Cut.polyVector([edge,cutbox])
      fmrk = fmark.move(-xo+2*260e3,0)
      $Cell.shapes(layer).insert(fmrk)
      cutbox.move(0,yo-2*260e3) #lower right
      edge = Cut.polyVector([edg,cutbox])
      fmrk = fmark.move(0,yo-2*260e3)
      $Cell.shapes(layer).insert(fmrk)
    end
	
    edge.move(xg0,yg0)
        
    $Cell.shapes(layer).insert(edge)
  end


  def Periphery.passOpening(layer,x,y,x0=0,y0=0,r=10e3)
    opening = Basic.roundBox(x,y,x0,y0,r)
    $Cell.shapes(layer).insert(opening)
  end

end
