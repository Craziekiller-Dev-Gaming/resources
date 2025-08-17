if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetIdentifier(source)
    local player = GetPlayerFromId(source)
    return player.identifier
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function AddItem(source, item, count, slot, metadata)
    local player = GetPlayerFromId(source)
    player.addInventoryItem(item, count, metadata, slot)
end

function RemoveItem(source, item, count, slot)
    local player = GetPlayerFromId(source)
    player.removeInventoryItem(item, count, nil, slot)
end

function GetItems(player)
    if not player then return end
    local inventory = player.getInventory()
    for k, v in pairs(inventory) do
        if v.count <= 0 then
            inventory[k] = nil
        end
    end
    return inventory
end

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end
