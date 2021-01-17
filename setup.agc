setup:

	CreateSprite(1, 1) // background
	SetSpriteSize(1, GetVirtualWidth(), GetVirtualHeight())
	
	CreateSprite(2, 8) // city skyline
	SetSpriteSize(2, GetVirtualWidth(), GetVirtualHeight() / 4)
	SetSpritePosition(2, 0, GetVirtualHeight() - GetSpriteHeight(2))
	
	CreateSprite(3, 5) // gun base
	SetSpriteSize(3, GetImageWidth(5) * 12, GetImageHeight(5) * 12)
	SetSpritePosition(3, (GetVirtualWidth() / 2) - (GetSpriteWidth(3) / 2), GetVirtualHeight() - GetSpriteHeight(3))
	
	CreateSprite(4, 6) // barrel
	SetSpriteSize(4, GetImageWidth(6) * 12, GetImageHeight(6) * 12)
	SetSpritePosition(4, (GetSpriteX(3) + (GetSpriteWidth(3) / 2)) - GetSpriteWidth(4) / 2, GetVirtualHeight() - GetSpriteHeight(4) * 1.75)
	
	CreateSprite(5, 7) // shell 1
	CreateSprite(6, 7) // shell 2
	SetSpriteSize(5, GetImageWidth(7) * 4, GetImageHeight(7) * 4)
	SetSpriteSize(6, GetImageWidth(7) * 4, GetImageHeight(7) * 4)
	SetSpritePosition(5, -40, -40)
	SetSpritePosition(6, -40, -40)
	
	CreateSprite(7, 3) // right-facing plane
	CreateSprite(8, 2) // left-facing plane
	SetSpriteSize(7, GetImageWidth(3) * 2, GetImageHeight(3) * 2)
	SetSpriteSize(8, GetImageWidth(2) * 2, GetImageHeight(2) * 2)
	SetSpritePosition(7, 0, 10)
	SetSpritePosition(8, 500, 60)
	
	// troopers
	for i=9 to 10
		CreateSprite(i, 4)
		SetSpriteSize(i, GetImageWidth(4) * 2.5, GetImageHeight(4) * 2.5)
	next i
	
	CreateImageColor(11, 255, 255, 255, 255)
	CreateSprite(11, 11)
	SetSpriteSize(11, GetVirtualWidth(), GetVirtualHeight())
	SetSpritePosition(11, 0, 0)
	
	// make the barrel rotate at the bottom
	SetSpriteOffset(4, GetSpriteWidth(4) / 2, GetSpriteHeight(4))
	
	return
