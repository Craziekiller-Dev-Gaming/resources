Config, Locales = {}, {}

Config.Locale = 'en' -- en / pt / es (not yet) / fr (not yet) / de (not yet)

Config.Debug = false -- true = Debug mode, it will show the debug messages on the console

Config.AutoAddDatabaseTables = true -- true = Auto add the database tables | false = You need to add the database tables manually

Config.AutoCreateSociety = true -- true = Auto create the society on the database tables | false = You need to create the society manually

Config.UseOkokNotify = false -- true = okokNotify | false = qb-notify (You can change the notification system on cl_utils.lua)

Config.UseOkokTextUI = false -- true = okokTextUI | false = qb-drawtext

Config.UseOkokRequests = false -- true = okokRequests | false right away

Config.UseOkokBanking = true -- true = okokBanking | false = qb-banking ( For transactions )

Config.UseJobBlip = false -- true = marker or target | false = open with a command

Config.UseJobBlipAndCommand = true -- true = marker or target and command | false = only marker or target

Config.UseTarget = true -- true = Target | false = textUI

Config.EventPrefix = "okokBossMenu"  -- This will change the prefix of the events name so if Config.EventPrefix = "example" the events will be "example:event"

Config.SocietySystem = "okokBanking" -- qb-banking / qb-management / okokBanking

Config.TargetSystem = "qb-target" -- The target system you are using (qb-target / ox-target)

Config.InventorySystem = "qs-inventory" -- The inventory system you are using ( qb-inventory / qb-inventory-new / ox-inventory / qs-inventory )

Config.ClothingSystem = "qb-clothing" -- The clothing system you are using ( qb-clothing / illenium-appearance )

Config.OpenBossMenuCommand = "openbossmenu" -- The command to open the boss menu if Config.UseJobBlip = false

Config.OpenGangMenuCommand = "opengangmenu" -- The command to open the gang menu if Config.UseJobBlip = false

Config.OpenDutyCommand = "openjobduty" -- The command to open the duty menu if Config.UseJobBlip = false

Config.OpenGangDutyCommand = "opengangduty" -- The command to open the gang duty menu if Config.UseJobBlip = false

Config.Currency = "$" -- The currency used on the script

Config.DefaultPaymentAfterFire = 50 -- The default payment after being fired

Config.HireDistance = 3.0 -- The distance that the player needs to be to hire someone

Config.MarkerDistance = 10 -- The distance that the player needs to be to see the marker

Config.MarkerID = 21 -- The marker ID for the job locations

Config.MarkerColors = { r = 31, g = 94, b = 255, a = 90 } -- The marker colors for the job locations

Config.UseQBCoreBoss = true -- true = It will use isBoss from the metadata of QBCore | false = It will use the Config.BossGrades

Config.BossGrades = { -- The boss grades that can access the boss menu ( you can get it on qb-core/shared/jobs.lua )
	'Boss',
	'Chief',
}

Config.JobLocations = {
    ['police'] = { bossCoords = {vector3(447.69, -973.46, 30.69)}, dutyCoords = {vector3(440.21, -975.72, 30.69)} },
	['ambulance'] = { bossCoords = {vector3(305.68, -597.83, 43.29)}, dutyCoords = {vector3(296.58, -600.34, 43.3)} },
	['ballas'] = { bossCoords = {vector3(114.18, -1960.81, 21.33)}, dutyCoords = {vector3(109.48, -1961.42, 20.96)} },
}

-------------------------- DISCORD LOGS

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.DepositWebhook = true
Config.DepositWebhookColor = '65280'

Config.WithdrawWebhook = true
Config.WithdrawWebhookColor = '16711680'

Config.HireWebhook = true
Config.HireWebhookColor = '65280'

Config.FireWebhook = true
Config.FireWebhookColor = '16711680'

Config.EditEmployeeRankWebhook = true
Config.EditEmployeeRankWebhookColor = '65280'

Config.OnDutyWebhook = true
Config.OnDutyWebhookColor = '65280'

Config.OffDutyWebhook = true
Config.OffDutyWebhookColor = '16711680'

Config.GivenBonusWebhook = true
Config.GivenBonusWebhookColor = '65280'

-------------------------- LOCALES (DON'T TOUCH)

function _okok(id)
	if Locales[Config.Locale][id] then
		return Locales[Config.Locale][id]
	else
		print("The locale '"..id.."' doesn't exist!")
	end
end