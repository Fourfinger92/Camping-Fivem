ESX = exports["es_extended"]:getSharedObject()
CreateThread(function()
    for i,k in pairs(ConfigCamping.wildesprobspawndings) do
        ESX.RegisterUsableItem(i, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(i, 1)
            TriggerClientEvent('lurch-Camping', source, i, k)    
        end)
    end
end)

RegisterNetEvent("stuhlzurueck")
AddEventHandler("stuhlzurueck", function(stuhl, lurch)
    if lurch == "lurcheandieMacht" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(stuhl, 1)
    end
end)

RegisterNetEvent("ichhabgegrillt")
AddEventHandler("ichhabgegrillt", function(item)
        local xPlayer = ESX.GetPlayerFromId(source)
        for i,k in pairs(item) do
            xPlayer.addInventoryItem(i, k)
        end
end)


CreateThread(function()
    for i,k in pairs(ConfigCamping.grillfleisch) do
        ESX.RegisterUsableItem(i, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(i, 1)
            TriggerClientEvent('Grillendlich', source, i,k)    
        end)
    end
end)


RegisterServerEvent('lurch-Campkontroll')AddEventHandler('lurch-Campkontroll',function(item, lurch)TriggerClientEvent("lurch-Kur:createobject",source,item, lurch.probs)end)
