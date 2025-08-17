CONFIG = {}
CONFIG.Locale = 'en'
Framework = {
    ESX = 'esx',
    QBCore = 'qbcore',
    Custom = 'custom',
}
CONFIG.Framework = Framework.QBCore -- esx or qbcore or custom
CONFIG.AlertIcon = './assets/siren.svg'
CONFIG.Debug = false
CONFIG.RCoreStatsIntegration = false

CONFIG.Features = {
    ['radio'] = true
}

--- The key of each job should be the name of the job
CONFIG.JOBS = {
    ['police'] = {
        Jobname = 'police',
        SharedBlips = { 'ambulance' }, -- Jobs that will share the map blips
        GlobalFrequency = 1,
        Ispolice = true,
        Ranks = {
            [0] = 'Cadet',
            [1] = 'Probationary Cadet',
            [2] = 'Officer',
            [3] = 'Snr. Officer',
            [4] = 'Corporal',
            [5] = 'Snr. Corporal',
            [6] = 'Sergeant',
            [7] = 'Master Sergeant',
            [8] = 'Lieutenant',
            [9] = 'Captain',
            [10] = 'High Command',
        },
        Blips = { -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg'
        },
        Perms = {
            ['Captain'] = true,
            ['High Command'] = true
        },
        Units = {
            { 'Dispatch', 1, false, { 'ambulance' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'TAC-1', 2, false },
            { 'Tac-2', 4, false },
            { 'EMS',     3, true, { 'ambulance' }},
        }
    },
    ['ambulance'] = {
        Jobname = 'ambulance',
        Ispolice = false,
        GlobalFrequency = 3,
        SharedBlips = { 'police' }, -- Jobs that will share the map blips
        Ranks = {
            [0] = 'Jr. EMT',
            [1] = 'EMT',
            [2] = 'SR. EMT',
            [3] = 'EMT Supervisor',
        },
        Blips = {                     -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/ambulance.svg', -- The path of the image, you can use a link or a local path
            ['bike'] = './assets/ambulance.svg',
            ['heli'] = './assets/ambulance.svg',
            ['none'] = './assets/ambulance.svg'
        },
        Perms = {
            ['EMT Supervisor'] = true
        },
        Units = {
            { 'Dispatch', 1, false, { 'police' } },
            { 'EMS', 3, false, { 'police' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'Alfa',    6, false },
            { 'Bravo',   7, false },
            { 'Charlie', 8, false },
        }
    },

}

CONFIG.EnableCallsigns = true

CONFIG.EnableOwnUnitChange = true -- If you want to enable the change of unit for the own player without permissions

CONFIG.RelatedJobs = {            -- Jobs that will share the GLOBAL RADIO
    --[[ {
        {
            job = 'police',
            label = 'Police',
        },
        {
            job = 'ambulance',
            label = 'EMS',
        }
    } ]]
}
