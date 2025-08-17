local IsDuplicityVersion = IsDuplicityVersion()

onexFx.Notify = function(name, type, msg, color, duration, header, icon, src)
    local duration = duration or 5000
    local type = type or 'success'

    if name == 'onex-interaction' then
        if IsDuplicityVersion then
            TriggerClientEvent('onex-interaction:client:notify', src, icon, header, 2, msg, color or "#ff0039", duration)
            return
        end
        TriggerEvent('onex-interaction:client:notify', icon, header, 2, msg, color or "#ff0039", duration)
    end

    if name == 'qb-notify' then
        if IsDuplicityVersion then
            TriggerClientEvent('QBCore:Notify', src, msg, type, duration)
            return
        end
        onexFx.Core.Functions.Notify(msg, type, duration)
    end

    if name == 'esx_notify' then
        if IsDuplicityVersion then
            TriggerClientEvent('esx:showNotification', src, msg, type, duration)
            return
        end
        onexFx.Core.ShowNotification(msg, type, duration)
    end

    return true
end
