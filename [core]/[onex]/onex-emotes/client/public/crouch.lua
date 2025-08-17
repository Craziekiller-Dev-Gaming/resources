-- Original source : https://github1s.com/qbcore-framework/qb-smallresources/blob/main/client/crouchprone.lua
-- Modified by Onex Scripts Owner Frostfire
local isCrouching = false

local function loadAnimSet(anim)
    if HasAnimSetLoaded(anim) then
        return
    end
    RequestAnimSet(anim)
    while not HasAnimSetLoaded(anim) do
        Wait(10)
    end
end

local function resetAnimSet()
    local ped = PlayerPedId()
    ResetPedMovementClipset(ped, 1.0)
    ResetPedWeaponMovementClipset(ped)
    ResetPedStrafeClipset(ped)

    Restore_walk_anim()
end

if Config.Binds.Crouch.enable then

    RegisterKeyMapping('+crouch', "Crouch", "keyboard", Config.Binds.Crouch.crouchKey)

    RegisterCommand('+crouch', function()
        local ped = PlayerPedId()

        DisableControlAction(0, 36, true)
        if not IsPedSittingInAnyVehicle(ped) and not IsPedFalling(ped) and not IsPedSwimming(ped) and
            not IsPedSwimmingUnderWater(ped) and not IsPauseMenuActive() then
            if isCrouching then
                ClearPedTasks(ped)
                resetAnimSet()
                SetPedStealthMovement(ped, false, 'DEFAULT_ACTION')
                isCrouching = false
            else
                ClearPedTasks(ped)
                loadAnimSet('move_ped_crouched')
                SetPedMovementClipset(ped, 'move_ped_crouched', 1.0)
                SetPedStrafeClipset(ped, 'move_ped_crouched_strafing')
                isCrouching = true
            end

        end
    end, false)

    RegisterCommand('-crouch', function()
    end, false)
end

exports('IsPlayerCrouched', isCrouching)
