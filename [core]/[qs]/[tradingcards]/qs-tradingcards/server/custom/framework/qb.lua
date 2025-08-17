if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

function RegisterUsableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end

function GetIdentifier(source)
    local player = GetPlayerFromId(source)
    return player.PlayerData.citizenid
end

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function AddItem(source, item, count, slot, metadata)
    local player = GetPlayerFromId(source)
    player.Functions.AddItem(item, count, slot, metadata)
end

function RemoveItem(source, item, count, slot)
    local player = GetPlayerFromId(source)
    player.Functions.RemoveItem(item, count, slot)
end

function GetItems(player)
    if not player then return false end
    return player.PlayerData.items
end

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end
