if Config.Framework ~= 'vrpex' then
    return
end
local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
QS_FUEL = {}
Tunnel.bindInterface('qs_fuelstations', QS_FUEL)

function GetPlayerFromId(source)
    return vRP.Passport(source)
end

function GetItem(source, item)
    local Passport = vRP.Passport(source)
    return vRP.InventoryItemAmount(Passport, item)[1]
end

function QS_FUEL.CheckBank()
    local source = source
    print('source', source)
    print('bank', vRP.GetBank(source))
    return parseInt(vRP.GetBank(source))
end

function AddItem(source, item, count)
    local Passport = vRP.Passport(source)
    vRP.GenerateItem(Passport, string.upper(item), count, true)
    vRP.GenerateItem(Passport, 'WEAPON_PETROLCAN_AMMO', 4500, true)
end

function RemoveItem(source, item, count)
    local Passport = vRP.Passport(source)
    vRP.RemoveItem(Passport, vRP.InventoryItemAmount(Passport, item)[2], count, false)
end

function RemoveMoney(source, amount)
    local Passport = vRP.Passport(source)
    vRP.PaymentFull(Passport, amount)
end
