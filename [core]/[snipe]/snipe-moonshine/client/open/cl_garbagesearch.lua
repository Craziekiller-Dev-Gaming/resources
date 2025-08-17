local searchedEntities = {}

local function SearchGarbage(entity)
    lib.callback.await("snipe-moonshine:server:isSearching",false, entity)
    TaskTurnPedToFaceEntity(cache.ped, entity, 1000)
    Wait(1000)
    if lib.progressCircle({
        duration = 7500,
        label = "Searching Trash",
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        position= 'bottom',
        anim = {
            scenario = "PROP_HUMAN_BUM_BIN"
        },
        prop = {},
    }) then 
        if math.random(1, 100) < Config.PrickProbability then
            SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - 3)
            ShowNotification(PrickedLocales[math.random(1, #PrickedLocales)], "error")
        end
        if math.random(1, 100) < Config.FindingProbability then
            lib.callback.await("snipe-moonshine:server:collectItem", false, entity)
        else
            ShowNotification("You found nothing", "success")
        end
        
    else 
        FreezeEntityPosition(cache.ped, false)
        ClearPedTasks(cache.ped)
        ShowNotification("Cancelled", "error")
    end
end

function DrawTargetForBins()
    if Config.UseInteract and GetResourceState("interact") == "started" then
        local models = {
            {model = 1948359883, offset = vec(0.0, 0.0, 0.0)},
            { model = 1388308576, offset = vec(0.0, 0.0, 0.0) },
            { model = -1211968443, offset = vec(0.0, 0.0, 0.0) },
            { model = -1712220001, offset = vec(0.0, 0.0, 0.0) },
            { model = -52732303, offset = vec(0.0, 0.0, 0.0) },
            { model = 1098827230, offset = vec(0.0, 0.0, 0.0) },
            { model = -1426008804, offset = vec(0.0, 0.0, 1.0)}
        }

        for k, v in pairs(models) do
            exports.interact:AddModelInteraction({
                model = v.model,
                offset = v.offset,
                distance = 8.0, -- optional
                interactDst = 2.0, -- optional
                options = {
                    {
                        label = 'Collect',
                        action = function(entity, coords, args)
                            searchedEntities[entity] = true
                            SearchGarbage(entity)
                        end,
                        canInteract = function(entity, coords, args)
                            return (not searchedEntities[entity])
                        end,
                    },
                }
            })
        end
    else
        local models = {1948359883, 1388308576, -1211968443, -1712220001, -52732303, 1098827230, -1426008804}
        local TargetName = "qb-target"
        if Config.Framework == "esx" then
            TargetName = "qtarget"
        end
        exports[TargetName]:AddTargetModel(models, {
            options = {
                {
                    label = Locales["target_search_garbage"],
                    icon = Icons["search_garbage"],
                    action = function(entity, coords, args)
                        SearchGarbage(entity)
                        searchedEntities[entity] = true
                    end,
                    canInteract = function(entity, coords, args)
                        return not searchedEntities[entity]
                    end,
                },
            },
            distance = 8.0,
            interactDst = 2.0,
        })
    end
end
