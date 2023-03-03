local defaultZoom
function onCreate()
    defaultZoom = getProperty('defaultCamZoom')
end

function onEvent(name, value1, value2)
    if name == 'Set Cam Zoom' then 
        value1 = tonumber(value1)
        if value1 == '' or value1 == nil or value1 == 'default' then
            value1 = defaultZoom
        end
        setProperty('defaultCamZoom', value1)
    end
end