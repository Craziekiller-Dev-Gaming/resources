if Config.Inventory ~= 'qs' then
    return
end

function SetItemMetaData(src, slot, meta)
    exports['qs-inventory']:SetItemMetadata(src, slot, meta)
end

RegisterUsableItem('tradingcard_psa', function(source, item)
    local src = source
    Wait(500)
    local serial = item.info['serial']
    local stashId = 'psa_' .. serial
    Debug('PSA Id generated', item.info['serial'])

    MySQL.Async.fetchAll('SELECT * FROM `inventory_stash` WHERE `stash` = @stashId', {
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
                TriggerClientEvent('tradingcards:client:UsePsa', src, item)
            end
        else
            TriggerClientEvent('tradingcards:client:UsePsa', src, item)
        end
    end)
end)
