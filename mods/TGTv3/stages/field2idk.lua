function onCreatePost()
	makeLuaSprite('sky', 'stages/field2idk/tfbbg3', 0, -300)
	setScrollFactor('sky', 1.10, 0.10)
	
	makeLuaSprite('ground', 'stages/field2idk/tfbbg', 150, 300)
	--setScrollFactor('ground', 1.10, 1.20)

	makeLuaSprite('background', 'stages/field2idk/tfbbg2', 350, 800)
	setScrollFactor('background', 1.20, 1)

	addLuaSprite('sky', false)
	addLuaSprite('background', false)
	addLuaSprite('ground', false)
end