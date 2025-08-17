lua54 'yes'
fx_version 'cerulean'

game 'gta5'
this_is_a_map 'yes'

author 'Apollo developments'
description 'M.C Clubhouse El Burro'
version '1.0.0'

client_scripts { 
    'client.lua',
    'apollo_entityset_mods.lua'
}

files {
    'stream/occlusions/apollo_mc_elburro_game.dat151.rel',
    }


data_file 'AUDIO_GAMEDATA' 'stream/occlusions/apollo_mc_elburro_game.dat'

escrow_ignore {
    'stream/ytd/*.ytd',
    'client.lua',
    "apollo_entityset_mods.lua",
}

dependency '/assetpacks'