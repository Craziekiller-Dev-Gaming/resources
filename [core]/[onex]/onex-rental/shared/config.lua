Config = {}
Locales = {}

Config.debug = true

Config.CameraSettings = {
    enable = false,
    offsets = {
        x = 0.45,
        y = 1.2,
        z = 0.4
    }

}

local RentVehicleList_1 = {
    -- [price] -> 1-day rental cost. The total is calculated by multiplying this amount by the number of days selected by the player.
    ['compact'] = {

        ['issi2'] = {
            name = 'Issi',
            price = 600,
            duration = {
                min = 1,
                max = 3
            }
        },
        ['blista'] = {
            name = 'Blista',
            price = 540,
            duration = {
                min = 1,
                max = 4
            }
        },
        ['panto'] = {
            name = 'Panto',
            price = 875,
            duration = {
                min = 1,
                max = 2
            }
        }

    },

    ['sedans'] = {
        ['asea'] = {
            name = 'Asea',
            price = 800,
            duration = {
                min = 1,
                max = 4
            }
        },
        ['asterope'] = {
            name = 'Asterope',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        }
    },

    ['suvs'] = {
        ['baller'] = {
            name = 'Baller',
            price = 800,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['cavalcade'] = {
            name = 'Cavalcade',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['dubsta'] = {
            name = 'Dubsta',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['fq2'] = {
            name = 'FQ2',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        }
    },

    ['muscale'] = {
        ['blade'] = {
            name = 'Blade',
            price = 800,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['buccaneer'] = {
            name = 'Buccaneer',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['dukes'] = {
            name = 'Dukes',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        }
    },

    ['sports'] = {
        ['alpha'] = {
            name = 'Alpha',
            price = 800,
            duration = {
                min = 1,
                max = 6
            }
        },
        ['buffalo'] = {
            name = 'Buffalo',
            price = 2400,
            duration = {
                min = 1,
                max = 6
            }
        }
    }
}

local RentBoatVehicleList = {
    -- [price] -> 1-day rental cost. The total is calculated by multiplying this amount by the number of days selected by the player.
    ['boats'] = {

        ['toro'] = {
            name = 'Toro',
            price = 600,
            duration = {
                min = 1,
                max = 3
            }
        },
        ['marquis'] = {
            name = 'Marquis',
            price = 540,
            duration = {
                min = 1,
                max = 4
            }
        },
        ['avisa'] = {
            name = 'Avisa',
            price = 875,
            duration = {
                min = 1,
                max = 2
            }
        },
        ['dinghy'] = {
            name = 'Dinghy',
            price = 875,
            duration = {
                min = 1,
                max = 2
            }
        }

    }
}

local RentPlaneList = {
    -- [price] -> 1-day rental cost. The total is calculated by multiplying this amount by the number of days selected by the player.
    ['planes'] = {
        ['dodo'] = {
            name = 'Dodo',
            price = 5000,
            duration = {
                min = 1,
                max = 3
            }
        },
        ['velum'] = {
            name = 'Velum',
            price = 6000,
            duration = {
                min = 1,
                max = 4
            }
        },
        ['mammatus'] = {
            name = 'Mammatus',
            price = 4500,
            duration = {
                min = 1,
                max = 3
            }
        },
        ['cuban800'] = {
            name = 'Cuban 800',
            price = 5500,
            duration = {
                min = 1,
                max = 2
            }
        },
        ['annihilator'] = {
            name = 'Cuban 800',
            price = 5500,
            duration = {
                min = 1,
                max = 2
            }
        }
    }
}

Config.RentData = {
    ['train_station'] = {
        org_name = "Train Station Rental Services.",

        ped = {
            name = 'Mr Richard',
            model = 'g_m_m_armlieut_01',
            coords = vector4(-796.48, -110.94, 37.47, 5),
            scenarioName = "WORLD_HUMAN_CLIPBOARD" -- https://pastebin.com/6mrYTdQv

        },
        blip = {
            enable = true
        },

        parkings = {vector4(-796.72, -115.99, 37.32, 244), vector4(-800.96, -118.05, 37.31, 245),
            vector4(-804.56, -120.14, 37.34, 245), vector4(-808.32, -122.28, 37.35, 245)},
        rentVehicle = RentVehicleList_1,
        CanPutOwnedVehicleOnRent = true -- if false , then player can not put his vehicle on rent list

    },

    ['airport'] = {
        org_name = "Airpot Station Rental Services.",

        ped = {
            name = 'Jimmy Smith',
            model = 'g_m_m_armlieut_01',
            coords = vector4(-983.37, -2691.9, 13.83, 143.96)
        },
        blip = {
            enable = true
        },

        parkings = {vector4(-979.62, -2689.64, 13.53, 331.02), vector4(-986.13, -2707.81, 13.53, 155.42),
                    vector4(-970.76, -2694.87, 13.53, 327.19), vector4(-970.34, -2710.54, 13.55, 184.18)},
        rentVehicle = RentVehicleList_1,
        CanPutOwnedVehicleOnRent = true -- if false , then player can not put his vehicle on rent list
    },

    ['boat_rental'] = {
        org_name = "Boat Rental Services.",

        ped = {
            name = 'Captain Jack',
            model = 'g_m_m_armlieut_01',
            coords = vector4(-806.5, -1496.1, 1.6, 223.59)
        },
        blip = {
            enable = false
        },

        parkings = {vector4(-801.46, -1498.68, 0.12, 108.0), vector4(-796.92, -1507.99, 0.11, 112.68)},
        rentVehicle = RentBoatVehicleList,
        NoneDB_Vehicle = true, -- if you want that this renting point vhicle wont be saved in database make it true -- mostly use it for boat , plane etc
        setPedinVeh = true, --- if you want to set player in vehicle when he rent it
        CanPutOwnedVehicleOnRent = false -- if false , then player can not put his vehicle on rent list
    },

    -- ['plane_rental'] = {
    --     org_name = "Plane Rental Services.",

    --     ped = {
    --         name = 'John Parker',
    --         model = 'g_m_m_armlieut_01',
    --         coords = vector4(-993.17, -2948.04, 13.96, 62.87)
    --     },
    --     blip = {
    --         enable = true
    --     },

    --     parkings = {vector4(-1022.58, -2973.58, 14.71, 58.17)},
    --     setPedinVeh = true, --- if you want to set player in vehicle when he rent it
    --     rentVehicle = RentPlaneList,
    --     NoneDB_Vehicle = true, -- if you want that this renting point vhicle wont be saved in database make it true -- mostly use it for boat , plane etc
    --     CanPutOwnedVehicleOnRent = false -- if false , then player can not put his vehicle on rent list
    -- }

}

