if Config.Inventory ~= 'origen' then
    return
end

function SetItemMetaData(src, slot, meta)
    exports['origen_inventory']:setMetadata(src, slot, meta)
end

RegisterUsableItem('tradingcard_psa', function(source, item)
    local src = source
    Wait(500)
    Debug('item', item)
    local serial = item.metadata['serial']
    if not item.metadata['serial'] then
        local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
        SetItemMetaData(src, item.slot, { serial = psaId })
        item.metadata['serial'] = psaId
        serial = psaId
    end
    local stashId = 'psa_' .. serial
    Debug('PSA Id generated', item.metadata['serial'])

    MySQL.Async.fetchAll('SELECT * FROM `stashitems` WHERE `stash` = @stashId', {
        ['@stashId'] = stashId
    }, function(result)
        if result and #result > 0 then
            result[1].items = json.decode(result[1].items)
            if result[1].items[1] ~= nil then
                local card = result[1].items[1]
                card.metadata.withCase = true
                if not Config.ShowToPlayers then
                    TriggerClientEvent('tradingcards:client:showCard', src, card.info, src)
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
            else
                exports['origen_inventory']:OpenInventory(src, 'stash', stashId, {
                    label = 'PSA Case',
                    slots = 1,
                    maxweight = 100,
                })
            end
        else
            exports['origen_inventory']:OpenInventory(src, 'stash', stashId, {
                label = 'PSA Case',
                slots = 1,
                maxweight = 100,
            })
        end
    end)
end)
