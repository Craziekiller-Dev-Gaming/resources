local menuOpen = Config.Commands.menuOpen
local e = Config.Commands.e
e.categ = 'all_emotes'
e.emoteType = 'emote'
local walk = Config.Commands.walk
walk.categ = 'walks_styles'
walk.emoteType = 'walk'
local expression = Config.Commands.expression
expression.categ = 'expressions'
expression.emoteType = 'expression'
local shared_emote = Config.Commands.shared_emote
shared_emote.categ = 'shared_emotes'
local shared_dance = Config.Commands.shared_dance
shared_dance.categ = 'shared_dances'
local animal = Config.Commands.animal
animal.categ = 'animal_emotes'
animal.emoteType = 'animal'
local notification = Config.Notification
local commands = {menuOpen, e, walk, expression, shared_emote, shared_dance, animal}

function sendNotification(notif)
    Framework.Notify.NotifyEvent(notif.text, notif.color, notif.duration, notif.header, notif.icon)
end

local function checkConditions(ename, categ, resetString, emoteType)
    -- if IsEntityDead(PlayerPedId()) or not isfw_dead() then
    if IsPlayerDead_fn() then
        sendNotification(notification.isDead)
        return true
    elseif IsPedRagdoll(PlayerPedId()) then
        sendNotification(notification.isRagdolled)
        return true
    elseif IsPedGettingUp(PlayerPedId()) then
        sendNotification(notification.isGettingUp)
        return true
    elseif IsPedInMeleeCombat(PlayerPedId()) then
        sendNotification(notification.isInCombat)
        return true
    elseif (IsPedSwimming(PlayerPedId()) or IsPedSwimmingUnderWater(PlayerPedId())) and not Config.Settings.AllowInWater then
        sendNotification(notification.isSwimming)
        return true
    elseif ename then
        if ename == resetString then
            if emoteType == 'walk' then
                resetWalkAnimsSet()
                sendNotification(notification.resetWalk)
                return true
            elseif emoteType == 'expression' then
                resetExpAnimsSet()
                sendNotification(notification.resetExpression)
                return true
            else
                EmoteCancel()
                sendNotification(notification.canceled)
                return true
            end
        elseif categ then
            local EmotesData = Emotes[categ][ename]

            if not EmotesData then
                if notification.invalid.useName then
                    local text
                    if emoteType == 'emote' then
                        text = string.format('/%s ' .. notification.invalid.emoteText, ename)
                    elseif emoteType == 'walk' then
                        text = string.format('/%s ' .. notification.invalid.walkstyleText, ename)
                    elseif emoteType == 'expression' then
                        text = string.format('/%s ' .. notification.invalid.expressionText, ename)
                    elseif emoteType == 'animal' then
                        text = string.format('/%s ' .. notification.invalid.animalText, ename)
                    end
                    sendNotification({
                        text = text,
                        color = notification.invalid.color,
                        duration = notification.invalid.duration,
                        header = notification.invalid.header,
                        icon = notification.invalid.icon
                    })
                    return true
                else
                    sendNotification(notification.invalid)
                    return true
                end
            end
        end
    end

    return false
end

local function registerCommand(cmd)
    if cmd == menuOpen then
        RegisterCommand(menuOpen.commandString, function()
            OpenEmotes()
        end, false)
    else
        RegisterCommand(cmd.commandString, function(source, args, raw)
            local ename = args[1] and args[1]:lower()
            local categ = cmd.categ
            local resetString = cmd.resetString or nil

            if not ename then
                return
            end

            if categ == 'shared_emotes' then
                categ = isSharedEmote(ename)
                cmd.emoteType = 'shared_emotes'
            end

            if checkConditions(ename, categ, resetString, cmd.emoteType or nil) then
                return
            end

            if cmd.emoteType == 'shared_emotes' then
                requestForSharedEmote(ename, false, getEimage(categ, ename))
                return
            end

            PlayEmote(categ, ename)
        end, false)
    end

    if cmd.enableKeyBind then
        RegisterKeyMapping(cmd.commandString, cmd.suggestion.description, cmd.defaultMapper, cmd.defaultKeyBind)
    end
end

for _, cmd in ipairs(commands) do
    if cmd.enable then
        registerCommand(cmd)
    end
end

CreateThread(function()
    for _, cmd in ipairs(commands) do
        local suggestionArgs = cmd.suggestion.args
        local args = suggestionArgs and {{
            name = suggestionArgs.commandString,
            help = suggestionArgs.description
        }} or nil
        TriggerEvent('chat:addSuggestion', '/' .. cmd.commandString, cmd.suggestion.description, args)
    end
end)
