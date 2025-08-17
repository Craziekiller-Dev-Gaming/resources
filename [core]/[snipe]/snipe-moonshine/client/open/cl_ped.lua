local spawnedEntity = {}

local peds = {}

function GetPeds()
    peds = lib.callback.await("snipe-moonshine:server:getPeds", false)
end

function BuyBarrel()
    local result = lib.callback.await("snipe-moonshine:server:buyBarrel", false)
    if not result[1] then
        ShowNotification(result[2], "error")
    end
end

local function SpawnPed(index, data)
    RequestModel(data.model)
    while not HasModelLoaded(data.model) do
        Wait(0)
    end
    local entity = CreatePed(0, GetHashKey(data.model), data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w,  false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    SetEntityHeading(entity, data.coords.w)
    
    if Config.UseInteract and GetResourceState("interact") == "started" then
        data.interaction = exports.interact:AddLocalEntityInteraction({
            entity = entity,
            label = "Moonshine",
            canInteract = function()
                return true
            end,
            options = GetOptionsForPed(index, "interact")
        })
    else
        local TargetName = "qb-target"
        if Config.Framework == "esx" then
            TargetName = "qtarget"
        end
        exports[TargetName]:AddTargetEntity(entity, { 
            options = GetOptionsForPed(index, "target"),
            distance = 2.5, 
        })
    end
    return entity
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(peds) do
            if #(pos - vector3(v.coords.x, v.coords.y, v.coords.z)) < 50.0 then
                if spawnedEntity[k] == nil or not DoesEntityExist(spawnedEntity[k]) then
                    spawnedEntity[k] = SpawnPed(k, v)
                end
            else
                if spawnedEntity[k] ~= nil and DoesEntityExist(spawnedEntity[k]) then
                    if v.interaction then
                        exports.interact:RemoveInteraction(v.interaction)
                    end
                    DeleteEntity(spawnedEntity[k])
                end
            end
        end
    end
end)