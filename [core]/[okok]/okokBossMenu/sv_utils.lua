QBCore = exports["qb-core"]:GetCoreObject()
Webhook = ''

function MySQLfetchAll(query, values, func)
	return MySQL.Sync.fetchAll(query, values, func)
end

function MySQLexecute(query, values, func)
    return MySQL.Async.execute(query, values, func)
end

function MySQLfetchScalar(query, values, func)
    return MySQL.Async.fetchScalar(query, values, func)
end

function getPlayerMoney(source)
	local Player = getPlayer(source)
	return Player.PlayerData.money.cash
end

function removePlayerMoney(source, amount)
	local Player = getPlayer(source)
	Player.Functions.RemoveMoney('cash', amount)
end

function addPlayerMoney(source, amount)
	local Player = getPlayer(source)
	Player.Functions.AddMoney('cash', amount)
end

function afterFiringPlayer(source, job)
	-- Add your logic here to remove job from multijob for online players
end

function afterFiringOfflinePlayer(citizenid, job)
	-- Add your logic here to remove job from multijob for offline players
end

function afterHiringPlayer(source, job)
	-- Add your logic here to give job to multijob
end

function getPlayerJob(source)
	debugPrint("Getting job for source: "..tostring(source))
	local Player = getPlayer(source)
	if not Player then return nil end
	return Player.PlayerData.job.name
end

function getPlayerGang(source)
	local Player = getPlayer(source)
	if not Player then return nil end
	return Player.PlayerData.gang.name
end

function setPlayerJob(Player, grade, job)
	return Player.Functions.SetJob(job, grade)
end

function setPlayerGang(Player, grade, gang)
	return Player.Functions.SetGang(gang, grade)
end

function getPlayerJobLabel(source)
	debugPrint("Getting job label for source: "..tostring(source))
	local Player = getPlayer(source)
	return Player.PlayerData.job.label
end

function getPlayerGrade(source)
	debugPrint("Getting grade for source: "..tostring(source))
	local Player = getPlayer(source)
	return Player.PlayerData.job.grade.level
end

function getPlayerGradeLabel(source)
	debugPrint("Getting grade label for source: "..tostring(source))
	local Player = getPlayer(source)
	return Player.PlayerData.job.grade.name
end

function getPlayerGangLabel(source)
	local Player = getPlayer(source)
	return Player.PlayerData.gang.label
end

function getPlayerGradeGangLabel(source)
	local Player = getPlayer(source)
	return Player.PlayerData.gang.grade.name
end

function getGradesInfo(job)
	debugPrint("Getting job grades for job: "..tostring(job))
	return QBCore.Shared.Jobs[job]
end

RegisterNetEvent(Config.EventPrefix..':createStash')
AddEventHandler(Config.EventPrefix..':createStash', function(inventory)
	exports['qb-inventory']:OpenInventory(source, inventory, { maxweight = 4000000, slots = 300 })
end)

-- Webhooks
function discordWebhook(data)
	local information = {}

    if data.type == 'deposit' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Deposited:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'withdraw' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Withdrawn:** '..data.price..' ' .. Config.Currency .. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'hire' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'fire' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'changeRank' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee Name:** '..data.employee_name..'\n**Employee Identifier:** '..data.employee_id..'\n**Rank:** '..data.rank..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'givenBonus' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Business:** '..data.item..'\n**Employee name:** '..data.employee_name..'\n**Employee identifier:** '..data.employee_id..'\n**Amount:** '..data.amount..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'onduty' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Player Name:** '..data.player..'\n**Business:** '..data.item.. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'offduty' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n**Player Name:** '..data.player..'\n**Business:** '..data.item.. '\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	end
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end