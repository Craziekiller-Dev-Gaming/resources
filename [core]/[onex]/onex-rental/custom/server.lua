if onexFx.Data.Framework ~= 'custom' then
    return
end

RegisterNetEvent('onex-rental:server:SaveRentingVehicle_' .. onexFx.Data.Framework, function(requestData)
    local plate = requestData.plate
    SetVehicleNumberPlateText(requestData.veh, plate)
    if requestData.isPlayerVeh then -- isPlayerVeh mean is it other player car or not
        --->>> Examples
        -- local query = 'UPDATE owned_vehicles SET owner = ? WHERE plate = ?'
        -- MySQL.update(query, {onexFx.GetIdentifier(requestData.src), plate})
        --- Here you have to update [plate] vehicle identifier value on you framework to [requestData.src] as owner
    else
        --->>> Examples
        -- MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)',
        --     {onexFx.GetIdentifier(requestData.src), plate, json.encode({
        --         model = joaat(requestData.data.model),
        --         plate = plate
        --     })})
        --- Here register new vehicle on your vehicle table as you do on new car purhcase
        --->>> Compulsory
        -- MySQL.insert('INSERT INTO onex_rentcar (identifier, vehdata, duration) VALUES (?, ?, ?)',
        --     {onexFx.GetIdentifier(requestData.src), json.encode({
        --         model = requestData.data.model,
        --         plate = plate
        --     }), tonumber(requestData.data.duration) * 24})
    end
end)

-- function GenerateFrameworkPlate() --- Generate plate for your framework
--     --- Your plate generation code logic here
--     return plate
-- end
