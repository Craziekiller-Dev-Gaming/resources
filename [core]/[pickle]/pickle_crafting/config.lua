Config = {}

Config.Debug = false

Config.Language = "en" -- Language to use.

Config.RenderDistance = 20.0 -- Table Prop Display Radius.

Config.DisplayDistance = 2.0 -- Interact and Queue Display Radius

Config.TheftDistance = 0 -- Theft is allowed when the crafter is further than this. Set to 0 if you wish to disable this.

Config.ItemImageFolder = "nui://qs-inventory/html/images" -- Don't put a slash at the end.

Config.PersistentTables = true -- Save placed tables in the database, this is new a feature!

Config.XPEnabled = true -- Enables the XP feature for adding and checking XP Levels.

Config.InventoryLimit = false -- If using ESX 1.1, this must be on if using a limit-based inventory.

Config.EnableTarget = true -- If true, this will use third-eye instead of pressing [E] to interact with crafting locations.

Config.BucketRefreshTime = 10 -- Checks after time has elapsed in seconds to see which bucket you're in, used for instanced crafting tables.

Config.Blueprints = {
    ["pistol"] = {
        item = "blueprint_pistol", -- Item to make usable to learn the blueprint.
        remove = true, -- Remove item when learned.
        label = "Pistol Blueprint", -- Blueprint Label.
        image = "blueprint.png", -- Blueprint Image.
        --[[
        learnBlueprint = function() -- Uncomment this to use this function when learning rather than the default.
            return true -- Return true to learn the blueprint.
        end
        --]]
    },
}

Config.XPCategories = {
    -- ["cooking"] = {
    --     label = "Cooking", -- Label of the category in the display & notifications.
    --     image = "cooking.png", -- XP Image.
    --     xpStart = 1000, -- Level 2 XP requirement.
    --     xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
    --     maxLevel = 10 -- Maximum level achievable.
    -- },
    -- ["tools"] = {
    --     label = "Tools", -- Label of the category in the display & notifications.
    --     image = "tools.png", -- XP Image.
    --     xpStart = 1000, -- Level 2 XP requirement.
    --     xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
    --     maxLevel = 2 -- Maximum level achievable.
    -- },
    ["mechanic"] = {
        label = "Mechanic", -- Label of the category in the display & notifications.
        image = "tools.png", -- XP Image.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 2 -- Maximum level achievable.
    },
    -- ["farming"] = {
    --     label = "Farming", -- Label of the category in the display & notifications.
    --     image = "farming.png", -- XP Image.
    --     xpStart = 1000, -- Level 2 XP requirement.
    --     xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
    --     maxLevel = 2 -- Maximum level achievable.
    -- },
    ["weapons"] = {
        label = "Weapons", -- Label of the category in the display & notifications.
        image = "weapons.png", -- XP Image.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 2 -- Maximum level achievable.
    },
    ["hacking"] = {
        label = "Hacking", -- Label of the category in the display & notifications.
        image = "weapons.png", -- XP Image.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 2 -- Maximum level achievable.
    },
    -- ["drugs"] = {
    --     label = "Drugs", -- Label of the category in the display & notifications.
    --     image = "drugs.png", -- XP Image.
    --     xpStart = 1000, -- Level 2 XP requirement.
    --     xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
    --     maxLevel = 2 -- Maximum level achievable.
    -- },
    ["handyman"] = {
        label = "Handyman", -- Label of the category in the display & notifications.
        image = "drugs.png", -- XP Image.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 2 -- Maximum level achievable.
    },
}

Config.RemoveTableSettings = {
    fire = 4, -- If the fire isn't extinguished after 10 seconds, destroy the table (if it is not a config table).
    explosion = false, -- If an explosion happens as a result of crafting, destroy the table (if it is not a config table).
}

Config.ExtinguishFire = function(index, coords)
    local ped = PlayerPedId()
    local pcoords = GetEntityCoords(ped)
    local can = CreateObject(`prop_wateringcan`, pcoords.x, pcoords.y, pcoords.z, true, true, true)
    local boneID = GetPedBoneIndex(ped, 0x8CBD)
    local off = vector3(0.15, 0.0, 0.4)
    local rot = vector3(0.0, -180.0, -140.0)
    FreezeEntityPosition(ped, true)
    AttachEntityToEntity(can, ped, boneID, off.x, off.y, off.z, rot.x, rot.y, rot.z, false, false, false, true, 1, true)
    PlayAnim(PlayerPedId(), "missfbi3_waterboard", "waterboard_loop_player", -8.0, 8.0, -1, 49, 1.0)
    local ecoords = GetOffsetFromEntityInWorldCoords(can, 0.0, 0.0, 0.0)
    PlayEffect("core", "ent_sht_water", can, vec3(0.34, 0.0, 0.2), vec3(0.0, 0.0, 0.0), 5000, function() end)
    Wait(5000)
    FreezeEntityPosition(ped, false)    
    DeleteEntity(can)
    ClearPedTasks(ped)
end

Config.Fire = function(index, coords)
    local ptfxHandler
    while Tables[index] and Tables[index].activeFire do 
        local wait = 1000
        local dist = #(GetEntityCoords(PlayerPedId()) - coords)
        if dist > Config.RenderDistance then 
            if ptfxHandler then
                RemoveParticleFx(ptfxHandler, true)
                ptfxHandler = nil
            end
        elseif not ptfxHandler then
            if not HasNamedPtfxAssetLoaded("core") then
                RequestNamedPtfxAsset("core")
                while not HasNamedPtfxAssetLoaded("core") do Wait(0) end
            end
            
            UseParticleFxAssetNextCall("core")
            ptfxHandler = StartParticleFxLoopedAtCoord("fire_wrecked_tank_cockpit", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.5)
        end
        
        Wait(wait)
    end
    if ptfxHandler then
        RemoveParticleFx(ptfxHandler, true)
        ptfxHandler = nil
    end
end

Config.Explosion = function(index, coords)
    local dist = #(GetEntityCoords(PlayerPedId()) - coords)
    if dist > Config.RenderDistance then return end

    if not HasNamedPtfxAssetLoaded("core") then
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do Wait(0) end
    end
    
    UseParticleFxAssetNextCall("core")
    local part = StartParticleFxNonLoopedAtCoord("exp_grd_petrol_pump", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  
    PlaySoundFrontend(-1, "BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS", 1)
end

Config.Actions = {
    ["action"] = function()
        local ped = PlayerPedId()
        PlayAnim(ped, "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", -8.0, 8.0, -1, 49, 1.0)
        Wait(2000)
        ClearPedTasks(ped)
        return true -- Return true to start crafting.
    end
}

Config.LearnBlueprint = function(index)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local obj1 = CreateProp(`p_blueprints_01_s`, coords.x, coords.y, coords.z, true, true, false)
    local obj2 = CreateProp(`p_blueprints_01_s`, coords.x, coords.y, coords.z, true, true, false)
    FreezeEntityPosition(obj1, true)
    AttachEntityToEntity(obj2, obj1, 0, 0.0, 0.0001, 0.0, 0.0, 0.0, 180.0, false, false, false, false, 2, true)
    AttachEntityToEntity(obj1, ped, GetPedBoneIndex(ped, 28422), -0.285, 0.0, 0.0, 0.0, 90.0, 0.0, false, false, false, true, 2, true)  
    PlayAnim(ped, "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", -8.0, 8.0, -1, 49, 1.0)
    lib.progressCircle({
        label = 'Learning Blueprint',
        duration = 2000,
        position = "bottom"
    })
    DeleteEntity(obj2)
    DeleteEntity(obj1)
    ClearPedTasks(ped)
    return true
end

Config.Props = {
    ["wheat"] = { -- Item name.
        ["default"] = {
            model = `prop_plant_fern_02a`, -- Model of the prop.
            offset = vector3(0.0, 0.0, 0.85), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(0.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
            camera = { -- Camera Positioning and Rotation.
                offset = vector3(0.0, -2.0, 2.5), -- X,Y,Z Offset from center of crafting table.
                rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
            },
        },
    },
    ["water"] = { -- Item name.
        ["default"] = {
            model = `ba_prop_club_water_bottle`, -- Model of the prop.
            offset = vector3(0.0, 0.0, 0.85), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(0.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
    },
    ["burger"] = {
        ["default"] = { -- Default for tables with visible models.
            model = `prop_cs_burger_01`, -- Model of the prop.
            offset = vector3(0.0, 0.0, 0.85), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(0.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        ["default_no_prop"] = { -- Default for tables with visible models.
            model = `prop_cs_burger_01`, -- Model of the prop.
            offset = vector3(0.0, 0.0, 0.0), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(0.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
    }
}

Config.TableTypes = {
    ["default"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "farming", image = "farming.png", label = "Farming", description = "Wheat, Corn, and other plants."},
            {name = "cooking", image = "cooking.png", label = "Cooking", description = "Burgers, Water, and other foods."},
            {name = "tools", image = "tools.png", label = "Tools", description = "Hammers, Nails, and other tools."},
            {name = "weapons", image = "weapons.png", label = "Weapons", description = "Pistols, Rifles, and other weapons."},
            {name = "misc", label = "Miscellaneous", description = "Other items that are craftable."},
        },
        items = { -- Items in the crafting table.
            --[[ -- Example Item (All features shown)
                {
                    name = "item_name", -- Name of the item.
                    category = "category_name", -- Category name (not the label).
                    type = "item", -- "weapon" treats the item as a weapon. Default is "item" when not set.
                    amount = 1, -- Amount to craft each time.
                    time = 5, -- Time to craft the item after action is complete.
                    chance = 100, -- Chance to succeed in crafting the item, failing destroys the removeable parts and reward. 
                    blueprint = "blueprint_name", -- Blueprint Requirement.
                    action = {name = "action_name", params = {1, 2, 3}}, -- Action to execute before crafting.
                    xp = {name = "xp_name", level = 1}, -- Experience required to craft.
                    parts = { -- Items required to craft.
                        {name = "part_name", amount = 2, remove = true},
                    },
                    rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                        {type = "xp", name = "drugs", amount = 1000},
                    },
                    createItem = function(craftingData)
                        return {} -- Return this as the item's metadata.
                    end
                },
            ]]
            -- FARMING
            {
                name = "wheat", -- Name of the item.
                category = "farming", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "farming", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "wheat_raw", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "farming", amount = 1000},
                },
            },
            {
                name = "tomato", -- Name of the item.
                category = "farming", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "farming", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "tomato_raw", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "farming", amount = 1000},
                },
            },
            {
                name = "broccoli", -- Name of the item.
                category = "farming", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "farming", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "broccoli_raw", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "farming", amount = 1000},
                },
            },
            {
                name = "corn", -- Name of the item.
                category = "farming", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "farming", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "corn_raw", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "farming", amount = 1000},
                },
            },
            {
                name = "pickle", -- Name of the item.
                category = "farming", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "farming", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "pickle_raw", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "farming", amount = 1000},
                },
            },
            -- COOKING
            {
                name = "burger", -- Name of the item.
                category = "cooking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "cooking", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "bread", amount = 1},
                    {name = "meat", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "cooking", amount = 1000},
                },
            },
            {
                name = "chips", -- Name of the item.
                category = "cooking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "cooking", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "potato", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "cooking", amount = 1000},
                },
            },
            {
                name = "salad", -- Name of the item.
                category = "cooking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "cooking", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "lettuce", amount = 1},
                    {name = "tomato", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "cooking", amount = 1000},
                },
            },
            {
                name = "soda", -- Name of the item.
                category = "cooking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "cooking", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "water", amount = 1},
                    {name = "corn", amount = 1},
                    {name = "sugar", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "cooking", amount = 1000},
                },
            },
            -- WEAPONS
            {
                name = "WEAPON_BAT", -- Name of the item.
                type = "weapon",
                category = "weapons", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "wood", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 1000},
                },
            },
            {
                name = "WEAPON_PISTOL", -- Name of the item.
                type = "weapon",
                category = "weapons", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                blueprint = "pistol", -- Blueprint Requirement.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 1},
                    {name = "metal_pipe", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 1000},
                },
            },
            {
                name = "WEAPON_PUMPSHOTGUN", -- Name of the item.
                type = "weapon",
                category = "weapons", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 3},
                    {name = "metal_pipe", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 1000},
                },
            },
            {
                name = "WEAPON_CARBINERIFLE", -- Name of the item.
                type = "weapon",
                category = "weapons", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 5},
                    {name = "metal_pipe", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 1000},
                },
            },
        },
    },
    -- ["drugs"] = {
    --     groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
    --     item = "drug_table", -- Set this to the item's name if you'd like it to be spawnable.
    --     model = `bkr_prop_coke_table01a`, -- Table model.
    --     camera = { -- Camera Positioning and Rotation.
    --         offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
    --         rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
    --     },
    --     categories = { -- Categories in the crafting table. (All items must be using one of these categories).
    --         {name = "drugs", label = "Drugs", image = "drugs.png", description = "Weed, Heroin, and other drugs."},
    --     },
    --     items = { -- Items in the crafting table.
    --         -- FARMING
    --         {
    --             name = "weed", -- Name of the item.
    --             category = "drugs", -- Category name (not the label).
    --             amount = 1, -- Amount to craft each time.
    --             time = 5, -- Time to craft the item after action is complete.
    --             xp = {name = "drugs", level = 1}, -- Experience required to craft.
    --             parts = { -- Items required to craft.
    --                 {name = "weed_raw", amount = 2},
    --             },
    --             rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
    --                 {type = "xp", name = "drugs", amount = 1000},
    --             },
    --         },
    --         {
    --             name = "heroin", -- Name of the item.
    --             category = "drugs", -- Category name (not the label).
    --             amount = 1, -- Amount to craft each time.
    --             time = 5, -- Time to craft the item after action is complete.
    --             xp = {name = "drugs", level = 1}, -- Experience required to craft.
    --             parts = { -- Items required to craft.
    --                 {name = "heroin_raw", amount = 2},
    --             },
    --             rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
    --                 {type = "xp", name = "drugs", amount = 1000},
    --             },
    --         },
    --         {
    --             name = "cocaine", -- Name of the item.
    --             category = "drugs", -- Category name (not the label).
    --             amount = 1, -- Amount to craft each time.
    --             time = 5, -- Time to craft the item after action is complete.
    --             xp = {name = "drugs", level = 1}, -- Experience required to craft.
    --             parts = { -- Items required to craft.
    --                 {name = "cocaine_raw", amount = 2},
    --             },
    --             rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
    --                 {type = "xp", name = "drugs", amount = 1000},
    --             },
    --         },
    --     },
    -- },
    ["weapons"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "ammo", label = "Ammo", image = "weapons.png", description = ""},
            {name = "Melee\'s", label = "Melee\'s", image = "weapons.png", description = ""},
            {name = "Pistol\'s", label = "Pistol\'s", image = "weapons.png", description = ""},
            {name = "SMG\'s", label = "SMG\'s", image = "weapons.png", description = ""},
            {name = "Shotgun\'s", label = "Shotgun\'s", image = "weapons.png", description = ""},
            -- {name = "Assault Rife\'s", label = "Assault Rife\'s", image = "weapons.png", description = ""},
            -- {name = "Pistol Attachment\'s", label = "Pistol Attachment\'s", image = "weapons.png", description = ""},
            -- {name = "SMG Attachment\'s", label = "SMG Attachment\'s", image = "weapons.png", description = ""},
            -- {name = "Shotgun Attachment\'s", label = "Shotgun Attachment\'s", image = "weapons.png", description = ""},
            -- {name = "Rifle Attachment\'s", label = "Rifle Attachment\'s", image = "weapons.png", description = ""},
            {name = "Tool\'s", label = "Tool\'s  ", image = "weapons.png", description = ""},
        },
        items = { -- Items in the crafting table.
            -- FARMING
            --Ammo
            {
                name = "pistol_ammo", -- Name of the item.
                category = "ammo", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "copper", amount = 12},
                    {name = "gunpowder", amount = 12},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 10},
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "smg_ammo", -- Name of the item.
                category = "ammo", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 3}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "copper", amount = 12},
                    {name = "gunpowder", amount = 12},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 10},
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "shotgun_ammo", -- Name of the item.
                category = "ammo", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 4}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "copper", amount = 12},
                    {name = "gunpowder", amount = 12},
                    {name = "plastic", amount = 12}
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 10},
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            -- {
            --     name = "rifle_ammo", -- Name of the item.
            --     category = "ammo", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 4}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "copper", amount = 12},
            --         {name = "gunpowder", amount = 12},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 10},
            --     },
            -- },
            -- Melee's
            {
                name = "weapon_bat", -- Name of the item.
                category = "Melee\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 10},
                    {name = "rubber", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 10},
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "weapon_switchblade", -- Name of the item.
                category = "Melee\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                    {name = "rubber", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 10},
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            -- Pistol's
            {
                name = "weapon_pistol", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 50, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 1},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_pistol_mk2", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 50, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 2}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 5},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_snspistol_mk2", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 50, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 2}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 3},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_ceramicpistol", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 70, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 3}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 4},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_pistol_mk2", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 70, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 4}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 5},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_pistol50", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 5}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 5},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            {
                name = "weapon_heavypistol", -- Name of the item.
                category = "Pistol\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 125, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 6}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 5},
                    {name = "gungrip", amount = 1},
                    {name = "pistolbarrel", amount = 1},
                    {name = "pistolbody", amount = 1},
                    {name = "gunspring", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            -- Shotgun's
            -- {
            --     name = "weapon_sawnoffshotgun", -- Name of the item.
            --     category = "Shotgun\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 6}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "gunspring", amount = 4},
            --         {name = "gungrip", amount = 1},
            --         {name = "weaponparts", amount = 4},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --         {type = "xp", name = "handyman", amount = 20},
            --     },
            -- },
            {
                name = "weapon_combatshotgun", -- Name of the item.
                category = "Shotgun\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 3}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "gunspring", amount = 4},
                    {name = "gungrip", amount = 1},
                    {name = "weaponparts", amount = 4},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            -- {
            --     name = "weapon_dbshotgun", -- Name of the item.
            --     category = "Shotgun\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 3}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "gunspring", amount = 4},
            --         {name = "gungrip", amount = 1},
            --         {name = "weaponparts", amount = 4},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 43},
            --         {type = "xp", name = "handyman", amount = 15},
            --     },
            -- },
             --SMG's
             {
                name = "weapon_microsmg", -- Name of the item.
                category = "SMG\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 120, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 7}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 6},
                    {name = "gungrip", amount = 1},
                    {name = "gunspring", amount = 2},
                    {name = "smg_barrel", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
             {
                name = "weapon_machinepistol", -- Name of the item.
                category = "SMG\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 60, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 9}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "weaponparts", amount = 8},
                    {name = "gungrip", amount = 1},
                    {name = "gunspring", amount = 2},
                    {name = "smg_barrel", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 20},
                    {type = "xp", name = "handyman", amount = 20},
                },
            },
            -- {
            --     name = "weapon_smg_mk2", -- Name of the item.
            --     category = "SMG\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 120, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 3}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --         {type = "xp", name = "handyman", amount = 20},
            --     },
            -- },
            -- {
            --     name = "weapon_assaultsmg", -- Name of the item.
            --     category = "SMG\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 15, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 3}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --         {type = "xp", name = "handyman", amount = 20},
            --     },
            -- },
            -- {
            --     name = "weapon_minismg", -- Name of the item.
            --     category = "SMG\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 8, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 3}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --         {type = "xp", name = "handyman", amount = 20},
            --     },
            -- },
            --Rifle's
            -- {
            --     name = "weapon_assaultrifle", -- Name of the item.
            --     category = "Assault Rife\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 4}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --     },
            -- },
            -- {
            --     name = "weapon_specialcarbine", -- Name of the item.
            --     category = "Assault Rife\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 4}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --     },
            -- },
            -- {
            --     name = "weapon_bullpuprifle_mk2", -- Name of the item.
            --     category = "Assault Rife\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 4}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --     },
            -- },
            -- {
            --     name = "weapon_advancedrifle", -- Name of the item.
            --     category = "Assault Rife\'s", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "weapons", level = 4}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "steel", amount = 150},
            --         {name = "rubber", amount = 150},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "weapons", amount = 20},
            --     },
            -- },
            --weapon parts
            {
                name = "weaponparts", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 15, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "metalscrap", amount = 10},
                    {name = "aluminum", amount = 10},
                    {name = "lead", amount = 10},
                    {name = "copper", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 15},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
            {
                name = "gungrip", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 12, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                    {name = "aluminum", amount = 10},
                    {name = "copper", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 7},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
            {
                name = "pistolbarrel", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 20},
                    {name = "steel", amount = 10},
                    {name = "copper", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 4},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
            {
                name = "pistolbody", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "metalscrap", amount = 10},
                    {name = "iron", amount = 10},
                    {name = "steel", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 4},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
            {
                name = "gunspring", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "copper", amount = 10},
                    {name = "iron", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 4},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
            {
                name = "smgbarrel", -- Name of the item.
                category = "Tool\'s", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "weapons", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "copper", amount = 30},
                    {name = "iron", amount = 30},
                    {name = "lead", amount = 30},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "weapons", amount = 4},
                    {type = "xp", name = "handyman", amount = 15},
                },
            },
        },
    },
    ["handyman"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "handyman", label = "Handyman", image = "weapons.png", description = ""},
        },
        items = { -- Items in the crafting table.
            -- FARMING
            {
                name = "lockpick", -- Name of the item.
                category = "handyman", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "metalscrap", amount = 3},
                    {name = "aluminum", amount = 3},
                    {name = "lead", amount = 3},
                    {name = "copper", amount = 3},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "advancedlockpick", -- Name of the item.
                category = "handyman", -- Category name (not the label).
                amount = 5, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "metalscrap", amount = 5},
                    {name = "aluminum", amount = 15},
                    {name = "lead", amount = 15},
                    {name = "copper", amount = 15},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "gunpowder", -- Name of the item.
                category = "handyman", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
               xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "blowtorch", -- Name of the item.
                category = "handyman", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
               xp = {name = "handyman", level = 2}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                    {name = "iron", amount = 5},
                    {name = "aluminum", amount = 5},
                    {name = "copper", amount = 5},
                    {name = "lead", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "thermite", -- Name of the item.
                category = "handyman", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
               xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "lead", amount = 10},
                    {name = "gunpowder", amount = 2},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            -- {
            --     name = "drill", -- Name of the item.
            --     category = "handyman", -- Category name (not the label).
            --     amount = 1, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --     xp = {name = "handyman", level = 1}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "heroin_raw", amount = 2},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "handyman", amount = 10},
            --     },
            -- },
            -- {
            --     name = "bandage", -- Name of the item.
            --     category = "handyman", -- Category name (not the label).
            --     amount = 6, -- Amount to craft each time.
            --     time = 5, -- Time to craft the item after action is complete.
            --    xp = {name = "handyman", level = 1}, -- Experience required to craft.
            --     parts = { -- Items required to craft.
            --         {name = "fabric", amount = 20},
            --     },
            --     rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
            --         {type = "xp", name = "handyman", amount = 15},
            --     },
            -- },
        },
    },
    ["hacking"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "hacking", label = "Hacking", image = "weapons.png", description = ""},
        },
        items = { -- Items in the crafting table.
            {
                name = "laserdrill", -- Name of the item.
                category = "hacking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 30, -- Time to craft the item after action is complete.
               xp = {name = "thief", level = 2}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "aluminum", amount = 20},
                    {name = "lead", amount = 20},
                    {name = "copper", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "thief", amount = 15},
                },
            },
            {
                name = "hackingdevice", -- Name of the item.
                category = "hacking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 90, -- Time to craft the item after action is complete.
                xp = {name = "thief", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 20},
                    {name = "steel", amount = 20},
                    {name = "aluminum", amount = 20},
                    {name = "lead", amount = 20},
                    {name = "copper", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "thief", amount = 10},
                },
            },
            {
                name = "gpshackingdevice", -- Name of the item.
                category = "hacking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 90, -- Time to craft the item after action is complete.
               xp = {name = "thief", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "iron", amount = 20},
                    {name = "steel", amount = 20},
                    {name = "aluminum", amount = 20},
                    {name = "lead", amount = 20},
                    {name = "copper", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "thief", amount = 10},
                },
            },
            {
                name = "nylonrope", -- Name of the item.
                category = "hacking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 30, -- Time to craft the item after action is complete.
               xp = {name = "thief", level = 2}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "lead", amount = 10},
                    {name = "fabric", amount = 10},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "thief", amount = 10},
                },
            },
        },
    },
    ["electronics"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "electronics", label = "electronics", image = "weapons.png", description = ""},
        },
        items = { -- Items in the crafting table.
            -- FARMING
            {
                name = "boostingtablet", -- Name of the item.
                category = "electronics", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                image = "blueprint.png",
                xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "electronickit", amount = 50},
                    {name = "steel", amount = 50},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
            {
                name = "radio", -- Name of the item.
                category = "electronics", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
               xp = {name = "handyman", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "electronickit", amount = 5},
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "handyman", amount = 10},
                },
            },
        },
    },
    ["risingsun"] = {
        groups = risingsun , -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "mechanic", label = "Mechanic Tools", image = "tools.png", description = ""},
            {name = "brakes", label = "Brakes", image = "tools.png", description = ""},
            {name = "ev", label = "Electric Vehicles", image = "tools.png", description = ""},
            {name = "engines", label = "Engine Parts", image = "tools.png", description = ""},
            {name = "tires", label = "Tires", image = "tools.png", description = ""},
            {name = "cosmetic", label = "Cosmetic", image = "tools.png", description = ""},
        },
        items = { -- Items in the crafting table.
            {
                name = "mechanic_tablet", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "electronickit", amount = 5},
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "harness", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "advancedlockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "duct_tape", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "repair_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cleaning_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_install_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "empty_nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "extras_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_smoke_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "vehicle_wheels", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "respray_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cosmetic_part", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "stancing_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lighting_controller", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "electronickit", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "drift_tuning_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ceramic_brakes", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "offroad_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "semi_slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "fwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "rwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "awd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_coolant", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_battery", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_motor", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "turbocharger", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v12_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v8_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v6_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "i4_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "brakepad_replacement", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "suspension_parts", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "spark_plug", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "air_filter", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "clutch_replacement", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_replacement", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "engine_oil", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "performance_part", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
        },
    },
    ["craftsmen"] = {
        groups = cruisin , -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "mechanic", label = "Mechanic Tools", image = "tools.png", description = ""},
            {name = "brakes", label = "Brakes", image = "tools.png", description = ""},
            {name = "ev", label = "Electric Vehicles", image = "tools.png", description = ""},
            {name = "engines", label = "Engine Parts", image = "tools.png", description = ""},
            {name = "tires", label = "Tires", image = "tools.png", description = ""},
            {name = "cosmetic", label = "Cosmetic", image = "tools.png", description = ""},
        },
        items = { -- Items in the crafting table.
            {
                name = "mechanic_tablet", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "electronickit", amount = 5},
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "harness", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "advancedlockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "duct_tape", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "repair_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cleaning_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_install_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "empty_nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "extras_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_smoke_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "vehicle_wheels", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "respray_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cosmetic_part", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "stancing_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lighting_controller", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "electronickit", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "drift_tuning_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ceramic_brakes", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "offroad_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "semi_slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "fwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "rwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "awd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_coolant", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_battery", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_motor", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "turbocharger", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v12_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v8_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v6_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "i4_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "brakepad_replacement", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "suspension_parts", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "spark_plug", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "air_filter", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "clutch_replacement", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_replacement", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "engine_oil", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "performance_part", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
        },
    },
    ["pdm"] = {
        groups = cruisin , -- {["police"] = 0, ["ambulance"] = 0}
        item = "crafting_table", -- Set this to the item's name if you'd like it to be spawnable.
        model = `gr_prop_gr_bench_04b`, -- Table model.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 1.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "mechanic", label = "Mechanic Tools", image = "tools.png", description = ""},
            {name = "brakes", label = "Brakes", image = "tools.png", description = ""},
            {name = "ev", label = "Electric Vehicles", image = "tools.png", description = ""},
            {name = "engines", label = "Engine Parts", image = "tools.png", description = ""},
            {name = "tires", label = "Tires", image = "tools.png", description = ""},
            {name = "cosmetic", label = "Cosmetic", image = "tools.png", description = ""},
        },
        items = { -- Items in the crafting table.
            {
                name = "mechanic_tablet", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "electronickit", amount = 5},
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "harness", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "advancedlockpick", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "duct_tape", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 10, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "repair_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cleaning_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_install_kit", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "empty_nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "nitrous_bottle", -- Name of the item.
                category = "mechanic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "extras_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_smoke_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "vehicle_wheels", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "respray_kit", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "cosmetic_part", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "stancing_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "lighting_controller", -- Name of the item.
                category = "cosmetic", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "electronickit", amount = 5},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "drift_tuning_kit", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ceramic_brakes", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "offroad_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "semi_slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "slick_tyres", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "rubber", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "fwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "rwd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "awd_drivetrain", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_coolant", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_battery", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "ev_motor", -- Name of the item.
                category = "ev", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "turbocharger", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v12_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v8_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "v6_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "i4_engine", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "brakepad_replacement", -- Name of the item.
                category = "brakes", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "suspension_parts", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "spark_plug", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "air_filter", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "clutch_replacement", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "tyre_replacement", -- Name of the item.
                category = "tires", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "rubber", amount = 20},
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "engine_oil", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "plastic", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
            {
                name = "performance_part", -- Name of the item.
                category = "engines", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 5, -- Time to craft the item after action is complete.
                xp = {name = "mechanic", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "steel", amount = 20},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "mechanic", amount = 5},
                },
            },
        },
    },
    ["stove_no_prop"] = {
        groups = nil, -- {["police"] = 0, ["ambulance"] = 0}
        model = nil, -- Table model, set to nil to use invisible prop.
        item = nil, -- Set this to the item's name if you'd like it to be spawnable.
        camera = { -- Camera Positioning and Rotation.
            offset = vector3(0.0, -1.0, 0.5), -- X,Y,Z Offset from center of crafting table.
            rotation = vector3(-25.0, 0.0, 0.0), -- Only change 3rd value to change horizontal rotation.
        },
        categories = { -- Categories in the crafting table. (All items must be using one of these categories).
            {name = "cooking", image = "cooking.png", label = "Cooking", description = "Burgers, Water, and other foods."},
        },
        items = { -- Items in the crafting table.
            -- COOKING
            {
                name = "burger", -- Name of the item.
                category = "cooking", -- Category name (not the label).
                amount = 1, -- Amount to craft each time.
                time = 1, -- Time to craft the item after action is complete.
                destroyTime = 5, -- Time to claim the item until the item is destroyed.
                destroyFire = true, -- If the item is destroyed, destroy all other items on the bench, and start a fire.
                explodeOnBurn = false, -- If a fire starts from this item, start an explosion on the bench.
                xp = {name = "cooking", level = 1}, -- Experience required to craft.
                parts = { -- Items required to craft.
                    {name = "bread", amount = 1},
                    {name = "meat", amount = 1},
                },
                rewards = { -- Additional rewards after crafting. Types: "xp" for experience reward, "item" for item reward. Default is "item" if not set.
                    {type = "xp", name = "cooking", amount = 1000},
                },
            },
        },
    },
}

Config.Tables = {
    {
        coords = vector3(-344.25, -103.61, 38.06), -- Table coords.
        heading = 70.74, -- Table heading.
        tableType = "risingsun"
    },
    {
        coords = vector3(-362.58, -1357.56, 31.15), -- Table coords.
        heading = 91.0, -- Table heading.
        tableType = "craftsmen"
    },
    {--test
        coords = vector3(-1017.67, -1423.11, 4.43), -- Table coords.
        heading = 290.0, -- Table heading.
        tableType = "pdm"
    },
    {
        coords = vector3(-2165.90, 5197.41, 15.88), -- Table coords.
        heading = 277.0, -- Table heading.
        tableType = "weapons"
    },
    {
        coords = vector3(-76.67, 6222.32, 46.25), -- Table coords.
        heading = 212.0, -- Table heading.
        tableType = "handyman"
    },
    {
        coords = vector3(199.86, -1517.07, 34.83), -- Table coords.
        heading = 310.0, -- Table heading.
        tableType = "electronics"
    },
    {
        coords = vector3(-1366.49, 4848.68, 144.95), -- Table coords.
        heading = 89.0, -- Table heading.
        tableType = "hacking"
    },
    -- {--test
    --     coords = vector3(-341.55, -109.49, 39.06), -- Table coords.
    --     heading = 70.74, -- Table heading.
    --     tableType = "risingsun"
    -- },
    {
        coords = vector3(-1202.3607, -896.8779, 12.9953), -- Table coords.
        heading = -240.1112, -- Table heading.
        tableType = "default"
    },
    {
        coords = vector3(-1200.3278, -901.2991, 14.0401), -- Table coords.
        heading = 124.1033, -- Table heading.
        tableType = "stove_no_prop"
    },
}