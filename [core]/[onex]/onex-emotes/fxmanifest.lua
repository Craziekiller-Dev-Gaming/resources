--  ██████╗ ███╗   ██╗███████╗██╗  ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
-- ██╔═══██╗████╗  ██║██╔════╝╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝     ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
-- ██║   ██║██║╚██╗██║██╔══╝   ██╔██╗     ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
-- ╚██████╔╝██║ ╚████║███████╗██╔╝ ██╗    ███████║╚██████╗██║  ██║██║██║        ██║   ███████║
--  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
-- ===================== Official Information ================================================
name 'Onex Resource Module : Player Animation Kit'
description 'Emote Menu by frostfire'
author 'Frostfire#3400'
PowerdBy 'Onex Scripts'
-- ====================== Game Configuration =================================================
fx_version 'bodacious'
game 'gta5'
version '1.0.3'
-- ====================  Resource UI  ========================================================
ui_page 'web/dist/index.html'
-- ui_page 'http://localhost:5173/'
files {'web/dist/index.html', 'web/dist/assets/*.*', 'web/dist/*.*', 'preview/placeholder/*.webp',
       'shared/locales.json', 'shared/colors.json'}
-- ==================== Resource Configuration ===============================================
shared_scripts {'shared/framework.lua', 'shared/locales.lua', 'shared/config.lua', 'shared/studio.lua',
                'shared/emotes.lua'}
client_scripts {'client/core/global_core.lua', 'client/client.lua', 'client/public/utils.lua', 'client/classes/*.lua',
                'client/production/*.lua', 'client/public/*.lua'}
server_scripts {'onex/onex.lua', 'server/socket.lua', 'server/server.lua', 'build/server.js'}
dependencies {'/onesync', 'onex-base', 'onex-emotes_list'}
provide {"dpemotes", "rpemotes", 'scully-emotes'}
escrow_ignore {'shared/*.lua', 'client/core/*.lua', 'client/public/*.lua'}
-- ==================== Resource Code Configuration  =============================================
lua54 'yes'

dependency '/assetpacks'