// https://forum.thegamecreators.com/thread/222633#msg2627553

function SetSpritePositionRelative(spr as integer, x as float, y as float, parent as integer)
 
    // First copy the rotation angle
    SetSpriteAngle(spr,GetSpriteAngle(parent))
 
    // set sprite position
    SetSpritePositionByOffset(spr,GetWorldXFromSprite( parent, x, y ),GetWorldYFromSprite( parent, x, y ))
 
endfunction
