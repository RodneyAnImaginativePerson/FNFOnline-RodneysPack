local directory = 'stages/fieldnight/'

function onCreate()
	makeLuaSprite('dumbsky', directory .. 'shadowbg', -700, -300)
	setScrollFactor('dumbsky', 1.1, 1.1)

	makeLuaSprite('idkwhatthisis', directory .. 'shadowbg3', -361, -206)
	setScrollFactor('idkwhatthisis', 1.15, 1.15)

	makeLuaSprite('wierdwallcliff', directory .. 'shadowbg2', -683, -125)

	makeLuaSprite('ground', directory .. 'shadowbg4', -726, 603)

	makeAnimatedLuaSprite('tailsBG', directory .. 'tails', 292, 211)
	addAnimationByPrefix('tailsBG', 'idle', 'IDLET', 24, true)
	addAnimationByPrefix('tailsBG', 'scared', 'SHOOTSCARET', 24, false)
	addAnimationByPrefix('tailsBG', 'scaredShoot', 'SHOOTT', 24, false)

	makeAnimatedLuaSprite('knucklesBG', directory .. 'knuckles', 834, 235)
	addAnimationByPrefix('knucklesBG', 'idle', 'IDLEK', 24, true)
	addAnimationByPrefix('knucklesBG', 'scared', 'SHOOTK', 24, false)
	addAnimationByPrefix('knucklesBG', 'scaredShoot', 'SHOOTSCAREK', 24, false)
	setObjectOrder('knucklesBG', getObjectOrder('boyfriendGroup') - 1)

	addLuaSprite('dumbsky', false)
	addLuaSprite('idkwhatthisis', false)
	addLuaSprite('wierdwallcliff', false)
	addLuaSprite('ground', false)
	addLuaSprite('knucklesBG', true)
	addLuaSprite('tailsBG', false)
end

function onBeatHit()
	playAnim('tailsBG', 'idle')
	playAnim('knucklesBG', 'idle')
end