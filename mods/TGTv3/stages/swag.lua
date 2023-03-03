local directory = 'stages/swag/'

function onCreate()
	addLuaScript('custom_events/PhillyGlowLua')
	makeLuaSprite('sky', directory .. 'nightsky', 0, 0)
	makeLuaSprite('ground', directory .. 'ground', 0, 1000)

	if not lowQuality then
		makeLuaSprite('walls', directory .. 'walls', 150, 300)
		setScrollFactor('walls', 0.9, 0.9)
		scaleObject('walls', 0.8, 0.8)
		setScrollFactor('sky', 1, 1)
	end

	makeLuaSprite('spotlight', directory .. 'spotlight', 450, 110)
	scaleObject('spotlight', 0.85, 0.90)
	setScrollFactor('spotlight', 1, 1)
	doTweenAlpha('noshowyet', 'spotlight', 0, 0.001 / playbackRate, 'linear')

	-- Smokieness *Cough* *Cough*
	for i = 1, 2 do
		makeAnimatedLuaSprite('smoke' .. i, 'smoke', (i == 1 and 2700 or i == 2 and -1250), 1050)
		setProperty('smoke1.flipX', true)

		addAnimationByPrefix('smoke' .. i, 'names', 'pun', 24, true)
		setScrollFactor('smoke' .. i, 1.025, 1.025)
		scaleObject('smoke' .. i, 0.8, 0.8)

		addLuaSprite('sky', false)
		addLuaSprite('ground', false)
		addLuaSprite('smoke' .. i, true)
		addLuaSprite('spotlight', true)
		addLuaSprite('walls', true)
	end

	setObjectOrder('smoke2', getObjectOrder('smoke1'))
end

function onEvent(name, value1, value2)
	if name == 'Swag Lights' then
		if value1 == 'Swag Mode' then
			doTweenAlpha('coolighting', 'spotlight', 100, 10 / playbackRate, 'linear')
			doTweenColor('wallsdark', 'walls', '585858', 1 / playbackRate, 'linear')
			triggerEvent('Change Scroll Speed', 0.7, 3.5)
			triggerEvent('PhillyGlowLua', 1, '6767ff')
			for i = 1, 2 do
				doTweenX('enter' .. i, 'smoke' .. i, (i == 1 and 1660 or i == 2 and -800), 3 / playbackRate, 'smoothStepIn')
				doTweenColor('blue' .. i, 'smoke' .. i, '6767ff', 0.1 / playbackRate, 'smoothStepIn')
				doTweenColor('blue3', 'ground', '6767ff', 0.1 / playbackRate, 'smoothStepIn')
				doTweenColor('blue4', 'sky', '6767ff', 0.1 / playbackRate, 'smoothStepIn')
			end
		elseif value1 == 'Not Just BF' then
			doTweenAlpha('byebyespotlight', 'spotlight', 0, 10 / playbackRate, 'linear')
			doTweenColor('wallsblue', 'walls', '0000ff', 10 / playbackRate, 'linear')
			triggerEvent('Change Scroll Speed', 1, 2)
		elseif value1 == 'Yeah Boi' then
			for i = 1, 2 do
				doTweenX('leave' .. i, 'smoke' .. i, (i == 1 and 2700 or i == 2 and -1250), 3 / playbackRate, 'backOut')
				doTweenColor('wallsnormal', 'walls', 'ffffff', 1.5 / playbackRate, 'linear')
				doTweenColor('normal' .. i, 'smoke' .. i, 'ffffff', 1.5 / playbackRate, 'backOut')
				doTweenColor('normal3', 'ground', 'ffffff', 1.5 / playbackRate, 'backOut')
				doTweenColor('normal4', 'sky', 'ffffff', 1.5 / playbackRate, 'backOut')
				triggerEvent('PhillyGlowLua', 0)
			end
		end
	end
end