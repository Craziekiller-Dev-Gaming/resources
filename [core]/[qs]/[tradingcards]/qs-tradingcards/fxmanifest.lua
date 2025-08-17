fx_version 'cerulean'

games { 'gta5' }

ui_page 'html/index.html'

version '1.1.3'

lua54 'yes'

files {
  'html/**/**'
}

shared_script {
  '@ox_lib/init.lua',
  'shared/*.lua',
  'locales/*.lua'
}

client_scripts {
  'client/custom/framework/*.lua',
  'client/custom/target/*.lua',
  'client/custom/inventory/*.lua',
  'client/*.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/custom/framework/*.lua',
  'server/custom/inventory/*.lua',
  'server/*.lua'
}

escrow_ignore {
  'shared/*.lua',
  'locales/*.lua',
  'client/custom/framework/*.lua',
  'client/custom/inventory/*.lua',
  'server/custom/framework/*.lua',
  'server/custom/inventory/*.lua'
}


dependency '/assetpacks'