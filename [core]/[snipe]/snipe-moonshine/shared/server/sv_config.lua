SvConfig = {}

SvConfig.MoonshinePeds = {
    [1] = {
        model = "a_m_o_tramp_01",
        coords = vector4(-679.82, -2278.44, 12.81, 175.25),
    },
}

SvConfig.BasePrice = 50 -- base price of moonshine (per 100% quality)

SvConfig.ItemToReturnWhenSold = "money" -- used only for ox_inventory

-- If you select money, then the player will get cash based on the BasePrice
SvConfig.ReturnType = "money" -- item (if the type is selected as item, make sure to add the item properly in the next option)
SvConfig.ReturnItem = "dirtymoney" -- if type is set as item (the amount will be decided based on the BasePrice)

-- Example.
-- If the quality of moonshine is 100, and the reputation is 50, then the player will get 200% of the price
-- If the quality of moonshine is 100, and the reputation is 100, then the player will get 300% of the price
SvConfig.ReputationRequiredForFullAmount = 50 -- at 50 reputation, people will get full amount if the quality of moonshine is 100

SvConfig.ReputationGainedPerBottle = 0.5    -- reputation gained per bottle sold

SvConfig.BarrelPrice = 1000 -- price of the barrel

SvConfig.DropOffLocations = {
    vector3(1777.38, 3738.15, 34.66),
    vector3(1435.3, 3657.19, 34.43),
    vector3(1781.45, 3911.17, 34.91),
    vector3(1880.47, 3920.42, 33.22),
    vector3(1943.79, 3804.37, 32.04),
    vector3(2156.88, 3385.59, 45.57),
    vector3(2168.08, 3330.96, 46.51),
    vector3(2639.56, 4246.15, 44.75),
    vector3(2728.68, 4142.18, 44.32),
    vector3(2159.08, 4782.31, 42.04),
    vector3(1967.01, 4634.17, 41.1),
    vector3(1725.38, 4642.56, 43.88),
    vector3(2016.92, 4987.77, 42.1),
    vector3(3310.86, 5176.59, 19.61),
    vector3(1510.44, 6325.87, 24.6),
    vector3(1416.96, 6339.32, 24.36),
    vector3(281.58, 6789.07, 15.81),
}

-- default drop off location (If you remove a location or SvConfig.DropOffLocations is less than 10, it will use this location)
SvConfig.DefaultDropOffLocation = vector3(1389.9, 3661.36, 34.93)