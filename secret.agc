

// OwO

trooper_idle:
	if GetRawKeyPressed(79) = 1 and o2 = 0 // O
		o1 = 1
	endif
	
	if GetRawKeyPressed(87) = 1 and o1 = 1 and o2 = 0 // W
		w = 1
	endif
	
	if GetRawKeyPressed(79) = 1 and o1 = 1 and w = 1 and o2 = 0
		o2 = 1
	endif
	
	if o1 =1 and w = 1 and o2 = 1
		gameover = 1
		failreason = 2
		gosub gameover
	endif

	return
