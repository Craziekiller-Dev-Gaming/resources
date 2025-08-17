queryLoaded = false
MySQL.ready( function()
    local p = promise.new()
    -- check if cooks_left, still_time and cooking_identifier column exists
    MySQL.Async.fetchAll("SHOW COLUMNS FROM snipe_moonshine", {}, function(result)
        local columns = {}
        for _, v in ipairs(result) do
            columns[v.Field] = true
        end
        print(json.encode( columns))
        if not columns["cooks_left"] then
            MySQL.Sync.execute("ALTER TABLE snipe_moonshine ADD COLUMN cooks_left INT DEFAULT NULL")
            MySQL.Sync.execute("UPDATE snipe_moonshine SET cooks_left = @cooks_left", {
                ["@cooks_left"] = Config.LimitOfCooksPerStill
            })
        end
        if not columns["still_time"] then
            MySQL.Sync.execute("ALTER TABLE snipe_moonshine ADD COLUMN still_time INT DEFAULT NULL")

            MySQL.Sync.execute("UPDATE snipe_moonshine SET still_time = @still_time", {
                ["@still_time"] = os.time() + (Config.TimeStillCanLast * 86400) -- 86400 seconds in a day
            })
        end
        if not columns["cooking_identifier"] then
            MySQL.Sync.execute("ALTER TABLE snipe_moonshine ADD COLUMN cooking_identifier VARCHAR(100) DEFAULT ''")
            MySQL.Sync.execute("UPDATE snipe_moonshine SET cooking_identifier = identifier", {})
        end
        p:resolve()
    end)
    Citizen.Await(p)
    print( "Database columns checked and updated.")
    queryLoaded = true
end)