--[[
    Welcome to the qb-tradingcard configuration!

    This script is designed to offer an interactive and customizable trading card system for your server.
    Before diving into configuration, please carefully read the instructions and documentation provided below.

    ### Key Points to Understand:
    1. **Step-by-Step Guidance**: Each crucial configuration will be highlighted and explained in detail within this file.
    2. **Customization Freedom**: Most settings are fully customizable to fit the unique needs of your framework (ESX, QBCore, etc.).
    3. **Custom Files**: The primary configuration files are organized under the `client/custom/*` and `server/custom/*` directories.
       Feel free to modify these files to adapt the system to your server's environment.

    ### Configuration Tips:
    - Look for configuration boxes (like this one) for detailed explanations of each setting.
    - Pay attention to comments for recommendations, common issues, and potential impacts of changes.
    - Always back up your changes before modifying core files to ensure no data is lost.

    ### Documentation:
    For full installation instructions, setup guides, and troubleshooting steps, refer to the official documentation here:
    🔗 **https://docs.quasar-store.com/**

    💡 **Pro Tip**: If you're new to configuring assets, consult a developer or a community support group to ensure optimal setup.
]]

Config = Config or {}
Locales = Locales or {}

--[[
    Language Selection Configuration

    The first step in customizing this asset is selecting your preferred language.
    Below, you’ll find a list of all the default language options available in the `locales/*` directory.
    If your desired language is not included, you can create a custom locale file and add it yourself.

    ### How to Add a New Language:
    1. Navigate to the `locales/` folder.
    2. Duplicate any existing locale file as a template (e.g., `en.lua`).
    3. Rename the file to your desired language code (e.g., `my.lua` for a custom language).
    4. Translate the contents of the file to your language.
    5. Update the `Config.Language` setting to match your new language.

    ### Default Languages Available:
        'ar'     -- Arabic
        'bg'     -- Bulgarian
        'ca'     -- Catalan
        'cs'     -- Czech
        'da'     -- Danish
        'de'     -- German
        'el'     -- Greek
        'en'     -- English
        'es'     -- Spanish
        'fa'     -- Persian
        'fr'     -- French
        'hi'     -- Hindi
        'hu'     -- Hungarian
        'it'     -- Italian
        'ja'     -- Japanese
        'ko'     -- Korean
        'nl'     -- Dutch
        'no'     -- Norwegian
        'pl'     -- Polish
        'pt'     -- Portuguese
        'ro'     -- Romanian
        'ru'     -- Russian
        'sl'     -- Slovenian
        'sv'     -- Swedish
        'th'     -- Thai
        'tr'     -- Turkish
        'zh-CN'  -- Chinese (Simplified)
        'zh-TW'  -- Chinese (Traditional)

    🔗 **Pro Tip**: When creating a new locale, ensure that your translations are accurate and formatted correctly to avoid issues in the system.
]]

Config.Language = 'en'

--[[
    Framework Detection System

    This script automatically detects which framework your server is using (qb-core, es_extended, or qbx_core).
    If you have renamed any of these frameworks, you can remove the value from `Config.Framework` and manually
    assign it after making the necessary modifications in the framework files inside this script.

    ⚠️ Important:
    - This system is designed to work automatically.
    - Do not edit or modify this section unless you fully understand its functionality.
    - Incorrect changes may result in the script not functioning properly.

    Framework Compatibility:
    - qb-core
    - es_extended (1.2 or legacy)
    - qbx_core (derived from qb-core)

    This script will throw an error if no compatible framework is detected, ensuring you are notified early.
]]

-- Define compatible frameworks and their identifiers
local frameworks = {
    ['es_extended'] = 'esx', -- Maps 'es_extended' to 'esx' for compatibility
    ['qb-core'] = 'qb',      -- Maps 'qb-core' to 'qb'
    ['qbx_core'] = 'qb'      -- Maps 'qbx_core' to 'qb'
}

-- Function to check which framework is active and running
local function dependencyCheck(data)
    for k, v in pairs(data) do
        if GetResourceState(k) == 'started' then -- Checks if the resource is running
            return v                             -- Returns the corresponding framework identifier
        end
    end
    return false -- Returns false if no framework is detected
end

-- Automatically detect the active framework
Config.Framework = dependencyCheck(frameworks)
assert(Config.Framework, 'No framework found, please make sure you have es_extended, qb-core, or qbx_core installed')

--[[
    Inventory System Configuration for PSA Stash

    This section is designed to configure the PSA stash system. It works by integrating with
    your existing inventory system, requiring specific events from the inventory to function correctly.

    To add support for a different inventory system:
    1. Copy and replicate the steps in `server/custom/inventory/*` to include your inventory's events.
    2. Add your inventory to the `inventories` table below following the given format.

    ⚠️ Important:
    - Make sure the correct inventory is detected by the script.
    - If your inventory is not listed, you need to manually add its events and integrate it properly.

    Supported Inventories:
    - `ox_inventory`
    - `qs-inventory`
    - `qb-inventory`
    - `core_inventory`
    - `origen_inventory`
    - `codem-inventory`
    - `tgiann-inventory`
]]

-- List of supported inventories and their identifiers
local inventories = {
    ['ox_inventory'] = 'ox',            -- Integration for ox_inventory
    ['qs-inventory'] = 'qs',            -- Integration for qs-inventory
    ['qb-inventory'] = 'qb',            -- Integration for qb-inventory
    ['core_inventory'] = 'core',        -- Integration for core_inventory
    ['origen_inventory'] = 'origen',    -- Integration for origen_inventory
    ['codem-inventory'] = 'codem',      -- Integration for codem-inventory
    ['tgiann-inventory'] = 'tgiann',    -- Integration for tgiann-inventory
    ['qs-advancedinventory'] = 'advqs', -- Integration for qs-advancedinventory
}

-- Automatically detects the active inventory system
Config.Inventory = dependencyCheck(inventories)
assert(Config.Inventory, 'No inventory found, please make sure you have ox_inventory, qs-inventory, or qb-inventory installed (if not, consult the creator of your inventory)')

-- Set to true if using the old version of qb-inventory
Config.HaveOldQbInventory = false -- Enable this if you're using a legacy version of qb-inventory

--[[
    General Configuration for Trading Card System

    This section includes all the general settings for the trading card system.
    You can customize both the client and server behavior in the "custom" folder
    provided with this asset. Below, you'll also find a list of predefined objects
    and configuration settings. Please refer to the documentation for further details.

    ⚠️ Important:
    - Make sure to review all configurations and modify them as per your server's needs.
    - Changes here affect the global functionality of the system.
]]

Config.UseTarget = true    -- Enable or disable target integration (e.g., qb-target, ox_target)

Config.OpeningTime = 2500           -- Time (in ms) for the opening animation of the card store or PSA
Config.ShowToPlayers = true         -- Show the TCG store location to players in-game (marker/text display)
Config.ShowAnimation = true         -- Enable or disable animations when interacting with the system
Config.AdminCommand = 'givecards'   -- Exclusive command to give you cards.

--[[
    List of card items available in the game. These represent the different
    tiers or types of trading cards players can obtain or interact with.
]]

Config.CardItems = {
    'tradingcard_legendary', -- Legendary trading card
    'tradingcard_rare',      -- Rare trading card
    'tradingcard_basic',     -- Basic trading card
}

--[[
    Configuration for store locations. These define where players can interact
    with the TCG system. Each location includes a model, hash, coordinates, and
    text to display.
]]

Config.Locations = {
    {
        type = 4,                                         -- Interaction type (e.g., target type)
        model = 'u_m_y_pogo_01',                          -- NPC model for the TCG store
        hash = 0xDC59940D,                                -- Hash for the NPC
        location = vector4(-143.67, 229.92, 93.92, 0.00), -- Coordinates for the location
        text = '[E] - Open TCG Store'                     -- Text displayed to players
    }
}

Config.ShopSlots = 3 -- Number of item slots available in the TCG store

--[[
    Items available for purchase in the TCG store. Each item includes:
    - `name`: Item name (must match your inventory system)
    - `price`: Cost of the item
    - `amount`: Quantity available for purchase
    - `info`: Additional metadata for the item
    - `type`: Item type (e.g., "item" for inventory items)
    - `slot`: Slot position in the shop menu
]]

Config.ShopItems = {
    [1] = {
        name = 'tradingcard_booster_pack',
        price = 500,
        amount = 50,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'tradingcard_stash',
        price = 2500,
        amount = 50,
        info = {},
        type = 'item',
        slot = 2,
    },
    [3] = {
        name = 'tradingcard_psa',
        price = 5800,
        amount = 50,
        info = {},
        type = 'item',
        slot = 3,
    },
}

--[[
    Customizable card colors and effects for different card types.
    - `color1, color2, color3, color4`: Background gradient colors.
    - `border_size`: Thickness of the border in pixels.
    - `border_color`: Color of the card border.
    - `shining`: Enable/disable shining effect on the card.
    - `sparkles`: Enable/disable sparkles effect on the card.
]]

Config.CardColors = {
    ['basic'] = {
        color1 = '#fff',
        color2 = '#fff',
        color3 = '#fff',
        color4 = '#fff',
        border_size = 6,
        border_color = '#999',
        shining = false,
        sparkles = false,
    },
    ['rare'] = {
        color1 = '#af13ce',
        color2 = '#87a593',
        color3 = '#ffbe33',
        color4 = '#ffcf33',
        border_size = 6,
        border_color = '#999',
        shining = false,
        sparkles = true
    },
    ['legendary'] = {
        color1 = '#e09a3d',
        color2 = '#41ece4',
        color3 = '#ff9f9f',
        color4 = '#ff7676',
        border_size = 6,
        border_color = '#999',
        shining = true,
        sparkles = true
    },
}

--[[
    Function to determine the type of card received based on random luck.
    - 30% chance for 'rare'.
    - 30% chance for 'legendary'.
    - 40% chance for 'basic'.
]]

function GetRandomCardType(cardListForItem)
    local luck = math.random(1, 100)
    local mappedRanks = {}
    for k, v in pairs(cardListForItem) do
        if not table.find(mappedRanks, v.color) then
            table.insert(mappedRanks, v.color)
        end
    end
    if #mappedRanks == 1 then
        Debug('Only one rank found, returning it')
        return mappedRanks[1]
    end
    for k, v in pairs(mappedRanks) do
        if luck <= 80 and v == 'rare' then
            Debug('Rare card found, returning it', mappedRanks, 'luck', luck)
            return v
        elseif luck > 30 and luck <= 70 and v == 'legendary' then
            Debug('Legendary card found, returning it', mappedRanks, 'luck', luck)
            return v
        end
    end
    if table.find(mappedRanks, 'basic') then
        Debug('No rare or legendary card found, returning basic card', mappedRanks, 'luck', luck)
        return 'basic'
    end
    Error('No card type found, we are returning random type', mappedRanks)
    return mappedRanks[math.random(1, #mappedRanks)]
end

--[[
    General configuration for booster packs.
    Define the visual representation of each booster pack.
    You can customize the item, opened pack image, and zipped pack image here.
]]

Config.CardBoosters = {
    {
        item = 'tradingcard_booster_pack', -- The inventory item for this booster pack
        image = 'opened-pack.png',         -- Image displayed when the pack is opened
        zipImage = 'zip_of_pack.png'       -- Compressed representation of the pack
    },
    {
        item = 'tradingcard_booster_legends', -- Inventory item for a legendary booster pack
        image = 'opened-pack-legends.png',    -- Image displayed when this pack is opened
        zipImage = 'zip_of_pack-legends.png'  -- Compressed representation of the pack
    }
}

--[[
    Cards Configuration
    Here you can define the cards available in the system. Each card can be customized with
    various attributes, including rarity, label, images, stats, and booster association.
]]

Config.Cards = {
    [1] = {
        color = 'rare',                                                                                                             -- Color type for the card (links to Config.CardColors)
        rank = 'rare',                                                                                                              -- Rank or rarity of the card
        label = 'Corrado Cattani',                                                                                                  -- Name of the card
        images = 'https://i.ibb.co/HVL3nYP/2021-05-02-30.webp',                                                                     -- Image URL for the card
        term = 'Corrado Cattani, son of a smuggler, candidate for general after a pandemic. Defender of his city against walkers.', -- Card lore or description
        -- description = 'A secondary description?', -- Uncomment this line for an optional secondary description
        health = 200,                                                                                                               -- Health points of the card
        attack = 99,                                                                                                                -- Attack power of the card
        height = '168',                                                                                                             -- Height of the character or item
        weight = '80',                                                                                                              -- Weight of the character or item
        quality = 100,                                                                                                              -- Quality percentage of the card
        booster = 'tradingcard_booster_pack'                                                                                        -- Associated booster pack for this card
    },
    [2] = {
        color = 'basic',
        rank = 'basic',
        label = 'Léo Lebo',
        images = 'https://i.ibb.co/rGsxzVT/qdqddq.png',
        term = 'Léo Lebo, a charismatic and determined man, was born in a small town. After studying law and economics, he made a name for himself in the real estate sector in the city.',
        -- description = 'A secondary description?',
        health = 125,
        attack = 80,
        height = '158',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [3] = {
        color = 'rare',
        rank = 'rare',
        label = 'Diego Lopez',
        images = 'https://i.ibb.co/mh7QPND/diego-lopez.webp',
        term = 'Diego Lopez, a former police officer in Mexico, flees to Los Santos after his family is murdered by a cartel. Now a member of the local police force, he seeks revenge and is determined to take down criminals wherever he can.',
        -- description = 'A secondary description?',
        health = 195,
        attack = 160,
        height = '152',
        weight = '54',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [4] = {
        color = 'rare',
        rank = 'rare',
        label = 'Ethan Moore',
        images = 'https://i.ibb.co/cxQ3zh6/Ethan-Moore1.webp',
        term = 'Moore, Chief of the San Andreas State Forces, is searching for his girlfriend kidnapped by the Colombian Holy Crown while taking care of his children. He is brave, stubborn, and has great investigative skills.',
        -- description = 'A secondary description?',
        health = 195,
        attack = 160,
        height = '192',
        weight = '102',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [5] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Quasar',
        images = 'https://i.ibb.co/v3xzXD5/11.png',
        term = 'Quasar, they say he has a TOP 1 store on FiveM, creator of several mythical assets, such as Smartphone, Inventory and more, I think, I just think you can buy his assets at buy.quasar-store.com!',
        -- description = 'A secondary description?',
        health = 400,
        attack = 390,
        height = '178',
        weight = '85',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [6] = {
        color = 'basic',
        rank = 'basic',
        label = 'Hannah Parker',
        images = 'https://i.ibb.co/55TPg1s/66-A8y4-Gifa-Zn.png',
        term = 'Hannah Parker, comes from California. After a strange disaster she immigrated to Los Santos to start a new life!',
        -- description = 'A secondary description?',
        health = 75,
        attack = 130,
        height = '162',
        weight = '52',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [7] = {
        color = 'basic',
        rank = 'basic',
        label = 'Shiva Patil',
        images = 'https://i.ibb.co/MNCT89d/6-XTi-U0qn7dx-D.webp',
        term = 'Shiva Patil, a former military man, arrives in Los Santos looking for peace, but after meeting the Grove Street gang, he joins them. Adopting the name Anthony Fernandez.',
        -- description = 'A secondary description?',
        health = 125,
        attack = 95,
        height = '185',
        weight = '80',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [8] = {
        color = 'rare',
        rank = 'rare',
        label = 'Miguel Esposito',
        images = 'https://i.ibb.co/W6FvZpk/Miguel-ESPOSITO-photo-66.webp',
        term = 'Miguel Esposito, of Portuguese descent, dreamed of being a police officer since he was a child. He joined the Los Santos Police Department at age 18 and has been a Commander for three years.',
        -- description = 'A secondary description?',
        health = 155,
        attack = 290,
        height = '175',
        weight = '72',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [9] = {
        color = 'basic',
        rank = 'basic',
        label = 'Thomas Nielsen',
        images = 'https://i.ibb.co/r3x1cqP/Skrmbillede-2024-06-13-153949.webp',
        term = 'Thomas Nielsen, a former chief physician of Region Panebil, is looking forward to exploring new cities and getting to know its people. With extensive experience in hospitals and pre-hospital services.',
        -- description = 'A secondary description?',
        health = 100,
        attack = 25,
        height = '193',
        weight = '85',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [10] = {
        color = 'basic',
        rank = 'basic',
        label = 'Emmanuel Richter',
        images = 'https://i.ibb.co/5YrVmD1/image.webp',
        term = 'Emmanuel Richter, born April 8, 1997 in Bregenz, Austria, moved to San Andreas at the age of 18 after a tragic event in his youth. In Paleto Bay, he works as a Deputy in the Sheriff\'s Department, enforcing the law with a ruthless and often controversial approach.',
        -- description = 'A secondary description?',
        health = 125,
        attack = 80,
        height = '160',
        weight = '58',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [11] = {
        color = 'basic',
        rank = 'basic',
        label = 'Mark Jayson',
        images = 'https://i.ibb.co/4Rnrp9s/image.webp',
        term = 'Always an outsider, Mark Jayson found his purpose at age 18 on his uncle’s Wolfsbane motorcycle. A passion for mechanics and helping others made him stand out, and he eventually joined a motorcycle club, finding a family and a sense of belonging.',
        -- description = 'A secondary description?',
        health = 155,
        attack = 165,
        height = '194',
        weight = '115',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [12] = {
        color = 'basic',
        rank = 'basic',
        label = 'Eustaquio Perez',
        images = 'https://i.ibb.co/gVdWQnX/sda.png',
        term = 'Eustaquio Perez, a Dominican in Puerto Rico, becomes a racing mechanic, joins the Monkey Gang, and then returns to the Dominican Republic. He returns to Puerto Rico, forms Flow Factory with his sister Sofia, and keeps his shop active.',
        -- description = 'A secondary description?',
        health = 25,
        attack = 55,
        height = '157',
        weight = '48',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [13] = {
        color = 'basic',
        rank = 'basic',
        label = 'Valencia Verona',
        images = 'https://i.ibb.co/jRDJqt4/asdasdasd.png',
        term = 'Valencia von Verona plans to buy a mansion in Vinewood Hills to expand his family\'s business in Los Santos. Meanwhile, he starts illegal activities and connects with local gangs to strengthen his influence in the criminal underworld.',
        -- description = 'A secondary description?',
        health = 85,
        attack = 70,
        height = '152',
        weight = '52',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [14] = {
        color = 'rare',
        rank = 'rare',
        label = 'Jbc Christie',
        images = 'https://i.ibb.co/23kndNB/Screenshot-2023-07-05-193745.webp',
        term = 'Jbc, a Jamaican ex-EMS, is looking for a new home after falling out with a gang. He eventually finds a welcoming town and is ready to start over, leaving his past behind.',
        -- description = 'A secondary description?',
        health = 85,
        attack = 175,
        height = '185',
        weight = '78',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [15] = {
        color = 'basic',
        rank = 'basic',
        label = 'Monkey Cesar',
        images = 'https://i.ibb.co/qC55MG6/maxresdefault.jpg',
        term = 'Cesar, a monkey with a defiant attitude, leads “The Bananas” in the fruit trade in the jungle. By repelling a rival invasion, he consolidates his power. Although he is a gangster, he cares for his crew like family and is a legend in the jungle.',
        -- description = 'A secondary description?',
        health = 90,
        attack = 210,
        height = '125',
        weight = '30',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [16] = {
        color = 'basic',
        rank = 'basic',
        label = 'Requis Thompson',
        images = 'https://i.ibb.co/H2Wsq4H/Sin-t-tulo.png',
        term = 'Requis Thompson, a hacker and driver, teams up with ex-mobster Tony Capavelli. Requis dreams of going legit, while Tony seeks to build a new criminal empire. Together, they dominate the city\'s underworld.',
        -- description = 'A secondary description?',
        health = 110,
        attack = 95,
        height = '175',
        weight = '58',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [17] = {
        color = 'rare',
        rank = 'rare',
        label = 'Deso Mate',
        images = 'https://i.ibb.co/fDW2VCY/20221010020811-1.webp',
        term = 'Deso Mate, a betrayed ex-secret service agent, joins a rebel group to take down the corrupt government that tried to kill him. Now, he strikes from the shadows, fighting for justice and freedom.',
        -- description = 'A secondary description?',
        health = 155,
        attack = 190,
        height = '185',
        weight = '110',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [18] = {
        color = 'basic',
        rank = 'basic',
        label = 'Richard Perez',
        images = 'https://i.ibb.co/JcDw1Jx/Pkkn-Rr4-Ikv-K2.webp',
        term = 'Richard, born in Chile in 1990, was a police officer who later built a successful business, enabling him to travel the world. He’s a calm person who believes in resolving issues with words.',
        -- description = 'A secondary description?',
        health = 25,
        attack = 80,
        height = '160',
        weight = '45',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [19] = {
        color = 'rare',
        rank = 'rare',
        label = 'Beatrix Kiddo',
        images = 'https://i.ibb.co/B61frxZ/kiddo3.png',
        term = 'Kiddo, once a cop with a love for cars and adventure, is now a mechanic and thrill-seeker. She shares wild escapades with her sister, bringing energy and laughter to every roleplay.',
        -- description = 'A secondary description?',
        health = 170,
        attack = 265,
        height = '175',
        weight = '62',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [20] = {
        color = 'basic',
        rank = 'basic',
        label = 'Nick Maverick',
        images = 'https://i.ibb.co/LNqXHwf/maverick.png',
        term = 'Nick Maverick, a Swedish-German physician with white eyes from a Bundeswehr injury, now works at University Medical Center Hamburg-Eppendorf.',
        -- description = 'A secondary description?',
        health = 70,
        attack = 105,
        height = '175',
        weight = '62',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [21] = {
        color = 'basic',
        rank = 'basic',
        label = 'Liam Rusty',
        images = 'https://i.ibb.co/vV5hk0J/image-2024-08-25-121126399-enhanced.png',
        term = 'Rusty opened his first mechanic shop at 23. By 1995, he moved to a new location and established Rusty\'s Customs as a leading name in automotive repair.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 120,
        height = '165',
        weight = '89',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [22] = {
        color = 'rare',
        rank = 'rare',
        label = 'Javier Ritch',
        images = 'https://i.ibb.co/P1XwjZF/Screenshot-273.webp',
        term = 'Javier Ritch, once a street hustler in Los Santos, founded the powerful cartel "La Mano Oscura" after a betrayal. Now, he controls a vast drug empire, ruling with an iron fist and facing constant danger.',
        -- description = 'A secondary description?',
        health = 170,
        attack = 200,
        height = '188',
        weight = '92',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [23] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Aura',
        images = 'https://i.ibb.co/9ZNCDk0/13.webp',
        term = 'Aura, a legendary outlaw from Quasar Store County, makes sure that every citizen is well and serves them with great charisma, although her patience will have a limit...',
        -- description = 'A secondary description?',
        health = 80,
        attack = 320,
        height = '175',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [24] = {
        color = 'basic',
        rank = 'basic',
        label = 'Steven Blaze',
        images = 'https://i.ibb.co/7XjWJLp/image.webp',
        term = 'Steven Blaze overcame a tough childhood and loss by hitchhiking across San Andreas. Finding a flyer for the San Andreas Fire Department, he joined, worked hard, and rose to fire chief.',
        -- description = 'A secondary description?',
        health = 155,
        attack = 95,
        height = '180',
        weight = '102',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [25] = {
        color = 'rare',
        rank = 'rare',
        label = 'Amanda Novak',
        images = 'https://i.postimg.cc/k5fbdsGZ/imagen-2024-08-31-145544120.png',
        term = 'Amanda Novak was forced out of her home as a teen and turned to crime to survive. She built her own family on the streets and founded Rat Gang, a crew that runs the city from the shadows.',
        -- description = 'A secondary description?',
        health = 100,
        attack = 195,
        height = '173',
        weight = '62',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [26] = {
        color = 'basic',
        rank = 'basic',
        label = 'Jason Vargas',
        images = 'https://i.postimg.cc/WpdtzrXB/fivem-characyer.webp',
        term = 'After leaving the military, Jason Vargas focused on his passion for driving at night on the Wangan Highway, using the savings from his service.',
        -- description = 'A secondary description?',
        health = 50,
        attack = 95,
        height = '180',
        weight = '71',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [27] = {
        color = 'basic',
        rank = 'basic',
        label = 'Marek Brown',
        images = 'https://i.postimg.cc/FstFK6fS/LaR9cec.webp',
        term = 'Marek Brown, a former US Army Staff Sergeant who retired in 2020, joined the LAPD and rose to Chief of Police. He now works to reduce crime and make Los Angeles safer.',
        -- description = 'A secondary description?',
        health = 60,
        attack = 110,
        height = '192',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [28] = {
        color = 'basic',
        rank = 'basic',
        label = 'Ben Bos',
        images = 'https://i.postimg.cc/Y9WKKpzs/6x-DAu3-F-d.webp',
        term = 'Growing up with just his mom and older brother, he now lives in the city with his best friend/brother, drifting through life with no clear plan. One day he\'s with the mafia, the next with the police.',
        -- description = 'A secondary description?',
        health = 90,
        attack = 55,
        height = '160',
        weight = '45',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [29] = {
        color = 'basic',
        rank = 'basic',
        label = 'Tony Sourbutts',
        images = 'https://i.postimg.cc/Wz85xKCy/r33xalJh.webp',
        term = 'Tony Sourbutts, high on cocaine, rode a unicycle with his parrot through downtown, crashing a dance party and becoming an overnight sensation before leaving a trail of confetti.',
        -- description = 'A secondary description?',
        health = 20,
        attack = 45,
        height = '155',
        weight = '43',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [30] = {
        color = 'basic',
        rank = 'basic',
        label = 'Bob-Lee Swagger',
        images = 'https://i.postimg.cc/HLm77xVQ/Z998S8H.png',
        term = 'Small town boy Left off to military after 4 deployment\'s he retired to sandy county to take the role as Sheriff, and pledged to Make a difference in the Blaine county area.',
        -- description = 'A secondary description?',
        health = 95,
        attack = 100,
        height = '192',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [31] = {
        color = 'basic',
        rank = 'basic',
        label = 'Daryl Foster',
        images = 'https://i.postimg.cc/L83jDLdy/image.png',
        term = 'He had a simple childhood with his mother after his parents\' separation. Initially independent and solitary, he is now very sociable and dreams of becoming world-famous.',
        -- description = 'A secondary description?',
        health = 40,
        attack = 70,
        height = '160',
        weight = '120',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [32] = {
        color = 'basic',
        rank = 'basic',
        label = 'Marcel Salzberg',
        images = 'https://i.postimg.cc/15ZgdXrb/screenshot.png',
        term = 'Marcel Salzberg, Vienna’s top police officer, is dedicated to eliminating crime and preventing theft. After nearly being dismissed due to an incomplete report, he now emphasizes meticulous reporting and has reformed the police force, always believing in the good in people.',
        -- description = 'A secondary description?',
        health = 20,
        attack = 85,
        height = '152',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [33] = {
        color = 'rare',
        rank = 'rare',
        label = 'Tyler Smith',
        images = 'https://i.postimg.cc/P5V5d51X/be40860255cb80354a629bb46770df10.png',
        term = 'Tyler Haugen Smith, a former military man and classic car enthusiast, lost his wife and daughter to the mafia. Shattered by the justice system’s failure, he now relentlessly seeks justice, driven by honor and a desire to hold the guilty accountable.',
        -- description = 'A secondary description?',
        health = 155,
        attack = 280,
        height = '182',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [34] = {
        color = 'rare',
        rank = 'rare',
        label = 'Pedro Gonzalez',
        images = 'https://i.postimg.cc/CMCMzNb6/screenshot-12.webp',
        term = 'Pedro Gonzalez, a renowned trap artist addicted to methamphetamine, leads a chaotic life of wild parties and intense studio sessions. His turbulent lifestyle fuels his music and keeps him at the top of the trap scene.',
        -- description = 'A secondary description?',
        health = 25,
        attack = 300,
        height = '170',
        weight = '65',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [35] = {
        color = 'basic',
        rank = 'basic',
        label = 'Jay Rodriquez',
        images = 'https://i.postimg.cc/7634JHJT/image.png',
        term = 'After 31 years as a drug dealer in Mexico, I moved to the Netherlands to escape threats on my life. Now, I\'m a successful cop, mastering the language and handling my new role well.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 80,
        height = '163',
        weight = '52',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [36] = {
        color = 'rare',
        rank = 'rare',
        label = 'Luvcho Zlatarov',
        images = 'https://i.postimg.cc/JzSCTDbk/image.webp',
        term = 'Luvcho Zlatarov, the dedicated mayor of Los Santos, is committed to making the city a beacon of opportunity and safety. Alongside him is his supportive wife, Alexandra Brown, who plays a key role in his mission.',
        -- description = 'A secondary description?',
        health = 225,
        attack = 370,
        height = '185',
        weight = '96',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [37] = {
        color = 'basic',
        rank = 'basic',
        label = 'Vincent DeMickalo',
        images = 'https://i.postimg.cc/nLKSvCTZ/image.png',
        term = 'Vincent DeMickalo, shaped by a tough upbringing marked by family mental health issues and loss, is now the Director of the SADPS. He uses his strength and compassion to positively impact his community.',
        -- description = 'A secondary description?',
        health = 100,
        attack = 120,
        height = '172',
        weight = '68',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [38] = {
        color = 'basic',
        rank = 'basic',
        label = 'James Baker',
        images = 'https://i.postimg.cc/HnnSD3ms/image.png',
        term = 'James, a dedicated Police Chief, works tirelessly to keep the streets safe and free of crime. His leadership and commitment ensure a secure community for everyone.',
        -- description = 'A secondary description?',
        health = 90,
        attack = 95,
        height = '180',
        weight = '75',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [39] = {
        color = 'rare',
        rank = 'rare',
        label = 'Bobby Brown',
        images = 'https://i.postimg.cc/7hRKx7P1/yx13-Rpy-d.webp',
        term = 'After a rough upbringing with only his grandmother and constant bullying, he has now become the bully himself.',
        -- description = 'A secondary description?',
        health = 185,
        attack = 200,
        height = '192',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [40] = {
        color = 'basic',
        rank = 'basic',
        label = 'Pepe Jean',
        images = 'https://i.postimg.cc/G25FYR0d/8ac75d-13825a080b7c4e241e3628811c3fd470.png',
        term = 'Raised by his grandmother and bullied as a child, Pepe Jean now rules the local underworld with a ruthless edge, using his past struggles as fuel for his power.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 100,
        height = '180',
        weight = '74',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [41] = {
        color = 'basic',
        rank = 'basic',
        label = 'Richard Mills',
        images = 'https://i.postimg.cc/VNsZWzhC/44cea0-1-Blk-min.webp',
        term = 'Richard Mills, a former businessman turned cartel leader, rose through the ranks of the drug trade. Now at the top, he faces constant threats from rivals and law enforcement while grappling with the moral cost of his empire.',
        -- description = 'A secondary description?',
        health = 5,
        attack = 210,
        height = '192',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [42] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Champa',
        images = 'https://i.postimg.cc/dV641z0t/ba2eaf-2.webp',
        term = 'Champa, a clumsy thief in the FiveM community, fails miserably at stealing scripts due to his lack of hacking skills. His incompetence leaves frustrated developers and a trail of botched attempts.',
        -- description = 'A secondary description?',
        health = 350,
        attack = 25,
        height = '155',
        weight = '42',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [43] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Logical',
        images = 'https://i.postimg.cc/dVhLkCsk/maxresdefault.jpg',
        term = 'Logical, if teamed up with Champa, would gain 100 attack points. Champa, the clumsy thief who robs elderly women, adds chaos to their unlikely partnership.',
        -- description = 'A secondary description?',
        health = 255,
        attack = 50,
        height = '160',
        weight = '150',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [44] = {
        color = 'basic',
        rank = 'basic',
        label = 'Robert d\'Tilo',
        images = 'https://i.postimg.cc/C5RWHwzN/coverphoto-thumb-png-22185c0d727cf019e302f9b7ffbc37cb.png',
        term = 'Robert d\'Tilo, once a promising officer, struggled with his weight and self-worth. His diminishing health and confidence left him feeling like a shadow of his former self, struggling to find redemption in his role.',
        -- description = 'A secondary description?',
        health = 200,
        attack = 70,
        height = '187',
        weight = '135',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [45] = {
        color = 'basic',
        rank = 'basic',
        label = 'Monica Roberto',
        images = 'https://i.postimg.cc/vmXjJ4nh/Xg0Jrfw.jpg',
        term = 'Monica Roberto, a talented transgender secret agent, excels in espionage with her charm and skill. Balancing her covert missions and personal identity, she navigates the high-stakes world with pride.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 180,
        height = '197',
        weight = '80',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [46] = {
        color = 'basic',
        rank = 'basic',
        label = 'Meg',
        images = 'https://i.postimg.cc/qMyp9GvG/maxresdefault.jpg',
        term = 'Meg, known for her harsh appearance, is a feared and cunning narcotrafficker. Despite her looks, she commands respect and operates with ruthless efficiency in the drug trade.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 100,
        height = '156',
        weight = '48',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [47] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Kiwi',
        images = 'https://i.postimg.cc/pXft0XsG/42978b-GTA5mods-Solara.jpg',
        term = 'Kiwi, the most feared hacker in Los Santos, once led Quasar as CEO with unmatched skill. After vanishing and leaving the company in chaos, she is now a wanted fugitive, evading capture while her former empire crumbles.',
        -- description = 'A secondary description?',
        health = 220,
        attack = 315,
        height = '180',
        weight = '90',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [48] = {
        color = 'rare',
        rank = 'rare',
        label = 'Clefitas',
        images = 'https://i.postimg.cc/tC5MZ1Sj/Captura-de-pantalla-2024-08-31-163636.png',
        term = 'Clefitas, a young police officer, specializes in capturing aliens. His quick wits and bravery make him the go-to agent for dealing with extraterrestrial threats in his city.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 230,
        height = '175',
        weight = '82',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [49] = {
        color = 'basic',
        rank = 'basic',
        label = 'Tony Montolla',
        images = 'https://i.postimg.cc/FHFs3Lhg/9d20ea-GTA5-2016-11-13-01-45-25-68.png',
        term = 'Tony Montolla, a notorious gangster, is surprisingly fearful and constantly on edge. Despite his criminal reputation, he lives in constant anxiety, always wary of potential threats and rivals.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 60,
        height = '180',
        weight = '76',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [50] = {
        color = 'basic',
        rank = 'basic',
        label = 'Rafaela Laurence',
        images = 'https://i.postimg.cc/W357prpW/caa3a4-20240109035220-1.jpg',
        term = 'Rafaela Laurence, a seemingly ordinary housewife, hides a military arsenal in her attic. Beneath her calm exterior lies a readiness for unexpected threats, blending domestic life with secret preparedness.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 140,
        height = '165',
        weight = '98',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [51] = {
        color = 'basic',
        rank = 'basic',
        label = 'Miles Jackson',
        images = 'https://i.postimg.cc/2jcbxWkw/hFjRtX9.jpg',
        term = 'Miles is the President of the Junkyard Bros MC and runs the Junk Shop. Most people love his wild side, but city officers prefer to avoid him. His style is uniquely junkie, like no other.',
        -- description = 'A secondary description?',
        health = 60,
        attack = 70,
        height = '180',
        weight = '74',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [52] = {
        color = 'basic',
        rank = 'basic',
        label = 'Dwyn o\'Connor',
        images = 'https://i.postimg.cc/wBp7Bc26/image.webp',
        term = 'Dwyn, from Cobh, Ireland, moved to L.A. after losing her first love. There, she met Seth O\'Connor. They settled in Miami, co-owned a pub, and raised five daughters.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 90,
        height = '197',
        weight = '82',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [53] = {
        color = 'basic',
        rank = 'basic',
        label = 'Charles O\'Connel',
        images = 'https://i.postimg.cc/76QHSg3J/x5ACA9F.jpg',
        term = 'Charles, from Carrigaholt, Ireland, lost both parents young. He became a pilot, but after his mother’s death, he spiraled into depression. He moved to Los Santos, started a business, and got married.',
        -- description = 'A secondary description?',
        health = 60,
        attack = 80,
        height = '165',
        weight = '73',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [54] = {
        color = 'rare',
        rank = 'rare',
        label = 'Yendi Fontaine',
        images = 'https://i.postimg.cc/MG9q8yr3/image.webp',
        term = 'Yendi, from Trinidad, moved to the U.S. at 12. She became an exotic dancer in Chicago, rising to manager. After meeting her soulmate, Izzy, she discovered Juicy was her sister. Now, Yendi dreams of new opportunities beyond dancing.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 280,
        height = '180',
        weight = '75',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [55] = {
        color = 'basic',
        rank = 'basic',
        label = 'Konrad Soerensen',
        images = 'https://i.postimg.cc/CxNzznQk/52c4f5e727f0cdfb7641c6265a7c15a4.webp',
        term = 'Konrad, from a West Jutland farm, dreamed of being a police officer. After working in Boston and returning home, he reconnected with his children and still hopes to serve as an officer.',
        -- description = 'A secondary description?',
        health = 40,
        attack = 100,
        height = '165',
        weight = '58',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [56] = {
        color = 'rare',
        rank = 'rare',
        label = 'Javier Ritch',
        images = 'https://i.postimg.cc/yNtmMdtZ/Screenshot-275.webp',
        term = 'Javier Ritch, a street hustler from Los Santos, rose to power by forming the cartel "La Mano Oscura." Now, he rules with ruthless control, knowing one wrong move could destroy everything.',
        -- description = 'A secondary description?',
        health = 140,
        attack = 295,
        height = '180',
        weight = '76',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [57] = {
        color = 'rare',
        rank = 'rare',
        label = 'Barrett Dalton',
        images = 'https://i.postimg.cc/d17hKjrs/image-enhanced-5.webp',
        term = 'A bad-ass mother from the streets, always looking for trouble, never backing down, and never giving a damn about what anyone thinks.',
        -- description = 'A secondary description?',
        health = 95,
        attack = 250,
        height = '172',
        weight = '80',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [58] = {
        color = 'basic',
        rank = 'basic',
        label = 'Oliver Wilson',
        images = 'https://i.postimg.cc/90hJkpNS/image.webp',
        term = 'Oliver supported his family until his sister became a lawyer. He moved to the West Coast, became a cop, then a doctor, and eventually Commissioner. After personal losses and struggles, he decided to leave his old life behind and start anew.',
        -- description = 'A secondary description?',
        health = 50,
        attack = 70,
        height = '160',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [59] = {
        color = 'basic',
        rank = 'basic',
        label = 'Oliver Parker',
        images = 'https://i.postimg.cc/L5jfcFZB/Screenshot-35.webp',
        term = 'Oliver Parker grew up in Athens with a disciplined naval father and a nurturing baker mother. Influenced by their values, he volunteered in civil protection and, despite his doubts, pursued a career in the fire department.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 20,
        height = '185',
        weight = '90',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [60] = {
        color = 'rare',
        rank = 'rare',
        label = 'Michael Caffrey',
        images = 'https://i.postimg.cc/W3kX1Kkt/TxBjjwG.jpg',
        term = 'Michael Caffrey, once an LCPD detective from Liberty City, was fired due to corruption. Now in Los Santos, he’s rebuilding his career with the SCU, aiming to lead a unit while battling personal struggles.',
        -- description = 'A secondary description?',
        health = 120,
        attack = 255,
        height = '190',
        weight = '102',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [61] = {
        color = 'basic',
        rank = 'basic',
        label = 'Ted Grimsley',
        images = 'https://i.postimg.cc/C105tnS5/image.webp',
        term = 'I fell from Heaven and became Ted. In Hell, I tried to corrupt Earth but failed. Now, I seek redemption and hope to reconnect with my lost children and estranged siblings.',
        -- description = 'A secondary description?',
        health = 90,
        attack = 170,
        height = '185',
        weight = '52',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [62] = {
        color = 'basic',
        rank = 'basic',
        label = 'Richard Perez',
        images = 'https://i.postimg.cc/k53Y0qZD/Pkkn-Rr4-Ikv-K2.webp',
        term = 'Richard, born January 30, 1997, in Chile, is a calm police officer with dwarfism who believes words can resolve any issue.',
        -- description = 'A secondary description?',
        health = 25,
        attack = 10,
        height = '128',
        weight = '43',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [63] = {
        color = 'rare',
        rank = 'rare',
        label = 'John White',
        images = 'https://i.postimg.cc/Y98XLgSm/image.webp',
        term = 'John White, born January 21, 1999, in Slovenia, is a respected legal professional known for his strictness and impartiality as a judge. Initially a lawyer, he earned a reputation for his relentless pursuit of justice and sharp intellect.',
        -- description = 'A secondary description?',
        health = 160,
        attack = 285,
        height = '178',
        weight = '57',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [64] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'BUGMAN',
        images = 'https://i.postimg.cc/Y98XLgSm/image.webp',
        term = 'BUGMAN is a notorious villain in Zion City, known for outsmarting authorities. In his other role as ZionyX, he\'s a top admin and helper in the game, respected for his reliability. His transformation from ZionyX to BUGMAN is marked by a dramatic shift from hero to villain.',
        -- description = 'A secondary description?',
        health = 290,
        attack = 350,
        height = '210',
        weight = '95',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [65] = {
        color = 'rare',
        rank = 'rare',
        label = 'Jason Vargas',
        images = 'https://i.postimg.cc/6Q4zz3hy/fivem-characyer.webp',
        term = 'Jason Vargas, former US Army Ranger now lives his dream driving through the night on Wangan Highway.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 70,
        height = '179',
        weight = '80',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [66] = {
        color = 'rare',
        rank = 'rare',
        label = 'Bobby Blue',
        images = 'https://i.postimg.cc/rFhJkWnD/bobby.png',
        term = 'I\'m Bobby Blue, 22, British, and straight. I grew up in my family\'s tea business, traveling widely and earning a reputation. After expanding into other products and facing trouble with the UK government, I left everything behind and started anew in Millennium Roleplay.',
        -- description = 'A secondary description?',
        health = 80,
        attack = 155,
        height = '185',
        weight = '92',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [67] = {
        color = 'basic',
        rank = 'basic',
        label = 'Josh Marcaida',
        images = 'https://i.postimg.cc/x8fvrTLG/Captura-de-pantalla-2024-09-03-022647.png',
        term = 'Josh joined the LSPD to make a difference in his city, motivated by his parents\' criminal convictions. He wanted to turn his family’s troubled past into a force for positive change and help others avoid the path his parents took.',
        -- description = 'A secondary description?',
        health = 160,
        attack = 95,
        height = '172',
        weight = '54',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [68] = {
        color = 'basic',
        rank = 'basic',
        label = 'Elena Torres',
        images = 'https://i.postimg.cc/wMr7W62j/Arachne4.png',
        term = 'Elena left her corporate job to become a detective. Driven by a quest for justice, she uses her expertise to solve the city\'s toughest cases.',
        -- description = 'A secondary description?',
        health = 110,
        attack = 85,
        height = '165',
        weight = '60',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [69] = {
        color = 'basic',
        rank = 'basic',
        label = 'Rafael Mendoza',
        images = 'https://i.postimg.cc/ZK99WdYB/FE3-Fg-UGX0-AMKJdi.jpg',
        term = 'Rafael, a former military operative, now serves as a top security consultant. His tactical expertise and strategic mind make him a legendary figure in the field.',
        -- description = 'A secondary description?',
        health = 120,
        attack = 100,
        height = '185',
        weight = '90',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [70] = {
        color = 'basic',
        rank = 'basic',
        label = 'Law Chen',
        images = 'https://i.postimg.cc/gJYXjtrm/Tao-Cheng-Online.png',
        term = 'Law, a skilled hacker with a knack for solving digital mysteries, uses her talents to fight cybercrime and protect her community.',
        -- description = 'A secondary description?',
        health = 120,
        attack = 80,
        height = '160',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [71] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Emanuel',
        images = 'https://i.postimg.cc/BbWz2gNb/image4.webp',
        term = 'Emanuel, a prominent developer at Quasar Store, wears a pigeon-headed mask to contain his immense programming power. Every project he touches turns into a technological masterpiece.',
        -- description = 'A secondary description?',
        health = 290,
        attack = 355,
        height = '184',
        weight = '78',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [72] = {
        color = 'basic',
        rank = 'basic',
        label = 'Joe Blogs',
        images = 'https://i.postimg.cc/Ghd7r95W/image.webp',
        term = 'Born in North London, I joined the Met Police and trained at the Royal London Police Academy. I advanced through the ranks and now serve as a high-ranking officer in the Firearms Unit, tackling criminal organizations.',
        -- description = 'A secondary description?',
        health = 90,
        attack = 55,
        height = '172',
        weight = '53',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [73] = {
        color = 'basic',
        rank = 'basic',
        label = 'Tyron Biggs',
        images = 'https://i.postimg.cc/Y9BN3sc5/p-QB1yad5khs3.webp',
        term = 'Tyron Biggs, a former codeine dealer, now runs a successful tuner garage. Known for his charisma and loyalty, he moved to Los Santos to expand his business and connect with the tuning scene.',
        -- description = 'A secondary description?',
        health = 45,
        attack = 140,
        height = '168',
        weight = '64',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [74] = {
        color = 'basic',
        rank = 'basic',
        label = 'Lena Torres',
        images = 'https://i.postimg.cc/ZYV3BRRt/e4a50d-53.png',
        term = 'Lena Torres, a former elite hacker, now runs a cybersecurity firm. Known for her sharp mind and tactical prowess, she uses her skills to protect high-profile clients.',
        -- description = 'A secondary description?',
        health = 60,
        attack = 70,
        height = '165',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [75] = {
        color = 'basic',
        rank = 'basic',
        label = 'Victor Kane',
        images = 'https://i.postimg.cc/XYyyzkg4/large-154800.jpg',
        term = 'Victor Kane, a legendary mercenary with a shadowy past, now leads an elite private security team. Revered for his combat skills and strategic genius.',
        -- description = 'A secondary description?',
        health = 100,
        attack = 130,
        height = '190',
        weight = '85',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [76] = {
        color = 'basic',
        rank = 'basic',
        label = 'Max Rivera',
        images = 'https://i.postimg.cc/L6JqJ3wL/101443.jpg',
        term = 'Max Rivera, a talented mechanic with a knack for high-performance cars. Known for his precision and dedication, he’s the go-to expert for tuning and repairs.',
        -- description = 'A secondary description?',
        health = 50,
        attack = 40,
        height = '180',
        weight = '75',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [77] = {
        color = 'rare',
        rank = 'rare',
        label = 'Sophie Martin',
        images = 'https://i.postimg.cc/k5vG01R3/c0bd1d-mrwitt-car-enthusiast.jpg',
        term = 'Sophie Martin, a savvy entrepreneur and nightclub owner. Her charm and business acumen have made her a key figure in the city’s nightlife scene.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 45,
        height = '170',
        weight = '60',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [78] = {
        color = 'basic',
        rank = 'basic',
        label = 'Daniel Cruz',
        images = 'https://i.postimg.cc/PJRP6CpC/3-jpg-4cf6fa1e7097ccfad9a8ba88b577b5dd.jpg',
        term = 'Daniel Cruz, a skilled urban artist known for his breathtaking murals. His work adds vibrant life to the city’s streets and inspires many with its creativity.',
        -- description = 'A secondary description?',
        health = 50,
        attack = 30,
        height = '175',
        weight = '68',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    [79] = {
        color = 'basic',
        rank = 'basic',
        label = 'Rachel Kim',
        images = 'https://i.postimg.cc/6qyQGBjt/552086-1.jpg',
        term = 'Rachel Kim, a talented chef who runs a popular fusion restaurant. Her culinary creations are celebrated for their innovative flavors and artistic presentation.',
        -- description = 'A secondary description?',
        health = 55,
        attack = 40,
        height = '160',
        weight = '52',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [80] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Kishi',
        images = 'https://i.postimg.cc/MG5ZPngz/imagen-2024-09-06-102008803.png',
        term = 'Kishi, a mesmerizing waifu with an alluring presence and unmatched combat skills. Once a top-secret operative, she now leads a covert organization with grace and power.',
        -- description = 'A secondary description?',
        health = 300,
        attack = 395,
        height = '182',
        weight = '110',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },

    [81] = {
        color = 'basic',
        rank = 'basic',
        label = 'Anthony Carter',
        images = 'https://i.postimg.cc/mkNWQz9W/Five-M-by-Cfx-re-Drill-York-City-RP-by-Raredabberoo-2-17-2024-4-51-08-PM.webp',
        term = 'I’m Anthony Carter, from the tough streets of NYC. I’m saving up to catch my flight to LA. I’ll do whatever it takes to reach my dream.',
        -- description = 'A secondary description?',
        health = 45,
        attack = 60,
        height = '170',
        weight = '55',
        quality = 100,
        booster = 'tradingcard_booster_legends'
    },
    [82] = {
        color = 'basic',
        rank = 'basic',
        label = 'Hadrian Burke',
        images = 'https://i.postimg.cc/mkNWQz9W/Five-M-by-Cfx-re-Drill-York-City-RP-by-Raredabberoo-2-17-2024-4-51-08-PM.webp',
        term = 'My name is Hadrian Burke, a police officer from the UK with a bit of country charm. Law enforcement has always been my calling, and it always will be. I speak my mind freely and follow my own path, regardless of any opposition.',
        -- description = 'A secondary description?',
        health = 60,
        attack = 80,
        height = '162',
        weight = '78',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
    -- Additional cards can be added following the same structure
    [83] = {
        color = 'legendary',
        rank = 'legendary',
        label = 'Officer Copperfield',
        images = 'https://i.postimg.cc/90Wz7rRr/Copperfield.png',
        term = 'Copperfield, a jovial, oversized cop with a heart of gold, patrols the city\'s grimy streets, bringing justice and a touch of humor to even the darkest corners.',
        -- description = 'A secondary description?',
        health = 300,
        attack = 395,
        height = '182',
        weight = '110',
        quality = 100,
        booster = 'tradingcard_booster_pack'
    },
}


--[[
    Debug Mode Configuration
    This section is designed to provide advanced debugging and visual testing options.
    - **Debug Mode**: Enables constant system logs and prints for tracking processes and identifying potential issues.
    - **Visual Mode**: Useful for testing the visual aspects of the system, such as animations or UI.
      Note: Visual mode is non-functional; it does not distribute actual cards from packs.
    These features are intended for developers or advanced users. Avoid enabling them on production servers.
]]

Config.Debug = true       -- Enable debug mode to log system activity and assist in identifying issues. Recommended for troubleshooting or development only.
Config.VisualMode = false -- Enable visual testing mode to preview animations and UI without affecting the actual system logic.
