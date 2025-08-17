fx_version 'cerulean'
game 'gta5'

Author 'Assert Gaming'
Version '1.0.3'

client_scripts {
    'client/main.lua',
    'config.lua',
}

shared_scripts {
    '@ox_lib/init.lua'
}

escrow_ignore {
    'config.lua',
}

lua54 'yes'
dependency '/assetpacks'