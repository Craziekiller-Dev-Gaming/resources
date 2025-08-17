local isServerSideVersion = IsDuplicityVersion()

onexFx.SetFuel = function(ent, amount)
    if init.Links.fuel.name == "LegacyFuel" then
        if not isServerSideVersion then
            exports["LegacyFuel"]:SetFuel(ent, amount)
        end
    elseif init.Links.fuel.name == "ox_fuel" then
        if isServerSideVersion then
            Entity(ent).state.fuel = amount
        end
    elseif init.Links.fuel.name == "cdn-fuel" then
        if not isServerSideVersion then
            exports['cdn-fuel']:SetFuel(amount)
        end
    end

end
