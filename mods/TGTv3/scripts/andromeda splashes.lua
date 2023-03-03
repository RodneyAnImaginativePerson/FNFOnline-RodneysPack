function onCreate()
	if boyfriendName ~= 'bf' then
		stupidFunction(false)
	end
end

function onUpdate()
	if boyfriendName ~= 'bf' then
		stupidFunction(true)
	end
end

local offsetX = 63
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if getPropertyFromGroup('notes', membersIndex, 'rating') == 'sick' then
		offsetX = (noteData == 0 and 35 or 63)
	end
end

function stupidFunction(heheStupid)
	if not inGameOver then
		if heheStupid == false then
			if songName == 'Tsuraran Fox' then
				for i = 0, getProperty('unspawnNotes.length')-1 do
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'andromedaSplashes')
				end
			else
				setPropertyFromClass('PlayState', 'SONG.splashSkin', 'andromedaSplashes')
			end
		else
			-- Splash Offsets
			--[[local noteData
			for i = 0, getProperty('notes.length')-1 do
				if getPropertyFromGroup('notes', i, 'mustPress') then
					noteData = getPropertyFromGroup('notes', i, 'noteData')
					offsetX = (noteData == 0 and 35 or 63)
				end
			end]]
			for i = 0, getProperty('grpNoteSplashes.length')-1 do
				setPropertyFromGroup('grpNoteSplashes', i, 'animation.curAnim.frameRate', 30)
				setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', offsetX)
				setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', 58)
			end
		end
	end
end