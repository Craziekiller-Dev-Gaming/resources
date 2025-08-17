onexFx = exports['onex-base'].fetchOnexFx()
Core = onexFx.Core

Framework = {}

Framework.PreviewCache_key = "1.0" -- * Don't get confused! If you've made any updates on the preview or captured new footage, all you need to do is change this value to any string decimal (like "2.0," "3.0," or "4.0"). This will delete the player cache and refresh it with the latest updates.

Framework.Listen = {

    IsMenuOpening = function()
        -- When menu open this will be called
    end,

    isMenuClosed = function()
        -- When menu will close this will be called
    end
}

Framework.Notify = {

    name = 'onex-interaction', --[[

        * onex-interaction
        * chat
        * qb_notify
        * esx_notify

    ]]

    NotifyEvent = function(text, color, duration, nHeader, nIcon)
        local header = nHeader
        local icon = nIcon
        if not header then
            header = Config.Notification.header or ''
        end
        if not icon then
            icon = Config.Notification.icon or ''
        end

        if Framework.Notify.name == 'onex-interaction' then
            TriggerEvent('onx-interaction:client:notify', icon, header, 2, text, color, duration)
        elseif Framework.Notify.name == 'qb_notify' then
            Core.Functions.Notify(text, 'success', duration)
        elseif Framework.Notify.name == 'esx_notify' then
            Core.ShowNotification(text)
        elseif Framework.Notify.name == 'chat' then
            TriggerEvent('chat:addMessage', {
                color = color,
                multiline = true,
                args = {header, text}
            })
        end
    end

}
