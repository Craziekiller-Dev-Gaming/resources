Config.LobbyCoords = vector4(-701.84, -2267.54, 13.46, 142.5) -- if a player leaves the server while being in a room, he will be teleported to this location

Config.PedLocations = {
    [1] = {
        coords = vector4(-715.68212890625, -2259.4946289063, 13.458878517151, 222.40846252441),
        model = "a_m_m_bevhills_01",
    }
}

Config.Blip = {
    coords = vector3(-701.84, -2267.54, 13.46),
    sprite = 183,
    color = 3,
    scale = 0.8,
    name = "Opium Nights Motel",
}

-- these are the offsets for where the player will spawn inside the apartments if you use the export SpawnInsideApartment in your spawn script
--[[
    Steps to grab your own offsets;
    1. Go to room 101 of your motel. (IMPORTANT. MAKE SURE YOU ARE IN ROOM 101)
    2. Enable debug
    3. Stand in the location you want the player to spawn
    4. Type /getOffset.
    5. Copy the values for final offset and final rotation and paste them here. 
    6. Offset is for coords and rotation is for heading.
    7. Disable debug
]]--
Config.SpawnOffsets = {
    coords = vec3(-0.57910001277924, 1.89150000810623, 0.0746999979019),
    rotation = vec3(-0.000000, -0.000002, -179.448013),
}