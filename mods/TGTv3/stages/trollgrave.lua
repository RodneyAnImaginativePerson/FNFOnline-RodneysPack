local directory = 'stages/trollgrave/'

function onCreate()
	makeLuaSprite('sky', directory .. 'stageback_HS', -600 -156)
	scaleObject('sky', 1.7, 1.7)
	setScrollFactor('sky', 1.1, 1.3)
	setObjectOrder('sky', 0)
	
	makeLuaSprite('groundandgrave', directory .. 'stagefront_HS', -656, 749)
	scaleObject('groundandgrave', 1, 1)
	setScrollFactor('groundandgrave', 1, 1)
	setObjectOrder('groundandgrave', 1)
end