function onCreate()
	precacheImage('andromedaSplashes')
end

local andro = false
function onUpdate()
	if andro then
		callScript('scripts/andromeda splashes', 'stupidFunction', {true})
	end
end

function onStepHit()
	if curStep == 1535 then
		-- Andromeda Splashes cause why not?
		andro = true
		callScript('scripts/andromeda splashes', 'stupidFunction', {false})
	end
end