Logs = {}

-- What logging service do you want to use?
-- Available options: 'fivemanage', 'fivemerr', 'discord' & 'none'
-- It is highly recommended to use a proper logging service such as Fivemanage or Fivemerr
Logs.Service = 'discord'

-- Do you want to include screenshots with your logs?
-- This is only applicable to Fivemanage and Fivemerr
Logs.Screenshots = false

-- You can enable (true) or disable (false) specific player events to log here
Logs.Events = {
    -- 'searched' is when a player searches at a farm and finds seeds
    searched = true,
    -- 'new_plant' is when a player plants a new plant
    new_plant = true,
    -- 'plant_fed' is when a player fertilizes a plant
    plant_fed = false,
    -- 'plant_watered' is when a player waters a plant
    plant_watered = false,
    -- 'plant_harvested' is when a player has harvested a plant
    plant_harvested = true,
    -- 'plant_deleted' is when a player has deleted/destroyed a plant
    plant_deleted = true,
    -- 'weed_rolled' is when a player has rolled weed into joints
    weed_rolled = true,
    -- 'weed_bagged' is when a player has bagged weed into baggies
    weed_bagged = true
}

-- If Logs.Service = 'discord', you can customize the webhook data here
-- If not using Discord, this section can be ignored
Logs.Discord = {
    -- The name of the webhook
    name = 'Weed Logs',
    -- The webhook link
    link = 'https://discord.com/api/webhooks/1352019932937846934/195aoC0Jx-DshJnzuH70ywDUWJ13avg-HL5dEviSfXNbHy9ZFuuJIeC6I8FvwHWVZmve',
    -- The webhook profile image
    image = 'https://i.imgur.com/ILTkWBh.png',
    -- The webhook footer image
    footer = 'https://i.imgur.com/ILTkWBh.png'
}