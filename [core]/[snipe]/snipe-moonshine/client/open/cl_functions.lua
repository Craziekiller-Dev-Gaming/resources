function DestroyBarrel(id)
    local p = promise.new()
    DoProgress(function(result)
        p:resolve(result)
    end, ProgressData.destroy)
    local result = Citizen.Await(p)
    if result then
        lib.callback.await("snipe-moonshine:server:destroyBarrel", false, id)
    end
end

function StartedDroppingOff()
    -- this function is triggered when a player starts dropping off the moonshine at the dropoff location.
    -- once this function is triggered, the player will start the raycast to place the bottle on ground.
end

function DroppedOffBottle()
    -- this function is triggered when a player drops off the moonshine at the dropoff location.
    -- Once this function is triggered, player needs to wait 10 seconds to get the cash.
end

function CanPlace()
    -- this function checks if the player can place the moonshine barrel on the ground.
    -- For eg, you can add checks like if player is in vehicle, if player is in water, etc.

    if GetResourceState("snipe-motel") == "started" then
        if exports["snipe-motel"]:isInRoom() then
            ShowNotification("You can't place the barrel in the motel room.", "error")
            return false
        end
    end
    return true
end