Config = {}

-- Which translation you wish to use ?
Config.Locale = "en"

Config.Framework = {
    -- 0 = standalone
    -- 1 = esx
    -- 2 = qbcore
    Active = 2,

    -- esx
    ESX_SHARED_OBJECT = "esx:getSharedObject",

    -- es_extended resource name
    ES_EXTENDED_NAME = "es_extended",

    -------

    -- qbcore
    QBCORE_SHARED_OBJECT = "QBCore:GetObject",

    -- qb-core resource name
    QB_CORE_NAME = "qb-core",

    -- should the script look it self for framework?
    AutoCheck = true,
}

Config.Society = "society"

-- Key settings
Config.keyToOpenTicketMenu = "E"
Config.keyToOpenComputer = "E"

-- Marker for buying ticket
Config.Arcade = {
    {
        NPC = {
            position = vector3(-1658.83, -1062.62, 11.16),
            heading = 208.11,
            model = "s_m_y_mime",
        },
        blip = {
            position = vector3(-1660.18, -1073.27, 12.76),
            blipId = 740,
            scale = 1.0,
            color = 1,
            name = "Arcade house",
            shortRange = true,
            enable = true,
        },
        marker = {
            markerPosition = vector3(-1657.62, -1063.46, 11.6),
            markerType = 23,
            options = {
                scale = { x = 1.0, y = 1.0, z = 1.0 },
                color = { r = 255, g = 0, b = 0, a = 125 },
            }
        },
    },
}

-- ticket price, and time in arcade.
Config.ticketPrice = {
    [1] = {
        label = _U("bronz"),
        price = 1000,
        time = 30, -- in minutes
    },
    [2] = {
        label = _U("silver"),
        price = 2000,
        time = 60, -- in minutes
    },
    [3] = {
        label = _U("gold"),
        price = 3000,
        time = 90, -- in minutes
    },
    [4] = {
        label = _U("Platinum"),
        price = 4000,
        time = 120, -- in minutes
    },
}

-- is arcade payed ?
Config.enableGameHouse = true

-- do not change unless you know what you're doing
Config.GPUList = {
    ETX2080 = "ETX2080",
    ETX1050 = "ETX1050",
    ETX660 = "ETX660",
}

Config.CPUList = {
    U9_9900 = "U9_9900",
    U9_9900 = "U9_9900",
    U3_6300 = "U3_6300",
    BENTIUM = "BENTIUM",
}

Config.MyList = {
    {
        name = "name",
        link = "bleh",
    },
}

-- game list for retro machine
Config.RetroMachine = {
    {
        name = "Pacman",
        link = "http://xogos.robinko.eu/PACMAN/",
    },
    {
        name = "Tetris",
        link = "http://xogos.robinko.eu/TETRIS/",
    },
    {
        name = "Ping Pong",
        link = "http://xogos.robinko.eu/PONG/",
    },
    {
        name = "DOOM",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/Doom.zip", "./DOOM.EXE"),
    },
    {
        name = "Duke Nukem 3D",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/duke3d.zip", "./DUKE3D.EXE"),
    },
    {
        name = "Wolfenstein 3D",
        link = string.format("nui://rcore_arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/Wolfenstein3D.zip", "./WOLF3D.EXE"),
    },
    {
        name = "Slide a Lama",
        link = "http://lama.robinko.eu/fullscreen.html",
    },
    {
        name = "Uno",
        link = "https://duowfriends.eu/",
    },
    {
        name = "Ants",
        link = "http://ants.robinko.eu/fullscreen.html",
    },
    {
        name = "FlappyParrot",
        link = "http://xogos.robinko.eu/FlappyParrot/",
    },
    {
        name = "Zoopaloola",
        link = "http://zoopaloola.robinko.eu/Embed/fullscreen.html"
    }
}

-- game list for gaming machine
Config.GamingMachine = {
    {
        name = "Slide a Lama",
        link = "http://lama.robinko.eu/fullscreen.html",
    },
    {
        name = "Uno",
        link = "https://duowfriends.eu/",
    },
    {
        name = "Ants",
        link = "http://ants.robinko.eu/fullscreen.html",
    },
    {
        name = "FlappyParrot",
        link = "http://xogos.robinko.eu/FlappyParrot/",
    },
    {
        name = "Zoopaloola",
        link = "http://zoopaloola.robinko.eu/Embed/fullscreen.html"
    }
}

-- game list for super computer
Config.SuperMachine = {}

for i = 1, #Config.RetroMachine do
    table.insert(Config.SuperMachine, Config.RetroMachine[i])
end

for i = 1, #Config.GamingMachine do
    table.insert(Config.SuperMachine, Config.GamingMachine[i])
end

-- computer list in world
Config.computerList = {
    
    --- Gabz Arcade Retro Machine's
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1650.29, -1078.69, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1649.25, -1077.56, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },

    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1648.37, -1076.44, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1649.49, -1074.75, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1650.15, -1074.15, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1650.85, -1073.56, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1652.26, -1075.68, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1652.97, -1075.18, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1653.62, -1074.67, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1654.19, -1074.16, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1655.28, -1068.53, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1654.65, -1067.72, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1657.34, -1068.79, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1657.60, -1066.55, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1652.45, -1068.91, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1651.98, -1068.22, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1651.38, -1067.60, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1650.88, -1067.01, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1650.29, -1066.31, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1649.80, -1065.70, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1659.81, -1070.10, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1660.19, -1069.34, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1660.24, -1068.48, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.RetroMachine,
        computerGPU = Config.GPUList.ETX2080,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 31,
        position = vector3(-1660.30, -1067.58, 12.16),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255, a = 125 },
            rotate = true,
        },
    },










--[[
        -- Gaming computers
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1063.7, -246.7, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1060.2, -244.85, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1055.7, -246.12, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1053.96, -241.8, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1056.14, -243.42, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1050.76, -240.9, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1050.03, -243.51, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,

        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList.ETX1050,
        computerCPU = Config.CPUList.U9_9900,

        markerType = 42,
        position = vector3(-1062.44, -248.98, 44.5),
        markerOptions = {
            scale = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 125, g = 125, b = 255, a = 125 },
            rotate = true,
        },
    },
    ]]
    
    -- Super machines
}

-- dont change, dont touch this.
Framework = {
    STANDALONE = 0,
    ESX = 1,
    QBCORE = 2,
}