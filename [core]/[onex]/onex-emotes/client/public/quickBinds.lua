CreateThread(function()

    for i = 1, 9, 1 do

        RegisterCommand('shift+' .. i, function()

            local altState = IsControlPressed(0, 21) or not IsDisabledControlPressed(0, 21);

            if altState == 1 then

                if IsEntityDead(PlayerPedId()) then
                    return
                end

                SendNUIMessage({
                    action = 'hotbar',
                    data = {
                        key = i
                    }
                })

            end

        end, false);

        RequestRegisterKeyMapping('shift+' .. i, "DON'T TOUCH", 'Emote SHIFT+' .. i, 'shift+' .. i, "", '' .. i .. '',
            true);
    end
end)
