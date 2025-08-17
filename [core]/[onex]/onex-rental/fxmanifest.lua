--  ██████╗ ███╗   ██╗███████╗██╗  ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
-- ██╔═══██╗████╗  ██║██╔════╝╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝     ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
-- ██║   ██║██║╚██╗██║██╔══╝   ██╔██╗     ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
-- ╚██████╔╝██║ ╚████║███████╗██╔╝ ██╗    ███████║╚██████╗██║  ██║██║██║        ██║   ███████║
--  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
-- ===================== Official Information ================================================
name 'Onex Resource Module : Car Rental'
description 'Vehicle Rental System'
author 'Frostfire#3400'
PowerdBy 'Onex Scripts'
-- ====================== Game Configuration =================================================
fx_version 'bodacious'
game 'gta5'
version '0.1.0'
-- ====================  Resource UI  ========================================================
ui_page 'web/dist/index.html'
-- ui_page 'http://localhost:5173/'
files {'web/dist/index.html', 'web/dist/assets/*.*', 'web/dist/assets/*.ttf', 'web/dist/assets/*.otf'}
-- ==================== Resource Configuration ===============================================
shared_scripts {'shared/*.lua', 'shared/locales/*.lua', 'shared/framework.lua'}
client_scripts {'client/client.lua', 'client/classes/events.lua', 'client/classes/callbacks.lua', 'client/base/*.lua',
                'client/public/*.lua'}
server_scripts {'@oxmysql/lib/MySQL.lua', 'server/version.lua', 'server/s_callback.lua', 'server/server.lua',
                'server/socket.lua', 'server/base/*.lua'}

dependency {'onex-base'}
escrow_ignore {'shared/*.lua', 'shared/locales/*.lua', 'custom/*.lua', 'server/base/*.lua', 'client/public/blips.lua'}
-- ==================== Resource Code Configuration  ==========================================
lua54 'yes'

dependency '/assetpacks'