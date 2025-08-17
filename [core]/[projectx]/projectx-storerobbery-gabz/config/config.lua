Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qb-core', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "qs", -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "rcore", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'qb-target', -- Target name
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = false, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = {
        Global = true, -- Global cooldown (Set to false to have individual cooldowns on stores, true to have cooldowns on all stores when one is robbed)
        Timer = 15, -- (Minutes) timer duration
    },

    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch
    MinimumPolice = 1, -- Minimum police required to start the robbery

    GruppeSechsJob17mov = true, -- Enable/Disable GruppeSechs Job Compatibility by 17mov

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 15, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "x_device", Chance = 30, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "x_phone", Chance = 50, Amount = {min = 1, max = 1}},
            {Name = "x_stethoscope", Chance = 20, Amount = {min = 1, max = 1}},
        },
    },

    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },
    
    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 1, max = 3}, -- Amount of stress applied
    },

    ComputerPassword = { -- Password for the computer
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Safe Code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Password', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = { -- true = target, false = drawtext
        ["Button"] = 38, -- [E] by default

        ["Fusebox"] = true,
        ["Register"] = true,
        ["Atm"] = true,
        ["Server"] = true,
        ["Npc"] = true,
        ["Computer"] = true,
        ["Safe"] = true,
        ["Shelf"] = true,
    },

    -- Durations 
    NotificationDuration = 2500, -- Duration of the displayed notifications

    FuseboxDuration = 6000,
    RegisterDuration = 15000,
    ServerDuration = 6000,
    Computer1Duration = 6000,
    Computer2Duration = 6000,
    DoorDuration = 6000,
    AtmDuration = 6000,
    ShelfDuration = 2500,
    SafeDuration = 6000,
}

Config.Items ={
    ["Circuit"] = "x_circuittester",
    ["Lockpick"] = "advancedlockpick",
    ["Harddrive"] = "x_harddrive", -- Item that is required before the robbery
    ["Device"] = "x_device",
    ["Key"] = "storekey",
}

Config.ItemsBreak ={
    ["Circuit"] = 0, -- % Break Chance
    ["Lockpick"] = 50, -- % Break Chance
    ["Device"] = 50, -- % Break Chance
}

-- Add stores here if you have more than the default ones
Config.Stores247 = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains"} -- 24/7 Stores
Config.GasStations = {"Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed"} -- Gas Stations
Config.LiquorStores = {"VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- Liquor Stores
Config.AllStores = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains", "Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed", "VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- All Stores

Config.Stores = {
    ["Strawberry"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(28.36, -1349.44, 31.77),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(25.03, -1339.74, 28.5, 52.98),
        ["NpcCoords"] = vector4(27.03, -1340.21, 28.5, 354.19),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 271.84,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(19.3, -1335.64, 29.28), -- Circle Zone Coords
                drawtext = vector3(19.13, -1335.71, 29.28),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(25.46, -1347.86, 29.68), -- Circle Zone Coords
                drawtext = vector3(24.76, -1347.89, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(25.44, -1345.7, 29.68), -- Circle Zone Coords
                drawtext = vector3(24.9, -1345.64, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(33.82, -1344.93, 29.70), -- Circle Zone Coords
                drawtext = vector3(33.51, -1344.9, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(25.03, -1339.74, 29.5), -- Circle Zone Coords
                drawtext = vector3(25.44, -1339.82, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(27.03, -1340.21, 29.5), -- Circle Zone Coords
                drawtext = vector3(27.06, -1339.77, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(29.55, -1340.23, 29.20), -- Circle Zone Coords
                drawtext = vector3(28.94, -1339.69, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(29.55, -1340.23, 29.20), -- Circle Zone Coords
                drawtext = vector3(28.94, -1339.69, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(31.48, -1339.3, 29.85), -- Circle Zone Coords
                drawtext = vector3(31.05, -1339.29, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(28.92, -1345.17, 29.6),
                drawtext = vector3(26.35, -1341.86, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(31.18, -1345.16, 29.6),
                drawtext = vector3(30.46, -1345.1, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(27.6, -1342.01, 29.6),
                drawtext = vector3(27.56, -1342.32, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(30.1, -1341.96, 29.6),
                drawtext = vector3(30.08, -1342.34, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.2, -1346.39, 29.6),
                drawtext = vector3(33.69, -1346.43, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.09, -1348.05, 29.6),
                drawtext = vector3(33.69, -1348.01, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(31.73, -1348.66, 29.6),
                drawtext = vector3(31.77, -1347.89, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(19.28, -1349.54, 28.48), vector3(39.94, -1349.71, 28.48), vector3(39.7, -1336.96, 28.48), vector3(19.31, -1336.38, 28.48)},
    },

    ["DowntownVineWood"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(376.54, 323.09, 105.62),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(375.0, 333.58, 102.57, 40.94),
        ["NpcCoords"] = vector4(376.77, 332.62, 102.57, 345.3),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 256.76,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(371.02, 334.09, 103.43), -- Circle Zone Coords
                drawtext = vector3(370.4, 334.04, 103.44),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.39, 325.64, 103.75), -- Circle Zone Coords
                drawtext = vector3(372.8, 325.78, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.89, 327.74, 103.75), -- Circle Zone Coords
                drawtext = vector3(373.32, 327.81, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(382.14, 326.39, 103.57), -- Circle Zone Coords
                drawtext = vector3(381.95, 326.45, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(375.0, 333.58, 103.57), -- Circle Zone Coords
                drawtext = vector3(375.34, 333.23, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(376.77, 332.62, 103.57), -- Circle Zone Coords
                drawtext = vector3(376.86, 332.9, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(379.14, 332.18, 103.36), -- Circle Zone Coords
                drawtext = vector3(378.75, 332.72, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(379.14, 332.18, 103.36), -- Circle Zone Coords
                drawtext = vector3(378.75, 332.72, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(381.39, 332.46, 103.7), -- Circle Zone Coords
                drawtext = vector3(380.88, 332.58, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(377.4, 327.34, 103.71),
                drawtext = vector3(376.66, 327.59, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.84, 326.78, 103.71),
                drawtext = vector3(378.88, 327.01, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(376.91, 330.84, 103.75),
                drawtext = vector3(376.81, 330.52, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.29, 330.21, 103.73),
                drawtext = vector3(379.21, 329.88, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.02, 325.0, 103.74),
                drawtext = vector3(381.73, 325.06, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(381.76, 323.34, 103.73),
                drawtext = vector3(381.31, 323.39, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.29, 323.39, 103.08),
                drawtext = vector3(379.45, 324.1, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(384.37, 320.79, 103.24), vector3(386.26, 332.61, 103.24), vector3(371.79, 336.54, 103.24), vector3(368.82, 325.04, 103.24)},
    },

    ["BanhamCanyon"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3038.12, 589.82, 9.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3046.4, 582.7, 6.91, 162.63),
        ["NpcCoords"] = vector4(-3046.47, 584.77, 6.91, 109.84),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 17.02,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3049.5, 589.39, 8.13), -- Circle Zone Coords
                drawtext = vector3(-3049.58, 589.62, 7.76),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3038.75, 585.65, 8.09), -- Circle Zone Coords
                drawtext = vector3(-3038.56, 585.03, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3040.79, 584.96, 8.09), -- Circle Zone Coords
                drawtext = vector3(-3040.61, 584.4, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3040.31, 593.62, 8.16), -- Circle Zone Coords
                drawtext = vector3(-3043.93, 592.4, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3046.4, 582.7, 7.91), -- Circle Zone Coords
                drawtext = vector3(-3046.29, 583.06, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3046.47, 584.77, 7.91), -- Circle Zone Coords
                drawtext = vector3(-3046.77, 584.71, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3047.22, 587.1, 7.9), -- Circle Zone Coords
                drawtext = vector3(-3047.59, 586.46, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3047.22, 587.1, 7.9), -- Circle Zone Coords
                drawtext = vector3(-3047.59, 586.46, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3048.68, 588.55, 8.39), -- Circle Zone Coords
                drawtext = vector3(-3048.64, 588.35, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.34, 588.18, 8.14),
                drawtext = vector3(-3042.02, 587.27, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3043.03, 590.38, 8.06),
                drawtext = vector3(-3042.87, 589.52, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.02, 585.9, 8.07),
                drawtext = vector3(-3044.66, 586.02, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.77, 588.27, 8.07),
                drawtext = vector3(-3045.47, 588.36, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.76, 593.34, 8.04),
                drawtext = vector3(-3042.72, 593.05, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3041.17, 593.81, 8.04),
                drawtext = vector3(-3041.17, 593.59, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3039.99, 591.85, 7.45),
                drawtext = vector3(-3040.71, 591.62, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3040.03, 595.4, 7.7), vector3(-3051.89, 591.11, 7.7), vector3(-3047.47, 580.43, 7.7), vector3(-3036.24, 583.87, 7.7)},
    },

    ["Chumash"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3239.72, 1004.37, 14.89),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3249.81, 1001.17, 11.83, 140.36),
        ["NpcCoords"] = vector4(-3249.07, 1003.19, 11.83, 83.05),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.06,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3241.9, 1012.61, 12.58), -- Circle Zone Coords
                drawtext = vector3(-3241.88, 1012.94, 12.39),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3241.63, 1000.92, 13.02), -- Circle Zone Coords
                drawtext = vector3(-3241.65, 1000.33, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3243.78, 1001.08, 13.02), -- Circle Zone Coords
                drawtext = vector3(-3243.85, 1000.56, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3243.78, 1009.34, 12.83), -- Circle Zone Coords
                drawtext = vector3(-3243.79, 1009.24, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3249.81, 1001.17, 12.83), -- Circle Zone Coords
                drawtext = vector3(-3249.62, 1001.44, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3249.07, 1003.19, 12.83), -- Circle Zone Coords
                drawtext = vector3(-3249.33, 1003.21, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3248.82, 1005.58, 12.77), -- Circle Zone Coords
                drawtext = vector3(-3249.6, 1005.06, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3248.82, 1005.58, 12.77), -- Circle Zone Coords
                drawtext = vector3(-3249.6, 1005.06, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3249.68, 1007.34, 13.3), -- Circle Zone Coords
                drawtext = vector3(-3249.69, 1007.27, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.99, 1004.53, 13.05),
                drawtext = vector3(-3244.13, 1003.7, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.78, 1007.14, 12.98),
                drawtext = vector3(-3243.8, 1006.13, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3247.34, 1003.56, 12.95),
                drawtext = vector3(-3246.99, 1003.6, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3247.11, 1006.04, 12.93),
                drawtext = vector3(-3246.74, 1005.98, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3242.36, 1009.58, 12.93),
                drawtext = vector3(-3242.46, 1009.35, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3240.7, 1009.57, 12.93),
                drawtext = vector3(-3240.8, 1009.14, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3240.41, 1007.17, 12.4),
                drawtext = vector3(-3241.11, 1007.22, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3239.4, 1010.18, 12.26), vector3(-3252.61, 1010.8, 12.26), vector3(-3253.63, 998.03, 12.26), vector3(-3240.44, 996.85, 12.26)},
    },

    ["MountChiliad"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1731.18, 6411.3, 37.07),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1731.7, 6421.88, 34.04, 31.55),
        ["NpcCoords"] = vector4(1733.39, 6420.44, 34.04, 332.31),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 245.41,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1723.33, 6413.2, 35.40), -- Circle Zone Coords
                drawtext = vector3(1723.21, 6413.03, 35.01),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1728.5, 6414.29, 35.22), -- Circle Zone Coords
                drawtext = vector3(1728.02, 6414.56, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1729.44, 6416.23, 35.22), -- Circle Zone Coords
                drawtext = vector3(1728.95, 6416.47, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1737.22, 6413.15, 35.04), -- Circle Zone Coords
                drawtext = vector3(1737.05, 6413.29, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1731.7, 6421.88, 35.04), -- Circle Zone Coords
                drawtext = vector3(1731.84, 6421.71, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1733.39, 6420.44, 35.04), -- Circle Zone Coords
                drawtext = vector3(1733.49, 6420.66, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1735.47, 6419.23, 34.92), -- Circle Zone Coords
                drawtext = vector3(1735.24, 6420.07, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1735.47, 6419.23, 34.92), -- Circle Zone Coords
                drawtext = vector3(1735.24, 6420.07, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1737.89, 6419.18, 35.51), -- Circle Zone Coords
                drawtext = vector3(1737.33, 6419.45, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1732.65, 6415.16, 35.28),
                drawtext = vector3(1732.11, 6415.5, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1735.18, 6413.93, 35.19),
                drawtext = vector3(1734.2, 6414.51, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1732.99, 6418.58, 35.19),
                drawtext = vector3(1732.78, 6418.34, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1735.22, 6417.4, 35.18),
                drawtext = vector3(1735.13, 6417.18, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1736.87, 6411.8, 35.18),
                drawtext = vector3(1736.4, 6412.02, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1736.05, 6410.35, 35.2),
                drawtext = vector3(1735.8, 6410.5, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1733.82, 6410.89, 34.69),
                drawtext = vector3(1734.07, 6411.51, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1739.45, 6406.82, 34.92), vector3(1744.68, 6417.64, 34.92), vector3(1727.6, 6426.13, 34.92), vector3(1721.94, 6414.05, 34.92)},
    },

    ["SandyShores"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1965.52, 3740.08, 33.91),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1956.72, 3746.93, 31.34, 89.95),
        ["NpcCoords"] = vector4(1958.78, 3747.39, 31.34, 27.78),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 296.92,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1954.78, 3753.9, 32.62), -- Circle Zone Coords
                drawtext = vector3(1954.6, 3754.23, 32.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1961.22, 3740.03, 32.53), -- Circle Zone Coords
                drawtext = vector3(1960.67, 3739.8, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1960.12, 3741.89, 32.53), -- Circle Zone Coords
                drawtext = vector3(1959.51, 3741.58, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1967.02, 3746.64, 32.34), -- Circle Zone Coords
                drawtext = vector3(1966.75, 3746.47, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1956.72, 3746.93, 32.34), -- Circle Zone Coords
                drawtext = vector3(1957.01, 3746.89, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1958.78, 3747.39, 32.34), -- Circle Zone Coords
                drawtext = vector3(1958.56, 3747.72, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1960.84, 3748.65, 32.33), -- Circle Zone Coords
                drawtext = vector3(1960.14, 3748.84, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1960.84, 3748.65, 32.33), -- Circle Zone Coords
                drawtext = vector3(1960.14, 3748.84, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1961.96, 3750.33, 32.75), -- Circle Zone Coords
                drawtext = vector3(1961.65, 3750.18, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1962.79, 3744.01, 32.65),
                drawtext = vector3(1962.2, 3743.72, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1965.22, 3745.42, 32.52),
                drawtext = vector3(1964.23, 3744.83, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1960.17, 3746.16, 32.53),
                drawtext = vector3(1960.36, 3745.93, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1962.35, 3747.36, 32.52),
                drawtext = vector3(1962.42, 3747.18, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1967.83, 3745.55, 32.44),
                drawtext = vector3(1967.61, 3745.4, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1968.69, 3744.13, 32.44),
                drawtext = vector3(1968.45, 3744.02, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1967.04, 3742.55, 31.87),
                drawtext = vector3(1966.6, 3743.27, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1970.56, 3743.27, 32.21), vector3(1962.28, 3758.23, 32.21), vector3(1951.64, 3751.9, 32.21), vector3(1959.96, 3737.25, 32.21)},
    },

    ["Harmony"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(544.21, 2672.67, 43.8),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(549.62, 2663.63, 41.16, 243.33),
        ["NpcCoords"] = vector4(547.48, 2664.0, 41.16, 188.09),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 97.8,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(555.08, 2665.51, 42.31), -- Circle Zone Coords
                drawtext = vector3(555.09, 2665.15, 42.2),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.01, 2671.76, 42.34), -- Circle Zone Coords
                drawtext = vector3(548.57, 2671.7, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.32, 2669.62, 42.34), -- Circle Zone Coords
                drawtext = vector3(548.84, 2669.66, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(540.14, 2667.78, 42.16), -- Circle Zone Coords
                drawtext = vector3(540.45, 2667.81, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(549.62, 2663.63, 42.16), -- Circle Zone Coords
                drawtext = vector3(549.22, 2663.83, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(547.48, 2664.0, 42.16), -- Circle Zone Coords
                drawtext = vector3(547.53, 2663.66, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(544.83, 2663.9, 42.14), -- Circle Zone Coords
                drawtext = vector3(545.64, 2663.2, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(544.83, 2663.9, 42.14), -- Circle Zone Coords
                drawtext = vector3(545.64, 2663.2, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(543.59, 2662.52, 42.54), -- Circle Zone Coords
                drawtext = vector3(543.78, 2662.56, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(544.88, 2668.62, 42.45),
                drawtext = vector3(545.6, 2668.71, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(542.4, 2668.29, 42.38),
                drawtext = vector3(543.4, 2668.45, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(546.66, 2665.67, 42.39),
                drawtext = vector3(546.62, 2665.97, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(544.17, 2665.35, 42.46),
                drawtext = vector3(544.15, 2665.69, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.71, 2669.18, 42.37),
                drawtext = vector3(540.05, 2669.23, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.38, 2670.8, 42.37),
                drawtext = vector3(539.83, 2670.9, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(541.63, 2671.74, 41.9),
                drawtext = vector3(541.79, 2670.87, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(550.1, 2673.66, 42.06), vector3(538.05, 2672.27, 42.06), vector3(540.3, 2655.47, 42.06), vector3(552.28, 2656.88, 42.06)},
    },

    ["GrandSenoraDesert"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2682.49, 3281.84, 57.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2671.59, 3283.6, 54.24, 117.06),
        ["NpcCoords"] = vector4(2673.12, 3285.03, 54.24, 62.38),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 329.31,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2676.56, 3293.89, 55.5), -- Circle Zone Coords
                drawtext = vector3(2676.8, 3294.18, 55.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2679.0, 3280.01, 55.43), -- Circle Zone Coords
                drawtext = vector3(2678.64, 3279.53, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2677.1, 3281.03, 55.43), -- Circle Zone Coords
                drawtext = vector3(2676.86, 3280.55, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2680.52, 3288.69, 55.62), -- Circle Zone Coords
                drawtext = vector3(2680.37, 3288.41, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2671.59, 3283.6, 55.24), -- Circle Zone Coords
                drawtext = vector3(2671.82, 3283.75, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2673.12, 3285.03, 55.24), -- Circle Zone Coords
                drawtext = vector3(2672.85, 3285.19, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2674.4, 3287.23, 54.92), -- Circle Zone Coords
                drawtext = vector3(2673.55, 3287.02, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2674.4, 3287.23, 54.92), -- Circle Zone Coords
                drawtext = vector3(2673.55, 3287.02, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2674.46, 3289.48, 55.66), -- Circle Zone Coords
                drawtext = vector3(2674.31, 3289.18, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2678.31, 3284.26, 55.74),
                drawtext = vector3(2678.03, 3283.71, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2679.62, 3286.6, 55.73),
                drawtext = vector3(2679.07, 3285.63, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2674.96, 3284.7, 55.57),
                drawtext = vector3(2675.18, 3284.49, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2676.15, 3286.91, 55.57),
                drawtext = vector3(2676.33, 3286.73, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2681.87, 3288.23, 55.46),
                drawtext = vector3(2681.7, 3287.92, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2683.3, 3287.31, 55.5),
                drawtext = vector3(2683.16, 3287.18, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2682.7, 3285.18, 54.91),
                drawtext = vector3(2682.04, 3285.45, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2685.52, 3288.63, 55.24), vector3(2675.6, 3294.4, 55.24), vector3(2669.48, 3282.91, 55.24), vector3(2679.6, 3277.74, 55.24)},
    },

    ["TataviamMountains"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2559.97, 385.95, 110.27),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2549.53, 381.56, 107.62, 146.19),
        ["NpcCoords"] = vector4(2550.23, 383.67, 107.62, 83.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.48,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2546.18, 371.89, 108.61), -- Circle Zone Coords
                drawtext = vector3(2545.79, 371.93, 108.61),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2557.8, 381.79, 108.81), -- Circle Zone Coords
                drawtext = vector3(2557.69, 381.22, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2555.64, 381.85, 108.81), -- Circle Zone Coords
                drawtext = vector3(2555.61, 381.32, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2555.25, 390.23, 108.87), -- Circle Zone Coords
                drawtext = vector3(2555.23, 389.93, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2549.53, 381.56, 108.62), -- Circle Zone Coords
                drawtext = vector3(2549.67, 381.94, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2550.23, 383.67, 108.62), -- Circle Zone Coords
                drawtext = vector3(2549.87, 383.71, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2550.37, 386.09, 108.56), -- Circle Zone Coords
                drawtext = vector3(2549.77, 385.56, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2550.37, 386.09, 108.56), -- Circle Zone Coords
                drawtext = vector3(2549.77, 385.56, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2549.49, 388.14, 108.94), -- Circle Zone Coords
                drawtext = vector3(2549.51, 387.95, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.22, 385.33, 109.12),
                drawtext = vector3(2555.19, 384.67, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.32, 387.89, 109.1),
                drawtext = vector3(2555.39, 386.91, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2552.06, 384.14, 108.88),
                drawtext = vector3(2552.29, 384.13, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2552.2, 386.64, 108.9),
                drawtext = vector3(2552.36, 386.58, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2556.64, 390.39, 108.95),
                drawtext = vector3(2556.56, 390.14, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2558.3, 390.24, 108.94),
                drawtext = vector3(2558.29, 390.0, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2558.81, 388.07, 108.25),
                drawtext = vector3(2558.08, 388.11, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2560.0, 391.48, 108.47), vector3(2546.76, 392.14, 108.47), vector3(2546.6, 379.88, 108.47), vector3(2559.6, 379.53, 108.47)},
    },

    ["Davis"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-53.8, -1757.23, 30.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-41.85, -1749.36, 28.42, 319.47),
        ["NpcCoords"] = vector4(-44.64, -1750.84, 28.42, 291.46),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 49.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-48.51, -1759.23, 29.54), -- Circle Zone Coords
                drawtext = vector3(-47.93, -1759.37, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.2, -1757.67, 29.54), -- Circle Zone Coords
                drawtext = vector3(-46.79, -1758.01, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-57.3, -1751.8, 29.63), -- Circle Zone Coords
                drawtext = vector3(-56.94, -1752.1, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-41.85, -1749.36, 29.42), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1749.84, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-44.64, -1750.84, 29.42), -- Circle Zone Coords
                drawtext = vector3(-44.24, -1750.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-43.85, -1748.06, 28.94), -- Circle Zone Coords
                drawtext = vector3(-43.29, -1748.5, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-48.77, -1754.54, 29.43),
                drawtext = vector3(-48.73, -1755.29, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-50.31, -1752.58, 29.41),
                drawtext = vector3(-50.4, -1753.09, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.38, -1752.62, 29.4),
                drawtext = vector3(-52.41, -1753.35, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.78, -1750.5, 29.38),
                drawtext = vector3(-52.74, -1751.15, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.33, -1750.28, 29.37),
                drawtext = vector3(-56.02, -1750.42, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.34, -1747.84, 29.38),
                drawtext = vector3(-54.12, -1748.08, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-51.51, -1747.42, 29.34),
                drawtext = vector3(-51.92, -1747.82, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-59.76, -1751.12, 29.25), vector3(-47.34, -1761.67, 29.25), vector3(-38.22, -1750.59, 29.25), vector3(-51.1, -1740.43, 29.25)},
    },

    ["LittleSeoul"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-711.7, -916.78, 21.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-707.75, -903.86, 18.22, 3.06),
        ["NpcCoords"] = vector4(-709.13, -906.89, 18.22, 336.96),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 90.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -915.72, 19.33), -- Circle Zone Coords
                drawtext = vector3(-706.12, -915.48, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -913.69, 19.33), -- Circle Zone Coords
                drawtext = vector3(-706.11, -913.68, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-718.19, -915.72, 19.83), -- Circle Zone Coords
                drawtext = vector3(-717.62, -915.72, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-707.75, -903.86, 19.22), -- Circle Zone Coords
                drawtext = vector3(-707.8, -904.35, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-709.13, -906.89, 19.22), -- Circle Zone Coords
                drawtext = vector3(-708.96, -906.56, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-710.23, -904.11, 18.79), -- Circle Zone Coords
                drawtext = vector3(-709.54, -904.1, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-709.72, -912.36, 19.21),
                drawtext = vector3(-709.2, -912.91, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-712.33, -911.75, 19.15),
                drawtext = vector3(-711.95, -912.24, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-713.81, -913.19, 19.14),
                drawtext = vector3(-713.42, -913.74, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.64, -911.76, 19.04),
                drawtext = vector3(-715.12, -912.3, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.72, -914.56, 19.06),
                drawtext = vector3(-718.11, -913.79, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.69, -910.71, 18.99),
                drawtext = vector3(-718.11, -910.69, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-716.53, -908.56, 19.05),
                drawtext = vector3(-716.58, -909.18, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-720.62, -916.81, 18.99), vector3(-704.17, -916.68, 18.99), vector3(-703.9, -900.17, 18.99), vector3(-720.36, -900.09, 18.99)},
    },

    ["RichmanGlen"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1822.28, 788.07, 139.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-1827.93, 800.13, 137.16, 42.18),
        ["NpcCoords"] = vector4(-1826.86, 796.98, 137.17, 14.68),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 132.47,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1819.09, 792.32, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1818.8, 793.09, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1820.47, 793.82, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1819.88, 794.23, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-1827.51, 784.62, 138.8), -- Circle Zone Coords
                drawtext = vector3(-1827.19, 784.9, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-1827.93, 800.13, 138.16), -- Circle Zone Coords
                drawtext = vector3(-1827.36, 799.63, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1826.86, 796.98, 138.17), -- Circle Zone Coords
                drawtext = vector3(-1826.99, 797.44, 138.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1829.61, 798.39, 137.79), -- Circle Zone Coords
                drawtext = vector3(-1829.05, 798.9, 138.19),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1823.58, 792.67, 138.08),
                drawtext = vector3(-1823.05, 792.68, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.08, 791.36, 138.04),
                drawtext = vector3(-1825.43, 791.28, 138.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.37, 789.17, 138.06),
                drawtext = vector3(-1825.45, 789.22, 138.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.37, 789.21, 138.05),
                drawtext = vector3(-1827.76, 789.03, 138.27),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1829.26, 785.67, 138.14),
                drawtext = vector3(-1828.67, 786.1, 138.31),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.13, 788.07, 138.14),
                drawtext = vector3(-1830.91, 788.23, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.1, 790.86, 138.19),
                drawtext = vector3(-1830.76, 790.38, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1828.56, 782.26, 138.84), vector3(-1816.18, 793.53, 138.84), vector3(-1826.2, 803.87, 138.84), vector3(-1838.57, 792.6, 138.84)},
    },

    ["MirrorPark"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1159.75, -327.2, 71.67),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1161.28, -313.38, 68.21, 9.15),
        ["NpcCoords"] = vector4(1160.51, -316.84, 68.21, 336.91),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 100.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.56, -324.89, 69.32), -- Circle Zone Coords
                drawtext = vector3(1165.04, -324.54, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.21, -322.89, 69.32), -- Circle Zone Coords
                drawtext = vector3(1164.76, -322.75, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1153.21, -326.89, 69.51), -- Circle Zone Coords
                drawtext = vector3(1153.75, -326.8, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1161.28, -313.38, 69.21), -- Circle Zone Coords
                drawtext = vector3(1161.41, -314.09, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1160.51, -316.84, 69.21), -- Circle Zone Coords
                drawtext = vector3(1160.76, -316.31, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1159.06, -314.13, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.7, -314.04, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1160.82, -322.06, 69.14),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1158.26, -322.01, 69.13),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.97, -323.65, 69.15),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1155.12, -322.48, 69.08),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.38, -325.1, 69.08),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1151.93, -322.05, 69.09),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1153.64, -319.7, 69.08),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1151.04, -328.32, 69.32), vector3(1167.47, -325.5, 69.32), vector3(1164.68, -311.37, 69.32), vector3(1148.37, -314.27, 69.32)},
    },

    ["GrapeSeed"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.78, 4929.27, 43.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1707.15, 4918.88, 41.06, 232.3),
        ["NpcCoords"] = vector4(1705.12, 4921.63, 41.06, 206.51),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 325.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1696.64, 4924.54, 42.18), -- Circle Zone Coords
                drawtext = vector3(1696.57, 4923.92, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1698.31, 4923.37, 42.18), -- Circle Zone Coords
                drawtext = vector3(1697.96, 4922.99, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1703.26, 4934.0, 42.26), -- Circle Zone Coords
                drawtext = vector3(1702.86, 4933.41, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1707.15, 4918.88, 42.06), -- Circle Zone Coords
                drawtext = vector3(1706.62, 4919.21, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1705.12, 4921.63, 42.06), -- Circle Zone Coords
                drawtext = vector3(1705.35, 4921.16, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1708.2, 4920.92, 41.61), -- Circle Zone Coords
                drawtext = vector3(1707.78, 4920.28, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1701.18, 4925.16, 42.09),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1703.1, 4926.98, 41.95),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1702.87, 4928.94, 41.96),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.26, 4929.67, 41.88),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.07, 4933.14, 41.94),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1707.6, 4931.5, 41.92),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1708.19, 4928.48, 41.88),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1705.07, 4938.0, 42.18), vector3(1693.64, 4921.75, 42.18), vector3(1706.17, 4912.73, 42.18), vector3(1718.39, 4928.88, 42.18)},
    },

    ["VespucciCanals"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1226.82, -902.07, 13.99),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1220.01, -911.22, 11.33, 123.84),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 32.7,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1222.33, -907.82, 12.43), -- Circle Zone Coords
                drawtext = vector3(-1222.01, -908.3, 12.33),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1220.01, -911.22, 12.33), -- Circle Zone Coords
                drawtext = vector3(-1220.49, -911.49, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1220.55, -913.15, 12.22), -- Circle Zone Coords
                drawtext = vector3(-1220.89, -912.6, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1221.2, -916.25, 11.33), -- Circle Zone Coords
                drawtext = vector3(-1220.68, -915.91, 11.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1225.74, -909.05, 12.39),
                drawtext = vector3(-1225.47, -909.02, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1226.76, -907.76, 12.39),
                drawtext = vector3(-1226.38, -907.61, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.64, -906.53, 12.39),
                drawtext = vector3(-1227.3, -906.28, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.36, -904.77, 12.39),
                drawtext = vector3(-1224.01, -905.12, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.62, -902.47, 12.39),
                drawtext = vector3(-1223.45, -902.79, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1222.03, -903.18, 12.39),
                drawtext = vector3(-1222.29, -903.37, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1220.88, -905.03, 12.39),
                drawtext = vector3(-1221.11, -905.22, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1222.64, -899.35, 12.39), vector3(-1210.81, -913.93, 12.39), vector3(-1223.09, -921.91, 12.39), vector3(-1232.55, -906.31, 12.39)},
    },

    ["MorningWood"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1491.47, -383.78, 42.39),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1483.87, -375.35, 39.16, 221.85),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 133.77,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1486.67, -378.46, 40.27), -- Circle Zone Coords
                drawtext = vector3(-1486.22, -378.05, 40.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1483.87, -375.35, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1483.32, -375.96, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1481.99, -375.86, 40.13), -- Circle Zone Coords
                drawtext = vector3(-1482.36, -376.07, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1478.62, -375.8, 39.16), -- Circle Zone Coords
                drawtext = vector3(-1479.03, -375.38, 39.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1484.7, -381.71, 40.35),
                drawtext = vector3(-1485.04, -381.24, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1485.81, -382.88, 40.35),
                drawtext = vector3(-1486.15, -382.36, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1486.89, -384.03, 40.35),
                drawtext = vector3(-1487.19, -383.44, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.44, -380.01, 40.35),
                drawtext = vector3(-1488.96, -380.58, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.83, -380.94, 40.35),
                drawtext = vector3(-1491.4, -380.53, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.17, -378.95, 40.35),
                drawtext = vector3(-1491.04, -379.34, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.71, -377.49, 40.35),
                drawtext = vector3(-1489.5, -377.88, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-1486.32, -389.65, 39.9), vector3(-1472.93, -375.89, 39.9), vector3(-1481.95, -366.53, 39.9), vector3(-1496.84, -378.62, 39.9)},
    },

    ["GreatOceanHighway"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-2974.49, 390.58, 16.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-2963.0, 390.87, 14.04, 173.4),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 85.24,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-2967.03, 390.9, 15.15), -- Circle Zone Coords
                drawtext = vector3(-2966.46, 390.9, 15.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-2963.0, 390.87, 15.04), -- Circle Zone Coords
                drawtext = vector3(-2963.0, 390.26, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-2961.79, 389.05, 15.03), -- Circle Zone Coords
                drawtext = vector3(-2962.53, 389.09, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-2959.6, 386.9, 14.04), -- Circle Zone Coords
                drawtext = vector3(-2959.56, 387.29, 14.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.13, 387.32, 14.85),
                drawtext = vector3(-2968.15, 387.6, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.78, 387.36, 14.84),
                drawtext = vector3(-2969.69, 387.82, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2971.29, 387.53, 14.93),
                drawtext = vector3(-2971.28, 387.89, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.92, 391.84, 14.98),
                drawtext = vector3(-2970.19, 391.22, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.1, 393.2, 14.91),
                drawtext = vector3(-2971.71, 393.0, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2970.47, 393.99, 15.0),
                drawtext = vector3(-2970.48, 393.64, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.23, 393.91, 15.0),
                drawtext = vector3(-2968.41, 393.43, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-2974.17, 382.18, 14.91), vector3(-2957.38, 380.53, 14.91), vector3(-2956.41, 395.43, 14.91), vector3(-2973.5, 396.57, 14.91)},
    },

    ["MurrietaHeights"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1141.57, -980.89, 48.37),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1130.77, -983.28, 45.42, 8.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 276.69,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1134.81, -982.36, 46.52), -- Circle Zone Coords
                drawtext = vector3(1134.19, -982.45, 46.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1130.77, -983.28, 46.42), -- Circle Zone Coords
                drawtext = vector3(1130.67, -982.75, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1129.24, -981.67, 46.41), -- Circle Zone Coords
                drawtext = vector3(1129.79, -981.57, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1126.75, -979.62, 45.40), -- Circle Zone Coords
                drawtext = vector3(1126.8, -980.06, 45.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1135.2, -978.71, 46.37),
                drawtext = vector3(1135.17, -979.05, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.78, -978.34, 46.36),
                drawtext = vector3(1136.9, -978.76, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.33, -978.12, 46.35),
                drawtext = vector3(1138.37, -978.56, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.88, -982.58, 46.32),
                drawtext = vector3(1137.78, -982.07, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1140.15, -983.56, 46.2),
                drawtext = vector3(1139.82, -983.5, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.77, -984.61, 46.69),
                drawtext = vector3(1138.79, -984.3, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.61, -984.94, 46.69),
                drawtext = vector3(1136.59, -984.6, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1140.81, -976.27, 46.25), vector3(1123.7, -978.93, 46.25), vector3(1124.47, -993.08, 46.25), vector3(1143.02, -990.4, 46.25)},
    },

    ["BolingBroke"] = {
        ["Reset"] = 60, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1166.43, 2703.84, 39.18),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1165.6, 2714.34, 37.16, 268.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 178.85,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1165.96, 2710.2, 38.26), -- Circle Zone Coords
                drawtext = vector3(1165.95, 2710.77, 38.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1165.6, 2714.34, 38.16), -- Circle Zone Coords
                drawtext = vector3(1166.09, 2714.33, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1167.46, 2715.53, 37.99), -- Circle Zone Coords
                drawtext = vector3(1167.46, 2715.01, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1169.58, 2717.83, 37.58), -- Circle Zone Coords
                drawtext = vector3(1169.15, 2717.93, 37.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.52, 2709.32, 38.05),
                drawtext = vector3(1169.23, 2709.3, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.46, 2707.69, 38.06),
                drawtext = vector3(1169.24, 2707.72, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.53, 2706.15, 38.06),
                drawtext = vector3(1169.32, 2706.15, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1165.11, 2707.23, 37.94),
                drawtext = vector3(1165.85, 2707.13, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.01, 2704.99, 38.32),
                drawtext = vector3(1164.12, 2705.29, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2706.67, 38.32),
                drawtext = vector3(1163.42, 2706.56, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2708.68, 38.34),
                drawtext = vector3(1163.53, 2708.73, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1158.38, 2702.84, 38.12), vector3(1170.88, 2703.34, 38.12), vector3(1170.38, 2721.67, 38.12), vector3(1158.37, 2721.75, 38.12)},
    },

}

Config.Register247 = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 500, max = 2000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.RegisterLtdGasoline = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 500, max = 2000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.RegisterLiquor = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 500, max = 2000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Atm247 = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1500, max = 3000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.AtmLtdGasoline = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1500, max = 3000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeLiquor = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 5000, max = 8000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeLtdGasoline = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 7000, max = 10000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Safe247 = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 10000, max = 12500}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeCorrupt247 = { -- Reward from the safe if the data got corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 6000, max = 10000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.MaxItems = 5 -- Max items that can be taken from the shelves
Config.RewardShelf = {
    {Name = "water_bottle", Chance = 20, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
    {Name = "vodka", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "beer", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "kurkakola", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "sandwich", Chance = 20, Amount = {min = 1, max = 1}},
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is on
    ["AlarmSoundVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmSoundDistance"] = 35.0, -- The distance that the sound reaches
    ["AlarmRepeat"] = 30, -- At 30 and Wait at 10000, the alarm will blare every 10 seconds for a total of 5 minutes
    ["AlarmWait"] = 10000, -- Waits between each alarm blare
}

Config.Weapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    -- Melee
    "WEAPON_KNIFE", -- Knife
    "WEAPON_NIGHTSTICK", -- Night Stick
    "WEAPON_HAMMER", -- Hammer
    "WEAPON_BAT", -- Bat
    "WEAPON_CROWBAR", -- Crowbar
    "WEAPON_GOLFCLUB", -- Golfclub
    "WEAPON_BOTTLE", -- Bottle
    "WEAPON_DAGGER", -- Dagger
    "WEAPON_HATCHET", -- Hatchet
    "WEAPON_KNUCKLE", -- Knuckle Duster
    "WEAPON_MACHETE", -- Machete
    "WEAPON_FLASHLIGHT", -- Flashlight
    "WEAPON_SWITCHBLADE", -- Switch Blade
    "WEAPON_POOLCUE", -- Poolcue
    "WEAPON_WRENCH", -- Wrench
    "WEAPON_BATTLEAXE", -- Battle Axe

    -- Pistols
    "WEAPON_PISTOL", -- Pistol
    "WEAPON_PISTOL_MK2", -- Pistol Mk2
    "WEAPON_COMBATPISTOL", -- Combat Pistol
    "WEAPON_PISTOL50", -- Pistol 50
    "WEAPON_SNSPISTOL", -- SNS Pistol 
    "WEAPON_HEAVYPISTOL", -- Heavy Pistol
    "WEAPON_VINTAGEPISTOL", -- Vintage Pistol
    "WEAPON_MARKSMANPISTOL", -- Marksman Pistol
    "WEAPON_REVOLVER", -- Revolver
    "WEAPON_APPISTOL", -- AP Pistol
    "WEAPON_STUNGUN", -- Stun Gun
    "WEAPON_FLAREGUN", -- Flare Gun

    -- SMGs
    "WEAPON_MICROSMG", -- Micro SMG
    "WEAPON_MACHINEPISTOL", -- Machine Pistol
    "WEAPON_SMG", -- SMG
    "WEAPON_SMG_MK2", -- SMG Mk2
    "WEAPON_ASSAULTSMG", -- Assault SMG
    "WEAPON_COMBATPDW", -- Combat PDW
    "WEAPON_MG", -- MG
    "WEAPON_COMBATMG", -- Combat MG
    "WEAPON_COMBATMG_MK2", -- Combat MG Mk2
    "WEAPON_GUSENBERG", -- Gusenberg
    "WEAPON_MINISMG", -- Mini SMG

    -- Assault Rifles
    "WEAPON_ASSAULTRIFLE", -- Assault Rifle
    "WEAPON_ASSAULTRIFLE_MK2", -- Assault Rifle Mk2
    "WEAPON_CARBINERIFLE", -- Carbine Rifle
    "WEAPON_CARBINERIFLE_MK2", -- Carbine Rifle Mk2
    "WEAPON_ADVANCEDRIFLE", -- Advanced Rifle
    "WEAPON_SPECIALCARBINE", -- Special Carbine
    "WEAPON_BULLPUPRIFLE", -- Bullpup Rifle
    "WEAPON_COMPACTRIFLE", -- Compact Rifle

    -- Sniper rifles
    "WEAPON_SNIPERRIFLE", -- Sniper Rifle
    "WEAPON_HEAVYSNIPER", -- Heavy Sniper
    "WEAPON_HEAVYSNIPER_MK2", -- Heavy Sniper Mk2
    "WEAPON_MARKSMANRIFLE", -- Marksman Rifle

    -- Shotguns
    "WEAPON_PUMPSHOTGUN", -- Pump Shotgun
    "WEAPON_SAWNOFFSHOTGUN", -- Sawnoff Shotgun
    "WEAPON_BULLPUPSHOTGUN", -- Bullpup Shotgun
    "WEAPON_ASSAULTSHOTGUN", -- Assault Shotgun
    "WEAPON_MUSKET", -- Musket
    "WEAPON_HEAVYSHOTGUN", -- Heavy Shotgun
    "WEAPON_DBSHOTGUN", -- Double Barrel Shotgun
    "WEAPON_AUTOSHOTGUN", -- Auto Shotgun

    -- Heavy Weapons
    "WEAPON_GRENADELAUNCHER", -- Grenade Launcher
    "WEAPON_RPG", -- RPG
    "WEAPON_MINIGUN", -- Minigun
    "WEAPON_FIREWORK", -- Firework
    "WEAPON_RAILGUN", -- Railgun
    "WEAPON_HOMINGLAUNCHER", -- Homing Launcher
    "WEAPON_GRENADELAUNCHER_SMOKE", -- Smoke Grenade Launcher 
    "WEAPON_COMPACTLAUNCHER", -- Compact Launcher

    -- Thrown Weapons
    "WEAPON_GRENADE", -- Grenade
    "WEAPON_STICKYBOMB", -- Sticky Bomb
    "WEAPON_PROXMINE", -- Proximity Mine
    "WEAPON_BZGAS", -- BZ Gas
    "WEAPON_MOLOTOV", -- Molotov
    "WEAPON_FIREEXTINGUISHER", -- Fire Extinguisher
    "WEAPON_PETROLCAN", -- Petrol Can
    "WEAPON_FLARE", -- Flare
    "WEAPON_BALL", -- Ball
    "WEAPON_SNOWBALL", -- Snowball
    "WEAPON_SMOKEGRENADE", -- Smoke Grenade
    "WEAPON_PIPEBOMB", -- Pipe Bomb
}

Config.MaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true}
Config.FemaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true}
Config.UseDecor = false
Config.Decorname = "SpawnedPed"

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.DoorStates = { -- Sync
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},

    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"]= {},
}

Config.DoorList = {
    ["Strawberry"] = {
        {
            objYaw = 0.0,
            objCoords = vector3(24.27, -1341.91, 29.65),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["DowntownVineWood"] = {
        {
            objYaw = 345.88,
            objCoords = vector3(373.68, 331.71, 103.72),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["BanhamCanyon"] = {
        {
            objYaw = 107.76,
            objCoords = vector3(-3044.05, 582.69, 8.06),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["Chumash"] = {
        {
            objYaw = 85.07,
            objCoords = vector3(-3247.66, 1000.24, 12.98),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["MountChiliad"] = {
        {
            objYaw = 333.64,
            objCoords = vector3(1730.07, 6420.15, 35.19),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["SandyShores"] = {
        {
            objYaw = 30.0,
            objCoords = vector3(1957.21, 3744.59, 32.5),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["Harmony"] = {
        {
            objYaw = 187.5,
            objCoords = vector3(549.97, 2666.01, 42.31),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["GrandSenoraDesert"] = {
        {
            objYaw = 60.87,
            objCoords = vector3(2673.22, 3281.86, 55.39),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["TataviamMountains"] = {
        {
            objYaw = 87.72,
            objCoords = vector3(2551.81, 380.83, 108.77),
            objHash = 1266035946,
            locked = true,
        },
    },
    ["VespucciCanals"] = {
        {
            objYaw = 33.86,
            objCoords = vector3(-1219.63, -912.41, 12.48),
            objHash = 1173348778,
            locked = true,
        },
    },
    ["MorningWood"] = {
        {
            objYaw = 134.93,
            objCoords = vector3(-1482.69, -374.94, 40.31),
            objHash = 1173348778,
            locked = true,
        },
    },
    ["GreatOceanHighway"] = {
        {
            objYaw = 86.39,
            objCoords = vector3(-2961.75, 390.26, 15.19),
            objHash = 1173348778,
            locked = true,
        },
    },
    ["MurrietaHeights"] = {
        {
            objYaw = 277.84,
            objCoords = vector3(1129.51, -982.78, 46.57),
            objHash = 1173348778,
            locked = true,
        },
    },
    ["BolingBroke"] = {
        {
            objYaw = 179.92,
            objCoords = vector3(1166.27, 2715.51, 38.31),
            objHash = 1173348778,
            locked = true,
        },
    },
}

Config.Steps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.ExtraSteps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.Tasks = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}