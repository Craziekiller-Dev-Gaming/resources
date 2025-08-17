if Config.Inventory ~= 'ox' then
    return
end

RegisterNetEvent('tradingcards:client:OpenShop')
AddEventHandler('tradingcards:client:OpenShop', function(id)
    exports.ox_inventory:openInventory('shop', {
        type = 'trading_shop',
        id = id,
    })
end)

function OpenInventory()
    local playerId = GetPlayerServerId(PlayerId())
    exports.ox_inventory:openInventory('player', playerId)
end

exports('openPsa', function(item)
    Wait(500)
    TriggerServerEvent('tradingcard:openPsa', item)
end)
