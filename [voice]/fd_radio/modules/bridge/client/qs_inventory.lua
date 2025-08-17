if not GetResourceState('qs-inventory'):find('start') then return end

SetTimeout(0, function()
    function bridge.hasItem(item, amount)
        if not LocalPlayer.state['isLoggedIn'] then return false end

        local count = exports['qs-inventory']:HasItem(item, amount)

        return count
    end
end)
