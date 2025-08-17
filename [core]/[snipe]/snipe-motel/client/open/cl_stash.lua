local function startsWith(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end

function OpenStash(stash_id)
    local stashId = stash_id
    if not startsWith(stashId, "apartment") then
        stashId = "motel_stash_"..stash_id
    end
    if Config.Inventory == "qb" or Config.Inventory == "qs" then
        
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId, {
            maxweight = Config.StashSize,
            slots = Config.StashSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashId)
    elseif Config.Inventory == "ox" then
        TriggerServerEvent("snipe-apartments:server:registerStash", stashId, "ox")
        exports.ox_inventory:openInventory("stash", stashId)
    elseif Config.Inventory == "mf" then
        TriggerServerEvent("snipe-apartments:server:registerStash", stashId, "mf")
        exports['mf-inventory']:openOtherInventory(stashId)
    elseif Config.Inventory == "codem" then
        exports["codem-inventory"]:OpenStash(stashId, Config.StashSize, Config.StashSlots)
    end
end