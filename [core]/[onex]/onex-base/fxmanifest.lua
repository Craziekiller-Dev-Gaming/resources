--  ██████╗ ███╗   ██╗███████╗██╗  ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
-- ██╔═══██╗████╗  ██║██╔════╝╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝     ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
-- ██║   ██║██║╚██╗██║██╔══╝   ██╔██╗     ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
-- ╚██████╔╝██║ ╚████║███████╗██╔╝ ██╗    ███████║╚██████╗██║  ██║██║██║        ██║   ███████║
--  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
-- ===================== Official Information ================================================
name 'Onex Resource Module'
description 'Collection of lib'
author 'Frostfire#3400'
PowerdBy 'Onex Scripts'
-- ====================== Game Configuration =================================================
fx_version 'cerulean'
game 'gta5'
version '0.1.0'
-- ==================== Resource Configuration ===============================================
shared_scripts {'global/lib/rpcHandler.lua', 'global/lib/procedureCall.lua', 'global/utils/functions.lua',
                'shared/init.lua', 'global/loadFramework.lua', 'global/debug/*.lua', 'global/links/*.lua'}
client_scripts {'@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua',
                '@PolyZone/ComboZone.lua', 'client/*.lua', 'client/**/*.lua'}
server_scripts {'server/version.lua', 'server/convars.lua', 'server/post_convarsCl.lua', 'server/gameFunctions.lua'}
dependencies {'/onesync'}
escrow_ignore {'shared/init.lua', 'global/links/*.lua'}
-- ==================== Resource Code Configuration  =============================================
lua54 'yes'

dependency '/assetpacks'