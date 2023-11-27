function onUse(cid, item, frompos, item2, topos)
    local config = {
    pos = {x = 2573, y = 2353, z = 6},
    vipcoins = 11192,
    qtd_vipcoins = 50,
    percent = 35,
    storage1 = 64823,
    storage2 = 64824,
    time = 18000,
    }
    local TeleporteChance = {
       [65] = "false",
       [35] = "true"
    }
    
    if (getPlayerItemCount(cid, config.vipcoins) >= config.qtd_vipcoins) then
        doPlayerRemoveItem(cid,config.vipcoins, config.qtd_vipcoins)
        local x = math.random( 1, 100 )
            for i, value in pairs(TeleporteChance) do
            x = x - i
                if x <= 0 then
                    if value == "true" then
                        doTeleportThing(cid,config.pos)
                        setPlayerStorageValue(cid, config.storage1, 1)
                        setPlayerStorageValue(cid, config.storage2, os.time() + config.time)
                        return true
                    elseif value == "false" then
                        doPlayerSendTextMessage(cid,22,"Falhou.")
                        return true
                    end
                end
            end
    else
        doPlayerSendTextMessage(cid,22,"Você precisa ter "..config.qtd_vipcoins.." VIP COINS na backpack.")
    end
return true
end