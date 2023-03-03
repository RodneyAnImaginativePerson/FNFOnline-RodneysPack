local extraCauseLazy = 95
local opponentStrumX = {92 + extraCauseLazy, 316 + extraCauseLazy, 732 - extraCauseLazy, 956 - extraCauseLazy}
local playerStrumX = {204 + extraCauseLazy, 428 + extraCauseLazy, 844 - extraCauseLazy, 1068 - extraCauseLazy}

function onStepHit()
    if curStep == 590 then
        for i = 0, 7 do
            noteTweenAlpha('alphaNote' .. i, i, 1, 1, 'quadOut')
        end
        for i = 0, 3 do
            noteTweenX('coolCordsDad'..i, i, opponentStrumX[i+1], 1, 'quadOut')
        end
        for i = 4, 7 do
            noteTweenX('coolCordsBF'..i, i, playerStrumX[i-3], 1, 'quadOut')
        end
	end
end