QBCore, ESX = nil, nil
-- PlayerJob = {}
PlayerInfo = {}

if Config.Framework == "qb" then
    QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()
elseif Config.Framework == "esx" then
    local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
    if (ESX == nil) then
        while ESX == nil do
            Wait(100)
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        end
    end
end

function PopulateData()
    if Config.Framework == "qb" then
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerInfo = {
            identifier = PlayerData.citizenid,
        }
        PlayerData = nil
    elseif Config.Framework == "qbx" then
        PlayerData = exports.qbx_core:GetPlayerData()
        PlayerInfo = {
            identifier = PlayerData.citizenid
        }
    elseif Config.Framework == "esx" then
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        PlayerData = ESX.GetPlayerData()
        PlayerInfo = {
            identifier = PlayerData.identifier,
        }
        PlayerData = nil
    end
    DrawTargetForBins()
end


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerLoaded)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerLoaded, function()
    PopulateData()
    GetPeds()
    RegisterPlayer()
end)

RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerUnload)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerUnload, function()
    PlayerInfo = nil
end)