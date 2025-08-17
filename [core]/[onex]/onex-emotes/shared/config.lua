Config = {}

Config.Shared_Emotes_Category = {
    ["shared_emotes"] = true
}

Config.IdleAnimation = { --- It will apply new idle animation for ped
    enable = true, -- make it false to disable new idle animation
    idleTimeout = 10000 -- After doing a action after how many mili second it will think its idle condition and play emote
}

Config.ControlPanelDefaultSettings = { -- By defualt you can set player emote menu upper control panel settings.
    canmovealways = 'false',
    emoteloop = 'false',
    upperbody = 'false',
    preview = 'false'
}

Config.Settings = {
    preSelectedCategory = 'all_emotes', -- When you open the menu, which category will be displayed by default? You can select any category other than [all_emotes] to avoid opening delays.

    placeEmote = {
        enable = true, -- if you dont want place emote then make it false
        noTP = false, --- when you use place emotes it will direct teleport instead of playing walk anim
        shouldReturn_to_Original_Pos = true, -- after canceling palce emote it will return to original place
        distance = 5.0,
        disableHeight = true -- If player do exploit and you want to repvent make it true
    },

    Emote_allowed_in_car = true, --[[
        This will make all emotes available on car , basically anim will play only on upper body  if player in a car.
    ]]

    AllowInWater = false, --[[
        Player can cancel or play emotes inside water.
    ]]

    DisarmPlayer = true, --[[
        Set this to true if you want to disarm the player when they play an emote.
     ]]

    AllowPunching = false,

    AnimalEmotes = {
        enable = true, --[[
            if you do not want to use animal emotes keep it false
        ]]

        big_dog = {"a_c_chop", "a_c_husky", "a_c_retriever", "a_c_shepherd", "a_c_rottweiler"},

        small_dog = {"a_c_poodle", "a_c_pug", "a_c_westy"}
    }

}

local header = 'ONEX-SYSTEM'
local icon = 'https://cdn.discordapp.com/icons/1035989130057896007/6162ef95e7ecff80b36fc923e0af39e2.webp?size=240'

Config.Notification = {

    -- Header & Icon is only used with ONEX-INTERACTION
    header = header,
    icon = icon,

    isDead = {
        text = 'You can\'t use emotes while dead!',
        color = '#ff0039',
        duration = 5000,
        header = 'You\'re Dead!',
        icon = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Skull_and_Crossbones.svg/510px-Skull_and_Crossbones.svg.png?20190922182140'
    },
    isInCombat = {
        text = 'You can\'t use emotes while in combat!',
        color = '#ff0039',
        duration = 5000,
        header = header,
        icon = icon
    },
    isRagdolled = {
        text = 'You can\'t use emotes while ragdolled!',
        color = '#ff0039',
        duration = 5000,
        header = header,
        icon = icon
    },
    isGettingUp = {
        text = 'You\'re currently getting up, please wait!',
        color = '#ff0039',
        duration = 5000,
        header = header,
        icon = icon
    },

    isSwimming = {
        text = 'You can\'t use emotes while swimming!',
        color = '#ff0039',
        duration = 5000,
        header = header,
        icon = icon
    },
    canceled = {
        text = 'Canceled Emote!',
        color = '#50fc00',
        duration = 5000,
        header = header,
        icon = 'https://png.pngtree.com/png-clipart/20230527/original/pngtree-red-cross-paint-clipart-transparent-background-png-image_9171931.png'
    },
    resetWalk = {
        text = 'Walk style has been reset!',
        color = '#50fc00',
        duration = 5000,
        header = header,
        icon = 'https://www.freeiconspng.com/thumbs/checkmark-png/checkmark-png-5.png'
    },
    resetExpression = {
        text = 'Expression has been reset!',
        color = '#50fc00',
        duration = 5000,
        header = header,
        icon = 'https://www.freeiconspng.com/thumbs/checkmark-png/checkmark-png-5.png'
    },
    invalid = {
        useName = true,
        emoteText = 'is not an emote!',
        expressionText = 'is not an expression!',
        walkstyleText = 'is not a walkstyle!',
        animalText = 'is not an animal emote!',
        -- emoteText = 'Invalid emote entered.',
        -- expressionText = 'Invalid expression entered.',
        -- walkstyleText = 'Invalid walkstyle entered.',
        -- animalText = 'Invalid animal emote entered',
        color = '#ff0039',
        duration = 5000,
        header = header,
        icon = 'https://cdn-icons-png.flaticon.com/512/564/564619.png'
    }
}

Config.Commands = {
    menuOpen = { -- !! [DO NOT] CHANGE THIS VARIABLE NAME !!
        enable = true, -- Enable true / false | if false, command is not registered.
        commandString = 'em', -- Command string to register command.
        suggestion = {
            description = 'Open Emote Menu' -- Command description that displays in the chat menu.
        },

        enableKeyBind = true, -- Enable Key Bind to trigger command. If false, command will not be triggered with this key.
        defaultMapper = 'keyboard', -- Get the mapper string here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
        defaultKeyBind = 'F4' -- Get the button string here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },

    e = { -- !! [DO NOT] CHANGE THIS VARIABLE NAME !!
        enable = true, -- Enable true / false | if false, command is not registered.
        commandString = 'e', -- Command string to register command.
        resetString = 'c',
        suggestion = {
            description = 'Play an emote', -- Command description that displays in the chat menu.
            args = {
                commandString = 'emote_name', -- Argument name displayed to the right of the command.
                description = 'dance, camera, sit or any valid emote.' -- Argument description that displays in the chat menu.
            }
        }
    },

    walk = {
        enable = true,
        commandString = 'walk',
        resetString = 'reset',
        suggestion = {
            description = 'Change Walking Style',
            args = {
                commandString = 'style_name',
                description = 'alien, brave, brave3 or any valid walking style name.'
            }
        }
    },

    expression = {
        enable = true,
        commandString = 'exp',
        resetString = 'reset',
        suggestion = {
            description = 'Change Expression',
            args = {
                commandString = 'expression_name',
                description = 'angry , cry , happy or any valid expression name.'
            }
        }
    },

    shared_emote = {
        enable = true,
        commandString = 'se',
        suggestion = {
            description = 'Play shared emote with your partner..',
            args = {
                commandString = 'shared_emote',
                description = 'cprs3 , hug2 or any valid shared emote name.'
            }
        }
    },

    shared_dance = {
        enable = true,
        commandString = 'sdance',
        suggestion = {
            description = 'Dance with your partner..',
            args = {
                commandString = 'dance_name',
                description = 'dance , boxdance or any valid dance name.'
            }
        }
    },

    animal = {
        enable = Config.Settings.AnimalEmotes.enable,
        commandString = 'animal',
        suggestion = {
            description = 'You must be an animal to use this command.',
            args = {
                commandString = 'animal_emote_name',
                description = 'bdogbark , bdogindicatehigh , bdogbeg or any valid emote name.'
            }
        }
    }
}

Config.Binds = {

    Ptfx = {
        key = 'g'
    },

    shared_emote_request = {

        accept = 246, -- Y (default) https://docs.fivem.net/docs/game-references/controls/
        cancel = 249, -- N (default) https://docs.fivem.net/docs/game-references/controls/

        acceptName = 'Y', --- THIS IS JUST A STRING VALUEW WHICH WILL BE PROJECT ON THE UI
        cancelName = 'N' --- THIS IS JUST A STRING VALUEW WHICH WILL BE PROJECT ON THE UI

    },

    CancelBind = {
        enable = true, -- Set this to false if you have something else on X, and then just use /e c to cancel Emotes.
        CancelEmoteKey = 'x' -- Get the button string here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },

    Handsup = {
        enable = false,
        command = 'handsup',
        enableBind = true,
        key = 'X'
    },

    PointHand = {
        enable = true,
        handpointKey = 'B' -- Get the button string here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },

    Crouch = {
        enable = true,
        crouchKey = 'lcontrol'
    }

}
