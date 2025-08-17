fx_version 'cerulean'
game 'gta5'

description 'Snipe Moonshine System'
version '1.2.5'
author 'Snipe'

lua54 'yes'

ui_page 'html/index.html'

files {
    'stream/snipe_moonshine_meta.ytyp',
	'html/**/*',
}

shared_scripts{
    '@ox_lib/init.lua',
    'shared/common/*.lua'
}

client_scripts{
    'client/**/*.lua',
} 

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/**/*.lua',
    'shared/server/*.lua'
}

escrow_ignore{
    'client/open/*',
    'server/open/*',
    'shared/**/*'
}

data_file 'DLC_ITYP_REQUEST' 'stream/snipe_moonshine_meta.ytyp' 

dependency '/assetpacks'