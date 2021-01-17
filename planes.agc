p1x = 0
p2x = 500

p1droptime as integer
p2droptime as integer

p1delayset = 0
p2delayset = 0

plane_move:
	p1x = p1x + planespeed
	p2x = p2x - planespeed
	
	if p1x > GetVirtualWidth()
		p1x = -10
	endif
	if p2x < 0
		p2x = GetVirtualWidth() - GetSpriteWidth(8)
	endif
	
	SetSpritePosition(7, p1x, GetSpriteY(7))
	SetSpritePosition(8, p2x, GetSpriteY(8))
	
	return
	

plane_drop:
	if t1falling = 0
		gosub trooper_drop1
	endif
	if t2falling = 0
		gosub trooper_drop2
	endif
	
	return
