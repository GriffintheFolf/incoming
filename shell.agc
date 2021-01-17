maxshells = 2 // maximum amount of shells that will be
			  // displayed on screen at once
currshell = 1

s1angle as float
s1x as float
s1y as float
s2x as float
s2y as float

s1moving = 0
s2moving = 0
s1tilt = 1
s2tilt = 1

// directions
// 1: left
// 2: right
// 3: straight up

s1dir = 0
s2dir = 0

shell_create:
	
	select currshell
		case 1:
			SetSpritePositionRelative(5, GetSpriteWidth(4) / 32, GetSpriteHeight(4) * -1.25, 4)
			s1angle = GetSpriteAngle(5)
			s1moving = 1
			
			if s1angle > 0 and s1angle >= 270
				s1dir = 1
			else
				if s1angle > 0 and s1angle <= 90
					s1dir = 2
				else
					if s1angle = 0
						s1dir = 3
					endif
				endif
			endif
			
			s1x = GetSpriteX(4) - (GetSpriteWidth(4) / 128)
			s1y = GetVirtualHeight() - GetSpriteHeight(4) * 1.75
		endcase
		
		case 2:
			SetSpritePositionRelative(6, GetSpriteWidth(4) / 32, GetSpriteHeight(4) * -1.25, 4)
			s2angle = GetSpriteAngle(6)
			s2moving = 1
			
			if s2angle > 0 and s2angle >= 270
				s2dir = 1
			else
				if s2angle > 0 and s2angle <= 90
					s2dir = 2
				else
					if s2angle = 0
						s2dir = 3
					endif
				endif
			endif
			
			s2x = GetSpriteX(4) - (GetSpriteWidth(4) / 128)
			s2y = GetVirtualHeight() - GetSpriteHeight(4) * 1.75
		endcase
	endselect

	currshell = currshell + 1
	if currshell > 2
		currshell = 1
	endif

	return

shell_move:

	if s1moving = 1
		if s1dir = 1 // to the left
			s1x = s1x - shellspeedx
			s1y = s1y - shellspeedy
			SetSpritePosition(5, s1x, s1y)
			SetSpriteAngle(5, s1angle)
		else
			if s1dir = 2 // to the right
				s1x = s1x + shellspeedx
				s1y = s1y - shellspeedy
				SetSpritePosition(5, s1x, s1y)
				SetSpriteAngle(5, s1angle)
			else
				if s1dir = 3
					s1y = s1y - shellspeedy
					SetSpritePosition(5, s1x, s1y)
				endif
			endif
		endif
	endif

	if s2moving = 1
		if s2dir = 1 // to the left
			s2x = s2x - shellspeedx
			s2y = s2y - shellspeedy
			SetSpritePosition(6, s2x, s2y)
			SetSpriteAngle(6, s2angle)
		else
			if s2dir = 2 // to the right
				s2x = s2x + shellspeedx
				s2y = s2y - shellspeedy
				SetSpritePosition(6, s2x, s2y)
				SetSpriteAngle(6, s2angle)
			else
				if s2dir = 3
					s2y = s2y - shellspeedy
					SetSpritePosition(6, s2x, s2y)
				endif
			endif
		endif
	endif

	return

shell_bounds:

	if GetSpriteX(5) < 0 or GetSpriteX(5) > GetVirtualWidth() or GetSpriteY(5) < 0
		s1moving = 0
		SetSpritePosition(5, -40, -40)
	endif
	
	if GetSpriteX(6) < 0 or GetSpriteX(6) > GetVirtualWidth() or GetSpriteY(6) < 0
		s2moving = 0
		SetSpritePosition(6, -40, -40)
	endif

shell_hit:
	
	if GetSpriteCollision(5, 9)
		s1moving = 0
		SetSpritePosition(5, -40, -40)
		
		SetSpriteImage(9, 10)
		PlaySound(1)
		t1falling = 0
		t1y = GetSpriteY(7) + GetSpriteHeight(9)
		SetSpriteImage(9, 4)
		
		score = score + 20
	endif
	
	if GetSpriteCollision(6, 9)
		s1moving = 0
		SetSpritePosition(6, -40, -40)
		
		SetSpriteImage(9, 10)
		PlaySound(1)
		t1falling = 0
		t1y = GetSpriteY(7) + GetSpriteHeight(9)
		SetSpriteImage(9, 4)
		
		score = score + 20
	endif
	
	if GetSpriteCollision(5, 10)
		s1moving = 0
		SetSpritePosition(5, -40, -40)
		
		SetSpriteImage(10, 10)
		PlaySound(1)
		t2falling = 0
		t2y = GetSpriteY(8) + GetSpriteHeight(10)
		SetSpriteImage(10, 4)
		
		score = score + 20
	endif
	
	if GetSpriteCollision(6, 10)
		s2moving = 0
		SetSpritePosition(6, -40, -40)
		
		SetSpriteImage(10, 10)
		PlaySound(1)
		t2falling = 0
		t2y = GetSpriteY(8) + GetSpriteHeight(10)
		SetSpriteImage(10, 4)
		
		score = score + 20
	endif
	
	
	
	return
