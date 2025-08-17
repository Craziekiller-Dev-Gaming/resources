if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function GetItem(source, item)
    local player = GetPlayerFromId(source)
    return player.Functions.GetItemByName(item)
end

function AddItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.Functions.AddItem(item, count)
end

function RemoveItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.Functions.RemoveItem(item, count)
end

function RemoveMoney(source, amount)
    local player = GetPlayerFromId(source)
    player.Functions.RemoveMoney('cash', amount)
end

function GetAccountMoney(source, account)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    return player.PlayerData.money[account]
end

function RemoveAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.RemoveMoney(account, amount)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.AddMoney(account, amount)
end
