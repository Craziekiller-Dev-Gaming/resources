if Config.Inventory ~= 'qs' then
    return
end

RegisterNetEvent('tradingcards:client:OpenShop')
AddEventHandler('tradingcards:client:OpenShop', function()
    local ShopItems = {}
    ShopItems.label = Lang('TRADINGCARDS_SHOP_TITLE')
    ShopItems.items = Config.ShopItems
    ShopItems.slots = Config.ShopSlots
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'itemshop_tradingcards', ShopItems)
end)

function OpenInventory()
    TriggerServerEvent('inventory:server:OpenInventory')
end

exports('openPsa', function(item)
    Wait(500)
    TriggerServerEvent('tradingcard:openPsa', item)
end)
