init = {}

init.Debug = GetConvar('Base_Debug', 'false') == 'true' or false

init.Language = 'en'

init.Framework = {
    AutoDetect = true, -- IT WILL AUTOMATICALLY DETECT FRAMEWORK NO NEED TO CHANGE NAME VALUE IF AUTODETECT = true
    Name = 'qb', --[[
        * qb (this also work with qbox)
        * esx 
        * custom
        * standalone
    ]]
    List = {
        ['esx'] = {
            core_script = 'es_extended',
            coreObj_export = 'getSharedObject'
        },
        ['qb'] = {
            core_script = 'qb-core',
            coreObj_export = 'GetCoreObject'
        }
    },

    IdentifierType = 'license' --[[ 
            
    *-> license 
    *-> steam 

    ]]
}

init.FrameworkBasedData = {
    getPlayer = {
        qb = 'GetPlayer',
        esx = 'GetPlayerFromId'
    }
}

init.Links = {
    target = {
        name = onexFx.GetResourceIndexByName({'qb-target', 'ox_target'}) or 'custom'
    },

    inventory = {
        name = onexFx.GetResourceIndexByName({'qb-inventory', 'ox_inventory', 'qs-inventory'}) or 'unknown'
    },

    clothing = {
        name = onexFx.GetResourceIndexByName({'onex-creation', 'qb-clothing', 'fivem-appearance', 'illenium-appearance',
                                              'esx_skin'}) or 'unknown'
    },

    spawn = {
        name = onexFx.GetResourceIndexByName({'onex-spawn', 'qb-spawn', 'qbx_spawn'}) or 'unknown'
    },

    fuel = {
        name = onexFx.GetResourceIndexByName({'LegacyFuel', 'ox_fuel', 'cdn-fuel'}) or 'unknown'
    }
}
