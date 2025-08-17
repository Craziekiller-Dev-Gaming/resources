onexFx = exports['onex-base'].fetchOnexFx()
Core = onexFx.Core
Framework = {}

Framework.Language = 'en'

Framework.Notify = {
    autodetect = true,
    ScriptName = "onex-interaction", --[[
        *onex-interaction
        *onex-npc_interact
        *qb-notify (work for qbox also)
        *esx_notify

    ]]

    Listner = function(msg, type, duration, header, color)
        local icon = "ICON" -- ** put here link of your server icon (96x96) would be good bigger image can also performe good but its optional.

        if Framework.Notify.autodetect then
            if GetResourceState('onex-interaction'):find('start') then
                Framework.Notify.ScriptName = 'onex-interaction'
            elseif GetResourceState('onex-npc_interact'):find('start') then
                Framework.Notify.ScriptName = 'onex-npc_interact'
            elseif GetResourceState('qb-core'):find('start') then
                Framework.Notify.ScriptName = 'qb-notify'
            elseif GetResourceState('es_extended'):find('start') then
                Framework.Notify.ScriptName = 'esx_notify'
            end
        end

        onexFx.Notify(Framework.Notify.ScriptName, type, msg, color, duration or 5000, header or 'ONEX SYSTEM', icon)
    end
}

local GetInteraction = function(autodetect)
    if not autodetect then
        return false
    end

    local systems = {{
        resource = 'onex-interaction',
        name = 'onex-interaction'
    }, {
        resource = 'onex-npc_interact',
        name = 'onex-npc_interact'
    }, {
        resource = 'qb-target',
        name = 'target'
    }, {
        resource = 'ox_target',
        name = 'target'
    }, {
        resource = 'es_extended',
        name = 'esx'
    }}

    for _, system in ipairs(systems) do
        if GetResourceState(system.resource):find('start') then
            return system.name
        end
    end

    return 'onex-interaction'
end

Framework.Interaction = {
    autodetect = true,
    Name = GetInteraction(true) or "onex-interaction", --[[
    *onex-interaction 
    *onex-npc_interact
    *target
    *esx
    ]]

    init = {
        key = {

            open = {
                binds = 'E',
                uiText = 'E'
            },

            register = {
                binds = 'H',
                uiText = 'H'
            }

        },

        msg = {
            open = "RENT A CAR",
            register = "PLACE CAR ON RENT"
        }
    },

    Preperation = function(ped, index)
        local IData = Framework.Interaction

        ----===================
        ---- Onex Interaction 
        -- ===================== 

        if IData.Name == 'onex-interaction' or IData.Name == 'esx' then
            RegisterCommand('open_rent_menu', function()
                if not cache.curRentalSpot then
                    return
                end
                TriggerEvent('onex-interaction:client:removeLeft_onClick', 'onex_open_rent')
                TriggerEvent('onex-interaction:client:removeLeft', 'onex_open_rent_register')
                TriggerEvent('onex-rental:clinet:openMenu', 'rent')
            end)

            onexFx.RequestRegisterKeyMapping("open_rent_menu", "Open Rent Menu", "To Browse Rent List...",
                "open_rent_menu", "", IData.init.key.open.binds, true);

            if onexFx.Data.Framework ~= 'standalone' then
                RegisterCommand('open_rent_reg_menu', function()
                    if not cache.curRentalSpot then
                        return
                    end

                    if cache.curRentalSpot and Config.RentData[cache.curRentalSpot].CanPutOwnedVehicleOnRent then
                        TriggerEvent('onex-interaction:client:removeLeft_onClick', 'onex_open_rent_register')
                        TriggerEvent('onex-interaction:client:removeLeft', 'onex_open_rent')
                        TriggerEvent('onex-rental:clinet:openMenu', 'register')
                    end
                end)

                onexFx.RequestRegisterKeyMapping("open_rent_reg_menu", "Open Registration Menu",
                    "To Register Your Vehicle On Rent...", "open_rent_reg_menu", "", IData.init.key.register.binds, true);
            end
        end

        ----===================
        ---- Target 
        -- ===================== 

        if Framework.Interaction.Name == 'target' then
            local tdata = {{
                icon = 'fa-solid fa-car',
                label = 'Open Menu',
                action = function()
                    cache.curRentalSpot = index
                    TriggerEvent('onex-rental:clinet:openMenu', 'rent')
                end
            }}

            if onexFx.Data.Framework ~= 'standalone' then
                table.insert(tdata, {
                    icon = 'fa-solid fa-tablet',
                    label = 'Open Registration Menu',
                    action = function()
                        cache.curRentalSpot = index
                        TriggerEvent('onex-rental:clinet:openMenu', 'register')
                    end
                })
            end

            onexFx.AddTargetEntity(ped, tdata, 2.0)
        end

    end,

    ---@param show boolean
    Handle = function(show)
        local IData = Framework.Interaction

        ----==================
        ---- ONEX INTERACTION 
        -- ===================== 

        if IData.Name == "onex-interaction" then
            if show then
                TriggerEvent('onex-interaction:client:DrawLeft', 'onex_open_rent', IData.init.key.open.uiText,
                    IData.init.msg.open)

                if onexFx.Data.Framework ~= 'standalone' and
                    Config.RentData[cache.curRentalSpot].CanPutOwnedVehicleOnRent then
                    TriggerEvent('onex-interaction:client:DrawLeft', 'onex_open_rent_register',
                        IData.init.key.register.uiText, IData.init.msg.register)
                end

            else
                TriggerEvent('onex-interaction:client:removeLeft', 'onex_open_rent')
                if onexFx.Data.Framework ~= 'standalone' then
                    TriggerEvent('onex-interaction:client:removeLeft', 'onex_open_rent_register')
                end
            end
        end

        ----==================
        ---- Esx TextUI 
        -- ===================== 

        if IData.Name == "esx" then
            if show then
                Core.TextUI("[" .. IData.init.key.open.uiText .. "] TO " .. IData.init.msg.open .. " | [" ..
                                IData.init.key.register.binds .. "] " .. IData.init.msg.register)

            else
                Core.HideUI()
            end
        end

    end,

    ----===================
    ---- Onex NPC Interact
    -- ===================== 

    Onex_NPC_Interact_Register = function(pedData, index)
        exports['onex-npc_interact']:OnexInsertDialougesData({{
            NpcModel = pedData.model,
            Coordinates = vector4(pedData.coords.x, pedData.coords.y, pedData.coords.z, pedData.coords.w),
            CoordMinus = true,
            Animation = {
                -- Name ='idle_a', 
                -- Dict ='amb@world_human_leaning@male@wall@back@foot_up@idle_a',
            },

            Scenarios = {
                enable = pedData.scenarioName and true or false,
                name = pedData.scenarioName --- here you can put scenarios name [https://pastebin.com/6mrYTdQv]
            },

            NPCName = pedData.name,
            OrgName = '👋24/7 Car Rental Ltd.',
            DialougeMsg = 'What Are You Looking For Today',
            Options = {{'RENT A CAR', 'onex-rental:clinet:NPCInteract:openMenu', 'c', {
                index = index,
                page = 'rent'
            }}, {'PLACE CAR ON RENT', 'onex-rental:clinet:NPCInteract:openMenu', 'c', {
                index = index,
                page = 'register'
            }}, {'No Thanks', 'sntx-npcInteract:closeUi', 'c'}},

            Jobs = {}, -- Keep like this if you want to add job then put {"police" , "ems"} like this

            -- == Camera --==

            Camera = {

                AutoCameraPosition = true,
                AutoCameraRotation = true,

                --- [CamCoords] [CamRotaion] Aplicable if AutoCameraPosition = false and AutoCameraRotation = false

                CamCoords = vector3(0.0, 0.0, 0.0),
                CamRotaion = vector3(0.0, 0.0, 0.0)
            }
        }})
    end,

    CreateThread(function()
        Wait(0)
        if not IsDuplicityVersion() then
            AddEventHandler("onex_zones:enter", function(name)
                cache.curRentalSpot = name:gsub("^onex_", "")
                Framework.Interaction.Handle(true)
            end)

            AddEventHandler("onex_zones:leave", function()
                cache.curRentalSpot = nil
                Framework.Interaction.Handle(false)
            end)
        end
    end)

}

Framework.SQL_Query = {

    getPlayerVehicles = {

        onRentVehicles = function(playerIdentifier)
            return {'SELECT * FROM onex_onrentcar WHERE identifier = ?', {playerIdentifier}}
        end,

        rentedVehicles = function(playerIdentifier)
            return {'SELECT * FROM onex_rentcar WHERE identifier = ?', {playerIdentifier}}
        end
    },

    qb = {

        playerVehicles = function(playerIdentifier)
            return {'SELECT * FROM player_vehicles WHERE citizenid = ?', {playerIdentifier}}
        end
    },

    esx = {

        playerVehicles = function(playerIdentifier)
            return {'SELECT * FROM owned_vehicles WHERE owner = ?', {playerIdentifier}}
        end
    }

}

debug = function(msg)
    if Config.debug then
        print(msg)
    end
end

