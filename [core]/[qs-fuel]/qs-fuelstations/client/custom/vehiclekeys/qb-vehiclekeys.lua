if Config.Vehiclekeys ~= 'qb-vehiclekeys' then
    return
end

function AddVehiclekeys(vehicle, plate, item)
    Wait(100)
    TriggerEvent('vehiclekeys:client:SetOwner', plate)
end

function RemoveVehiclekeys(vehicle, plate)
    return
end
