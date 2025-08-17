Config = Config or {}
Locales = Locales or {}

--[[ 
    Choose your preferred language!

    In this section, you can select the main language for your asset. We have a wide
    selection of default languages available, located in the locales/* folder.

    If your language is not listed, don't worry! You can easily create a new one
    by adding a new file in the locales folder and customizing it to your needs.

    Default languages available:
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
        'he'     -- Hebrew
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

Config.Language = 'en'

--[[
    Framework configuration and tools of your server!
    Please read the usable options carefully, in case they
    are not here you can add more or modify the default ones
    in the client/custom/* and server/custom/* directories.
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
local qbxHas = GetResourceState('qbx_core') == 'started'

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or qbxHas and 'qbx' or 'esx'
Config.UseTarget = true -- true or false

--[[
    Extra asset configuration, fully compatible with qb and esx, if you use this remove qb-shops
]]

Config.ShopsInvJsonFile = './json/shops-inventory.json'
Config.TruckDeposit = 125
Config.MaxDeliveries = 20
Config.DeliveryPrice = 500
Config.RewardItem = 'cryptostick'
Config.Fuel = 'qs-fuelstations'

Config.EnableDelivery = false
Config.DeliveryText = '[E] - Interact'
Config.DeliveryLocations = {
    ['main'] = { label = 'GO Postal', coords = vector4(69.0862, 127.6753, 79.2123, 156.7736) },
    ['vehicleWithdraw'] = vector4(71.9318, 120.8389, 79.0823, 160.5110),
    ['vehicleDeposit'] = vector3(62.7282, 124.9846, 79.0926),
    ['stores'] = {} -- auto generated
}

Config.Vehicles = {
    ['boxville2'] = { ['label'] = 'Boxville StepVan', ['cargodoors'] = { [0] = 2, [1] = 3 }, ['trunkpos'] = 1.5 },
}

Config.Products = {
    ['normal'] = {
        { name = 'tosti',         price = 15,   amount = 50 },
        { name = 'water_bottle',  price = 15,   amount = 50 },
        { name = 'kurkakola',     price = 15,   amount = 50 },
        { name = 'twerks_candy',  price = 15,   amount = 50 },
        { name = 'snikkel_candy', price = 15,   amount = 50 },
        { name = 'sandwich',      price = 15,   amount = 50 },
        { name = 'beer',          price = 50,   amount = 50 },
        { name = 'whiskey',       price = 50,  amount = 50 },
        { name = 'vodka',         price = 50,  amount = 50 },
        { name = 'bandage',       price = 150, amount = 50 },
        { name = 'medikit',       price = 500, amount = 50 },
        { name = 'lighter',       price = 25,   amount = 50 },
        { name = 'cigarette', price = 10,   amount = 50 },
    },
    ['clicklovers'] = {
        { name = 'phone',         price = 850,   amount = 50 },
        { name = 'truckingtablet',  price = 750,   amount = 50 },
    },
     ['polmech'] = {
        { name = 'repair_kit',         price = 450,   amount = 50 },
    },
    ['smoke'] = {
        { name = 'joint',         price = 50,   amount = 50 },
        { name = 'cigar',  price = 75,   amount = 50 },
        { name = 'vape',  price = 100,   amount = 50 },
        { name = 'vape_battery',  price = 20,   amount = 50 },
        { name = 'vape_flavour_capsule',  price = 25,   amount = 50 },
        { name = 'bong',  price = 300,   amount = 50 },
        { name = 'weed_nugget',  price = 75,   amount = 50 },
        { name = 'bong_water',  price = 20,   amount = 50 },
        { name = 'lighter',  price = 25,   amount = 50 },
    },
    ['liquor'] = {
        { name = 'beer',    price = 15,  amount = 50 },
        { name = 'whiskey', price = 50, amount = 50 },
        { name = 'vodka',   price = 50, amount = 50 },
        { name = 'lighter',  price = 25,   amount = 50 },
        { name = 'cigarette', price = 10,   amount = 50 },
    },
    ['hardware'] = {
        { name = 'weapon_wrench',     price = 750, amount = 250 },
        { name = 'weapon_hammer',     price = 750, amount = 250 },
        { name = 'duct_tape',         price = 100, amount = 50 },
        { name = 'radio',             price = 500, amount = 50 },
        { name = 'binoculars',        price = 50,  amount = 50 },
    },
    ['weedshop'] = {
        { name = 'joint',          price = 10,  amount = 50 },
        { name = 'weapon_poolcue', price = 100, amount = 50 },
        { name = 'weed_nutrition', price = 20,  amount = 50 },
        { name = 'empty_weed_bag', price = 2,   amount = 1000 },
        { name = 'rolling_paper',  price = 2,   amount = 1000 },
    },
    ['gearshop'] = {
        { name = 'diving_gear', price = 2500, amount = 10 },
        { name = 'jerry_can',   price = 200,  amount = 50 },
    },
    ['leisureshop'] = {
        { name = 'parachute',   price = 2500, amount = 10 },
        { name = 'binoculars',  price = 50,   amount = 50 },
        { name = 'diving_gear', price = 2500, amount = 10 },
        { name = 'diving_fill', price = 500,  amount = 10 },
    },
    ['weapons'] = {
        { name = 'weapon_knife',         price = 250,  amount = 250 },
        { name = 'weapon_bat',           price = 250,  amount = 250 },
        { name = 'weapon_hatchet',       price = 250,  amount = 250 },
        { name = 'pistol_ammo',          price = 250,  amount = 250, requiredLicense = 'weapon' },
        { name = 'weapon_pistol',        price = 15000, amount = 5,   requiredLicense = 'weapon' },
        { name = 'weapon_snspistol',     price = 12500, amount = 5,   requiredLicense = 'weapon' },
        --{ name = 'weapon_vintagepistol', price = 4000, amount = 5,   requiredLicense = 'weapon' },
    },
    ['blackmarket'] = {
        { name = 'security_card_01',  price = 5000, amount = 50 },
        { name = 'security_card_02',  price = 5000, amount = 50 },
        { name = 'advanced_lockpick', price = 5000, amount = 50 },
        { name = 'electronickit',     price = 5000, amount = 50 },
        { name = 'gatecrack',         price = 5000, amount = 50 },
        { name = 'thermite',          price = 5000, amount = 50 },
        { name = 'trojan_usb',        price = 5000, amount = 50 },
        { name = 'drill',             price = 5000, amount = 50 },
        { name = 'radioscanner',      price = 5000, amount = 50 },
        { name = 'cryptostick',       price = 5000, amount = 50 },
        { name = 'joint',             price = 5000, amount = 50 },
        { name = 'cokebaggy',         price = 5000, amount = 50 },
        { name = 'crack_baggy',       price = 5000, amount = 50 },
        { name = 'xtcbaggy',          price = 5000, amount = 50 },
        { name = 'coke_brick',        price = 5000, amount = 50 },
        { name = 'weed_brick',        price = 5000, amount = 50 },
        { name = 'coke_small_brick',  price = 5000, amount = 50 },
        { name = 'oxy',               price = 5000, amount = 50 },
        { name = 'meth',              price = 5000, amount = 50 },
        { name = 'weed_whitewidow',   price = 5000, amount = 50 },
        { name = 'weed_skunk',        price = 5000, amount = 50 },
        { name = 'weed_purplehaze',   price = 5000, amount = 50 },
        { name = 'weed_ogkush',       price = 5000, amount = 50 },
        { name = 'weed_amnesia',      price = 5000, amount = 50 },
        { name = 'weed_ak47',         price = 5000, amount = 50 },
        { name = 'markedbills',       price = 5000, amount = 50, info = { worth = 5000 } },
    },
    ['prison'] = {
        { name = 'sandwich',     price = 15, amount = 50 },
        { name = 'water_bottle', price = 15, amount = 50 },
    },
    ['police'] = {
        { name = 'weapon_pistol',       price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_PI_FLSH', label = 'Flashlight' } } } },
        { name = 'weapon_stungun',      price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        { name = 'weapon_pumpshotgun',  price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        { name = 'weapon_smg',          price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_SCOPE_MACRO_02', label = '1x Scope' }, { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        { name = 'weapon_carbinerifle', price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' }, { component = 'COMPONENT_AT_SCOPE_MEDIUM', label = '3x Scope' } } } },
        { name = 'weapon_nightstick',   price = 0, amount = 50 },
        { name = 'weapon_flashlight',   price = 0, amount = 50 },
        { name = 'pistol_ammo',         price = 0, amount = 50 },
        { name = 'smg_ammo',            price = 0, amount = 50 },
        { name = 'shotgun_ammo',        price = 0, amount = 50 },
        { name = 'rifle_ammo',          price = 0, amount = 50 },
        { name = 'handcuffs',           price = 0, amount = 50 },
        { name = 'empty_evidence_bag',  price = 0, amount = 50 },
        { name = 'police_stormram',     price = 0, amount = 50 },
        { name = 'armor',               price = 0, amount = 50 },
        { name = 'radio',               price = 0, amount = 50 },
        { name = 'heavyarmor',          price = 0, amount = 50 },
    },
    ['ambulance'] = {
        { name = 'radio',                   price = 0, amount = 50 },
        { name = 'bandage',                 price = 0, amount = 50 },
        { name = 'painkillers',             price = 0, amount = 50 },
        { name = 'firstaid',                price = 0, amount = 50 },
        { name = 'weapon_flashlight',       price = 0, amount = 50 },
        { name = 'weapon_fireextinguisher', price = 0, amount = 50 },
    },
    ['mechanic'] = {
        { name = 'veh_toolbox',       price = 5000, amount = 50 },
        { name = 'veh_armor',         price = 5000, amount = 50 },
        { name = 'veh_brakes',        price = 5000, amount = 50 },
        { name = 'veh_engine',        price = 5000, amount = 50 },
        { name = 'veh_suspension',    price = 5000, amount = 50 },
        { name = 'veh_transmission',  price = 5000, amount = 50 },
        { name = 'veh_turbo',         price = 5000, amount = 50 },
        { name = 'veh_interior',      price = 5000, amount = 50 },
        { name = 'veh_exterior',      price = 5000, amount = 50 },
        { name = 'veh_wheels',        price = 5000, amount = 50 },
        { name = 'veh_neons',         price = 5000, amount = 50 },
        { name = 'veh_xenons',        price = 5000, amount = 50 },
        { name = 'veh_tint',          price = 5000, amount = 50 },
        { name = 'veh_plates',        price = 5000, amount = 50 },
        { name = 'nitrous',           price = 5000, amount = 50 },
        { name = 'tunerlaptop',       price = 5000, amount = 50 },
        { name = 'repairkit',         price = 5000, amount = 50 },
        { name = 'advancedrepairkit', price = 5000, amount = 50 },
        { name = 'tirerepairkit',     price = 5000, amount = 50 },
    }
}

Config.Locations = {
    -- 24/7 Locations
    ['247supermarket'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(25.01, -1346.85, 29.50, 272),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(26.45, -1315.51, 29.62, 0.07),
        ['useStock'] = true,
        ['account'] = 'money', -- Set your account here
        ['distance'] = 5.0,
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket2'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3039.68, 584.87, 7.91, 22),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3047.95, 590.71, 7.62, 19.53),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket3'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3242.97, 1000.61, 12.83, 357.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3245.76, 1005.25, 12.83, 269.45),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket4'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1728.64, 6415.57, 35.04, 250),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1741.76, 6419.61, 35.04, 6.83),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket5'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1960.46, 3740.48, 32.34, 301.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1963.81, 3750.09, 32.26, 302.46),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket6'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(548.591, 2670.85, 42.16, 99.39),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(541.54, 2663.53, 42.17, 120.51),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket7'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2677.9, 3280.15, 55.24, 335.08),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2662.19, 3264.95, 55.24, 168.55),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket8'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2556.76, 381.39, 108.62, 356.67),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2553.24, 399.73, 108.56, 344.86),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['247supermarket9'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(373.27, 326.98, 103.57, 253.73),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(379.97, 357.3, 102.56, 26.42),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- LTD Gasoline Locations
    ['ltdgasoline'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-47.02, -1758.23, 29.42, 45.05),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-40.51, -1747.45, 29.29, 326.39),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['ltdgasoline2'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-706.06, -913.97, 19.22, 88.04),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-702.89, -917.44, 19.21, 181.96),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['ltdgasoline3'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-1820.02, 794.03, 138.09, 135.45),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1829.29, 801.49, 138.41, 41.39),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['ltdgasoline4'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1164.71, -322.94, 69.21, 101.72),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1160.62, -312.06, 69.28, 3.77),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['ltdgasoline5'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1697.87, 4922.96, 42.06, 324.71),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1702.68, 4917.28, 42.22, 139.27),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Rob's Liquor Locations
    ['robsliquor'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-1221.58, -908.15, 12.33, 35.49),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1226.92, -901.82, 12.28, 213.26),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['robsliquor2'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-1486.59, -377.68, 40.16, 139.51),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1468.29, -387.61, 38.79, 220.13),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['robsliquor3'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-2966.39, 391.42, 15.04, 87.48),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-2961.49, 376.25, 15.02, 111.41),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['robsliquor4'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(1165.17, 2710.88, 38.16, 179.43),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1194.52, 2722.21, 38.62, 9.37),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['robsliquor5'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(1134.2, -982.91, 46.42, 277.24),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1129.73, -989.27, 45.97, 280.98),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Hardware Store Locations
    ['hardware'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(45.68, -1749.04, 29.61, 53.13),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(89.15, -1745.29, 30.09, 315.25),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['hardware2'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(2747.71, 3472.85, 55.67, 255.08),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2704.68, 3457.21, 55.54, 176.28),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    ['hardware3'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(-421.83, 6136.13, 31.88, 228.2),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-438.25, 6146.9, 31.48, 136.99),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Ammunation Locations
    ['ammunation'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-659.09, -939.17, 21.83, 117),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-660.61, -938.14, 21.83, 167.22),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation2'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(813.52, -2155.25, 29.62, 5),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(820.97, -2146.7, 28.71, 359.98),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation3'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(1698.05, 3757.44, 34.71, 167),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1687.17, 3755.47, 34.34, 163.69),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation4'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-325.99, 6081.20, 31.45, 177),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-341.72, 6098.49, 31.32, 11.05),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation5'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(246.75, -51.36, 69.94, 17),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(249.0, -50.64, 69.94, 60.71),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation6'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(18.29, -1108.08, 29.80, 163),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-5.82, -1107.48, 29.0, 164.32),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation7'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(2564.73, 298.98, 108.73, 268),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2578.77, 285.53, 108.61, 277.2),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation8'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1112.46, 2697.12, 18.55, 128),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1127.67, 2708.18, 18.8, 41.76),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation9'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(841.04, -1028.61, 28.19, 269),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(847.83, -1020.36, 27.88, 88.29),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation10'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1310.89, -394.28, 36.70, 347),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1302.44, -385.23, 36.62, 303.79),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['ammunation11'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-3166.90, 1086.97, 20.84, 176),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3183.6, 1084.35, 20.84, 68.13),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Weedshop Locations
    ['weedshop'] = {
        ['label'] = 'White Widow',
        ['coords'] = vector4(188.02, -241.98, 54.07, 253),
        ['ped'] = 'a_m_y_hippy_01',
        ['scenario'] = 'WORLD_HUMAN_AA_SMOKE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-cannabis',
        ['targetLabel'] = 'Open Smoke Shop',
        ['products'] = Config.Products['smoke'],
        ['showblip'] = true,
        ['blipsprite'] = 140,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1162.13, -1568.57, 4.39, 328.52),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Sea Word Locations
    ['clicklovers'] = {
        ['label'] = 'Clicklovers',
        ['coords'] = vector4(211.97, -1508.05, 29.29, 226),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_IMPATIENT',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-phone',
        ['targetLabel'] = 'Clicklovers',
        ['products'] = Config.Products['clicklovers'],
        ['showblip'] = true,
        ['blipsprite'] = 521,
        ['blipscale'] = 0.7,
        ['blipcolor'] = 6,
        ['delivery'] = vector4(-1674.18, -1073.7, 13.15, 333.56),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },
    ['polmech'] = {
        ['label'] = 'Police Mechanic',
        ['coords'] = vector4(-581.65, -428.74, 31.16, 358),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_IMPATIENT',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-phone',
        ['targetLabel'] = 'Police Mechanic',
        ['products'] = Config.Products['polmech'],
        ['showblip'] = false,
        ['blipsprite'] = 521,
        ['blipscale'] = 0.7,
        ['blipcolor'] = 6,
        ['delivery'] = vector4(-1674.18, -1073.7, 13.15, 333.56),
        ['requiredJob'] = 'police' ,
        ['account'] = 'money', -- Set your account here
        -- ['requiredGrade'] = 2,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- Leisure Shop Locations
    -- ['leisureshop'] = {
    --     ['label'] = 'Leisure Shop',
    --     ['coords'] = vector4(-1505.91, 1511.95, 115.29, 257.13),
    --     ['ped'] = 'a_m_y_beach_01',
    --     ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE',
    --     ['radius'] = 1.5,
    --     ['targetIcon'] = 'fas fa-leaf',
    --     ['targetLabel'] = 'Open Leisure Shop',
    --     ['products'] = Config.Products['leisureshop'],
    --     ['showblip'] = true,
    --     ['blipsprite'] = 52,
    --     ['blipscale'] = 0.8,
    --     ['blipcolor'] = 0,
    --     ['delivery'] = vector4(-1507.64, 1505.52, 115.29, 262.2),
    --     ['account'] = 'money', -- Set your account here
    --     -- ['requiredJob'] = { 'mechanic', 'police' },
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['police'] = {
    --     ['label'] = 'Police Shop',
    --     ['coords'] = vector4(461.8498, -981.0677, 30.6896, 91.5892),
    --     ['ped'] = 'mp_m_securoguard_01',
    --     ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
    --     ['radius'] = 1.5,
    --     ['targetIcon'] = 'fas fa-gun',
    --     ['targetLabel'] = 'Open Armory',
    --     ['products'] = Config.Products['police'],
    --     ['delivery'] = vector4(459.0441, -1008.0366, 28.2627, 271.4695),
    --     ['requiredJob'] = 'police', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',      -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['ambulance'] = {
    --     ['label'] = 'Ambulance Shop',
    --     ['coords'] = vector4(309.93, -602.94, 43.29, 71.0820),
    --     ['ped'] = 's_m_m_doctor_01',
    --     ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
    --     ['radius'] = 1.5,
    --     ['targetIcon'] = 'fas fa-hand',
    --     ['targetLabel'] = 'Open Armory',
    --     ['products'] = Config.Products['ambulance'],
    --     ['delivery'] = vector4(283.5821, -614.8570, 43.3792, 159.2903),
    --     ['requiredJob'] = 'ambulance', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',         -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['mechanic'] = {
    --     ['label'] = 'Mechanic Shop',
    --     ['coords'] = vector4(-333.52, -140.04, 39.06, 252),
    --     ['products'] = Config.Products['mechanic'],
    --     ['delivery'] = vector4(-354.3936, -128.2882, 39.4307, 251.4931),
    --     ['requiredJob'] = 'mechanic', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',        -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['mechanic2'] = {
    --     ['label'] = 'Mechanic Shop',
    --     ['coords'] = vector4(1189.36, 2641.00, 38.44, 0),
    --     ['products'] = Config.Products['mechanic'],
    --     ['delivery'] = vector4(1189.9852, 2651.1873, 37.8351, 317.7137),
    --     ['requiredJob'] = 'mechanic2', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',         -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['mechanic3'] = {
    --     ['label'] = 'Mechanic Shop',
    --     ['coords'] = vector4(-1156.56, -1999.85, 13.19, 0),
    --     ['products'] = Config.Products['mechanic'],
    --     ['delivery'] = vector4(-1131.9661, -1972.0144, 13.1603, 358.8637),
    --     ['requiredJob'] = 'mechanic3', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',         -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['bennys'] = {
    --     ['label'] = 'Mechanic Shop',
    --     ['coords'] = vector4(-195.80, -1318.24, 31.08, 0),
    --     ['products'] = Config.Products['mechanic'],
    --     ['delivery'] = vector4(-232.5028, -1311.7202, 31.2960, 180.3716),
    --     ['requiredJob'] = 'bennys', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',      -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    -- ['beeker'] = {
    --     ['label'] = 'Mechanic Shop',
    --     ['coords'] = vector4(100.92, 6616.00, 32.47, 0),
    --     ['products'] = Config.Products['mechanic'],
    --     ['delivery'] = vector4(119.3033, 6626.7358, 31.9558, 46.1566),
    --     ['requiredJob'] = 'beeker', -- Example: { 'mechanic', 'police' },
    --     ['account'] = 'money',      -- Set your account here
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },

    ['prison'] = {
        ['label'] = 'Canteen Shop',
        ['coords'] = vector4(1777.59, 2560.52, 44.62, 187.83),
        ['ped'] = false,
        ['products'] = Config.Products['prison'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1845.8175, 2585.9312, 45.6721, 96.7577),
        ['account'] = 'money', -- Set your account here
        -- ['requiredJob'] = { 'mechanic', 'police' },
        -- ['requiredGrade'] = 3,
        -- ['requiredGang'] = { 'mechanic', 'police' },
    },

    -- ['blackmarket'] = {
    --     ['label'] = 'Black Market',
    --     ['coords'] = vector4(-594.7032, -1616.3647, 33.0105, 170.6846),
    --     ['ped'] = 'a_m_y_smartcaspat_01',
    --     ['scenario'] = 'WORLD_HUMAN_AA_SMOKE',
    --     ['radius'] = 1.5,
    --     ['targetIcon'] = 'fas fa-clipboard',
    --     ['targetLabel'] = 'Open Shop',
    --     ['products'] = Config.Products['blackmarket'],
    --     ['delivery'] = vector4(-428.6385, -1728.1962, 19.7838, 75.6646),
    --     ['account'] = 'money', -- Set your account here
    --     -- ['requiredJob'] = { 'mechanic', 'police' },
    --     -- ['requiredGrade'] = 3,
    --     -- ['requiredGang'] = { 'mechanic', 'police' },
    -- },
}

--[[
    Stashing system!
    Here you can add your stashes, their blips or even add a license to them!
    Remember that the licenses are an item, so you must put the name of said item!

    Example:
        ['requiredLicense'] = 'weapon_license' -- item or nil
]]

Config.Stashes = {
    -- [1] = {
    --     ['coords'] = vector3(-565.69, -417.94, 39.63),
    --     ['targetLabel'] = 'Open Stash',
    --     ['size'] = {
    --         weight = 500000,
    --         slots = 100
    --     },
    --     ['blip'] = nil,
    --     ['label'] = 'police_stash',
    --     ['requiredJobs'] = { 'police' }, -- nil or example { 'police', 'ambulance' }
    --     ['requiredJobsGrades'] = { 2, 3, 4 },
    --     ['requiredLicense'] = nil,       -- nil or example 'itemname',
    --     ['personal'] = false,
    --     ['distance'] = 5.0
    -- },
    -- [2] = {
    --     ['coords'] = vector3(306.303284, -1457.709839, 29.953857),
    --     ['targetLabel'] = 'Open Stash',
    --     ['size'] = {
    --         weight = 9500,
    --         slots = 15
    --     },
    --     ['blip'] = nil,
    --     ['label'] = 'doctor_stash',
    --     ['requiredJobs'] = { 'ambulance' }, -- nil or example { 'police', 'ambulance' }
    --     ['requiredJobsGrades'] = nil,       -- nil or grade tables example { 2, 3, 4},
    --     ['requiredLicense'] = nil,          -- nil or example 'itemname',
    --     ['personal'] = false,
    --     ['distance'] = 5.0
    -- },
    [1] = {
        ['coords'] = vector3(237.481323, -1354.747192, 31.032227),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 10000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'mysterious_shed',
        ['requiredJobs'] = { 'rising' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [2] = {
        ['coords'] = vector3(-1025.46, -1421.93, 5.43),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 500000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'PDM Stash',
        ['requiredJobs'] = { 'pdm' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [3] = {
        ['coords'] = vector3(-335.27, -1367.84, 31.45),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'craftsmen Stash 1',
        ['requiredJobs'] = { 'craftsmen' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [4] = {
        ['coords'] = vector3(-342.48, -1367.82, 31.45),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'craftsmen Stash 2',
        ['requiredJobs'] = { 'craftsmen' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [5] = {
        ['coords'] = vector3(-350.96, -1367.66, 31.45),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'craftsmen Stash 3',
        ['requiredJobs'] = { 'craftsmen' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [6] = {
        ['coords'] = vector3(-361.73, -1340.20, 31.45),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 500000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'craftsmen Stash 4',
        ['requiredJobs'] = { 'craftsmen' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [7] = {
        ['coords'] = vector3(-334.24, -102.69, 39.06),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 500000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'RisingSun Stash 1',
        ['requiredJobs'] = { 'risingsun' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [8] = {
        ['coords'] = vector3(-325.14, -112.04, 39.06),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'RisingSun Stash 2',
        ['requiredJobs'] = { 'risingsun' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [9] = {
        ['coords'] = vector3(-330.41, -118.63, 39.06),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'RisingSun Stash 3',
        ['requiredJobs'] = { 'risingsun' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [10] = {
        ['coords'] = vector3(-333.52, -126.08, 39.06),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'RisingSun Stash 4',
        ['requiredJobs'] = { 'risingsun' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [11] = {
        ['coords'] = vector3(-350.29, -121.55, 39.06),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 200000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'RisingSun Stash 5',
        ['requiredJobs'] = { 'risingsun' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    },
    [12] = {
        ['coords'] = vector3(-1028.61, -1438.38, 5.43),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 500000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'PDM Storage',
        ['requiredJobs'] = { 'pdm' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    }
}

--[[
    Debug mode, you can see all kinds of prints/logs using debug,
    but it's only for development.
]]

Config.ZoneDebug = false
