display.setStatusBar(display.HiddenStatusBar);

_w = display.contentWidth;
_h = display.contentHeight;

--criar um grupo para que consiga posicionar o target atrás do circulo
local myGroup = display.newGroup()

--image rect para que possa redimensionar
local object = display.newImageRect("target_white.png", 60,60)

object.x = _w/2
object.y = _h/2

function object:touch( event )
    if ( event.phase == "began" ) then        
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
 
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            object.x = event.x
            object.y = event.y
            
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
            object.x =  _w/2
            object.y = _h/2          
        end
    end
    return true
end
Runtime:addEventListener( "touch", object )

local target = display.newCircle(myGroup, _w/2, _h/2,  40 )
target:setFillColor( 0)
target.strokeWidth = 5
target:setStrokeColor( 1, 0, 0 )

