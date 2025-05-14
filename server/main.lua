lib.locale()
local RSGCore = exports['rsg-core']:GetCoreObject()

for k, quantity in pairs(Config.Backpacks) do
    RSGCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return end
        local actualWeight = Player.PlayerData.weight
        local newCapacity = actualWeight + (quantity * 1000)
        if newCapacity > (Config.BackpacksLimity * 1000) then
            lib.notify(src, {
                title = locale('sv_lang_3'),
                type = 'error',
                icon = 'fa-solid fa-bag-shopping',
                iconAnimation = 'shake',
                duration = 7000
            })
            return
        end
        Player.Functions.RemoveItem(k, 1)
        RSGCore.Functions.ChangeWeight(src, newCapacity)
        lib.notify(src, {
            title = string.format(locale('sv_lang_4'), quantity),
            type = 'success',
            icon = 'fa-solid fa-bag-shopping',
            iconAnimation = 'shake',
            duration = 7000
        })
    end)
end

for k, quantity in pairs(Config.Pockets) do
    RSGCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return end
        local actualSlots = Player.PlayerData.slots
        local newCapacity = actualSlots + quantity
        if newCapacity > Config.PocketsLimity then
            lib.notify(src, {
                title = locale('sv_lang_1'),
                type = 'error',
                icon = 'fa-solid fa-bag-shopping',
                iconAnimation = 'shake',
                duration = 7000
            })
            return
        end

        Player.Functions.RemoveItem(k, 1)
        RSGCore.Functions.ChangeSlots(src, newCapacity)
        lib.notify(src, {
            title = string.format(locale('sv_lang_2'), quantity),
            type = 'success',
            icon = 'fa-solid fa-bag-shopping',
            iconAnimation = 'shake',
            duration = 7000
        })
    end)
end

if Config.WipeAllWhenRespawn then
    RegisterServerEvent('rsg-medic:server:deathactions')
    AddEventHandler('rsg-medic:server:deathactions', function()
        local _source = source
        RSGCore.Functions.ChangeWeight(_source, RSGCore.Config.Player.PlayerDefaults.weight)
        RSGCore.Functions.ChangeSlots(_source, RSGCore.Config.Player.PlayerDefaults.slots)
    end)
end
