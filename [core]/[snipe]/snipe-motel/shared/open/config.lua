Config = {}

Config.MultipleMlos = false -- do not touch!!!!

-- you can change the keybind here and also for the ui side, you can change the keybind in html/locales/en.json or any json file (gizmo_toggle_focus_key).
-- Along with the locales in html/locales/en.json or any json file (furniture_interaction_text). 
Config.ToggleKey = 20 -- Z key (this is W key in azerty keyboard layout). 
Config.UseQBApartmentStashes = false -- if you are using qb-apartments and wants to move stashes from apartments to snipe-motel

Config.DoorIdPrefix = 77652

Config.Debug = false

Config.RequireMoneyToRent = false
Config.RentPrice = 100 -- per day
Config.MoneyType = "cash" -- you can modify the logic in sv_framework RemoveMoney() function to suit your needs.


-- if the players dont extend the room after it expires within 3 days, it will delete all the entries from the database
-- this will also delete the furniture placed in the room
Config.GracePeriod = 3 
Config.GraceAmount = 1000 -- amount to charge the player for the grace period

Config.TargetOrInteract = true -- only works with qb-target, qtarget and ox_target or interact script (https://github.com/darktrovx/interact). If you dont have interact, it will auto fall back to target

Config.PresetFurniture = false -- if true, players will have a room with preset furniture. If false, players will have an empty room.
Config.RequireMoneyToBuyFurniture = true
Config.ReturnMoneyOnDelete = false -- if true, it will return the money to the player when he deletes the furniture (Only works when RequireMoneyToBuyFurniture is true)
Config.DefaultFurniturePrice = 100 -- if you have set the above to true and you have missed to set the price for the furniture in furniture_list.lua, it will use this price

Config.OnlyOwnerShouldAccessStashOutfit = true -- if true, only the owner of the room can access the stash and outfits

Config.AllowStash = true -- if true, players can access and place stashes in the room
Config.AllowOutfit = true -- if true, players can access the outfit in the room

Config.Inventory = "qs" -- "qb", "qs", "ox", "mf", "codem" (if you use any other stash, modify in client/open/cl_stash.lua) (NO SUPPORT FOR PAID INVENTORIES IF THERE IS NO DOCUMENTATION. I am willing to help if you provide the documentation)
Config.StashSize = 1000000
Config.StashSlots = 50 

-- fivem is if you use wasabi's fivem appearance
Config.Clothing = "rcore" -- "qb", "illenium", "fivem", "rcore" (if you use any other clothing, modify in client/open/cl_clothing.lua) (NO SUPPORT FOR PAID CLOTHING IF THERE IS NO DOCUMENTATION. I am willing to help if you provide the documentation)

Config.AllowKeys = true -- if you want people to add key owners
Config.KeyLimit = 2 -- how many keys can be added for each room

Config.Framework = "other" -- do not touch this 
-- if you have renamed your qb-core, es_extended, event names, make sure to change them. Based on this information your framework will be detected.
Config.FrameworkTriggers = {
    ["qb"] = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        JobUpdate = "QBCore:Client:OnJobUpdate"
    },
    ["esx"] = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:playerDropped",
        JobUpdate = "esx:setJob"
    },
    ["ox"] = {
        ResourceName = "ox_core",
        PlayerLoaded = "ox:playerLoaded",
        PlayerUnload = "ox:playerLogout",
        JobUpdate = "ox:setGroup"
    }
}

Config.AllowRaiding = true -- to allow the raidable jobs to raid the motel rooms
Config.RaidableJobs = {
    ["police"] = true
}

Config.UseItemToRaid = {
    enable = true,
    itemName = "stormram" -- make sure you have this item in your inventory if enabled
}

for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        Config.Framework = k
        break
    end
end

if Config.Framework == "other" then
    Config.TargetOrInteract = false -- if your framework is not supported by default, this will be set to false. You can comment this out and change the target code to work with your system.
end


-- For MLO CHECKING (DO NOT TOUCH THIS!!)
Config.MLO = nil
Config.MLOTable = {
    ["mlo_snipe_motel"] = false,
    ["mlo_snipe_eclipse_motel"] = false,
}
local mlosStarted = 0
for k, v in pairs(Config.MLOTable) do
    
    Config.MLOTable[k] = (GetResourceState(k) == "started" or GetResourceState(k) ~= "missing")
    if Config.MLOTable[k] then
        mlosStarted = mlosStarted + 1
        Config.MLO = k
    end
    
    if mlosStarted > 1 then
        print("You have started more than one MLO. Please start only one MLO and delete other MLO that you have!")
        Config.MultipleMlos = true
        break
    end
    
end
if mlosStarted <= 1 then
    print("[SNIPE-MOTEL] MLO Initialized : " .. Config.MLO)
end



