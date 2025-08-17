if onexFx.Data.Framework ~= 'esx' then
    return
end

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do
    table.insert(NumberCharset, string.char(i))
end

for i = 65, 90 do
    table.insert(Charset, string.char(i))
end
for i = 97, 122 do
    table.insert(Charset, string.char(i))
end

-- mixing async with sync tasks
local function IsPlateTaken(plate)
    local p = promise.new()

    MySQL.scalar('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate}, function(result)
        p:resolve(result)
    end)

    return Citizen.Await(p)
end

local function GetRandomNumber(length)
    Wait(0)
    return length > 0 and GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)] or ''
end

local function GetRandomLetter(length)
    Wait(0)
    return length > 0 and GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)] or ''
end

function GenerateFrameworkPlate()
    math.randomseed(GetGameTimer())

    local generatedPlate = string.upper(GetRandomLetter(4) .. '' .. GetRandomNumber(4))

    local isTaken = IsPlateTaken(generatedPlate)
    if isTaken then
        return GenerateFrameworkPlate()
    end

    return generatedPlate
end

RegisterNetEvent('onex-rental:server:SaveRentingVehicle_' .. onexFx.Data.Framework, function(requestData)
    local plate = requestData.plate
    if requestData.isPlayerVeh then
        local query = 'UPDATE owned_vehicles SET owner = ? WHERE plate = ?'
        MySQL.update(query, {onexFx.GetIdentifier(requestData.src), plate})
    else

        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)',
            {onexFx.GetIdentifier(requestData.src), plate, json.encode({
                model = joaat(requestData.data.model),
                plate = plate
            })})

        MySQL.insert('INSERT INTO onex_rentcar (identifier, vehdata, duration) VALUES (?, ?, ?)',
            {onexFx.GetIdentifier(requestData.src), json.encode({
                model = requestData.data.model,
                plate = plate
            }), tonumber(requestData.data.duration) * 24})
    end
end)
