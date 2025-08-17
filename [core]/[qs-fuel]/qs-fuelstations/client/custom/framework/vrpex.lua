if Config.Framework ~= 'vrpex' then
    return
end

local Tunnel = module('vrp', 'lib/Tunnel')
vSERVER = Tunnel.getInterface('qs_fuelstations')

function GetPlayerData()
    --Just ignore it
    return { vSERVER.CheckBank(), vSERVER.CheckBank(), vSERVER.CheckBank() }
end

function GetPlayerAccounts()
    --Just ignore it
    return vSERVER.CheckBank()
end

function GetAccountMoney()
    currentCash = vSERVER.CheckBank()
end

function SendTextMessage(msg, type)
    if type == 'inform' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
    if type == 'error' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
    if type == 'success' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
end

local texts = {}
if GetResourceState('qs-textui') == 'started' then
    function DrawText3D(x, y, z, text, id, key)
        local _id = id
        if not texts[_id] then
            CreateThread(function()
                texts[_id] = 5
                while texts[_id] > 0 do
                    texts[_id] = texts[_id] - 1
                    Wait(0)
                end
                texts[_id] = nil
                exports['qs-textui']:DeleteDrawText3D(id)
                Debug('Deleted text', id)
            end)
            TriggerEvent('textui:DrawText3D', x, y, z, text, id, key)
        end
        texts[_id] = 5
    end
else
    function DrawText3D(x, y, z, text)
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        local factor = text:len() / 370
        DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
        ClearDrawOrigin()
    end
end

function DrawGenericText(text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.65, 0.65)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(0.80, 0.90)
end
