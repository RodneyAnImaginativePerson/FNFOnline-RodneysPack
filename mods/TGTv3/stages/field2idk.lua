function onCreatePost()
	makeLuaSprite('sky', directory .. 'tfbbg3', 0, -300)
	setScrollFactor('sky', 1.10, 0.10)
	
	makeLuaSprite('ground', directory .. 'tfbbg', 150, 300)
	--setScrollFactor('ground', 1.10, 1.20)

	makeLuaSprite('background', directory .. 'tfbbg2', 350, 800)
	setScrollFactor('background', 1.20, 1)

	addLuaSprite('sky', false)
	addLuaSprite('background', false)
	addLuaSprite('ground', false)
end