gameover:
	SetSpriteVisible(11, 1)
	
	CreateText(10, "FORM #169363-A")
	CreateText(11, "Termination of Employment")
	CreateText(12, "Subject: Player")
	
	if failreason = 1
		CreateText(13, "Reason: Failure to protect mission-critical assets")
	else
		CreateText(13, "Reason: Breach of workplace dress code (see ADDENDUM)")
		CreateText(14, "ADDENDUM:")
	endif
	CreateText(15, "Game Over")
	CreateTexT(16, "Press Space to play again")

	for i=10 to 16
		if i = 14 and failreason = 1
			continue
		endif
		
		SetTextColor(i, 0, 0, 0, 255)
		SetTextSize(i, 48)
		
		
	next i
	
	if failreason = 2
		SetTextColor(14, 0, 0, 0, 255)
		SetTextSize(14, 48)
	endif
	
	SetTextPosition(10, 0, 0)
	SetTextPosition(11, 0, GetTextY(10) + GetTextTotalHeight(11))
	SetTextPosition(12, 0, GetTextY(11) + GetTextTotalHeight(12))
	SetTextPosition(13, 0, GetTextY(12) + GetTextTotalHeight(13))
	
	SetTextPosition(15, GetVirtualWidth() - GetTextTotalWidth(15), 650)
	SetTextPosition(16, GetVirtualWidth() - GetTextTotalWidth(16), 650 + GetTextTotalHeight(16))
	
	if failreason = 2
		SetTextPosition(14, 0, 250)
		CreateSprite(69, 9)
		
		SetSpritePosition(69, 0, 250 + GetTextTotalHeight(14))
	endif

	while gameover = 1
		if GetRawKeyPressed(32) = 1 // space
			gameover = 0
			score = 0
			hits = 0
			
			for j=10 to 16
				if j = 14 and failreason = 1
					continue
				endif
				
				SetTextVisible(j, 0)
			next j
			
			SetSpriteVisible(11, 0)
			if failreason = 2
				SetSpriteVisible(69, 0)
			endif
			
			return
		endif
		
		Sync()
	endwhile

	return
