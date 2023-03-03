--too lazy to document much here but change the values around to your own liking if u know how to -heat
--ALSO THIS ONLY WORKS WITH PSYCH v5.0 AND ABOVE

local healthLoss = -1.5 -- health loss on miss
local healthGain = 0.2 -- health gain on hit

local judgement = true -- punishment for hitting off beat

local scale = 0.6 -- scale of "note"
local xOffset = -65 -- x offset of "note"
--local yOffset = 0 -- y offset of "note"
local safeOffset = 1 -- the distance the "note" can be hit

local getHealth
function onCreate()
	getHealth = getProperty('health')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Crosshair' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'crosshair') -- texture path
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true) --no note splashes
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
			setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
			setPropertyFromGroup('unspawnNotes', i, 'copyAlpha', false)
			setPropertyFromGroup('unspawnNotes', i, 'copyX', false)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 0)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 0)
		end
	end
end

function onUpdate(elapsed)
	for i = 0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'Crosshair' then
			if getPropertyFromGroup('notes', i, 'strumTime') - getPropertyFromClass('Conductor', 'safeZoneOffset') * safeOffset < getSongPosition() then
				if keyJustPressed('space') or botPlay then 
					crossHit(i)
				end
			end

			if getSongPosition() > getPropertyFromGroup('notes', i, 'strumTime') + (300 / getProperty('songSpeed')) then
				crossMiss(i)
			end

			-- Dupe removal i guess?
			if getPropertyFromGroup('notes', i, 'strumTime') == getPropertyFromGroup('notes', i, 'prevNote.strumTime') 
				and getPropertyFromGroup('notes', i, 'prevNote.noteType') == 'Crosshair' then
				setPropertyFromGroup('notes', id, 'visible', false) 
				setPropertyFromGroup('notes', id, 'active', false) 
				removeFromGroup('notes', id, false)
			end
			
			-- Offsets?
			setPropertyFromGroup('notes', i, 'alpha', getPropertyFromGroup('playerStrums', 0, 'alpha')) 
			setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('playerStrums', 0, 'x') + xOffset)
			--setPropertyFromGroup('notes', i, 'y', getPropertyFromGroup('playerStrums', 0, 'y') + yOffset)
			setPropertyFromGroup('notes', i, 'scale.x', scale) 
			setPropertyFromGroup('notes', i, 'scale.y', scale) 
		end	
 	end
end

-- Miss
function crossMiss(id)
	if not lowQuality then
		if getHealth >= 1 then
			addHealth(healthLoss)
		elseif getHealth <= 1 and getHealth >= 1.5 then
			addHealth(healthLoss + 1)
		elseif getHealth <= 1.5 then
			addHealth(healthLoss + 1.2)
		end
	else
		addHealth(healthLoss + 1.2)
	end
	setPropertyFromGroup('notes', id, 'visible', false) 
	setPropertyFromGroup('notes', id, 'active', false) 
	removeFromGroup('notes', id, false)
	--playSound('gunshot', 1)
	playAnim('boyfriend', 'hurt', true)
	setProperty('boyfriend.specialAnim', true)
	playAnim('dad', 'shoot', true)
	setProperty('dad.specialAnim', true)
	playAnim('tailsBG', 'scaredShoot')
	setProperty('tailsBG.specialAnim', true)
	playAnim('knucklesBG', 'scaredShoot')
	setProperty('knucklesBG.specialAnim', true)
end

-- Hit
function crossHit(id)
	if lowQuality then
		healthGain = 1
	end
	addHealth(healthGain)
	loss = 0
	if judgement and not botPlay then
		loss = 0.003 * (getSongPosition() - getPropertyFromGroup('notes', id, 'strumTime')) * (healthLoss / 2)
		--if loss > 0 then loss = -loss end 
		if loss > 0 then loss = 0 end 
	end
	setPropertyFromGroup('notes', id, 'visible', false) 
	setPropertyFromGroup('notes', id, 'active', false) 
	removeFromGroup('notes', id, false)
	playAnim('boyfriend', 'dodge', true)
	setProperty('boyfriend.specialAnim', true)
	playAnim('dad', 'shoot', true)
	setProperty('dad.specialAnim', true)
	playAnim('tailsBG', 'scared')
	setProperty('tailsBG.specialAnim', true)
	playAnim('knucklesBG', 'scared')
	setProperty('knucklesBG.specialAnim', true)
	--playSound('gunshot', 0.5)
end