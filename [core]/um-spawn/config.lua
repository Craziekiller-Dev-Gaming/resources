um = {}

um.debug = false

um.lang = 'en' -- tr,en,es,zh,fr,hi [or add locales > .lua]

um.propertyDefaultImage = 'https://files.fivemerr.com/images/534eff8f-e6cb-473f-b441-bf0ac114e256.png'

um.property = {
    apartments = false,
    houses = false
}

-- If you want to show the logo, set it to true or hidden false
um.logo = {
    status = false,
    url = 'imageurl',
}

um.main = {
    onlyLastLocation = false,        -- If you want to only last location set true.
    forceDeadPedLastLocation = true, -- If you want force injured ped last location set true.
    camera = {
        radius = 2.0,                -- Camera distance from the character
        angle = 50,                  -- Camera angle
        point = 0.1,                 -- Camera point
        turning = true,              -- If you want to turn the camera, set it to true.
        skyspawnPos = -20,           -- -100 vertical, -20 horizontal
    },
    spawn = {
        type = 'playerFromSky', -- playerFromSky (um), gtaVNative
        cutScene = false,       -- If you want to show the cutscene, set it to true.
    },
    ped = {
        status = true, -- Make it true if you want your character to see and walk the path
    },
    bookmark = {
        status = false,   -- If you want to show the bookmark system, set it to true.
        money = {
            free = false, -- If you want to bookmark the free money, set it to true.
            amount = math.random(100, 1000) or 500
        }
    },
}

--[[
   If your hud appears in spawn menu,
   this is nonsense, remember that hud is not shown without playerLoaded or LocalPlayer loaded,
   but that's ok, that's what this function was made for
--]]
um.hud = function(bool)
    if bool then
        -- Example: exports['myhud']:SetDisplay(false)
        exports["17mov_Hud"]:ToggleDisplay(false)
        Debug('Hud is hidden', 'debug')
    else
        -- Example: exports['myhud']:SetDisplay(true)
        exports["17mov_Hud"]:ToggleDisplay(true)
        Debug('Hud is show', 'debug')
    end
end

um.weather = {
    sync = true,  -- If you want to sync the weather, set it to true.
    sc = 'qb',     -- cd , qb
    type = 'XMAS', -- https://docs.fivem.net/docs/game-references/weather-types/
    time = 23,     -- 0 - 23
}

um.coords = {
    ['motel'] = {
        coords = vector4(-746.49, -2286.09, 13.06, 314.76),
        street = 'Greenwich Parkway',
        text = 'Apartments'
    },
    ['hospital'] = {
        coords = vector4(286.42, -602.82, 43.19, 128.92),
        street = 'Dorset Drive',
        text = 'Mount Zonah Hospital'
    },
    ['police'] = {
        coords = vector4(-581.92, -389.38, 34.94, 358.13),
        street = 'Dorset Drive',
        text = 'Los Santos Police Department'
    },
    ['sandy'] = {
        coords = vector4(1421.33, 3601.24, 34.85, 297.93),
        street = 'Algonquin Blvd',
        text = 'Sandy Shore'
    },
    ['paleto'] = {
        coords = vector4(-131.32, 6390.86, 31.5, 34.13),
        street = 'Paleto Blvd',
        text = 'Paleto Bay'
    }
}
