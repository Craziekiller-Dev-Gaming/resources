Config = {}

Config.Language = "en"

Config.NotifyXP = true

Config.MenuCommand = "xp"

Config.Categories = {
    ["handyman"] = {
        label = "Handyman", -- Label of the category in the display & notifications.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 6 -- Maximum level achievable.
    },
    ["thief"] = {
        label = "Thief", -- Label of the category in the display & notifications.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 10 -- Maximum level achievable.
    },
    ["weapons"] = {
        label = "Weapons", -- Label of the category in the display & notifications.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 10 -- Maximum level achievable.
    },
    ["mechanic"] = {
        label = "Mechanic", -- Label of the category in the display & notifications.
        xpStart = 1000, -- Level 2 XP requirement.
        xpFactor = 0.5, -- Multiplier for much to increase the next level's XP requirement.
        maxLevel = 10 -- Maximum level achievable.
    },
}