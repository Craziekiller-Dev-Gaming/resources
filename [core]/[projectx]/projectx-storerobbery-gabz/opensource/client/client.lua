local zones = {}

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent(Config.Core.name..':Notify', notification, notificationType, duration)
        end
    end
    
    function HasItem(item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(item) > 0
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(item)
        elseif Config.Inventory == "qs" then
            return exports['qs-inventory']:Search(item) > 0
        else
            return QBCore.Functions.HasItem(item)
        end
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if Config.Progressbar == "ox" then
            if lib.progressCircle({
                duration = duration,
                position = 'bottom',
                useWhileDead = false,
                label = label,
                canCancel = false,
                disable = {car = true},
                anim = {},
                prop = {},
            }) then success() else fail() end
        else
            QBCore.Functions.Progressbar(name, label, duration, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, success, fail, icon)
        end
    end
    
    RegisterNetEvent(Config.Core.name..':Client:OnPlayerUnload', function()
        TriggerEvent('projectx-storerobbery-gabz:client:Logout')
    end)
elseif Config.Framework == "esx" then
    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('esx:showNotification', notification, notificationType, duration)
        end
    end
    
    function HasItem(item)
        local p = promise.new()
        if Config.Inventory == "ox" then return exports.ox_inventory:GetItemCount(item) > 0 end
        lib.callback('projectx-storerobbery-gabz:server:hasitem', false, function(name)
            p:resolve(name)
        end, item)
        return Citizen.Await(p)
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressCircle({
            duration = duration,
            position = 'bottom',
            useWhileDead = false,
            label = label,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() else fail() end
    end
    
    RegisterNetEvent('projectx-storerobbery-gabz:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Store Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        TriggerEvent('projectx-storerobbery-gabz:client:Logout')
    end)
else

end

function CreateCircleZones(name, coords, size, event, icon, label, distance, param, param2, param3, param4)
    if not Config.WorldInteract then
        if Config.Target == "ox_target" then
            exports.ox_target:addSphereZone({
                name = name,
                coords = coords,
                radius = size,
                debug = Config.debug,
                drawSprite = true,
                options =
                {{
                    icon = icon,
                    label = label,
                    distance = distance,
                    onSelect = event,
                }}
            })
        else
            exports[Config.Target]:AddCircleZone(name, coords, size, {name = name, debugPoly = Config.debug, useZ=true},
                {
                options = {
                    {
                        name = name,
                        type = "client",
                        action = event,
                        icon = icon,
                        label = label,
                        coords = coords,
                    }
                },
                distance = distance
            })
        end
    else
        exports.interact:AddInteraction({
            coords = coords,
            distance = 3.0,
            interactDst = distance, -- optional
            id = name, -- needed for removing interactions
            name = name, -- optional
            options = {
                {
                    label = label,
                    action = function()
                        TriggerEvent(event, param, param2, param3, param4)
                    end,
                },
            }
        })
    end
end

function CircleZoneDestroy(name)
    if Config.WorldInteract then return exports.interact:RemoveInteraction(name) end
    if Config.Target == "ox_target" then exports.ox_target:removeZone(name) else exports[Config.Target]:RemoveZone(name) end
end

function drawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports[Config.Core.abbrev..'-core']:DrawText(text) else exports[Config.Core.abbrev..'-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports[Config.Core.abbrev..'-drawtext']:DrawText(text) else exports[Config.Core.abbrev..'-drawtext']:HideText() end    
    end
end

function zoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove()
            table.remove(zones, k)
        end
    end
end

function zoneCreate(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function OnEvidence(pos, chance)
    if math.random(1, 100) > chance or IsWearingHandshoes() then return end
    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function Dispatch()
    local coords = GetEntityCoords(PlayerPedId())
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', },
            coords = data.coords,
            title = '10-15 - Store Robbery',
            message = 'A '..data.sex..' robbing a store at '..data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = '911 - Store Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "origen" then
        TriggerServerEvent("SendAlert:police", {
            coords = coords,
            title = 'Store Robbery',
            type = 'GENERAL',
            message = 'A store is being robbed',
            job = 'police',
        })
    elseif Config.Dispatch == "tk" then
        exports['tk_dispatch']:addCall({
            title = 'Store Robbery',
            code = '10-58',
            priority = 'Priority 3',
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = 3,
                sprite = 357,
                scale = 1.0,
            },
            jobs = {'police'}
        })
    elseif Config.Dispatch == "rcore" then
        local player_data = exports['rcore_dispatch']:GetPlayerData()
        local data = {
            code = '10-35 Store Robbery', 
            default_priority = 'medium',
            coords = player_data.coords,
            job = 'police',
            text = 'Store Robbery!',
            type = 'alert',
            blip_time = 5,
            blip = {
                sprite = 272, 
                colour = 3,
                scale = 0.7,
                text = 'Store Robbery',
                flashes = false,
                radius = 0,
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch == "outlaw" then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Store Robbery'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = coords}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == "codem" then
        local Data = {
            type = 'Robbery',
            header = 'Robbery in progress',
            text = 'Store Robbery in progress',
            code = '10-54',
        }
        exports['codem-dispatch']:CustomDispatch(Data)
    elseif Config.Dispatch == "qs" then
        exports['qs-dispatch']:StoreRobbery()
    elseif Config.Dispatch == "ps" then
        exports['ps-dispatch']:StoreRobbery()
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('projectx-storerobbery-gabz:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-storerobbery-gabz:client:AddExperience", function(exp)
    -- add exp function here and insert exp as a parameter
end)

function CheckExpLevel()
    -- Add "return" then add your check exp level function here
end

--------------------- Minigames ---------------------
------ You can return true to skip a minigame -------
-----------------------------------------------------

function FuseboxMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:NumberSlide(4, 50, 4)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function RegisterMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleShake(1, 50, 5)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function ATMMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:Progress(4, 50)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function DoorMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleProgress(3, 50)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function ServerMinigame()
    local p = promise.new()
    local success = exports['SN-Hacking']:Mines(5, 3, 9, 1)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function NpcMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:KeySpam(1, 50)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function Computer1Minigame()
    local p = promise.new()
    local success = exports['SN-Hacking']:MemoryCards('medium')
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function Computer2Minigame()
    local p = promise.new()
    local success = exports['SN-Hacking']:Thermite(7, 10, 10000, 2, 2, 3000)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SafeMinigame()
    local gameData = {totalNumbers = 20, seconds = 20, timesToChangeNumbers = 4, amountOfGames = 1, incrementByAmount = 5}
    local p = promise:new()
    local success = exports['pure-minigames']:numberCounter(gameData)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function GangSafeMinigame()
    local p = promise:new()
    local result = exports["pd-safe"]:createSafe({math.random(0,99)})
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(result)
    return Citizen.Await(p)
end

function ShelfMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleProgress(2, 50)
    -- TriggerServerEvent('projectx-storerobbery-gabz:server:AddExperience', 1) -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end