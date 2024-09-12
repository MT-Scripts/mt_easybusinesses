lib.locale()

CreateThread(function()
    for bk, bv in pairs(Businesses) do
        if bv.blip then
            local blip = AddBlipForCoord(bv.blip.coords.x, bv.blip.coords.y, bv.blip.coords.z)
            SetBlipSprite(blip, bv.blip.sprite)
            SetBlipDisplay(blip, bv.blip.display)
            SetBlipAsShortRange(blip, true)
            SetBlipScale(blip, bv.blip.scale)
            SetBlipColour(blip, bv.blip.color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(bv.blip.label)
            EndTextCommandSetBlipName(blip)
        end

        if bv.managements then
            for mk, mv in pairs(bv.managements) do
                exports.ox_target:addSphereZone({
                    coords = mv.coords,
                    radius = mv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_management'),
                            icon = 'fas fa-user-tie',
                            onSelect = function()
                                exports.qbx_management:OpenBossMenu('job')
                            end,
                            canInteract = function()
                                return QBX.PlayerData.job.isboss
                            end
                        }
                    }
                })
            end
        end

        if bv.stashes then
            for sk, sv in pairs(bv.stashes) do
                exports.ox_target:addSphereZone({
                    coords = sv.coords,
                    radius = sv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_stash'),
                            icon = 'fas fa-cube',
                            onSelect = function()
                                if not exports.ox_inventory:openInventory('stash', "businesses_stash_"..bv.job.."_"..sk) then
                                    lib.callback('mt_easybusinesses:server:registerStash', false, function()
                                        exports.ox_inventory:openInventory('stash', "businesses_stash_"..bv.job.."_"..sk)
                                    end, "businesses_stash_"..bv.job.."_"..sk, sv.label, sv.slots, (sv.weight*1000))
                                end
                            end,
                            canInteract = function()
                                return (QBX.PlayerData.job.grade.level >= sv.minGrade)
                            end
                        }
                    }
                })
            end
        end

        if bv.crafts then
            for ck, cv in pairs(bv.crafts) do
                exports.ox_target:addSphereZone({
                    coords = cv.coords,
                    radius = cv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_craft'),
                            icon = 'fas fa-wrench',
                            onSelect = function()
                                lib.callback('mt_easybusinesses:server:registerCraft', false, function()
                                    exports.ox_inventory:openInventory('crafting', { id = "businesses_craft_"..bv.job.."_"..ck })
                                end, "businesses_craft_"..bv.job.."_"..ck, cv.items, cv.label)
                            end,
                            canInteract = function()
                                return (QBX.PlayerData.job.grade.level >= cv.minGrade)
                            end
                        }
                    }
                })
            end
        end

        if bv.shops then
            for sk, sv in pairs(bv.shops) do
                exports.ox_target:addSphereZone({
                    coords = sv.coords,
                    radius = sv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_shop'),
                            icon = 'fas fa-dollar-sign',
                            onSelect = function()
                                lib.callback('mt_easybusinesses:server:registerShop', false, function()
                                    exports.ox_inventory:openInventory('shop', { type = "businesses_stash_"..bv.job.."_"..sk })
                                end, "businesses_stash_"..bv.job.."_"..sk, sv.label, sv.inventory)
                            end,
                            canInteract = function()
                                return (QBX.PlayerData.job.grade.level >= sv.minGrade)
                            end
                        }
                    }
                })
            end
        end

        if bv.trays then
            for tk, tv in pairs(bv.trays) do
                exports.ox_target:addSphereZone({
                    coords = tv.coords,
                    radius = tv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_tray'),
                            icon = 'fas fa-cube',
                            onSelect = function()
                                if not exports.ox_inventory:openInventory('stash', "businesses_tray_"..bv.job.."_"..tk) then
                                    lib.callback('mt_easybusinesses:server:registerStash', false, function()
                                        exports.ox_inventory:openInventory('stash', "businesses_tray_"..bv.job.."_"..tk)
                                    end, "businesses_tray_"..bv.job.."_"..tk, tv.trayLabel, tv.slots, (tv.weight*1000))
                                end
                            end,
                            canInteract = function()
                                return tv.includeTray
                            end
                        },
                        {
                            label = locale('target_showcase'),
                            icon = 'fas fa-eye',
                            onSelect = function()
                                if not exports.ox_inventory:openInventory('stash', "businesses_showcase_"..bv.job.."_"..tk) then
                                    lib.callback('mt_easybusinesses:server:registerShowcaseStash', false, function()
                                        exports.ox_inventory:openInventory('stash', "businesses_showcase_"..bv.job.."_"..tk)
                                    end, "businesses_showcase_"..bv.job.."_"..tk, tv.showcaseLabel, tv.slots, (tv.weight*1000), bv.job, tv.showcaseGrade)
                                end
                            end,
                            canInteract = function()
                                return tv.includeShowcase
                            end
                        },
                    }
                })
            end
        end

        if bv.duty then
            for dk, dv in pairs(bv.duty) do
                exports.ox_target:addSphereZone({
                    coords = dv.coords,
                    radius = dv.radius,
                    debug = bv.debug,
                    options = {
                        {
                            label = locale('target_duty_on'),
                            icon = 'fas fa-toggle-on',
                            onSelect = function()
                                TriggerServerEvent("QBCore:ToggleDuty")
                            end,
                            canInteract = function()
                                return ((QBX.PlayerData.job.name == bv.job) and (not QBX.PlayerData.job.onduty))
                            end
                        },
                        {
                            label = locale('target_duty_off'),
                            icon = 'fas fa-toggle-off',
                            onSelect = function()
                                TriggerServerEvent("QBCore:ToggleDuty")
                            end,
                            canInteract = function()
                                return ((QBX.PlayerData.job.name == bv.job) and QBX.PlayerData.job.onduty)
                            end
                        },
                    }
                })
            end
        end
    end
end)