AddEventHandler('onClientResourceStart', function(resName)
    if resName == GetCurrentResourceName() then
        Citizen.CreateThread(function()
            while true do
                local activePlayerList = GetActivePlayers()
                TriggerServerEvent('autoCulling', #activePlayerList)
                Citizen.Wait(20000)
            end
        end)
    end
end)