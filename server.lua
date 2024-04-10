local maxCulling = 300.0 --> max = 424.0
local minCulling = 100.0
local stepCulling = 50.0
local playerCullingData = {}

RegisterNetEvent('autoCulling')
AddEventHandler('autoCulling', function(nbPlayerAround)
    local _source = source
    if not playerCullingData[_source] then
        playerCullingData[_source] = {culling = maxCulling}
    end

    local curCulling = playerCullingData[_source].culling
    if nbPlayerAround >= 30 then
        curCulling = math.max(minCulling, curCulling - stepCulling)
    else
        curCulling = math.min(maxCulling, curCulling + stepCulling)
    end

    if curCulling ~= playerCullingData[_source].culling then
        playerCullingData[_source].culling = curCulling

        if _source ~= nil then
            SetPlayerCullingRadius(_source, curCulling)
            local playerEntity = NetworkGetEntityFromNetworkId(_source)
            if playerEntity then
                SetEntityDistanceCullingRadius(playerEntity, curCulling)
            end
        end
    end
end)