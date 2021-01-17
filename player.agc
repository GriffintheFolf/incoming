player_move:

	if GetRawKeyState(37) = 1 // left arrow
		playerangle = playerangle - playerspeed
	else
		if GetRawKeyState(39) = 1 // right arrow
			playerangle = playerangle + playerspeed
		endif
	endif

	SetSpriteAngle(4, playerangle)
	if GetSpriteAngle(4) < 270 and GetSpriteAngle(4) > 269 // flat on left
		playerangle = 270
		SetSpriteAngle(4, playerangle)
	else
		if GetSpriteAngle(4) > 90 and GetSpriteAngle(4) < 270
			playerangle = 90
			SetSpriteAngle(4, playerangle)
		endif
	endif
	
	return
	
player_fire:

	if GetRawKeyPressed(32) = 1 // space
		gosub shell_create
	endif
	
	return
