local fuel = nil

local systems = {
    {fileName = "qs-fuelstations", variable = "qs-fuelstations"}
}

for i = 1, #systems do
    local isStarted = GetResourceState(systems[i].fileName) == "started"

    if (isStarted) then
        fuel = systems[i].variable

        -- Functions.internalDebug("Found", fuel)

        break
    end
end

return fuel