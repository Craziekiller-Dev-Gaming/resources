local itemList = {}
if Config.Inventory == "ox" then
    itemList = Config.InventoryExport:Items()
end
CreateThread(function()
    if Config.Framework == "qb" then
        QBCore.Functions.CreateUseableItem(Config.BarrelItemName, function(source, item)
            local src = source
            TriggerClientEvent('snipe-moonshine:client:placeBarrel', src, Config.BarrelProp)
        end)
    elseif Config.Framework == "qbx" then
        exports.qbx_core:CreateUseableItem(Config.BarrelItemName, function(source, item)
            local src = source
            TriggerClientEvent('snipe-moonshine:client:placeBarrel', src, Config.BarrelProp)
        end)
    elseif Config.Framework == "esx" then
        ESX.RegisterUsableItem(Config.BarrelItemName, function(source)
            local src = source
            TriggerClientEvent('snipe-moonshine:client:placeBarrel', src, Config.BarrelProp)
        end)
    end

    if Config.Inventory == "qb" then
        QBCore.Functions.CreateUseableItem("moonshine_bottle", function(source, item)
            local src = source
            TriggerClientEvent('snipe-moonshine:client:useMoonshineBottle', src, item.slot)
        end)
    elseif Config.Inventory == "qs" then
        exports["qs-inventory"]:CreateUsableItem("moonshine_bottle", function(source, item)
            local src = source
            TriggerClientEvent('snipe-moonshine:client:useMoonshineBottle', src, item.slot)
        end)
    end
    
end)

RegisterNetEvent("snipe-moonshine:server:registerStash", function(id, type)
    if type == "barrel" then
        Config.InventoryExport:RegisterStash(id, Locales["stash_barrel_label"], 5, 50000)
    elseif type == "drop" then
        Config.InventoryExport:RegisterStash(id, Locales["stash_dropoff_label"], 1, 50000)
    end
end)

function GetResponseString(items)
    local str = "You are missing the following items: "
    for k, v in pairs(items) do
        str = str.." "..itemList[k].label..", "
    end
    return str
end


lib.callback.register("snipe-moonshine:server:isSearching", function(source, entity)
    searching[entity] = source
end)

local itemsTable = {}
for k, v in pairs(Config.RequiredItems) do
    itemsTable[#itemsTable+1] = k
end


lib.callback.register("snipe-moonshine:server:collectItem", function(source, entity)
    if searching[entity] == source then
        local item = itemsTable[math.random(1, #itemsTable)]
        local count = 1
        Config.InventoryExport:AddItem(source, item, count)
        searching[entity] = nil
        return
    else
        return
    end
end)

lib.callback.register("snipe-moonshine:server:buyBarrel", function(source)
    if HasMoney(source, SvConfig.BarrelPrice, "cash") then
        if AddItem(source, Config.BarrelItemName, 1) then
            RemoveMoney(source, SvConfig.BarrelPrice, "cash")
            return {true}
        else
            return {false, Locales["inventory_full"]}
        end
    else
        return {false, string.format(Locales["no_money"], SvConfig.BarrelPrice)}
    end
end)