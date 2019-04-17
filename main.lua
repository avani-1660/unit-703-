-----------------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-- Gravity

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
--physics.setDrawMode( "hybrid" )   -- Shows collision engine outlines only

local theGround = display.newImage( "assets/land.png" )
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

-- Character move

local dPad = display.newImageRect( "assets/d-pad.png", 150, 150)
dPad.x = 75
dPad.y = display.contentCenterY -200

--up arrow 

local upArrow = display.newImageRect( "assets/upArrow.png", 35,25 )
upArrow.x = 75
upArrow.y = display.contentCenterY -256
upArrow.id = "up arrow"

-- down arrow 

local downArrow =display.newImageRect ("assets/downArrow.png" , 35, 25 )
downArrow.x = 75
downArrow.y = display.contentCenterY -144
downArrow.id = "down Arrow"

--right arrow 

local rightArrow = display.newImageRect ("assets/rightArrow.png" , 25,35)
rightArrow.x =130
rightArrow.y = display.contentCenterY-200
rightArrow.id = "right Arrow"

--left Arrow

local leftArrow = display.newImageRect ( "assets/leftArrow.png", 25,35)
leftArrow.x = 20
leftArrow.y = display.contentCenterY -200
leftArrow.id = "left arrow"

-- character 

local theCharacter = display.newImageRect( "assets/Idle.png", 70, 70 )
theCharacter.x =90
theCharacter.y = 125
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = -50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = 50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 50, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = -50, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    return true
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
rightArrow:addEventListener( "touch",rightArrow )
leftArrow:addEventListener( "touch", leftArrow)
