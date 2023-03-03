local directory = 'stages/field/'

function onCreate()
	makeLuaSprite('sky', directory .. 'sky', 0, 0)
	makeLuaSprite('ground', directory .. 'grass', 0, 1000)

	if not lowQuality then
		makeLuaSprite('sky', directory .. 'sky-low', 0, 0)
		makeLuaSprite('ground', directory .. 'grass-low', 0, 1000)

		makeLuaSprite('walls', directory .. 'walls', 150, 300)
		setScrollFactor('walls', 0.9, 0.9)
		scaleObject('walls', 0.8, 0.8)
		setScrollFactor('sky', 1, 1)
	end

	if songName == 'Talentless Fox' then
		makeLuaSprite('sky', directory .. 'sky-low', 0, 0)
		makeLuaSprite('ground', directory .. 'grass-low', 0, 1000)

		if not lowQuality then
			makeLuaSprite('walls', directory .. 'walls-low', 150, 300)
			setScrollFactor('walls', 0.9, 0.9)
			scaleObject('walls', 0.8, 0.8)
			setScrollFactor('sky', 1, 1)
		end
	end

	addLuaSprite('sky', false)
	addLuaSprite('ground', false)
	addLuaSprite('walls', true)
end