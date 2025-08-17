Logs = {}

-- What logging service do you want to use?
-- Available options: 'fivemanage', 'fivemerr', 'discord' & 'none'
-- It is highly recommended to use a proper logging service such as Fivemanage or Fivemerr
Logs.Service = 'none'

-- Do you want to include screenshots with your logs?
-- This is only applicable to Fivemanage and Fivemerr
Logs.Screenshots = false

-- You can enable (true) or disable (false) specific player events to log here
Logs.Events = {
    -- found_item is when the player finds an item while detecting
    found_item = true,
    -- level_up is when a player levels up their metal detecting skill level
    level_up = true,
    -- buy_detector is when a player purchases a metal detector
    buy_detector = true,
    -- item_sold is when a player sells an item(s) to shop
    item_sold = true,
}

-- If Logs.Service = 'discord', you can customize the webhook data here
-- If not using Discord, this section can be ignored
Logs.Discord = {
    -- The name of the webhook
    name = 'Metal Detecting Logs',
    -- The webhook link
    link = 'https://discord.com/api/webhooks/1352021829757435966/y5uyi856PkdcG2KjRkYjC87ZXIQjflCRiGGDLnEGakygx3faV01sW4YYbakHqkal8rls',
    -- The webhook profile image
    image = 'https://i.imgur.com/ILTkWBh.png',
    -- The webhook footer image
    footer = 'https://i.imgur.com/ILTkWBh.png'
}