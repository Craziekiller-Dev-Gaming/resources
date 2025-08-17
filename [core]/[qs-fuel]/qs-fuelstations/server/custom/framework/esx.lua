if Config.Framework ~= 'esx' then
    return
end

local hasOx = GetResourceState('ox_inventory') == 'started'

local legacyEsx = pcall(function()
    ESX = exports['es_extended']:getSharedObject()
end)
if not legacyEsx then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetItem(source, item)
    local player = GetPlayerFromId(source)
    return player.getInventoryItem(item)
end

function AddItem(source, item, count)
    local player = GetPlayerFromId(source)
    if not Config.JerryCanItem then
        player.removeWeapon(item)
        return player.addWeapon(item, 4500)
    end
    player.addInventoryItem(item, count)
end

function RemoveItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.removeInventoryItem(item, count)
end

function RemoveMoney(source, amount)
    local player = GetPlayerFromId(source)
    player.removeAccountMoney('money', amount)
end

function GetAccountMoney(source, account)
    local player = GetPlayerFromId(source)
    return player.getAccount(account).money
end

function RemoveAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    player.removeAccountMoney(account, amount)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    player.addAccountMoney(account, amount)
end

if not hasOx then
    return
end

print('OX Inventory is running, fuel stations will use it for fuel cans.')

local ox_inventory = exports.ox_inventory

RegisterNetEvent('ox_fuel:updateFuelCan', function(durability)
    local source = source
    local item = ox_inventory:GetCurrentWeapon(source)

    if item and durability > 0 then
        durability = math.floor(item.metadata.durability - durability)
        item.metadata.durability = durability
        item.metadata.ammo = durability

        ox_inventory:SetMetadata(source, item.slot, item.metadata)
    end
end)
