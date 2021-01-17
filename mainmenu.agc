mainmenu_setup:

	CreateText(1, "Incoming!")
	SetTextSize(1, 256)
	SetTextPosition(1, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, 10)
	
	CreateText(2, "Controls")
	CreateText(3, "-Left and right arrows to position gun")
	CreateText(4, "-Space to fire")
	
	CreateText(5, "You lose if five paratroopers hit the city")
	
	CreateText(6, "Press Space to begin")
	
	for i=1 to 6
		SetTextColor(i, 0, 0, 0, 255)
	next i
	
	for j=2 to 5
		SetTextSize(j, 64)
	next j
	SetTextSize(6, 128)
	
	SetTextPosition(2, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, GetTextY(1) + GetTextTotalHeight(1))
	SetTextPosition(3, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, GetTextY(2) + GetTextTotalHeight(3))
	SetTextPosition(4, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, GetTextY(3) + GetTextTotalHeight(4))
	SetTextPosition(5, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, GetTextY(4) + GetTextTotalHeight(5))
	
	SetTextPosition(6, GetVirtualWidth() - GetTextTotalWidth(1) * 1.06, GetVirtualHeight() - GetTextTotalHeight(6))
	
	return
	
mainmenu:

	while main = 1
		if GetRawKeyState(32) = 1 // space
			for k=1 to 6
				SetTextVisible(k, 0)
			next k
			SetSpriteVisible(11, 0)
			main = 0
		endif
		
		Sync()
	endwhile

	return
