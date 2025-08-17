--[[
    QS-Fuelstations Configuration Guide:

    Welcome to the configuration file for the `qs-fuelstations` resource!
    This file allows you to customize and adapt the asset to your framework
    and server requirements with ease.

    Key Information:
    - Each significant configuration section is outlined in this guide.
    - Step-by-step instructions are provided for critical configurations to
      ensure smooth implementation.
    - Most settings are flexible and can be adjusted to meet your specific needs.

    Customization Locations:
    - Client configurations: Found in `client/custom/*`.
    - Server configurations: Found in `server/custom/*`.

    Important:
    Before making changes, it is highly recommended to review the official
    documentation. It provides detailed instructions and explanations for
    each configurable element.

    Resource Documentation:
    Visit the official documentation for a comprehensive guide:
    https://docs.quasar-store.com/information/welcome
]]

Config = Config or {}
Locales = Locales or {}

--[[
    Choose your preferred language:

    In this section, you can select the main language for your asset. We have a wide
    selection of default languages available, located in the locales/* folder.

    If your language is not listed, don't worry! You can easily create a new one
    by adding a new file in the locales folder and customizing it to your needs.

    🌐 Default languages available:
        'ar'     -- Arabic
        'bg'     -- Bulgarian
        'ca'     -- Catalan
        'cs'     -- Czech
        'da'     -- Danish
        'de'     -- German
        'el'     -- Greek
        'en'     -- English
        'es'     -- Spanish
        'fa'     -- Persian
        'fr'     -- French
        'hi'     -- Hindi
        'hu'     -- Hungarian
        'it'     -- Italian
        'ja'     -- Japanese
        'ko'     -- Korean
        'nl'     -- Dutch
        'no'     -- Norwegian
        'pl'     -- Polish
        'pt'     -- Portuguese
        'ro'     -- Romanian
        'ru'     -- Russian
        'sl'     -- Slovenian
        'sv'     -- Swedish
        'th'     -- Thai
        'tr'     -- Turkish
        'zh-CN'  -- Chinese (Simplified)
        'zh-TW'  -- Chinese (Traditional)

    After selecting your preferred language, be sure to save your changes and test
    the asset to ensure everything works as expected!
]]

local function dependencyCheck(data)
    for k, v in pairs(data) do
        if GetResourceState(k):find('started') ~= nil then
            return v
        end
    end
    return false
end

Config.Language = 'en' -- Set the language of the resource (e.g., 'en' for English, 'es' for Spanish).

--[[
    Framework Detection:

    This system automatically identifies whether you're using `qb-core`,
    `es_extended`, or `vrp`. If the resource names have been changed, manually
    update `Config.Framework` after modifying the relevant script files.

    Note: Avoid modifying this code unless necessary.
]]

local esxHas = GetResourceState('es_extended') == 'started'                          -- Check if 'es_extended' is running
local qbHas = GetResourceState('qb-core') == 'started'                               -- Check if 'qb-core' is running
local vrpHas = GetResourceState('vrp') == 'started'                                  -- Check if 'vrp' is running

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or vrpHas and 'vrpex' or 'esx' -- Auto-detect or fallback to 'esx'
Config.UseTarget = false                                                             -- Enables support for 'ox_target' and 'qb-target'
Config.EnableJerrycan = true                                                         -- Enable or disable jerrycan functions

--[[
    Blip Settings:

    This section manages the configuration of blips for gas stations on the map.
    You can choose to display all stations or only the nearest ones for better
    performance.

    Key Features:
    - `Config.ShowNearestStations`: When enabled, only the nearest gas stations
      will be visible, improving server optimization.
    - `Config.StationBlips`: Customize the appearance of the blips (sprite, scale, and color).

    Reference:
    For a complete list of blip options, visit:
    https://docs.fivem.net/docs/game-references/blips/
]]

Config.ShowNearestStations = true -- Display only the nearest gas stations for better performance

Config.StationBlips = {
    SetBlipSprite = 361, -- Sprite ID for the blip icon (gas station icon)
    SetBlipScale = 0.6,  -- Size of the blip on the map
    SetBlipColour = 81,  -- Color ID for the blip
    name = 'Gas Station' -- Name of the blip
}

---@type table<number, {name: string, coords: vector3, refuelCoords: vector3}>
Config.GasStations = {
    {
        name = 'Route 68 Gas Station',                       -- Name of the gas station
        coords = vec3(49.4187, 2778.793, 58.043),     -- Location of the gas station
        refuelCoords = vec3(39.785, 2794.281, 57.899) -- Refueling point coordinates
    },

    {
        name = 'Joshua Gas Station',
        coords = vec3(263.894, 2606.463, 44.983),
        refuelCoords = vec3(272.56, 2598.52, 44.58),
    },
    {
        name = 'Harmony Gas Station',
        coords = vec3(1039.958, 2671.134, 39.550),
        refuelCoords = vec3(1055.490478515625, 2663.85107421875, 39.5656509399414)
    },
    {
        name = '68 Custom\'s Gas Station',
        coords = vec3(1207.260, 2660.175, 37.899),
        refuelCoords = vec3(1203.96, 2642.59, 37.84)
    },
    {
        name = 'Rex\'s Gas Station',
        coords = vec3(2539.685, 2594.192, 37.944),
        refuelCoords = vec3(2526.481201171875, 2606.675048828125, 37.94485092163086)
    },
    {
        name = 'Senora Gas Station',
        coords = vec3(2679.858, 3263.946, 55.240),
        refuelCoords = vec3(2670.09, 3259.69, 55.24),
    },
    {
        name = 'Sandy Gas Station',
        coords = vec3(2005.055, 3773.887, 32.403),
        refuelCoords = vec3(1988.74, 3781.08, 32.18),
    },
    {
        name = 'Grapeseed Gas Station',
        coords = vec3(1687.156, 4929.392, 42.078),
        refuelCoords = vec3(1710.909423828125, 4939.63818359375, 42.08590316772461)
    },
    {
        name = 'Route 1 Gas Station',
        coords = vec3(1701.314, 6416.028, 32.763),
        refuelCoords = vec3(1695.46, 6428.0, 32.63),
    },
    {
        name = 'Paleto Gas Station',
        coords = vec3(179.857, 6602.839, 31.868),
    },
    {
        name = 'Paleto Bank Gas Station',
        coords = vec3(-94.4619, 6419.594, 31.489),
        refuelCoords = vec3(-91.0, 6396.47, 31.64),
    },
    {
        name = 'Zancudo Gas Station',
        coords = vec3(-2554.996, 2334.40, 33.078),
        refuelCoords = vec3(-2567.13, 2317.27, 33.22),
    },
    {
        name = 'N. Rockford Gas Station',
        coords = vec3(-1800.375, 803.661, 138.651),
        refuelCoords = vec3(-1830.18, 781.39, 138.33)
    },
    {
        name = 'Morningwood Gas Station',
        coords = vec3(-1437.622, -276.747, 46.207),
        refuelCoords = vec3(-1437.37, -259.18, 46.26),
    },
    {
        name = 'Great Ocean Gas Station',
        coords = vec3(-2096.243, -320.286, 13.168),
        refuelCoords = vec3(-2060.82080078125, -302.5645446777344, 13.1520938873291)
    },
    {
        name = 'Little Seoul Gas Station',
        coords = vec3(-724.619, -935.1631, 19.213),
        refuelCoords = vec3(-723.21, -909.07, 19.34)
    },
    {
        name = 'Uwu Gas Station',
        coords = vec3(-526.019, -1211.003, 18.184),
        refuelCoords = vec3(-520.42, -1225.82, 18.45),
    },
    {
        name = 'Grove St. Gas Station',
        coords = vec3(-70.2148, -1761.792, 29.534),
        refuelCoords = vec3(-57.77, -1774.39, 29.03),
    },
    {
        name = 'Strawberry Gas Station',
        coords = vec3(265.648, -1261.309, 29.292),
        refuelCoords = vec3(288.48, -1251.04, 29.44),
    },
    {
        name = 'Vespucci Gas Station',
        coords = vec3(819.653, -1028.846, 26.403),
        refuelCoords = vec3(812.8623657226562, -1041.6175537109375, 26.75194358825683)
    },
    {
        name = 'El Rancho Gas Station',
        coords = vec3(1208.951, -1402.567, 35.224),
        refuelCoords = vec3(1218.8662109375, -1388.71337890625, 35.18914031982422)
    },
    {
        name = 'Mirror Park Gas Station',
        coords = vec3(1181.381, -330.847, 69.316),
        refuelCoords = vec3(1175.43603515625, -313.91400146484375, 69.18193817138672)
    },
    {
        name = 'Vinewood Gas Station',
        coords = vec3(620.843, 269.100, 103.089),
        refuelCoords = vec3(636.351806640625, 255.8418121337891, 103.13734436035156)
    },
    {
        name = 'Palomino Station',
        coords = vec3(2581.321, 362.039, 108.468),
        refuelCoords = vec3(2561.66650390625, 346.0816955566406, 108.44479370117188)
    },
    {
        name = 'Davis Gas Station',
        coords = vec3(176.631, -1562.025, 29.263),
        refuelCoords = vec3(179.06649780273438, -1545.9722900390625, 29.1483211517334)
    },
    {
        name = 'Innocence Gas Station',
        coords = vec3(-319.292, -1471.715, 30.549),
        refuelCoords = vec3(-339.44183349609375, -1465.489501953125, 30.59231948852539)
    },
    {
        name = 'Airstrip Gas Station',
        coords = vec3(1784.324, 3330.55, 41.253),
        refuelCoords = vec3(1778.86, 3320.2, 41.42),
    }
}

--[[
    Fuel System Configuration:

    This section manages fuel prices, behaviors, and tank configurations.
    Adjust these settings to tailor the fuel system to your server's economy
    and gameplay mechanics.

    Key Configurations:
    - Pricing: Customize the cost of jerry cans and refueling.
    - Fuel Behaviors: Enable or disable specific features like throwing fuel or
      triggering explosions when breaking the cable.
    - Tank Models: Configure the models of fuel tanks, including Z offsets for
      accurate nozzle placement. Avoid adding custom models unless necessary,
      as the default ones cover most scenarios.

    Important:
    - If you enable `Config.AddExplosion`, ensure players are aware of the risks
      of breaking the wire while fueling.
    - Electric stations are included and customizable; add your models and settings
      carefully under `Config.TankModels` and `Config.ChargeStations`.
]]

local vehicleKeys = {
    ['qs-vehiclekeys'] = 'qs-vehiclekeys',
    ['qb-vehiclekeys'] = 'qb-vehiclekeys',
    ['F_RealCarKeysSystem'] = 'F_RealCarKeysSystem',
    ['fivecode_carkeys'] = 'fivecode_carkeys',
    ['glfp10_carkeys'] = 'glfp10_carkeys',
    ['mono_carkeys'] = 'mono_carkeys',
    ['ti_vehicleKeys'] = 'ti_vehicleKeys',
    ['vehicles_keys'] = 'vehicles_keys',
    ['wasabi_carlock'] = 'wasabi_carlock',
    ['xd_locksystem'] = 'xd_locksystem',
    ['qbx_vehiclekeys'] = 'qbx_vehiclekeys'
}

Config.Vehiclekeys = dependencyCheck(vehicleKeys) or 'none'


Config.PriceSymbol = '$' -- Money symbol

Config.JerryCanCost = 100 -- Cost of purchasing a jerry can
Config.JerryCanRefillCost = 50 -- Cost of refilling an existing jerry can
Config.JerryCanItem = true -- If true (ESX), jerry can is an item; if false, it's a weapon

Config.ThrowFuel = false -- Enable or disable throwing gasoline onto the ground
Config.ThrowFuelKey = 24 -- Key to throw gasoline (default: Left Mouse Button)

Config.CableLength = 3.5 -- Default cable length for refueling
Config.CableMaxLength = 7.0 -- Maximum cable length allowed
Config.AddExplosion = true -- Enable explosion if the wire is broken during refueling

Config.TankModels = {
    [`prop_gas_pump_1d`] = {
        offsetZ = 2.3,
    },
    [`prop_gas_pump_1a`] = {
        offsetZ = 2.3,
    },
    [`prop_gas_pump_1b`] = {
        offsetZ = 2.3,
    },
    [`prop_gas_pump_1c`] = {
        offsetZ = 2.3,
    },
    [`prop_vintage_pump`] = {
        offsetZ = 1.8,
    },
    [`prop_gas_pump_old2`] = {
        offsetZ = 1.6,
    },
    [`prop_gas_pump_old3`] = {
        offsetZ = 1.6,
    },
    [`electric_charger`] = {
        offsetZ = 0.8,
        electric = true,
        nozle = 'electric_nozzle'
    }
}

Config.ChargeStations = { -- Charging stations for electric vehicles
    {
        coords = vector4(175.9, -1546.65, 28.26, 224.29),
        model = `electric_charger`
    },
    {
        coords = vector4(-51.09, -1767.02, 28.26, 47.16),
        model = `electric_charger`
    },
    {
        coords = vector4(-514.06, -1216.25, 17.46, 66.29),
        model = `electric_charger`
    },
    {
        coords = vector4(-704.64, -935.71, 18.21, 90.02),
        model = `electric_charger`
    },
    {
        coords = vector4(279.79, -1237.35, 28.35, 181.07),
        model = `electric_charger`
    },
    {
        coords = vector4(834.27, -1028.7, 26.16, 88.39),
        model = `electric_charger`
    },
    {
        coords = vector4(1194.41, -1394.44, 34.37, 270.3),
        model = `electric_charger`
    },
    {
        coords = vector4(1168.38, -323.56, 68.3, 280.22),
        model = `electric_charger`
    },
    {
        coords = vector4(633.64, 247.22, 102.3, 60.29),
        model = `electric_charger`
    },
    {
        coords = vector4(-1420.51, -278.76, 45.26, 137.35),
        model = `electric_charger`
    },
    {
        coords = vector4(-2080.61, -338.52, 12.26, 352.21),
        model = `electric_charger`
    },
    {
        coords = vector4(-98.12, 6403.39, 30.64, 141.49),
        model = `electric_charger`
    },
    {
        coords = vector4(181.14, 6636.17, 30.61, 179.96),
        model = `electric_charger`
    },
    {
        coords = vector4(1714.14, 6425.44, 31.79, 155.94),
        model = `electric_charger`
    },
    {
        coords = vector4(1703.57, 4937.23, 41.08, 55.74),
        model = `electric_charger`
    },
    {
        coords = vector4(1994.54, 3778.44, 31.18, 215.25),
        model = `electric_charger`
    },
    {
        coords = vector4(1770.86, 3337.97, 40.43, 301.1),
        model = `electric_charger`
    },
    {
        coords = vector4(2690.25, 3265.62, 54.24, 58.98),
        model = `electric_charger`
    },
    {
        coords = vector4(1208.26, 2649.46, 36.85, 222.32),
        model = `electric_charger`
    },
    {
        coords = vector4(1033.32, 2662.91, 38.55, 95.38),
        model = `electric_charger`
    },
    {
        coords = vector4(267.96, 2599.47, 43.69, 5.8),
        model = `electric_charger`
    },
    {
        coords = vector4(50.21, 2787.38, 56.88, 147.2),
        model = `electric_charger`
    },
    {
        coords = vector4(-2570.04, 2317.1, 32.22, 21.29),
        model = `electric_charger`
    },
    {
        coords = vector4(2545.81, 2586.18, 36.94, 83.74),
        model = `electric_charger`
    },
    {
        coords = vector4(2561.24, 357.3, 107.62, 266.65),
        model = `electric_charger`
    },
    {
        coords = vector4(-1819.22, 798.51, 137.16, 315.13),
        model = `electric_charger`
    },
    {
        coords = vector4(-341.63, -1459.39, 29.76, 271.73),
        model = `electric_charger`
    },
    -- Gabz Auto:
    {
         coords = vector4(837.7554, -793.623, 25.23, 105.22),
         model = `electric_charger`
     },
}

--[[
    Charging and Offset Configuration:

    This section defines the charging rate and custom offsets for vehicles.
    Customize these settings to adjust charging behavior and nozzle placement
    for specific vehicle models.

    Key Configurations:
    - `Config.ChargeRate`: Determines the charge speed (value is charge per second).
      Affects how long it takes to fully charge from 0% to 100%.
    - `Config.CustomOffsets`: Specifies nozzle offsets for certain vehicles. These
      offsets determine the precise attachment point for refueling or charging.

    Notes:
    - Offsets are defined as `vec3(x, y, z)`:
      - X: Left/Right adjustment.
      - Y: Front/Rear adjustment.
      - Z: Top/Bottom adjustment.
    - Add custom offsets for any vehicles not listed, ensuring accurate attachment.
]]

Config.ChargeRate = 1.8 -- Charging rate per second (0-100% in approximately 56 seconds)

Config.CustomOffsets = {
    ['baller'] = {           -- Offsets for the Baller model
        vec3(2, 1, 0),       -- First nozzle position
        vec3(0.5, 1, 0)      -- Second nozzle position
    },
    ['guardian'] = {         -- Offsets for the Guardian model
        vec3(-1.3, -1.0, 0), -- First nozzle position
        vec3(1.3, -1.0, 0)   -- Second nozzle position
    },
    -- Helicopter models
    ['md902'] = {               -- Offsets for the MD902 helicopter
        vec3(-0.9, -1.8, 0),    -- Left nozzle position
        vec3(0.9, -1.8, 0)      -- Right nozzle position
    },
    ['polmav'] = {              -- Offsets for the Polmav helicopter
        vec3(-0.65, -1.2, 0.0), -- Left nozzle position
        vec3(0.65, -1.2, 0.0)   -- Right nozzle position
    },
    ['ec135med'] = {
        vec3(-0.9, -1.3, 0.5),
        vec3(0.9, -1.3, 0.5)
    },
    ['swift'] = {
        vec3(-0.9, -1.5, 0.8),
        vec3(0.9, -1.5, 0.8)
    },
    ['swift2'] = {
        vec3(-0.9, -1.5, 0.8),
        vec3(0.9, -1.5, 0.8)
    },
    ['conada'] = {
        vec3(-0.9, -1.5, -0.2),
        vec3(0.9, -1.5, -0.2)
    },
    ['conada2'] = {
        vec3(-0.9, -1.5, -0.2),
        vec3(0.9, -1.5, -0.2)
    },
    ['havok'] = {
        vec3(-0.4, -0.5, -0.3),
        vec3(0.4, -0.5, -0.3)
    },
    ['volatus'] = {
        vec3(-0.9, -1.3, -0.1),
        vec3(0.9, -1.3, -0.1)
    },
    ['maverick'] = {
        vec3(-1.0, -1.6, 0.6),
        vec3(1.0, -1.6, 0.6)
    },
    ['frogger'] = {
        vec3(-0.9, -0.75, 0.7),
        vec3(0.9, -0.75, 0.7)
    },
    ['frogger2'] = {
        vec3(-0.9, -0.75, 0.7),
        vec3(0.9, -0.75, 0.7)
    },
    ['akula'] = {
        vec3(-1.35, 1.8, -0.4),
        vec3(1.35, 1.8, -0.4)
    },
    ['hunter'] = {
        vec3(-1.25, 1.8, -0.9),
        vec3(1.25, 1.8, -0.9)
    },
    ['valkyrie'] = {
        vec3(-1.10, -1.0, -0.2),
        vec3(1.10, -1.0, -0.2)
    },
    ['savage'] = {
        vec3(-0.9, -2.7, 0.2),
        vec3(0.9, -2.7, 0.2)
    },
    ['skylift'] = {
        vec3(-1.50, 3.3, -1.5),
        vec3(1.50, 3.3, -1.5)
    },
    ['cargobob'] = {
        vec3(-1.35, -2.7, -0.2),
        vec3(1.35, -2.7, -0.2)
    },
    ['cargobob2'] = {
        vec3(-1.35, -2.7, -0.2),
        vec3(1.35, -2.7, -0.2)
    },
    ['cargobob3'] = {
        vec3(-1.35, -2.7, -0.2),
        vec3(1.35, -2.7, -0.2)
    },
    ['buzzard'] = {
        vec3(-0.8, -1.2, 0.6),
        vec3(0.8, -1.2, 0.6)
    },
    ['buzzard2'] = {
        vec3(-0.8, -1.2, 0.6),
        vec3(0.8, -1.2, 0.6)
    },
    ['seasparrow3'] = {
        vec3(-0.8, -1.2, 0.0),
        vec3(0.8, -1.2, 0.0)
    },
    ['svolito'] = {
        vec3(-0.82, -2.3, -0.4),
        vec3(0.82, -2.3, -0.4)
    },
    ['svolito2'] = {
        vec3(-0.82, -2.3, -0.4),
        vec3(0.82, -2.3, -0.4)
    },
    ['sparrow'] = {
        vec3(-0.7, -0.1, 0),
        vec3(0.7, -0.1, 0)
    },
    ['sparrow2'] = {
        vec3(-0.7, -0.1, 0),
        vec3(0.7, -0.1, 0)
    },
    ['sparrow3'] = {
        vec3(-0.7, -0.1, 0),
        vec3(0.7, -0.1, 0)
    },
    ['annihl'] = {
        vec3(-1.0, -3.0, 0.4),
        vec3(1.0, -3.0, 0.4)
    },
    ['annihlator2'] = {
        vec3(-1.26, -3.5, 0.55),
        vec3(1.26, -3.5, 0.55)
    },
    --Boats
    ['avisa'] = {
        vec3(-0.725, -2.0, 1.125),
        vec3(0.725, -2.0, 1.125)
    },
    ['submersible'] = {
        vec3(-1.55, -1.5, 1.3),
        vec3(1.55, -1.5, 1.3)
    },
    ['submersible2'] = {
        vec3(0.0, 0.0, 0.0),
        vec3(1.55, -1.5, 1.3)
    },
    ['predator'] = {
        vec3(-1.51, -4.0, 0.68),
        vec3(1.51, -4.0, 0.68)
    },
    ['tug'] = {
        vec3(-3.2, -3.65, 1.5),
        vec3(3.2, -3.65, 1.5)
    },
    ['toro'] = {
        vec3(-1.45, -1.75, 0.70),
        vec3(1.45, -1.75, 0.7)
    },
    ['toro2'] = {
        vec3(-1.45, -1.75, 0.70),
        vec3(1.45, -1.75, 0.7)
    },
    ['tropic'] = {
        vec3(-1.2, 0.5, 0.65),
        vec3(1.2, 0.5, 0.65)
    },
    ['tropic2'] = {
        vec3(-1.2, 0.5, 0.65),
        vec3(1.2, 0.5, 0.65)
    },
    ['longfin'] = {
        vec3(-1.6, 0.5, 0.75),
        vec3(1.6, 0.5, 0.75)
    },
    ['speeder'] = {
        vec3(-1.4, -2, 0.8),
        vec3(1.4, -2, 0.8)
    },
    ['speeder2'] = {
        vec3(-1.4, -2, 0.8),
        vec3(1.4, -2, 0.8)
    },
    ['suntrap'] = {
        vec3(-1.25, 0.0, 0.57),
        vec3(1.25, 0.0, 0.57)
    },
    ['squalo'] = {
        vec3(-1.45, 0.0, 0.57),
        vec3(1.45, 0.0, 0.57)
    },
    ['seashark'] = {
        vec3(-0.4, 0.8, 0.8),
        vec3(0.4, 0.8, 0.8)
    },
    ['seashark2'] = {
        vec3(-0.4, 0.8, 0.8),
        vec3(0.4, 0.8, 0.8)
    },
    ['seashark3'] = {
        vec3(-0.4, 0.8, 0.8),
        vec3(0.4, 0.8, 0.8)
    },
    ['marquis'] = {
        vec3(-2.15, 0.0, 0.93),
        vec3(2.15, 0.0, 0.93)
    },
    ['jetmax'] = {
        vec3(-1.25, -3.0, 0.55),
        vec3(1.25, -3.0, 0.55)
    },
    ['dinghy'] = {
        vec3(-0.75, -3.0, 0.8),
        vec3(0.75, -3.0, 0.8)
    },
    ['dinghy2'] = {
        vec3(-0.75, -3.0, 0.8),
        vec3(0.75, -3.0, 0.8)
    },
    ['dinghy3'] = {
        vec3(-0.75, -3.0, 0.8),
        vec3(0.75, -3.0, 0.8)
    },
    ['dinghy4'] = {
        vec3(-0.75, -3.0, 0.8),
        vec3(0.75, -3.0, 0.8)
    },
    ['smallboat'] = {
        vec3(-0.75, -2.6, 0.5),
        vec3(0.75, -2.6, 0.5)
    },
    ['largeboat'] = {
        vec3(-2.2, -3.5, 0.8),
        vec3(2.2, -3.5, 0.8)
    },
    ['hillboaty'] = {
        vec3(-1.2, -1.2, 0.8),
        vec3(1.2, -1.2, 0.8)
    },
    --Planes
    ['seabreeze'] = {
        vec3(-0.7, -0.1, 0.5),
        vec3(0.7, -0.1, 0.5)
    },
    ['microlight'] = {
        vec3(-0.4, -0.75, 0.1),
        vec3(0.4, -0.75, 0.1)
    },
    ['nimbus'] = {
        vec3(-1.0, 2.5, -0.7),
        vec3(1.0, 2.5, -0.7)
    },
    ['luxor2'] = {
        vec3(-1.0, 0.5, -0.4),
        vec3(1.0, 0.5, -0.4)
    },
    ['velum2'] = {
        vec3(-0.9, 2.0, -0.3),
        vec3(0.9, 2.0, -0.3)
    },
    ['dodo'] = {
        vec3(-0.7, 1.4, 0.3),
        vec3(0.7, 1.4, 0.3)
    },
    ['vestra'] = {
        vec3(-0.68, 2.65, 0.12),
        vec3(0.68, 2.65, 0.12)
    },
    ['velum'] = {
        vec3(-0.9, 2.0, -0.3),
        vec3(0.9, 2.0, -0.3)
    },
    ['shamal'] = {
        vec3(-1.0, 0.5, -0.4),
        vec3(1.0, 0.5, -0.4)
    },
    ['mammatus'] = {
        vec3(-0.8, 2.4, 0.5),
        vec3(0.8, 2.4, 0.5)
    },
    ['stunt'] = {
        vec3(-0.65, 1.4, 0.2),
        vec3(0.65, 1.4, 0.2)
    },
    ['luxor'] = {
        vec3(-1.0, 0.5, -0.4),
        vec3(1.0, 0.5, -0.4)
    },
    ['duster'] = {
        vec3(-0.71, 2.4, -0.1),
        vec3(0.71, 2.4, -0.1)
    },
    ['cuban800'] = {
        vec3(-0.71, 2.4, -0.1),
        vec3(0.71, 2.4, -0.1)
    },
    -- Add more vehicles here.
}

--[[
    Vehicle and Fuel Configuration:

    This section allows you to configure vehicle fuel consumption rates,
    specify which vehicle classes will experience fuel decay, and set up
    fuel prices for different fuel types. Additionally, you can define a list
    of vehicles that are exempt from fuel decay.

    Key Configurations:
    - `Config.VehiclesClasses`: Sets fuel consumption multipliers for each
      vehicle class. A value of `1.0` means standard consumption, while `0.0`
      disables fuel decay for that class (e.g., Cycles).
    - `Config.FuelConsumption`: Defines consumption rates based on fuel type
      (petrol, diesel, or electric). Adjust these values to balance gameplay.
    - `Config.FuelPrices`: Sets manual fuel prices or fetches them dynamically
      from an API using `Config.ApiToken`.

    Notes:
    - Restarting the script won't update the fuel level for vehicles currently
      occupied by players. A new vehicle spawn is required to reflect changes.
    - For dynamic fuel pricing via API, ensure `Config.ApiToken` is valid. If
      disabled, fuel prices can be managed manually in the configuration.

    References:
    - API for dynamic pricing: https://collectapi.com/api/gasPrice/gas-prices-api
]]

Config.VehiclesClasses = {
    [0] = 1.0,  -- Compacts
    [1] = 1.0,  -- Sedans
    [2] = 1.0,  -- SUVs
    [3] = 1.0,  -- Coupes
    [4] = 1.0,  -- Muscle
    [5] = 1.0,  -- Sports Classics
    [6] = 1.0,  -- Sports
    [7] = 1.0,  -- Super
    [8] = 1.0,  -- Motorcycles
    [9] = 1.0,  -- Off-road
    [10] = 1.0, -- Industrial
    [11] = 1.0, -- Utility
    [12] = 1.0, -- Vans
    [13] = 0.0, -- Cycles
    [14] = 1.0, -- Boats
    [15] = 1.0, -- Helicopters
    [16] = 1.0, -- Planes
    [17] = 1.0, -- Service
    [18] = 1.0, -- Emergency
    [19] = 1.0, -- Military
    [20] = 1.0, -- Commercial
    [21] = 1.0, -- Trains
}


Config.FuelConsumptionRate = 10.0 -- Global fuel consumption rate (default: 10.0) (https://docs.fivem.net/natives/?_0x845F3E5C)

Config.FuelConsumption = {        -- Fuel consumption rates per fuel type
    ['petrol'] = 1.0,            -- Standard petrol consumption
    ['diesel'] = 0.1,             -- Reduced consumption for diesel
    ['electric'] = 5.0            -- Increased consumption for electric vehicles
}

Config.ApiToken = 'apikey 4xIJUdjYld3WlZ3xwe3lx3:5SUseocIItXTzBoDNb2Xcx' -- API key for dynamic fuel pricing
Config.FuelPrices = {                                                    -- Manual fuel prices (used if API is disabled)
    ['petrol'] = 5.0,                                                    -- Petrol price per unit
    ['diesel'] = 10.0,                                                   -- Diesel price per unit
    ['electric'] = 5.0                                                   -- Electric charge price per unit
}

--[[
    Vehicle Fuel Type and Consumption Configuration:

    This section configures fuel types and consumption rates for specific vehicle models.
    By default, `petrol` is assigned to all vehicles unless otherwise specified in the
    `model_fuel_types.json` file. Using the JSON file for configuration helps maintain
    organization and avoids clutter in the Lua script.

    Key Features:
    - `Config.VehicleFuelTypesByModel`: Automatically assigns fuel types and consumption
      rates based on model data in `model_fuel_types.json`.
    - `Config.VehiclesFuelUsage`: Defines fuel usage rates based on throttle intensity.
      The higher the throttle, the greater the fuel consumption.
    - `Config.VehiclesBlacklist`: Excludes specific vehicles from the fuel system. These
      vehicles won't consume fuel.

    Notes:
    - For accurate consumption, set `fPetrolConsumptionRate` in the vehicle's `handling.meta` file.
    - If the script is restarted, vehicles currently spawned with a modified configuration
      will require deletion and respawning to apply changes.

    Reference:
    - Fuel consumption handling: https://docs.fivem.net/docs/scripting-manual/using-new-game-features/fuel-consumption/
]]

Config.VehicleFuelTypesByModel = {}
local MODEL_FUEL_TYPES = json.decode(LoadResourceFile(GetCurrentResourceName(), 'model_fuel_types.json'))
for k, v in pairs(MODEL_FUEL_TYPES) do
    Config.VehicleFuelTypesByModel[joaat(v.model)] = {
        model = v.model,                                  -- Vehicle model name
        fuelType = v.fuel_type,                           -- Fuel type assigned (e.g., petrol, diesel, electric)
        consumption = Config.FuelConsumption[v.fuel_type] -- Consumption rate for the fuel type
    }
end

Config.VehiclesFuelUsage = { -- Fuel usage rates based on throttle levels
    [1.0] = 0.6,             -- Full throttle
    [0.9] = 0.5,             -- 90% throttle
    [0.8] = 0.4,             -- 80% throttle
    [0.7] = 0.45,            -- 70% throttle
    [0.6] = 0.40,            -- 60% throttle
    [0.5] = 0.35,            -- 50% throttle
    [0.4] = 0.3,             -- 40% throttle
    [0.3] = 0.25,            -- 30% throttle
    [0.2] = 0.2,             -- 20% throttle
    [0.1] = 0.1,             -- 10% throttle
    [0.0] = 0.0,             -- Idle
}

Config.VehiclesBlacklist = { -- Vehicles excluded from the fuel system
    -- 't20',   -- Example vehicle model
    -- 'zentorno',
    -- 'other'
}

--[[
    Fuel Delivery Job Configuration:

    This section configures the job system for players to refuel gas stations.
    Players can take on this task as a job to earn money or enable a more
    dynamic experience by tracking fuel levels at stations.

    Key Features:
    - `Config.EnableJob`: Enables the job system. Players must refuel stations
      to keep them operational.
    - `Config.EveryStationHasFuelLevel`: Tracks fuel levels at each station.
      Stations run out of fuel if not refueled by players.
    - Job mechanics include vehicle spawning, job payouts, and customizable
      delivery options.

    Notes:
    - Players cannot work if all stations are full.
    - Fuel levels decrease when players take a jerrycan or refuel their vehicles.
    - Customize blips, vehicles, and payout settings to suit your server.
]]

Config.EnableJob = false                -- Enable or disable the fuel delivery job system
Config.EveryStationHasFuelLevel = false -- Enable fuel level tracking for each station
Config.JerryCanStationLevel = 20       -- Fuel level reduction when a jerrycan is taken
Config.DivideStationLevel = 2          -- Higher value = slower station fuel depletion

-- Ensure compatibility: Disable fuel level tracking if the job system is disabled
if not Config.EnableJob then
    Config.EveryStationHasFuelLevel = false
    print('EveryStationHasFuelLevel is disabled because EnableJob is disabled.')
end

-- Job Blip Settings
Config.JobBlip = {
    title = 'Fuel Delivery',                  -- Blip title
    color = 12,                               -- Blip color
    coords = vec3(1721.87, -1557.67, 111.65), -- Blip location
    id = 477                                  -- Blip ID for display
}

Config.AddStationFuelLevel = { 10, 20 } -- Random fuel level increase (min and max) per delivery

-- Job NPC Settings
Config.PedType = 'a_m_m_ktown_01'                             -- Ped model for the job NPC
Config.PedCoords = vector4(1721.87, -1557.67, 111.65, 243.12) -- NPC location and heading

-- Job Vehicle and Locations
Config.TruckSpawnLocation = vec4(1733.08, -1556.68, 112.66, 252.0)  -- Truck spawn location
Config.TankerSpawnLocation = vec4(1738.34, -1530.89, 112.65, 252.0) -- Tanker spawn location
Config.RefuelLocation = vec4(1688.59, -1460.29, 111.65, 254.5)      -- Refuel station location

Config.TruckToSpawn = 'packer'                                      -- Truck model (must pull large trailers)
Config.TrailerToSpawn = 'tanker2'                                   -- Tanker model (must be a tanker variant for proper rope placement)

-- Job Payment Settings
Config.PayPerFueling = math.random(1200, 2500) -- Payment per refuel, multiplied by the number of stations serviced
Config.PayType = 'bank'                        -- Payment method: 'bank' or 'money'

-- Vehicle Costs
Config.TruckPrice = 5000 -- Cost to rent a truck for the job
Config.TankPrice = 2000  -- Cost to rent a tanker for players using their own truck

-- Delivery Mechanics
Config.MaxFuelDeliveries = 5  -- Maximum deliveries before refueling is required
Config.RefuelDuration = 15000 -- Duration (in ms) to refuel a station

--[[
    Debug Mode Configuration:

    Enabling debug mode allows developers to receive constant system
    outputs and information to better understand how the resource operates.
    This is useful for troubleshooting and development but is not recommended
    for live server environments.

    Key Features:
    - `Config.Debug`: Enables general debug information for the resource.
    - `Config.ZoneDebug`: Provides detailed debug information for specific zones.
    - If `Config.Debug` is enabled, certain configurations (e.g., `Config.RefuelDuration`)
      are adjusted for faster testing.

    Note:
    Use debug mode only during development to avoid excessive console output.
]]

Config.Debug = false     -- Enable or disable general debug mode
Config.ZoneDebug = false -- Enable detailed zone-specific debug information

-- Adjustments for debug mode
if Config.Debug then
    Config.RefuelDuration = 100 -- Refuel duration reduced for faster testing in debug mode
end
