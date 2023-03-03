function onEvent(name, value1, value2)
	if name == 'Freeze Chart' and not lowQuality then
		currentpos = getPropertyFromClass('Conductor', 'songPosition')
		stopThis = toboolean(value1)
		runTimer('resetRun', value2)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'resetRun' then
		stopThis = false
	end
end

function onUpdatePost()
	if stopThis == true then
		setPropertyFromClass('Conductor', 'songPosition', currentpos)
	end
end

function toboolean(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end