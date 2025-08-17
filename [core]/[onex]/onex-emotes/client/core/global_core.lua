if GetResourceState('onex-emotes_list') ~= 'started' then
    return print('^3 MISSING DEPENDENCY : onex_emotes_list', 'Check Docs (docs.onexscripts.com)')
end

-- ==================================================
-- *                    Events
-- =================================================
local StandaloneIdentifier = nil
local isESXPlayerDead = false

if onexFx.Data.Framework == 'esx' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function() --- using to restore walk and expression
        RefreshMenu()
        Wait(2000)
        Restore_walk_anim()
        Restore_exp_anim()
    end)

    AddEventHandler('esx:onPlayerDeath', function()
        isESXPlayerDead = true
    end)

    AddEventHandler('esx:onPlayerSpawn', function(spawn)
        isESXPlayerDead = false
    end)
elseif onexFx.Data.Framework == 'standalone' then
    RegisterNetEvent('onex-emotes:client:DeliverLicense', function(data)
        StandaloneIdentifier = data
    end)
elseif onexFx.Data.Framework == 'qb' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function() --- using to restore walk and expression
        RefreshMenu()
        Wait(2000)
        Restore_walk_anim()
        Restore_exp_anim()
    end)
end

-- =================================================

-- *                FUNCTIONS

-- =================================================

-- ! Do not touch until you know what you are doing

-- Functions

function IsPlayerDead_fn()
    local isDead = false

    if onexFx.Data.Framework == 'qb' then
        local Pdata = Core.Functions.GetPlayerData()
        isDead = Pdata.metadata['inlaststand'] and Pdata.metadata['isdead']
    elseif onexFx.Data.Framework == 'esx' then
        isDead = isESXPlayerDead
    elseif onexFx.Data.Framework == 'standalone' then
        isDead = IsPlayerDead(PlayerPedId())
    elseif onexFx.Data.Framework == 'custom' then
        --- set your logic if you are using custom framework
    end

    return isDead
end

function RetrivePlayerIdentifier()
    local identifier = nil

    if onexFx.Data.Framework == 'qb' then
        identifier = Core.Functions.GetPlayerData().citizenid
    elseif onexFx.Data.Framework == 'esx' then
        identifier = Core.GetPlayerData().identifier
    elseif onexFx.Data.Framework == 'standalone' then
        TriggerServerEvent('onex-emotes:server:requestingLicense')

        repeat
            Wait(10)
        until StandaloneIdentifier

        identifier = StandaloneIdentifier
    elseif onexFx.Data.Framework == 'custom' then
        -- return unique any key for identifying [citizenid , license , steam ] player
    end

    repeat
        Wait(10)
    until identifier

    return identifier
end

function RetrivePlayerName(player_src)
    local PlayerName = 'Frostfire'
    if onexFx.Data.Framework == 'standalone' then
        PlayerName = GetPlayerName(player_src)
    elseif onexFx.Data.Framework == 'qb' then
        local Pdata = Core.Functions.GetPlayerData()
        PlayerName = Pdata.charinfo.firstname .. ' ' .. Pdata.charinfo.lastname
    elseif onexFx.Data.Framework == 'esx' then
        local Pdata = Core.GetPlayerData()
        PlayerName = Pdata.firstName .. ' ' .. Pdata.lastName
    elseif onexFx.Data.Framework == 'custom' then
        -- return player name can be from database or can be simple name or anything
    end

    return PlayerName
end

-- Thereads

CreateThread(function()
    Wait(0)

    if Framework.fx == 'qb' then
        if not LocalPlayer.state['isLoggedIn'] then
            return
        end
    end

    Restore_walk_anim()
    Restore_exp_anim()
end)
