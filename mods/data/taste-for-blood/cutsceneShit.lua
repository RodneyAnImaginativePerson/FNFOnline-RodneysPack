-- Story Mode
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('tastyBlood')
		allowCountdown = true
		return Function_Stop
	end
	return Function_Continue
end

-- Free Play
function onCreate()
	if not isStoryMode then
		addCharacterToList('darksonic', 'dad')
		triggerEvent('Change Character', 'dad', 'sonic-mad')
	end
end

function onStepHit()
	if not isStoryMode and curStep == 140 then
		cameraFlash('other', '6d23c9', 1.50, false)
		triggerEvent('Change Character', 'dad', 'darksonic')
	end
	if curStep == 140 and getRandomBool(10) == true then
		if downscroll == false and middlescroll == false then
			debugPrint('lmao- wait but... :whyyyyyy:')
		else
			debugPrint('lmao')
			triggerEvent('Change Scrolltype', 'off', 'off')
		end
	end
end