if onexFx.Data.Links.inventory.name == 'ox_inventory' then

    AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
        if name == "rental_receipt" then
            TriggerClientEvent('onex-rental:client:openRentReceipt', playerId, metadata)
        end
    end)

elseif onexFx.Data.Links.inventory.name == 'qb-inventory' or onexFx.Data.Links.inventory.name == 'qs-inventory' then
    Core.Functions.CreateUseableItem('rental_receipt', function(src, item)
        local Player = Core.Functions.GetPlayer(src)
        if not Player.Functions.GetItemByName(item.name) then
            return
        end
        TriggerClientEvent('onex-rental:client:openRentReceipt', src, item.info)
    end)
end
