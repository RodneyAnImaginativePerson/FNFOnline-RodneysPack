local defzoom = 0
local zoomtime = 0.0
local unzoomtime = 0.0
local zoomtype = ''
function onCreate() -- Defining Variables
    defzoom = getProperty('defaultCamZoom') -- Default Zoom
    zoomtime = 0.25 -- Time it takes to Zoom In
    unzoomtime = 0.2 -- Time it takes to Zoom Out
    zoomtype = 'expoOut' -- Tween used
end

function onEvent(name, value1, value2)
	if name == 'Camera Tween Zoom' and cameraZoomOnBeat then
        if value1 < 0 then
            value1 = 0
        end

        if value1 == 0 then
            doTweenZoom('zoomIn', 'camGame', value2, 0.05, zoomtype)
			setProperty('defaultCamZoom', value2)
        else
            doTweenZoom('zoomIn', 'camGame', value2, zoomtime, zoomtype)
			setProperty('defaultCamZoom', value2)
            runTimer('zoombackIn', value1, 1)
        end
        --debugPrint('Event triggered: ', name, value1, value2)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'zoombackIn' then
		doTweenZoom('zoomOut', 'camGame', defzoom, unzoomtime, zoomtype)
		setProperty('defaultCamZoom', defzoom)
    end
end