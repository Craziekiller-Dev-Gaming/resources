if Config.Inventory ~= 'ox' then
    return
end

OxInventory = exports['ox_inventory']

function SetItemMetaData(src, slot, meta)
    OxInventory:SetMetadata(src, slot, meta)
end

local function generateStash(src, stashId)
    OxInventory:RegisterStash(stashId, 'PSA Case', 1, 1000)
    Wait(100)
    OxInventory:forceOpenInventory(src, 'stash', {
        id = stashId
    })
end

RegisterNetEvent('tradingcard:openPsa', function(item)
    local src = source
    local itemSlot = OxInventory:GetSlot(src, item.slot)
    if not itemSlot.metadata or not next(itemSlot.metadata) then
        local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
        SetItemMetaData(src, itemSlot.slot, { serial = psaId })
        itemSlot.metadata = { serial = psaId }
    end
    local stashId = 'psa_' .. itemSlot.metadata.serial
    local inventory = OxInventory:GetInventory(stashId, false)
    if not inventory then
        generateStash(src, stashId)
        return
    end
    local card = inventory.items[1]
    if not card then
        return generateStash(src, stashId)
    end
    if not table.find(Config.CardItems, card.name) then
        generateStash(src, stashId)
        print('Card not found in config')
        return
    end
    card.metadata.withCase = true
    if not Config.ShowToPlayers then
        TriggerClientEvent('tradingcards:client:showCard', src, card.metadata, src)
    else
        for k, v in pairs(GetPlayers()) do
            local PlayerPed = GetPlayerPed(src)
            local TargetPed = GetPlayerPed(v)
            local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
            if dist < 3.0 then
                TriggerClientEvent('tradingcards:client:showCard', v, card.metadata, src)
            end
        end
    end
end)

-- no need to use on other inventories.
RegisterNetEvent('tradingcards:server:removeItem', function(item, count)
    local src = source
    RemoveItem(src, item, count)
end)


exports('OpenInterationMenu', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local itemSlot = exports.ox_inventory:GetSlot(inventory.id, slot)
        print(json.encode(itemSlot.metadata, { indent = true }))
        print('anan')
        itemSlot.info = itemSlot.metadata
        TriggerClientEvent('tradingcards:client:openCardInteractionMenu', inventory.id, itemSlot)
    end
end)

exports('openAlbum', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local itemSlot = exports.ox_inventory:GetSlot(inventory.id, slot)
        TriggerClientEvent('tradingcards:client:OpenAlbum', inventory.id, itemSlot.metadata)
    end
end)

local function formatItem(item)
    return {
        name = item.name,
        price = item.price,
    }
end

CreateThread(function()
    local items = Config.ShopItems
    local _items = {}
    for k, v in pairs(items) do
        table.insert(_items, formatItem(v))
    end
    local locations = {}
    for k, v in pairs(Config.Locations) do
        locations[k] = vec3(v.location.x, v.location.y, v.location.z)
    end
    exports.ox_inventory:RegisterShop('trading_shop', {
        name = 'trading_shop',
        inventory = _items,
        locations = locations
    })
end)
