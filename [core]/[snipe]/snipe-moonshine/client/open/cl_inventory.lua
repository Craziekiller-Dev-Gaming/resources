local function CheckHasEnoughItems(items)
    local hasItems = true
    for k, v in pairs(Config.RequiredItems) do
        if items[k] == nil or (items[k].count < 2) then -- do not change this condition
            hasItems = false
        end
    end
    return hasItems
end

function GetPlayerItems()
    local returnData = {}
    if Config.Inventory == "qs" then
        if Config.Inventory == "qs" then
            local playerItems = exports['qs-inventory']:getUserInventory()
            for k, v in pairs(playerItems) do
                returnData[v.name] = {
                    label = v.label,
                    count = v.amount,
                    name = v.name,
                    slot = v.slot,
                }
            end
            if CheckHasEnoughItems(returnData) then 
                return returnData 
            else 
                return false 
            end
        end
    elseif Config.Inventory == "qb" then
        local playerItem = QBCore.Functions.GetPlayerData().items
        for k, v in pairs(playerItem) do
            returnData[v.name] = {
                label = v.label,
                count = v.amount,
                name = v.name,
                slot = v.slot,
            }
        end
        if CheckHasEnoughItems(returnData) then 
            return returnData 
        else 
            return false 
        end
    end
end