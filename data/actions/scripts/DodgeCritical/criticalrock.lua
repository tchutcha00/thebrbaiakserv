local config = {

   levelscrit = 500,  --- leveis que ter�o
   storagecrit = 42904 -- storage que ser� verificado

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local criticalLevel = getPlayerStorageZero(cid, config.storagecrit)
    local thingPos = getThingPos(cid)
    if criticalLevel < config.levelscrit then
        if doRemoveItem(item.uid, 1) then
            doCreatureSetStorage(cid, config.storagecrit, criticalLevel + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_LIGHT_BLUE, "{[CRITICAL]} Voc� evoluiu para o n�vel [{".. (criticalLevel + 1) .."/".. config.levelscrit .."}] de critical.")
            db.query("UPDATE `players` SET `critical` = `critical`+1  WHERE `id` = " .. getPlayerGUID(cid) .. ";")
            doSendAnimatedText(thingPos, "+CRITICAL", COLOR_RED)
            doSendMagicEffect(thingPos, CONST_ME_FIREWORK_REd)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[CRITICAL] Voc� j� atingiu o n�vel m�ximo de critical [500/500].")
        doSendMagicEffect(thingPos, CONST_ME_POFF)
    end
    return true
end
