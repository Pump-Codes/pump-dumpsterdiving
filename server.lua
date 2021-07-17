QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('pump-dumpsterdiving:startDumpsterTimer')
AddEventHandler(pump-dumpsterdiving:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('pump-dumpsterdiving:giveDumpsterReward')
AddEventHandler('pump-dumpsterdiving:giveDumpsterReward', function()
    local xPlayer, randomItem = QBCore.Functions.GetPlayer(source), Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        xPlayer.Functions.AddItem(randomItem, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[randomItem], "add")
    end
end)

function startTimer(id, object)
    local timer = 10 * 14000

    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('pump-dumpsterdiving:removeDumpster', id, object)
        end
    end
end
