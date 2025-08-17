local StringCharset = {}
local NumberCharset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

function RandomStr(length)
    if length > 0 then
        return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
    else
        return ''
    end
end

function RandomInt(length)
    if length > 0 then
        return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ''
    end
end

function table.filter(t, filterIter)
    local out = {}
    for k, v in pairs(t) do
        if filterIter(v, k, t) then
            table.insert(out, v)
        end
    end
    return out
end

---@param arr table
---@param func function | any
---@return table | false, number | false
table.find = function(arr, func)
    if not arr then return false, false end
    for i, v in ipairs(arr) do
        if type(func) == 'function' then
            if func(v, i) then return v, i end
        else
            if v == func then return v, i end
        end
    end
    return false, false
end


function table.deepclone(tbl)
    tbl = table.clone(tbl)
    for k, v in pairs(tbl) do
        if type(v) == 'table' then
            tbl[k] = table.deepclone(v)
        end
    end
    return tbl
end

function Error(...)
    print('^1[ERROR]^7', ...)
end

function LoopError(...)
    local unpacked = table.unpack({ ... })
    CreateThread(function()
        while true do
            print('^1[ERROR]^7', unpacked)
            Wait(2000)
        end
    end)
end

function Debug(...)
    if Config.Debug then
        local params = { ... }
        for k, v in ipairs(params) do
            if type(v) == 'table' then
                params[k] = json.encode(v)
            end
        end
        print('^5[DEBUG]^7', table.unpack(params))
    end
end

function Info(...)
    print('^5[INFO]^7', ...)
end
