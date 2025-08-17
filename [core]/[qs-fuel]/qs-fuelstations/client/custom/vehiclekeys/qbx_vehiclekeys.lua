if Config.Vehiclekeys ~= 'qbx_vehiclekeys' then
    return
end

function AddVehiclekeys(vehicle, plate, item)
    Wait(100)
    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
end

function RemoveVehiclekeys(vehicle, plate)
    return
end
