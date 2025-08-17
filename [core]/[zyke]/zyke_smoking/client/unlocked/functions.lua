function GetAmount()
    return Cache?.itemData?.amount or 0
end

-- Vape-only
function GetBattery()
    return Cache?.itemData?.battery or 0
end

-- Bong-only
function GetWater()
    return Cache?.itemData?.water or 0
end

exports("GetAmount", GetAmount)
exports("GetBattery", GetBattery)
exports("GetWater", GetWater)

-- Because of the changes to environment when dealing with routing buckets, the client can no longer access the prop
-- The prop removal is handled by the "SetObjectNetId" event, where it removes the prop if it does exist already
function EnsureSmokeableProp()
    if (not Cache.currentItem) then return end

    local item = GetItemSettings(Cache.currentItem)
    if (not item) then return end

    local propName = item.prop

    -- Deletes prop if possible, otherwise server handles it
    if (Cache.props.main and DoesEntityExist(Cache.props.main)) then
        DeleteEntity(Cache.props.main)
    end

    Cache.props.main = CreateObject(propName, 0.0, 0.0, 0.0, true, true, true)

    TriggerServerEvent("zyke_smoking:SetObjectNetId", ObjToNet(Cache.props.main))
    EnsurePropPositions()
end

function ResetWalkStyle()
    local ply = PlayerPedId()
    local isMale = IsPedMale(ply)
    local walkStyle = isMale and "move_m@multiplayer" or "move_f@multiplayer"

    SetPedMovementClipset(ply, walkStyle, 1.0)
end

---@param slot integer?
---@param item string
function CreateLighterProp(slot, item)
    RemoveLighterProp()

    local defaultLighter = Config.Settings.lighter.item[1]
    local lighter = Config.LighterProps[item] or Config.LighterProps[defaultLighter]
    if (not lighter) then return end
    if (not lighter[Cache.itemPlacement] or not lighter[Cache.itemPlacement][Cache.itemType]) then return end

    local bone = lighter[Cache.itemPlacement]?[Cache.itemType]?.bone
    local offset = lighter[Cache.itemPlacement]?[Cache.itemType]?.offset
    local rotation = lighter[Cache.itemPlacement]?[Cache.itemType]?.rotation
    if (not bone or not offset or not rotation) then return end

    if (not Z.loadModel(lighter.model)) then return end

    Cache.props.secondary = CreateObject(lighter.model, 0.0, 0.0, 0.0, true, true, false)

    local ply = PlayerPedId()
    local boneIdx = GetPedBoneIndex(ply, bone)
    AttachEntityToEntity(Cache.props.secondary, ply, boneIdx, offset.x, offset.y, offset.z, rotation.x, rotation.y, rotation.z, true, true, false, true, 1, true)
end

function RemoveLighterProp()
    if (Cache.props.secondary and DoesEntityExist(Cache.props.secondary)) then
        DeleteEntity(Cache.props.secondary)
    end
end

---@return boolean
function IsHigh()
    return Cache.effects.isActive
end

exports("IsHigh", IsHigh)

---@return boolean
function HasWalkEffect()
    return IsHigh() and Cache.effects.effects[1].movement ~= nil
end

exports("HasWalkEffect", HasWalkEffect)

function HasScreenEffect()
    return IsHigh() and Cache.effects.effects[1].screen ~= nil
end

exports("HasScreenEffect", HasScreenEffect)