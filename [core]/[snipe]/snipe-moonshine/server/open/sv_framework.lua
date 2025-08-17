QBCore, ESX = nil, nil
disabled = false

if Config.Framework == "qb" then
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()
    end
elseif Config.Framework == "esx" then
    local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
    if (ESX == nil) then
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
else
    print("Framework not found")
    disabled = true
end

function GetPlayerFrameworkIdentifier(id)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(id)
        if not Player then return end
        return Player.PlayerData.citizenid
    elseif Config.Framework == "qbx" then
        local Player = exports.qbx_core:GetPlayer(source)
        if not Player then return end
        return Player.PlayerData.citizenid
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(id)
        if not xPlayer then return end
        return xPlayer.identifier
    end
end

function HasMoney(source, amount, type)
    
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.PlayerData.money[type] >= amount then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbx" then
        if exports.qbx_core:GetMoney(source, type) >= amount then
            return true
        else
            return false
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if type == "cash" then
            
            if xPlayer.getMoney() >= amount then
                return true
            else
                return false
            end
        elseif type == "bank" then
            if xPlayer.getAccount("bank").money >= amount then
                return true
            else
                return false
            end
        end
    end
end

function HasItem(source, item, amount)
    if Config.Inventory == "ox" then
        return Config.InventoryExport:GetItemCount(source, item) >= amount
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Player.Functions.GetItemByName(item)
        if item ~= nil then
            return item.amount >= amount
        else
            return false
        end
    elseif Config.Inventory == "qs" then
        return exports['qs-inventory']:GetItemTotalAmount(source, item) >= amount
    end
    return Config.InventoryExport:GetItemCount(source, item) >= amount
end

function GetItemCount(source, item)
    if Config.Inventory == "ox" then
        return Config.InventoryExport:GetItemCount(source, item)
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.GetItemByName(item)
    elseif Config.Inventory == "qs" then
        return exports['qs-inventory']:GetItemTotalAmount(source, item)
    end
end

function GetItemInfo(source, item)

    if Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.GetItemByName(item)
    elseif Config.Inventory == "qs" then
        return exports['qs-inventory']:GetItemByName(source, item)
    end
end


function AddItem(source, item, amount, metadata)
    if Config.Inventory == "ox" then
        if Config.InventoryExport:AddItem(source, item, amount, metadata) then
            return true
        else
            return false
        end
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.AddItem(item, amount, false, metadata) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
            return true
        else
            return false
        end
    elseif Config.Inventory == "qs" then
        if exports['qs-inventory']:CanCarryItem(source, item, amount) then
            if exports['qs-inventory']:AddItem(source, item, amount, nil, metadata) then
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

function RemoveItem(source, item, amount)
    if Config.Inventory == "ox" then
        if Config.InventoryExport:RemoveItem(source, item, amount) then
            return true
        else
            return false
        end
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.RemoveItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
            return true
        else
            return false
        end
    elseif Config.Inventory == "qs" then
        if exports['qs-inventory']:RemoveItem(source, item, amount) then
            return true
        else
            return false
        end
    end
end

function RemoveItemBySlot(source, item, amount, slot)
    if Config.Inventory == "ox" then
        return Config.InventoryExport:RemoveItem(source, "moonshine_bottle", 1, nil, slot)
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.RemoveItem(item, amount, slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
            return true
        else
            return false
        end
    elseif Config.Inventory == "qs" then
        if exports['qs-inventory']:RemoveItem(source, item, amount, slot) then
            return true
        else
            return false
        end
    end

end

function GetItemBySlot(source, slot)
    if Config.Inventory == "ox" then
        return Config.InventoryExport:GetSlot(source, slot)
    elseif Config.Inventory == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.GetItemBySlot(slot)
    elseif Config.Inventory == "qs" then
        return exports['qs-inventory']:GetItemBySlot(source, slot)
    end
end

function AddMoney(source, amount, type)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddMoney(type, amount)
        return true
    elseif Config.Framework == "qbx" then
        exports.qbx_core:AddMoney(source, type, amount)
        return true
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if type == "cash" then
            xPlayer.addMoney(amount)
            return true
        elseif type == "bank" then
            xPlayer.addAccountMoney("bank", amount)
            return true
        end
    end
end

function RemoveMoney(source, amount, type)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveMoney(type, amount)
        return true
    elseif Config.Framework == "qbx" then
        exports.qbx_core:RemoveMoney(source, type, amount)
        return true
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if type == "cash" then
            xPlayer.removeMoney(amount)
            return true
        elseif type == "bank" then
            xPlayer.removeAccountMoney("bank", amount)
            return true
        end
    end
end