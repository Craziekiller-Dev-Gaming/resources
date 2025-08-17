-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discord.com/api/webhooks/1280279876028600423/aHbiFZw_1JEMq-q_D946B4R32nGGfhqN-5u4gbK62JbODg96Q__oXp0XBZ89l9GZOuGJ"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discord.com/api/webhooks/1280279984220405902/l9RgUGgjXjsttDnlesjyRoJx6EDaDSLGCNLF-Xr1GLnkTD0zMCRzR5Lxr0nj79i7qiV0"

-- Discord webhook for server logs
LOGS = {
    Default = "https://discord.com/api/webhooks/", -- set to false to disable
    Calls = "https://discord.com/api/webhooks/1280280129389596784/KKhGqhyI2PVWimSVTJdRyUoUhQTgOnxyzsolcsvXbieR00DYqChDQEpJJMtr1zzEpNuN",
    Messages = "https://discord.com/api/webhooks/1280280195466657813/EPSxQmrOCR-5f1_ViSprF4hOrKl70449f7doDuY2hVJJ01LiPhgX6IcilXCHRa2cumQh",
    InstaPic = "https://discord.com/api/webhooks/1280279876028600423/aHbiFZw_1JEMq-q_D946B4R32nGGfhqN-5u4gbK62JbODg96Q__oXp0XBZ89l9GZOuGJ",
    Birdy = "https://discord.com/api/webhooks/1280279984220405902/l9RgUGgjXjsttDnlesjyRoJx6EDaDSLGCNLF-Xr1GLnkTD0zMCRzR5Lxr0nj79i7qiV0",
    YellowPages = "https://discord.com/api/webhooks/1348016725332856832/o6p81ijrPgCtV7s16ERORRB9YLeOJG9W-Ov7TohDYwao24qTLSR-8OhZ8thhva5j8B82",
    Marketplace = "https://discord.com/api/webhooks/1348017336623304704/pEQaQx9Fk22oKtqiTIYuyJbsZHl7G5v-bpNVLlbcvuWpQRKkEJEXrJZgba_n6RVUi62L",
    Mail = "https://discord.com/api/webhooks/1348017430177386616/Hr1o7bQeyjivLCUBs78e0EWJuK4X-b341slIJFbRXLsIaNl8cd0Q_GL8NiX_Z6hytzFJ",
    Wallet = "https://discord.com/api/webhooks/1348021985434800158/WjO3VGYEK9iOu_qtXbTjKZaif1GYeJN0Y6au2AzS38nRj_gGRQjTj4tEkmCbA5AngXUp",
    DarkChat = "https://discord.com/api/webhooks/1348017601565032571/YMVmXeYfTcrhSXWm3bvITsBfvr7ji06D24e3nP1uupo1G95SzBvCFV7loXqKcMhNy3gT",
    Services = "https://discord.com/api/webhooks/",
    Crypto = "https://discord.com/api/webhooks/",
    Trendy = "https://discord.com/api/webhooks/1348017745421140019/B3p5apHiw4QszjjOYQSoz0yOlm3n--oOdrxMWLfbz0qWZQ8zthVXgM42XZaXZuTly4CO",
    Uploads = "https://discord.com/api/webhooks/1348017855869882368/ktSmY2_hNFhb20fLNQ0njjHwR0Gvv-34WfzlWRw69fjNx79o-3z_mevEbeUswzJ6Kltg" -- all camera uploads will go here
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "API_KEY_HERE",
    Image = "API_KEY_HERE",
    Audio = "API_KEY_HERE",
}
