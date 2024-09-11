lib.callback.register('mt_easybusinesses:server:registerStash', function(source, id, label, slots, weight)
    return exports.ox_inventory:RegisterStash(id, label, slots, weight)
end)

lib.callback.register('mt_easybusinesses:server:registerCraft', function(source, id, items, label)
    return exports.ox_inventory:RegisterCraftStation(id, { items = items, label = label })
end)

lib.callback.register('mt_easybusinesses:server:registerShop', function(source, id, label, items)
    return exports.ox_inventory:RegisterShop(id, { name = label, inventory = items })
end)

lib.callback.register('mt_easybusinesses:server:registerShowcaseStash', function(source, id, label, slots, weight, job, grade)
    exports.ox_inventory:RegisterStash(id, label, slots, weight)

    exports.ox_inventory:registerHook('swapItems', function(payload)
        local Player = exports.qbx_core:GetPlayer(source)
        if payload.fromInventory == id or payload.toInventory == id then
            return Player.PlayerData.job.name == job and Player.PlayerData.job.grade.level >= grade 
        else
            return true
        end
    end)
end)