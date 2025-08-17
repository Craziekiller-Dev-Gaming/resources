if Config.Inventory ~= 'core' then
    return
end

RegisterNetEvent('tradingcards:client:OpenShop')
AddEventHandler('tradingcards:client:OpenShop', function()
    print("This inventory does not support store events...")
end)

function OpenInventory()
    exports.core_inventory:openInventory()
end

exports('openPsa', function(item)
    Wait(500)
    TriggerServerEvent('tradingcard:openPsa', item)
end)