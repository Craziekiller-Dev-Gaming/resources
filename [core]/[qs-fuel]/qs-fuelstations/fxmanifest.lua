fx_version 'cerulean'

games { 'gta5' }

lua54 'yes'

version '2.0.9'

ui_page 'html/index.html'

ox_libs {
    'table',
}

files {
    'html/index.html',
    'html/js/app.js',
    'html/sounds/*.ogg',
    'model_fuel_types.json'
}

shared_script {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua',
    'utils/*.lua'
}

client_scripts {
    'client/**/**/**/**.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**/**/**/**.lua'
}

dependencies {
    'ox_lib', -- Required
}

escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'client/custom/**/**.lua',
    'server/custom/**/**.lua'
}

dependency '/assetpacks'