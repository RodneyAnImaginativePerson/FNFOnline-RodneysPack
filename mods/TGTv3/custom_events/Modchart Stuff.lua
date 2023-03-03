-- Modchart by Klanter Xpasm 280#0187 and Optimized by me!
local tweenValue = 'linear'
local durationValue = 1
local modchart = false
function onUpdate()
    songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(curBpm/60)*(scrollSpeed/10)
    if modchart == true then
        for i = 0, 3 do
            noteTweenX('oppomoX' .. i, i, _G['defaultOpponentStrumX' .. i] - 80 * math.sin((currentBeat + i * 0.25) * math.pi), durationValue, tweenValue)
            noteTweenY('oppomoY' .. i, i, _G['defaultOpponentStrumY' .. i] - 80 * math.sin((currentBeat + i * 0.25) * math.pi), durationValue, tweenValue)
        end
        
        for i = 4, 7 do
            noteTweenX('playmoX' .. i, i, _G['defaultPlayerStrumX' .. i - 4] - 80 * math.sin((currentBeat + i * 0.25) * math.pi), durationValue, tweenValue)
            noteTweenY('playmoY' .. i, i, _G['defaultPlayerStrumY' .. i - 4] - 80 * math.sin((currentBeat + i * 0.25) * math.pi), durationValue, tweenValue)
        end
    else
        for i = 0, 3 do
            cancelTween('oppomoX' .. i)
            cancelTween('oppomoY' .. i)
        end
        
        for i = 4, 7 do
            cancelTween('playmoX' .. i)
            cancelTween('playmoY' .. i)
        end
	end
end

local value1contents = {}
function onEvent(name, value1, value2)
    if name == 'Modchart Stuff' then
        --debugPrint(tweenValue, ' '..durationValue, modchart)
        if string.find(value1, ',') then
            value1contents = Split(value1, ',')
        end
        
        tweenValue = value1contents[1]
        durationValue = value1contents[2]
        
        if value2 == 'false' then
            modchart = false
        elseif value2 == 'true' then
            modchart = true
        end
    end
end

function Split(s, delimiter)
    result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match))
    end
    return result
end