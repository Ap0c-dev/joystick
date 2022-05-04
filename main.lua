display.setStatusBar(display.HiddenStatusBar);

_w = display.contentWidth;
_h = display.contentHeight;


local object = display.newImage("target_white.png" )
object.id = "ball object"
object.x = _w/2
object.y = _h/2
direcao = 0
 
function object:touch( event )
    if ( event.phase == "began" ) then        
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
 
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
            object.x = event.x
            object.y = event.y
            
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
           object = display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
           
        end
    end
    return true
end
Runtime:addEventListener( "touch", object )

-- local function mover(event)
--     object.x = event.x
--     object.y = event.y
-- end
-- Runtime:addEventListener( "touch", mover )


-- Runtime:addEventListener("touch", move)
-- local function touchTela(ev)
--     if ev.phase == "began" then
--         if ev.x >= _w/2 then
--             object.direcao = 1;
--         else
--             object.direcao = -1;
--         end
--     elseif ev.phase == "ended" then
--         object.direcao = 0;
--end