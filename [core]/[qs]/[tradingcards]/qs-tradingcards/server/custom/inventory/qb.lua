if Config.Inventory ~= 'qb' then
    return
end

function SetItemMetaData(src, slot, meta)
    local player = GetPlayerFromId(src)
    local items = GetItems(player)
    if not items then return end
    for k, v in pairs(items) do
        if v.slot == slot then
            v.info = meta
            break
        end
    end
    player.Functions.SetInventory(items)
end

CreateThread(function()
    if Config.HaveOldQbInventory then return end
    exports['qb-inventory']:CreateShop({
        name = 'tradingcards',
        label = 'Trading Cards Shop',
        slots = Config.ShopSlots,
        items = Config.ShopItems,
    })
end)
RegisterNetEvent('tradingcards:openShop', function()
    local src = source
    exports['qb-inventory']:OpenShop(src, 'tradingcards')
end)

RegisterUsableItem('tradingcard_psa', function(source, item)
    local src = source
    Wait(500)
    local serial = item.info['serial']
    if not item.info['serial'] then
        local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
        SetItemMetaData(src, item.slot, { serial = psaId })
        item.info['serial'] = psaId
        serial = psaId
    end
    local stashId = 'psa_' .. serial
    Debug('PSA Id generated', item.info['serial'])

    MySQL.Async.fetchAll('SELECT * FROM `inventories` WHERE `identifier` = @stashId', {
        ['@stashId'] = stashId
    }, function(result)
        if result and #result > 0 then
            result[1].items = json.decode(result[1].items)
            if result[1].items[1] ~= nil then
                local card = result[1].items[1]
                card.info.withCase = true
                if not Config.ShowToPlayers then
                    TriggerClientEvent('tradingcards:client:showCard', src, card.info, src)
                else
                    for k, v in pairs(GetPlayers()) do
                        local PlayerPed = GetPlayerPed(src)
                        local TargetPed = GetPlayerPed(v)
                        local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
                        if dist < 3.0 then
                            TriggerClientEvent('tradingcards:client:showCard', v, card.info, src)
                        end
                    end
                end
            else
                if Config.HaveOldQbInventory then
                    TriggerClientEvent('tradingcards:client:UsePsa', src, item)
                    return
                end
                exports['qb-inventory']:OpenInventory(src, stashId, {
                    label = 'PSA Case',
                    slots = 1,
                    maxweight = 100,
                })
            end
        else
            if Config.HaveOldQbInventory then
                TriggerClientEvent('tradingcards:client:UsePsa', src, item)
                return
            end
            exports['qb-inventory']:OpenInventory(src, stashId, {
                label = 'PSA Case',
                slots = 1,
                maxweight = 100,
            })
        end
    end)
end)
