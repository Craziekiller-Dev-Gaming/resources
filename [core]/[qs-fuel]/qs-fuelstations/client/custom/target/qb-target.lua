if not Config.UseTarget then
    return
end

local target_name = GetResourceState('ox_target'):find('started') and 'qtarget' or 'qb-target'

CreateThread(function()
    for model, _ in pairs(Config.TankModels) do
        exports[target_name]:AddTargetModel(model, {
            options = {
                {
                    icon = 'fas fa-faucet',
                    targeticon = 'fas fa-gas-pump',
                    label = Lang('FUEL_TARGET_REFILL_JERRY_CAN'),
                    action = function(data)
                        BuyJerrycan()
                    end,
                    canInteract = function(entity, distance, data)
                        local ped = PlayerPedId()
                        local isAlive = GetEntityHealth(ped) > 0
                        if IsFueling or IsPedInAnyVehicle(ped, false) or CurrentHandPumpId ~= 0 then
                            return false
                        end
                        if CurrentPumpData?.tankData?.electric then return false end
                        return CurrentPumpData?.prop and HasPedGotWeapon(ped, 883325847, false) and isAlive
                    end,
                },
                {
                    icon = 'fas fa-gas-pump',
                    targeticon = 'fas fa-gas-pump',
                    label = Lang('FUEL_TARGET_PICKUP_FUEL_PUMP'),
                    action = function(data)
                        local pos = GetEntityCoords(CurrentPumpData.prop)
                        TakeNozzle()
                        CreateHandPump(CurrentPumpData)
                        CurrentPumpTankPosition = pos
                    end,
                    canInteract = function(entity, distance, data)
                        local ped = PlayerPedId()
                        local isAlive = GetEntityHealth(ped) > 0
                        if IsFueling or IsPedInAnyVehicle(ped, false) or HasPedGotWeapon(ped, 883325847, false) or CurrentHandPumpId ~= 0 then
                            return false
                        end
                        return CurrentPumpData?.prop and isAlive
                    end,
                },
                {
                    icon = 'fas fa-faucet',
                    targeticon = 'fas fa-gas-pump',
                    label = Lang('FUEL_TARGET_BUY_JERRY_CAN'),
                    action = function(data)
                        BuyJerrycan()
                    end,
                    canInteract = function(entity, distance, data)
                        if not Config.EnableJerrycan then return false end
                        local ped = PlayerPedId()
                        local isAlive = GetEntityHealth(ped) > 0
                        if CurrentPumpData?.tankData?.electric then return false end
                        if IsFueling or IsPedInAnyVehicle(ped, false) or HasPedGotWeapon(ped, 883325847, false) or CurrentHandPumpId ~= 0 then
                            return false
                        end
                        return CurrentPumpData?.prop and isAlive
                    end,
                },
                {
                    icon = 'fas fa-faucet',
                    targeticon = 'fas fa-gas-pump',
                    label = Lang('FUEL_TARGET_SAVE_FUEL_PUMP'),
                    action = function(data)
                        if isSpraying then
                            TriggerServerEvent('fuelstations:server:triggerSpray', false, 0)
                        end
                        IsFueling = false
                        PutNozzle()
                        DeleteHandPump()
                    end,
                    canInteract = function(entity, distance, data)
                        local ped = PlayerPedId()
                        local isAlive = GetEntityHealth(ped) > 0
                        if IsFueling or IsPedInAnyVehicle(ped, false) or CurrentHandPumpId == 0 then
                            return false
                        end
                        return isAlive
                    end,
                },
            },
            distance = 2,
        })
    end

    exports[target_name]:Vehicle({
        options = {
            {
                icon = 'fas fa-gas-pump',
                targeticon = 'fas fa-gas-pump',
                label = Lang('FUEL_TARGET_USE_JERRY_CAN'),
                action = function(data)
                    local ped = PlayerPedId()
                    local fuelCap = GetNearestFuelCap()
                    local currentFuel = GetFuel(fuelCap[1])
                    if (currentFuel >= 100.0) then
                        return SendTextMessage(Lang('FUEL_TEXT_TANK_FULL'), 'inform')
                    elseif GetAmmoInPedWeapon(ped, 883325847) > 20 then
                        IsFueling = true

                        TriggerEvent('fuelstations:client:refuelFromPump', false, ped, fuelCap[1], true)
                        return
                    else
                        return SendTextMessage(Lang('FUEL_TEXT_JERRY_CAN_EMPTY'), 'error')
                    end
                end,
                canInteract = function(entity, distance, data)
                    local ped = PlayerPedId()
                    if IsFueling or IsPedInAnyVehicle(ped, false) then
                        return false
                    end
                    return GetSelectedPedWeapon(ped) == 883325847
                end,
            },
            {
                icon = 'fas fa-gas-pump',
                targeticon = 'fas fa-gas-pump',
                label = Lang('FUEL_TARGET_PICKUP_FUEL_PUMP'),
                action = function(data)
                    local ped = PlayerPedId()
                    local pumpPos = GetEntityCoords(CurrentHandPumpId, true)
                    if #(pumpPos - GetEntityCoords(ped)) < 1.0 then
                        PutNozzle()
                        DetachHandPump()
                        IsFueling = false
                    end
                end,
                canInteract = function(entity, distance, data)
                    local ped = PlayerPedId()
                    if CurrentHandPumpId == 0 or IsPedInAnyVehicle(ped, false) or CurrentPumpPosition == vec3(0, 0, 0) then
                        return false
                    end
                    return DoesEntityExist(CurrentHandPumpId)
                end,
            },
            {
                icon = 'fas fa-gas-pump',
                targeticon = 'fas fa-gas-pump',
                label = Lang('FUEL_TARGET_PUT_FUEL_PUMP'),
                action = function(data)
                    local fuelCap = GetNearestFuelCap()
                    local dst = #(GetEntityCoords(PlayerPedId()) - fuelCap[2])
                    if dst >= 5.0 then
                        return SendTextMessage(Lang('FUEL_NOTIFICATION_TOO_FAR'), 'error')
                    end
                    local currentFuel = GetFuel(fuelCap[1])
                    if (currentFuel >= 100.0) then
                        return SendTextMessage(Lang('FUEL_TEXT_TANK_FULL'), 'inform')
                    end
                    local vehFuelType = Config.VehicleFuelTypesByModel[GetEntityModel(fuelCap[1])]?.fuelType or 'petrol'
                    if CurrentTankIsElectric then
                        if vehFuelType ~= 'electric' then
                            SendTextMessage(Lang('FUEL_NOTIFICATION_ELECTRIC_VEHICLE') .. ' ' .. vehFuelType, 'error')
                            return
                        end
                    else
                        if vehFuelType == 'electric' then
                            -- SendTextMessage("El vehiculo es de gas", 'error')
                            return
                        end
                    end
                    if isSpraying then
                        TriggerServerEvent('fuelstations:server:triggerSpray', false, 0)
                    end
                    local ped = PlayerPedId()
                    PutNozzle()
                    AttachHandPump(fuelCap[1], fuelCap[2], fuelCap[3])
                    IsFueling = true
                    TriggerEvent('fuelstations:client:refuelFromPump', true, ped, fuelCap[1])
                end,
                canInteract = function(entity, distance, data)
                    local ped = PlayerPedId()
                    if CurrentHandPumpId == 0 or IsFueling or IsPedInAnyVehicle(ped, false) or CurrentPumpPosition ~= vec3(0, 0, 0) then
                        return false
                    end
                    local vehicleFuelType = Config.VehicleFuelTypesByModel[GetEntityModel(entity)]?.fuelType or 'petrol'
                    if CurrentPumpData?.tankData?.electric and vehicleFuelType ~= 'electric' then
                        return false
                    end

                    return DoesEntityExist(CurrentHandPumpId)
                end,
            },
            {
                icon = 'fas fa-faucet',
                targeticon = 'fas fa-gas-pump',
                label = Lang('FUEL_TARGET_STOP_FUEL_CHARGING'),
                action = function(data)
                    IsFueling = false
                    FuelingByJerryCan = false
                end,
                canInteract = function(entity, distance, data)
                    local ped = PlayerPedId()
                    local isAlive = GetEntityHealth(ped) > 0
                    if IsPedInAnyVehicle(ped, false) then
                        return false
                    end
                    return isAlive and FuelingByJerryCan and IsFueling
                end,
            },
        },
        distance = 2,
    })
end)

function AddTargetModel(model, options)
    exports[target_name]:AddTargetModel(model, options)
end
