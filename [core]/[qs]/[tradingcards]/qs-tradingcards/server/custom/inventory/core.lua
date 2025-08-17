if Config.Inventory ~= 'core' then
    return
end

function SetItemMetaData(src, slot, meta)
    local PlayerIdentifier = GetIdentifier(src) -- assuming you have a function that return player idetifier from src
    exports.core_inventory:updateMetadata('content-' .. PlayerIdentifier:gsub(':', ''), meta.id, meta)
end

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

    exports['core_inventory']:openInventory(src, stashId, 'stash', nil, nil, false, nil)
    Wait(100)
    local inventory = exports.core_inventory:getInventory(stashId)

    if inventory and next(inventory) then
        local card = inventory[1]
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
        exports['core_inventory']:openInventory(src, stashId, 'stash', nil, nil, true, nil)
    end
end)
