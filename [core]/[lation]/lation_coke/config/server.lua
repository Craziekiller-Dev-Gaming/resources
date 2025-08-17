return {
    ----------------------------------------------
    --        💬 Setup logging system
    ----------------------------------------------

    logs = {
        -- What logging service do you want to use?
        -- Available options: 'fivemanage', 'fivemerr', 'discord' & 'none'
        -- It is highly recommended to use a proper logging service such as Fivemanage or Fivemerr
        service = 'discord',
        -- Do you want to include screenshots with your logs?
        -- This is only applicable to Fivemanage and Fivemerr
        screenshots = false,
        -- You can enable (true) or disable (false) specific player events to log here
        events = {
            -- 'leaves_harvested' is when a player harvests coca leaves
            leaves_harvested = true,
            -- 'cement_collected' is when a player collects a cement bag
            cement_collected = true,
            -- 'table_placed' is when a player places a table down
            table_placed = true,
            -- 'table_brick' is when a player receives a completed coke brick from a table
            table_brick = true,
            -- 'table_packaged' is when a player packages a coke brick from a table
            table_packaged = true,
            -- 'table_removed' is when a player packs up/picks up a table
            table_removed = true,
            -- 'lab_purchase' is when a player purchases a lab
            lab_purchase = true,
            -- 'lab_brick' is when a player receives a completed coke brick from a lab
            lab_brick = true,
            -- 'lab_packaged' is when a player packages a coke brick from a lab
            lab_packaged = true,
            -- 'lab_upgrade' is when a lab has been upgraded
            lab_upgrade = true,
            -- 'lab_door' is when a player locks/unlocks a lab
            lab_door = true,
            -- 'lab_transfer' is when a player transfers ownership of a lab to another player
            lab_transfer = true,
            -- 'lab_sold' is when a player sells a lab to the state
            lab_sold = true,
        },
        -- If service = 'discord', you can customize the webhook data here
        -- If not using Discord, this section can be ignored
        discord = {
            -- The name of the webhook
            name = 'Coke Logs',
            -- The webhook link
            link = 'https://discord.com/api/webhooks/1406707309568196669/Ybg64-sL5xn3PxxsdXNRk18hzvCiTGEiEpexReGu7I7WrpZyRDDGgVg2rp4PX4XD1bej',
            -- The webhook profile image
            image = 'https://i.imgur.com/ILTkWBh.png',
            -- The webhook footer image
            footer = 'https://i.imgur.com/ILTkWBh.png'
        }
    },

}