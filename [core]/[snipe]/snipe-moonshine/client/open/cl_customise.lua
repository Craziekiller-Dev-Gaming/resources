change = "heading" -- do not touch

function ShowNotification(msg, type)
    if Config.Notify == "ox" then
        lib.notify({type = type, description = msg})
    elseif Config.Notify == "qb" then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify == "esx" then
        ESX.ShowNotification(msg)
    elseif Config.Notify == "okok" then
        exports['okokNotify']:Alert("Moonshine", msg, 5000, type)
    end
end

function DrawTexts()
    drawTxt(0.8, 0.60, 0.4,0.4,0.30, "D to change Z coordinates", 55, 155, 55, 255)
    drawTxt(0.8, 0.63, 0.4,0.4,0.30, "W to change y", 55, 155, 55, 255)
    drawTxt(0.8, 0.66, 0.4,0.4,0.30, "G to change x", 55, 155, 55, 255)
    drawTxt(0.8, 0.69, 0.4,0.4,0.30, "H to change heading", 55, 155, 55, 255)
    drawTxt(0.8, 0.72, 0.4,0.4,0.30, "Scroll Wheel to move it around selected", 55, 155, 55, 255)
    drawTxt(0.8, 0.75, 0.4,0.4,0.30, "Press E to place, Esc/backspace to cancel", 55, 155, 55, 255)
    drawTxt(0.8, 0.78, 0.4,0.4,0.4, "Currently Selected: "..change, 255, 0, 0, 255)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DrawInteraction(obj, id, identifier)
    if Config.UseInteract and GetResourceState("interact") == "started" then
        local interaction = exports.interact:AddLocalEntityInteraction({
            entity = obj,
            offset = vec3(-1.8, 0, 0.0),
            label = "Barrel",
            canInteract = function()
                return true
            end,
            options = GetOptionsForBarrel(id, "interact")
        })
        return interaction
    else
        local TargetName = "qb-target"
        if Config.Framework == "esx" then
            TargetName = "qtarget"
        end
        exports[TargetName]:AddTargetEntity(obj, {
            options = GetOptionsForBarrel(id, "target"),
        })
        return nil
    end
end

CreateThread(function()
    if Config.Inventory == "ox" then
        Config.InventoryExport:displayMetadata({
            moonshine_quality_label = Locales["quality_inventory_label"],
        })
    end
end)

local dropOffBlip = nil

function DrawBlipForDropOff(coords)
    ShowNotification(Locales["drop_off_location_marked"], "info")
    if dropOffBlip then
        RemoveBlip(dropOffBlip)
        dropOffBlip = nil
    end
    CreateThread(function()
        while not coords do
            Wait(0)
        end
        SetNewWaypoint(coords.x, coords.y)
        dropOffBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(dropOffBlip, 102)
        SetBlipColour(dropOffBlip, 3)
        SetBlipScale(dropOffBlip, 1.2)
        SetBlipAsShortRange(dropOffBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Locales["drop_off_blip_label"])
        EndTextCommandSetBlipName(dropOffBlip)
        Wait(20000)
        if dropOffBlip then
            RemoveBlip(dropOffBlip)
            dropOffBlip = nil
        end
    end)
end

function DoProgress(cb, progressData)
    if Config.Progress == "qb" then
        QBCore.Functions.Progressbar("moonshine-progress", progressData.progressbar,  (progressData.progresstime), false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  progressData.dictionary,
            anim = progressData.animname,
            flags = 49,
        }, {}, {}, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = (progressData.progresstime),
			label = progressData.progressbar,
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = progressData.dictionary,
				clip =  progressData.animname,
			},
		}) then 
			-- ClearPedTasksImmediately(PlayerPedId())
            StopAnimTask(PlayerPedId(), progressData.dictionary, progressData.animname, 1.0)
            cb(true)
		else 
			cb(false)
		end
    end
end

function DrawParticleEffect(obj)
    lib.requestNamedPtfxAsset("core")
    UseParticleFxAssetNextCall("core")
    ptfx1 = StartParticleFxLoopedOnEntity("ent_ray_paleto_gas_flames", obj, -0.95, -0.15, -0.6, 0.0, 0.0, 0.0, 0.15, 0.0, 0.0, 0.0)
    UseParticleFxAssetNextCall("core")
    ptfx2 = StartParticleFxLoopedOnEntity(
        "ent_amb_smoke_factory" --[[ string ]], 
        obj --[[ Entity ]], 
        -1.6, -0.12, 1.0,
        0.0, 0.0, 0.0,
        0.3 --[[ number ]], 
        0.0, 0.0, 0.0
    )
    return ptfx1, ptfx2
end

function StartBlowingThread(id, coords)
    CreateThread(function()
        Wait(15 * 1000) -- wait 30 seconds before blowing up

        AddExplosion(
            coords.x --[[ number ]], 
            coords.y --[[ number ]], 
            coords.z --[[ number ]], 
            6 --[[ integer ]], 
            8.0 --[[ number ]], 
            true --[[ boolean ]], 
            false --[[ boolean ]], 
            0 --[[ number ]]
        )
    lib.callback.await("snipe-moonshine:server:destroyBarrel", false, id)
    end)
end

function AnalyseStill(id)
    local p = promise.new()
    DoProgress(function(result)
        p:resolve(result)
    end, ProgressData.analyse)
    local result = Citizen.Await(p)
    if not result then
        ShowNotification(Locales["cancel"], "error")
        return
    end
    local stillExpired = lib.callback.await("snipe-moonshine:server:stillExpiryHelper", false, id)
    
    if stillExpired[1] then
        ShowNotification(Locales["still_expired"], "error")
        return
    else
        local exactTimeOfExpiry = stillExpired[2]
        local daysLeftForExpiry = stillExpired[3]
        if daysLeftForExpiry ~= -1 then
            if Config.ShowExactTimeForStillLeft then
                ShowNotification( string.format(Locales["still_time_left"], exactTimeOfExpiry), "success") -- this will show the exact time of still expiry
            else
                local percentageLeft = (daysLeftForExpiry/Config.TimeStillCanLast) * 100
                local shownNotification = false
                for k, v in pairs( Config.StillExpiryStrings) do
                    if percentageLeft >= v.range[1] and percentageLeft <= v.range[2] then
                        ShowNotification(v.string, "info")
                        shownNotification = true
                    end
                end
                if not shownNotification then
                    print("Server needs to fix the still expiry strings") -- this means that the strings are not set correctly
                end
            end
        end
    end
    
    local cooksLeft, coords = GetCookLeft(id) 
    
    if cooksLeft == -1 then
        ShowNotification(Locales["unlimited_cooks"], "success")
        return
    end
    if cooksLeft == 0 then
        ShowNotification(Locales["cooking_limit_reached"], "error")
        return
    end

    if cooksLeft > 0 then
        ShowNotification(string.format(Locales["cooks_left"], cooksLeft), "success")
    end
end