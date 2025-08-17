if onexFx.Data.Framework ~= 'qb' then
    return
end

function GenerateFrameworkPlate()
    local plate = Core.Shared.RandomInt(1) .. Core.Shared.RandomStr(2) .. Core.Shared.RandomInt(3) ..
                      Core.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GenerateQBPlate()
    else
        return plate:upper()
    end
end

RegisterNetEvent('onex-rental:server:SaveRentingVehicle_' .. onexFx.Data.Framework, function(requestData)
    local plate = requestData.plate
    if requestData.isPlayerVeh then
        local GrageVehData = MySQL.rawExecute.await('SELECT * FROM player_vehicles WHERE plate = ?', {plate})

        TriggerClientEvent('onex-rental:cl_qb:SetVehicleProperties', requestData.src, requestData.veh,
            GrageVehData[1].mods, GrageVehData[1].fuel)

        if GetResourceState('qbx_core'):find('start') then
            MySQL.update.await(
                'UPDATE player_vehicles SET citizenid = @citizenid, license = (SELECT license FROM players WHERE citizenid = @citizenid), state = @state WHERE plate = @plate',
                {
                    citizenid = onexFx.GetIdentifier(requestData.src),
                    plate = plate,
                    state = 0
                })
        else
            local query = 'UPDATE player_vehicles SET citizenid = ? WHERE plate = ?'
            MySQL.update(query, {onexFx.GetIdentifier(requestData.src), plate})
        end
    else

        if GetResourceState('qbx_core') then

            MySQL.insert.await(
                'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES ((SELECT license FROM players WHERE citizenid = @citizenid), @citizenid, @vehicle, @hash, @mods, @plate, @state, @garage)',
                {
                    citizenid = onexFx.GetIdentifier(requestData.src),
                    vehicle = requestData.data.model,
                    hash = GetHashKey(requestData.veh),
                    mods = '{}',
                    plate = plate,
                    state = 0,
                    garage = 'pillboxgarage'
                })
        else
            MySQL.insert.await(
                'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
                {onexFx.GetLicense(requestData.src), onexFx.GetIdentifier(requestData.src), requestData.data.model,
                 GetHashKey(requestData.veh), '{}', plate, 'pillboxgarage', 0})
        end

    end

    TriggerClientEvent('vehiclekeys:client:SetOwner', requestData.src, plate)

    MySQL.insert('INSERT INTO onex_rentcar (identifier, vehdata, duration) VALUES (?, ?, ?)',
        {onexFx.GetIdentifier(requestData.src), json.encode({
            model = requestData.data.model,
            plate = plate
        }), tonumber(requestData.data.duration) * 24})
end)

