---@param veh integer
---@return number
function Functions.getFuel(veh)
    if (FuelSystem == "qs-fuelstations") then return Functions.numbers.round(exports["qs-fuelstations"]:GetFuel(veh), 1) end

    return Functions.numbers.round(GetVehicleFuelLevel(veh), 1)
end

return Functions.getFuel