-- ██████╗░██████╗░██████╗░░░░░░░███████╗██╗░░░░░███████╗██╗░░░██╗░█████╗░████████╗░█████╗░██████╗░
-- ██╔══██╗██╔══██╗██╔══██╗░░░░░░██╔════╝██║░░░░░██╔════╝██║░░░██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗
-- ██║░░██║██████╔╝██████╔╝█████╗█████╗░░██║░░░░░█████╗░░╚██╗░██╔╝███████║░░░██║░░░██║░░██║██████╔╝
-- ██║░░██║██╔══██╗██╔═══╝░╚════╝██╔══╝░░██║░░░░░██╔══╝░░░╚████╔╝░██╔══██║░░░██║░░░██║░░██║██╔══██╗
-- ██████╔╝██║░░██║██║░░░░░░░░░░░███████╗███████╗███████╗░░╚██╔╝░░██║░░██║░░░██║░░░╚█████╔╝██║░░██║
-- ╚═════╝░╚═╝░░╚═╝╚═╝░░░░░░░░░░░╚══════╝╚══════╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝

Config = Config or {}

-- Only one can be set true at a time 
Config.QBCoreFramework = true		-- Set this to true if using QBCoreFramework
Config.ESXFramework = false			-- Set this to true if using ESXFramework

-- Customise the target system according to your needs
Config.targetSystem = true				-- If you want to use target which
Config.targetName = 'qb-target' 		-- This script work with qb-target/ox_target
Config.QBMenu = false					-- Keep this true if you are using QBCoreFramework
Config.OXLib = true					-- Set this to true if you are using OXLib and don't forget to setup Config.QBMenu = false
Config.elevatorTime = 2					-- The waiting time it will take to transport the player
Config.emote = "buzz"					-- Emote used when using elevators

Config.notification = {
	enabled = false,							-- Display hint notification?
	distance = 3.0,							-- Distance from elevator that the hint will show
	message = "Target the elevator to use"	-- Text of the hint notification
}

Config.elevators = {

	HumaneLabs = {
		{
			coords = vector3(3541.71, 3674.17, 28.12), heading = 80.0, level = "Laboratory", label = "Floor -1",
		},
		{
			coords = vector3(3541.7, 3674.05, 20.99), heading = 80.0, level = "Authorized Only", label = "Floor -3"
		},
	},
	
    MazeBank = {
		{
			coords = vector3(-138.67, -588.2, 167.0), heading = 125.5, level = "Hardstand", label = "Floor 21",
		},
		{
			coords = vector3(-142.8, -572.63, 32.42), heading = 164.0, level = "Ground Parking", label = "Parking"
		},
	},

	Agency = {
		{
			coords = vector3(-576.19, -713.63, 121.61), heading = 95.0, level = "F.Clinton & Partner", label = "Floor 11",
		},
		{
			coords = vector3(-576.47, -714.31, 113.01), heading = 95.0, level = "F.Clinton & Partner", label = "Floor 10",
		},
		{
			coords = vector3(-589.48, -708.38, 36.38), heading = 356.0, level = "Ground Floor", label = "Ground"
		},
	},

	
	LSPD = {
		{
			coords = vector3(-589.24, -431.1, 45.64), heading = 273.27, level = "CID / Roof", label = "Third Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-590.03, -430.91, 39.64), heading = 272.24, level = "Offices", label = "Second Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-590.14, -430.91, 35.18), heading = 270.6, level = "Lobby", label = "Main Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-592.96, -430.79, 31.17), heading = 272.74, level = "Garage", label = "Lower Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	PillboxSecondGabz = {
		{
			coords = vector3(330.45, -601.07, 43.28), heading = 67.64, level = "Upper Pillbox", label = "Main Floor",
		},
		{
			coords = vector3(345.68, -582.34, 28.79), heading = 248.30, level = "Lower Pillbox", label = "Lower Pillbox",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(341.58, -580.88, 28.79), heading = 70.59, level = "Parking", label = "Parking",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	PillboxThirdGabz = {
		{
			coords = vector3(338.52, -583.84, 74.16), heading = 254.13, level = "Rooftop", label = "HeliPad",
			jobs = {
				["police"] = 0,
				["ambulance"] = 2,
			},
		},
		{
			coords = vector3(327.17, -603.87, 43.28), heading = 338.36, level = "Upper Pillbox", label = "Main Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 2,
			},
		},
	},

}
