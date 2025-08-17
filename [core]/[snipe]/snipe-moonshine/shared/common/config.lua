Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}


Config = {}

-- if you have renamed your qb-core, es_extended, event names, make sure to change them. Based on this information your framework will be detected.
Config.FrameworkTriggers = {
    ["qb"] = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
    },
    ["qbx"] = {
        ResourceName = "qbx_core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
    },
    ["esx"] = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:onPlayerLogout",
    },
}

Config.Notify = "ox" -- qb || ox || esx || okok

Config.Inventory = "qs"  -- qb || qs || ox

Config.BarrelItemName = "moonshine_barrel"
Config.BarrelProp = "snipe_moonshine_distill"

Config.InventoryExport = exports["ox_inventory"] -- if you have renamed your ox inventory, make the change here (only for ox inventory)

Config.Progress = "ox" -- qb

Config.CanOnlyOwnerAccessTheBarrel = false -- if true, only the owner of the barrel can access it. If false, everyone can access it.

-- Download interact from here - https://github.com/darktrovx/interact
Config.UseInteract = false -- if true you can use the interact system. If false, you will require target (qb/ox or qtarget) 

Config.TimeToCook = 1 -- in hours
Config.PrickProbability = 50 -- 1-100 (50% chance to get pricked and lose health while searching)
Config.FindingProbability = 10 -- 1-100 (10% chance to find something while searching. You will find 1 item per search)

Config.QualityNaming = {
    [1] = "Horrible", -- if quality between 0 to 10
    [2] = "Harsh", -- if quality between 10 to 20
    [3] = "Below Average",  -- if quality between 20 to 30
    [4] = "Average", -- if quality between 30 to 40
    [5] = "Above Average", -- if quality between 40 to 50
    [6] = "Good", -- if quality between 50 to 60
    [7] = "Great", -- if quality between 60 to 70
    [8] = "Excellent", -- if quality between 70 to 80
    [9] = "Perfect", -- if quality between 80 to 90
    [10] = "Legendary", -- if quality between 90 to 100
}

-- once you set these items, do not edit them, it will break the database entries for quality!!! If you do edit them after the script is live, run the following SQL query: Truncate table snipe_moonshine_data;
Config.RequiredItems = { 
    ["mold_bread"] = true,
    ["mold_corn"] = true,
    ["water"] = true,
    ["mold_barley"] = true,
    ["mold_apple"] = true
}

-- -1 means unlimited (if you want to limit the amount of cooks a player can do, set it to the desired number)
Config.LimitOfCooksPerPlayer = 2

-- -1 means unlimited (if you want to limit the amount of cooks a still can do, set it to the desired number)
Config.LimitOfCooksPerStill = 10

-- Time in days that the barrel can last before it becomes unuseable (set to -1 for unlimited)
Config.TimeStillCanLast = 7

Config.ShowExactTimeForStillLeft = true -- if true, it will show the exact time the still will expire. If False you can edit the strings for each percentage in Config.StillExpiryStrings

Config.StillExpiryStrings = {
    [1] = {
        range = {80, 100}, -- first number should be less than 2nd number
        string = "Still has plenty of time left!"
    },
    [2] = {
        range = {60, 80},
        string = "Still has a good amount of time left!"
    },
    [3] = {
        range = {40, 60},
        string = "Still has some time left!"
    },
    [4] = {
        range = {20, 40},
        string = "Still is getting close to expiry!"
    },
    [5] = {
        range = {0, 20},
        string = "Still is about to expire!"
    },
}

-- DO NOT TOUCH THIS!!!!

for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        Config.Framework = k
        break
    end
end
