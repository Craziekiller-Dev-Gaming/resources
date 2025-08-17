inHandsup = false
canHandsUp = true

local disableHandsupControls = {

    --- On Foot Controls 

    [36] = true, -- INPUT_DUCK
    [44] = true, -- INPUT_COVER

    --- Vehicle Controls - Car

    [59] = true, -- INPUT_VEH_MOVE_LR
    [60] = true, -- INPUT_VEH_MOVE_UD
    [61] = true, -- INPUT_VEH_MOVE_UP_ONLY
    [62] = true, -- INPUT_VEH_MOVE_DOWN_ONLY
    [63] = true, -- INPUT_VEH_MOVE_LEFT_ONLY
    [64] = true, -- INPUT_VEH_MOVE_RIGHT_ONLY
    [65] = true, -- INPUT_VEH_SPECIAL
    [66] = true, --  INPUT_VEH_GUN_LR
    [67] = true, -- INPUT_VEH_GUN_UD
    [69] = true, -- INPUT_VEH_ATTACK
    [70] = true, -- INPUT_VEH_ATTACK2
    [71] = true, -- INPUT_VEH_ACCELERATE
    [72] = true, -- INPUT_VEH_BRAKE
    [73] = true, -- INPUT_VEH_DUCK
    [74] = true, -- INPUT_VEH_HEADLIGHT
    [77] = true, -- INPUT_VEH_HOTWIRE_LEFT
    [78] = true, -- INPUT_VEH_HOTWIRE_RIGHT
    [80] = true, --  INPUT_VEH_CIN_CAM
    [91] = true, -- INPUT_VEH_PASSENGER_AIM
    [53] = true, -- INPUT_WEAPON_SPECIAL
    [54] = true, --  INPUT_WEAPON_SPECIAL_TWO

    --- We need these enabled as the weapon and radio wheel are tied together, and I want players to be able to defend themselves -- TayMcKenzieNZ --
    --   [81] = true, -- INPUT_VEH_NEXT_RADIO
    --    [82] = false, -- INPUT_VEH_PREV_RADIO
    --    [83] = true, -- INPUT_VEH_NEXT_RADIO_TRACK
    --    [84] = true, -- INPUT_VEH_PREV_RADIO_TRACK
    --    [85] = true, -- INPUT_VEH_RADIO_WHEEL

    [86] = true, -- INPUT_VEH_HORN
    [102] = true, -- INPUT_VEH_JUMP
    [104] = true, -- INPUT_VEH_SHUFFLE
    [105] = true, -- INPUT_VEH_DROP_PROJECTILE
    [337] = true, -- INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE
    [338] = true, -- INPUT_VEH_HYDRAULICS_CONTROL_LEFT
    [339] = true, -- INPUT_VEH_HYDRAULICS_CONTROL_RIGHT
    [340] = true, -- INPUT_VEH_HYDRAULICS_CONTROL_UP
    [341] = true, --  INPUT_VEH_HYDRAULICS_CONTROL_DOWN
    [342] = true, --  INPUT_VEH_HYDRAULICS_CONTROL_UD
    [343] = true, --  INPUT_VEH_HYDRAULICS_CONTROL_LR
    [351] = true, --  INPUT_VEH_ROCKET_BOOST
    [354] = true, -- INPUT_VEH_BIKE_WINGS
    [357] = true, -- INPUT_VEH_TRANSFORM

    -- Vehicle Controls - Bicycle / Motorcycle

    [136] = true, -- INPUT_VEH_PUSHBIKE_PEDAL
    [137] = true, -- INPUT_VEH_PUSHBIKE_SPRINT
    [139] = true, -- INPUT_VEH_PUSHBIKE_REAR_BRAKE
    [140] = true, -- INPUT_MELEE_ATTACK_LIGHT
    [141] = true, --  INPUT_MELEE_ATTACK_HEAVY
    [142] = true, -- INPUT_MELEE_ATTACK_ALTERNATE

    -- We disable the following, as the hands up animation on a bicycle / motorcycle looks broken and therefore meele does not work correctly. Perhaps we can fix this later? - TayMcKenzieNZ --
    -- Players can however meele attack with a weapon --    

    [143] = true, -- INPUT_MELEE_BLOCK
    [345] = true, -- INPUT_VEH_MELEE_HOLD
    [346] = true, -- INPUT_VEH_MELEE_LEFT
    [347] = true -- INPUT_VEH_MELEE_RIGHT

}

if Config.Binds.Handsup.enable then
    local function HandsUpLoop()
        CreateThread(function()
            while inHandsup do
                if disableHandsupControls then
                    for control, state in pairs(disableHandsupControls) do
                        DisableControlAction(0, control, state)
                    end
                end

                if IsPlayerAiming(PlayerId()) then
                    ClearPedSecondaryTask(PlayerPedId())
                    CreateThread(function()
                        Wait(350)
                        inHandsup = false
                    end)
                end

                Wait(0)
            end
        end)
    end

    RegisterCommand(Config.Binds.Handsup.command, function()
        Handsup()
    end, false)

    function Handsup()
        if not canHandsUp then
            return
        end
        local playerPed = PlayerPedId()
        if not IsPedHuman(playerPed) then
            return
        end
        if isInNotPermittedAction() then
            return
        end

        inHandsup = not inHandsup
        if inHandsup then
            DestroyAllProps()
            local dict = "random@mugging3"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(0)
            end
            TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 2.0, 2.0, -1, 49, 0, false,
                IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and 4127 or false, false)
            HandsUpLoop()
        else
            ClearPedSecondaryTask(PlayerPedId())
            local categ = 'emotes'
            local emote = Emotes.emotes[CurrentAnimationName]
            if not emote then
                emote = Emotes.prop_emotes[CurrentAnimationName]
                categ = 'prop_emotes'
            end

            if not emote then
                return
            end

            emote.name = CurrentAnimationName

            ClearPedSecondaryTask(PlayerPedId())
            Wait(400)
            DestroyAllProps()

            if categ and emote and emote.name then
                PlayEmote(categ, emote.name)
            end

        end
    end

    TriggerEvent('chat:addSuggestion', '/handsup', 'Put your arms up.')

    if Config.Binds.Handsup.enableBind then
        RegisterKeyMapping("handsup", "Put your arms up", "keyboard", Config.Binds.Handsup.key)
    end

    local function IsPlayerInHandsUp()
        return inHandsup
    end

    exports('IsPlayerInHandsUp', IsPlayerInHandsUp)

    exports('IsCanPlayerHandsUp', function()
        return canHandsUp
    end)

    exports('SetCanPlayerHandsUp', function(bool)

        if bool then
            canHandsUp = bool
            return
        end

        canHandsUp = not canHandsUp
    end)

end
