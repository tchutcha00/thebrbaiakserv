local config = {

   levelscrit = 500,  --- leveis que terão
   storagecrit = 42904 -- storage que será verificado

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local criticalLevel = getPlayerStorageZero(cid, config.storagecrit)
    local thingPos = getThingPos(cid)
    if criticalLevel < config.levelscrit then
        if doRemoveItem(item.uid, 1) then
            doCreatureSetStorage(cid, config.storagecrit, criticalLevel + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_LIGHT_BLUE, "{[CRITICAL]} Você evoluiu para o nível [{".. (criticalLevel + 1) .."/".. config.levelscrit .."}] de critical.")
            db.query("UPDATE `players` SET `critical` = `critical`+1  WHERE `id` = " .. getPlayerGUID(cid) .. ";")
            doSendAnimatedText(thingPos, "+CRITICAL", COLOR_RED)
            doSendMagicEffect(thingPos, CONST_ME_FIREWORK_REd)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[CRITICAL] Você já atingiu o nível máximo de critical [500/500].")
        doSendMagicEffect(thingPos, CONST_ME_POFF)
    end
    return true
end
