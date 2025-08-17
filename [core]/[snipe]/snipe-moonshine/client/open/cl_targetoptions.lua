local targetOptions = {}
local interactOptions = {}

function GetOptionsForBarrel(id, type)
    if Config.Inventory == "ox" then
        if type == "interact" then
            interactOptions = {
                {
                    label = Locales["target_open_barrel_label"],
                    action = function()
                        OpenInventory(id, "barrel")
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_collect_moonshine_label"],
                    action = function()
                        CollectMoonshine(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_start_cooking_label"],
                    action = function()
                        StartCooking(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_destroy_barrel_label"],
                    action = function()
                        DestroyBarrel(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_analyse_still_label"],
                    action = function()
                        AnalyseStill(id)
                    end,
                },
            }
            return interactOptions
        elseif type == "target" then

            targetOptions = {
                {
                    icon = Icons["open_barrel"],
                    label = Locales["target_open_barrel_label"],
                    action = function()
                        OpenInventory(id, "barrel")
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["pickup_moonshine"],
                    label = Locales["target_collect_moonshine_label"],
                    action = function()
                        CollectMoonshine(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["start_cooking"],
                    label = Locales["target_start_cooking_label"],
                    action = function()
                        StartCooking(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["destroy_barrel"],
                    label = Locales["target_destroy_barrel_label"],
                    action = function()
                        DestroyBarrel(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["analyse_still"],
                    label = Locales["target_analyse_still_label"],
                    action = function()
                        AnalyseStill(id)
                    end,
                },
            }
            return targetOptions
        end
    else
        if type == "interact" then
            interactOptions = {
                {
                    label = Locales["target_collect_moonshine_label"],
                    action = function()
                        CollectMoonshine(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_start_cooking_label"],
                    action = function()
                        StartCooking(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_destroy_barrel_label"],
                    action = function()
                        DestroyBarrel(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_analyse_still_label"],
                    action = function()
                        AnalyseStill(id)
                    end,
                },
            }
            return interactOptions
        elseif type == "target" then

            targetOptions = {
                {
                    icon = Icons["pickup_moonshine"],
                    label = Locales["target_collect_moonshine_label"],
                    action = function()
                        CollectMoonshine(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["start_cooking"],
                    label = Locales["target_start_cooking_label"],
                    action = function()
                        StartCooking(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    icon = Icons["destroy_barrel"],
                    label = Locales["target_destroy_barrel_label"],
                    action = function()
                        DestroyBarrel(id)
                    end,
                    canInteract = function()
                        if (not Config.CanOnlyOwnerAccessTheBarrel) or (identifier == PlayerInfo.identifier) then
                            return true
                        end
                        return false
                    end
                },
                {
                    label = Locales["target_analyse_still_label"],
                    action = function()
                        AnalyseStill(id)
                    end,
                },
            }
            return targetOptions
        end
    end
end

function GetOptionsForPed(index, type)
    if Config.Inventory == "ox" then
        if type == "interact" then
            interactOptions = {
                {
                    label = "Drop Crate",
                    action = function()
                        DropCrate(index)
                    end
                },
                {
                    label = "Pick Moonshine Bottles",
                    action = function()
                        PickupCrate(index)
                    end
                },
                {
                    label = Locales["target_buy_barrel"],
                    icon = Icons["buy_barrel"],
                    action = function()
                        BuyBarrel()
                    end
                }
            }
            return interactOptions
        elseif type == "target" then
            targetOptions = {
                {
                    label = Locales["target_drop_crate_label"],
                    icon = Icons["drop_crate"],
                    action = function()
                        DropCrate(index)
                    end
                },
                {
                    label = Locales["target_pickup_bottle_label"],
                    icon = Icons["pickup_bottle"],
                    action = function()
                        PickupCrate(index)
                    end
                },
                {
                    label = Locales["target_buy_barrel"],
                    icon = Icons["buy_barrel"],
                    action = function()
                        BuyBarrel()
                    end
                }
            }
            return targetOptions
        end
    else
        if type == "interact" then
            interactOptions = {
                {
                    label = "Drop Crate",
                    action = function()
                        DropCrate(index)
                    end
                },
                {
                    label = Locales["target_buy_barrel"],
                    icon = Icons["buy_barrel"],
                    action = function()
                        BuyBarrel()
                    end
                }
            }
            return interactOptions
        elseif type == "target" then
            targetOptions = {
                {
                    label = Locales["target_drop_crate_label"],
                    icon = Icons["drop_crate"],
                    action = function()
                        DropCrate(index)
                    end
                },
                {
                    label = Locales["target_buy_barrel"],
                    icon = Icons["buy_barrel"],
                    action = function()
                        BuyBarrel()
                    end
                }
            }
            return targetOptions
        end
    end
end