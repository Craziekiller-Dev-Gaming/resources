-- Handling the metadata reduction for the packs
for packName, packData in pairs(Config.Settings.packs) do
    Z.registerUsableItem(packName, function(plyId, itemData)
        local metadata = itemData.metadata
        local slot = itemData.slot

        if (metadata.amount == nil or metadata.amount <= 0) then
            return Z.notify(plyId, "noAmountInPack")
        end

        metadata.amount -= 1
        metadata.description = T("cigarettePack:amount", {metadata.amount})

        Z.setItemMetadata(plyId, slot, metadata, false)
        Z.addItem(plyId, packData.itemToGive, 1)
    end)
end

for name, data in pairs(Config.Settings.packs) do
    Z.ensureMetadata(name, {
        amount = data.amount,
        description = T("cigarettePack:amount", {data.amount})
    })
end