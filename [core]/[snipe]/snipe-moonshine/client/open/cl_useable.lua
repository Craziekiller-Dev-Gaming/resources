local isHigh = 0

local function RequestWalkDict()
    RequestAnimSet("move_m@drunk@verydrunk") 
    RequestAnimSet("move_m@buzzed") 
    RequestAnimSet("move_m@drunk@slightlydrunk") 
    while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Wait(1)
    end
    while not HasAnimSetLoaded("move_m@buzzed") do
        Wait(1)
    end
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Wait(1)
    end
end

local function MoonshineEffect(quality)
    isHigh = math.round(quality/100 * 100) -- effect will last for the time of the ageing in seconds
    RequestWalkDict()
    SetPedMovementClipset(cache.ped, "move_m@drunk@verydrunk", 0.2)
	while isHigh > 0 do
        SetTimecycleModifier("BikerFilter")
        SetTimecycleModifierStrength(1.0)
		if isHigh > 80 then
			SetPedMovementClipset(cache.ped, "move_m@drunk@verydrunk", 0.2)
		elseif isHigh > 40 then
			SetPedMovementClipset(cache.ped, "move_m@buzzed", 0.2)
        elseif isHigh > 10 then
			SetPedMovementClipset(cache.ped, "move_m@drunk@slightlydrunk", 0.2)
        else
            SetPedMovementClipset(cache.ped, "move_m@drunk@verydrunk", 0.1)
		end
		
		if IsPedRunning(cache.ped) or IsPedJumping(cache.ped) then
			SetPedToRagdoll(cache.ped, math.random(2000, 4000), math.random(2000, 4000), 3, 0, 0, 0)
		end
		isHigh = isHigh - 1
		Citizen.Wait(500)
    end
    Wait(1000)
	ResetPedMovementClipset(cache.ped)
    SetTimecycleModifier("default")
    SetTimecycleModifierStrength(0.0)
	isHigh = 0
end


local function DrinkMoonshine(slot)
    local quality = lib.callback.await("snipe-moonshine:server:getMoonshineQuality", false, slot)
    if not quality then
        ShowNotification("No Quality Found", "error")
        return
    end
    if Config.Inventory == "ox" then
        Config.InventoryExport:closeInventory()
    end
    if lib.progressCircle({
        label = "Drinking Moonshine",
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            clip = "idle_c",
        },
        prop = {
            model = "p_cs_bottle_01",
            bone = 28422,
            pos = vec3(0.01, -0.01, -0.04),
            rot = vec3(0.0, 0.0, 0.0),
        }
    }) then 
        local success = lib.callback.await("snipe-moonshine:server:drinkMoonshine", false, slot)
        if not success then
            ShowNotification("Failed to remove moonshine bottle", "error")
            return
        end
        MoonshineEffect(quality)
    else 
        ShowNotification("Cancelled", "error")
    end
end

exports("DrinkMoonshine", DrinkMoonshine)