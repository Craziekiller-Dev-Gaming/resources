function ShowNotification(source, msg, type)
    if Config.Notify == "qb" then
        TriggerClientEvent('QBCore:Notify', source, msg, type)
    elseif Config.Notify == "ox" then
        TriggerClientEvent('ox_lib:notify', source, {type = type, description = msg})
    elseif Config.Notify == "esx" then
        TriggerClientEvent('esx:showNotification', source, msg)
    elseif Config.Notify == "okok" then
        TriggerClientEvent('okokNotify:Alert', source, "Moonshine", msg, 5000, type)
    end
end

lib.callback.register("snipe-moonshine:server:getPeds", function(source)
    return SvConfig.MoonshinePeds
end)

function GetPrice(reputation, quality)

    local multiplier = 1 + (reputation/SvConfig.ReputationRequiredForFullAmount)

    -- if you want the multiplier to be capped, you can try something like this which will make sure the price of moonshine is never more than double the base price

    -- if multiplier > 2 then
    --     multiplier = 2
    -- end

    local price = math.round(multiplier * SvConfig.BasePrice * (quality/100))
    if price == 0 then
        price = 1
    end
    return price
end