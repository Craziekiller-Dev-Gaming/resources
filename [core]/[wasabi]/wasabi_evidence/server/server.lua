-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
local evidenceStorage, evidenceDropped, fingerPrints, fingerprintsStorage, manualFingerprintsStorage, dropId = {}, {}, {}, {}, {}, 0
local inQueue = {}

-- Load previous evidence queries
CreateThread(function()
    MySQL.ready(function()
        MySQL.query('SELECT * FROM wasabi_fingerprints', {}, function(data)
            if data then
                for _,v in pairs(data) do
                    fingerprintsStorage[v.identifier] = true
                end
            end
        end)
        MySQL.query('SELECT * FROM wasabi_evidence', {}, function(data)
            if data then
                for _,v in pairs(data) do
                    local vData = json.decode(v.data)
                    vData.id = v.id
                    evidenceStorage[#evidenceStorage + 1] = vData
                end
            end
        end)
        if Config.ManualFingerprintDatabase then
            MySQL.query('SELECT * FROM wasabi_manual_prints', {}, function(data)
                if data then
                    for _,v in pairs(data) do
                        manualFingerprintsStorage[v.identifier] = {
                          firstName = v.firstname,
                          lastName = v.lastname
                        }
                    end
                end
            end)
        end
    end)
end)

-- Functions
local function SaveEvidence(source, evidence)
    local authorized
    for k,v in pairs(Config.PoliceJobs) do
        local hasJob, hasGrade = wsb.hasGroup(source, k)
        if hasJob and hasGrade >= Config.PoliceJobs[hasJob] then authorized = true break end
    end
    if not authorized then return end
    local idFound
    MySQL.Async.execute('INSERT INTO wasabi_evidence (data) VALUES (@data)', {
        ['@data'] = json.encode(evidence),
    }, function(rowsChanged)
        if rowsChanged then
            MySQL.single('SELECT id FROM wasabi_evidence WHERE data = ?', {json.encode(evidence)}, function(result)
                if result then
                    idFound = result.id
                end
            end)
        else
            idFound = 'no'
        end
    end)
    while not idFound do Wait(0) end
    if idFound and idFound ~= 'no' then
        evidence.id = idFound
        evidenceStorage[#evidenceStorage + 1] = evidence
        return evidence
    else
        return false
    end
end

local function DeleteEvidence(source, id)
    if not wsb.hasGroup(source, Config.PoliceJobs) and not wsb.isPlayerBoss(source) then return false end
    MySQL.Async.execute('DELETE FROM `wasabi_evidence` WHERE `id` = @id', { ["@id"] = id })
    local newStorage = {}
    for k,v in pairs(evidenceStorage) do
        if v?.id ~= id then
            newStorage[#newStorage + 1] = v
        end
    end
    evidenceStorage = newStorage
    return true
end


-- Events
RegisterNetEvent('wasabi_evidence:add', function(evidence, coords, interior, street)
    dropId = dropId + 1
    evidenceDropped[#evidenceDropped + 1] = {
        id = dropId,
        identifier = wsb.getIdentifier(source),
        evidence = evidence,
        coords = coords,
        interior = interior,
        time = os.time(),
        owner = wsb.getName(source),
        street = street
    }
end)

RegisterNetEvent('wasabi_evidence:cleanBlood', function(obj)
    TriggerClientEvent('wasabi_evidence:cleanBloodSpot', -1, obj)
end)

RegisterNetEvent('wasabi_evidence:remove', function(id, coords)
    for k,v in pairs(evidenceDropped) do
        if v?.id == id and v?.coords == coords then
            evidenceDropped[k] = nil
            local newEvidence = {}
            for i=1, #evidenceDropped do
                if evidenceDropped[i] ~= nil then
                    newEvidence[#newEvidence + 1] = evidenceDropped[i]
                end
            end
            evidenceDropped = newEvidence
            break
        end
    end
end)

RegisterNetEvent('wasabi_evidence:usePrintTool', function()
    if not wsb.hasItem(source, Config.VehicleFingerPrinting.requiredItem) then return end
    wsb.removeItem(source, Config.VehicleFingerPrinting.requiredItem, 1)
end)

RegisterNetEvent('wasabi_evidence:sv:setInteract', function(target)
    TriggerClientEvent('wasabi_evidence:cl:setInteract', target, source)
end)

-- Callbacks
lib.callback.register('wasabi_evidence:getDateAndTime', function(source, time)
    return os.date(Strings.date_format, time), os.date(Strings.time_format, time)
end)

lib.callback.register('wasabi_evidence:checkLastDriver', function(source, vehicle, track)
    local driver = (fingerPrints[vehicle] or false)
    if track then
        fingerPrints[vehicle] = {
            identifier = wsb.getIdentifier(source),
            owner = wsb.getName(source)
        }
    end
    if driver then return driver else return false end
end)

lib.callback.register('wasabi_evidence:hasCleaner', function(source)
    if wsb.hasItem(source, Config.CriminalsCanCleanEvidence.requiredBloodCleanItem) > 0 then
        if Config.CriminalsCanCleanEvidence.removeBloodCleanItemOnUse then
            wsb.removeItem(source, Config.CriminalsCanCleanEvidence.requiredBloodCleanItem, 1)
        end
        return true
    else
        return false
    end
end)

lib.callback.register('wasabi_evidence:getBloodType', function(source, citizenid)
    if not wsb.framework == 'qb' then return false end
    local player = wsb.getPlayerFromIdentifier(citizenid)
    if not player then return end
    if not player.PlayerData.metadata['bloodtype'] then return false else return player.PlayerData.metadata['bloodtype'] end
end)

lib.callback.register('wasabi_evidence:getPrintInfo', function(source, data)
    local data = data
    data.id = 1
    data.evidence = 'print'
    data.time = os.time()
    return data
end)

lib.callback.register('wasabi_evidence:getEvidenceStorage', function(source)
    if not wsb.hasGroup(source, Config.PoliceJobs) then return end
    return evidenceStorage, fingerprintsStorage, manualFingerprintsStorage
end)

lib.callback.register('wasabi_evidence:saveEvidence', function(source, evidence)
    local saved = SaveEvidence(source, evidence)
    return saved
end)

lib.callback.register('wasabi_evidence:deleteEvidence', function(source, evidence)
    local deleted = DeleteEvidence(source, evidence)
    return deleted
end)

lib.callback.register('wasabi_evidence:getNearbyEvidence', function(source, coords, interior)
    if Config.AutoDestroy and #evidenceDropped > 0 then
        local time = os.time()
        for k,v in ipairs(evidenceDropped) do
            if v?.time and (time - v.time) > Config.AutoDestroy then
                evidenceDropped[k] = nil
            end
        end
        local newEvidence = {}
        for i=1, #evidenceDropped do
            if evidenceDropped[i] ~= nil then
                newEvidence[#newEvidence + 1] = evidenceDropped[i]
            end
        end
        evidenceDropped = newEvidence
    end
    local data
    if #evidenceDropped > 0 then
        local inserted = {}
        for _,v in ipairs(evidenceDropped) do
            local evidenceIn, pedIn
            if interior ~= nil and interior ~= 0 then pedIn = true end
            if v?.interior ~= nil and v.interior ~= 0 then evidenceIn = true end
            if v and v.coords and #(coords - v.coords) < 30 and (evidenceIn == pedIn) then
                inserted[#inserted + 1] = v
            end
        end
        data = inserted
    else
        data = {}
    end
    while not data do Wait(0) end
    return data
end)

---@diagnostic disable-next-line: unused-local
lib.callback.register('wasabi_evidence:fingerprintPlayer', function(_source, targetId, identifier)
    if not identifier then identifier = wsb.getIdentifier(targetId) end
    local filtered
    if not fingerprintsStorage[identifier] then
        MySQL.insert('INSERT IGNORE INTO wasabi_fingerprints (identifier) VALUES (?)', {identifier}, function()
            fingerprintsStorage[identifier] = true
        end)
    end
    local num = 1
    for k,v in pairs(evidenceStorage) do
        local data = v
        if not filtered then filtered = {} end
        if data.identifier == identifier then
            data.id = num
            evidenceStorage[k].prints = true
            data.prints = true
            filtered[num] = data
            num = num + 1
        end
    end
    if not filtered or #filtered < 1 then
        return false
    else
        return filtered
    end
end)

lib.callback.register('wasabi_evidence:manualFingerprintPlayer', function(source, targetId, identifier)
    if not identifier then
      identifier = wsb.getIdentifier(targetId)
    end
    if manualFingerprintsStorage[identifier] then
        return manualFingerprintsStorage[identifier]
    end
    return false
end)

lib.callback.register('wasabi_evidence:manualFingerprintPlayerModify', function(source, targetId, firstName, lastName, identifier)
    if not identifier then
      identifier = wsb.getIdentifier(targetId)
    end
    if not manualFingerprintsStorage[identifier] then
        MySQL.insert('INSERT IGNORE INTO wasabi_manual_prints (identifier, firstname, lastname) VALUES (?, ?, ?)', {identifier, firstName, lastName}, function()
            manualFingerprintsStorage[identifier] = {
              firstName = firstName,
              lastName = lastName
            }
        end)
    else
        MySQL.insert('UPDATE wasabi_manual_prints SET firstname = ?, lastname = ? WHERE identifier = ?', {firstName, lastName, identifier}, function()
            manualFingerprintsStorage[identifier] = {
              firstName = firstName,
              lastName = lastName
            }
        end)
    end
    return true
end)

-- Register usable items
CreateThread(function()
    if Config.VehicleFingerPrinting.enabled then
        wsb.registerUsableItem(Config.VehicleFingerPrinting.requiredItem, function(source)
            TriggerClientEvent('wasabi_evidence:fingerprintVehicle', source)
        end)
    end
end)
