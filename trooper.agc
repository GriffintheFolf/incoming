/*
trooper_select:
	if t1falling = 1
		currtrooper = 2
	else
		if t2falling = 1
			currtrooper = 1
		else
			return
		endif
	endif
	
	return
	
	*/

trooper_drop1:
	t1falling = 1
	SetSpritePosition(9, GetSpriteX(7), GetSpriteY(7) + GetSpriteHeight(9))
	
	
	return

trooper_drop2:
	t2falling = 1
	SetSpritePosition(10, GetSpriteX(8), GetSpriteY(8) + GetSpriteHeight(10))
	
	
	return

trooper_move:

	if t1falling = 1
		t1y = t1y + trooperspeed
		SetSpritePosition(9, GetSpriteX(9), t1y)
	endif
	if t2falling = 1
		t2y = t2y + trooperspeed
		SetSpritePosition(10, GetSpriteX(10), t2y)
	endif
	
	return

trooper_hit:

	if t1falling = 1
		if GetSpriteCollision(9, 2) // hits the city
			SetSpritePosition(9, -70, -70)
			p1delayset = 0
			t1y = GetSpriteY(7) + GetSpriteHeight(9)
			t1falling = 0
			hits = hits + 1
		endif
	endif
	
	if t2falling = 1
		if GetSpriteCollision(10, 2) // hits the city
			SetSpritePosition(10, -70, -70)
			t2y = GetSpriteY(8) + GetSpriteHeight(10)
			p2delayset = 0
			t2falling = 0
			hits = hits + 1
		endif
	endif

	return
