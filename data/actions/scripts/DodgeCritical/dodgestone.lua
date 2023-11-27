local limite = 500 -- limite de dodge
local storagedodge = 92798645 -- storage do dodge
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local dodgeLevel = getPlayerStorageZero(cid, storagedodge)
    local thingPos = getThingPos(cid)
    if dodgeLevel < limite then
        if doRemoveItem(item.uid, 1) then
            doCreatureSetStorage(cid, storagedodge, dodgeLevel + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_LIGHT_ORANGE, "{[DODGE]} Voc� evoluiu para o n�vel [{".. (dodgeLevel + 1) .."/"..limite.."}] de dodge.")
            db.query("UPDATE `players` SET `dodge` = `dodge`+1  WHERE `id` = " .. getPlayerGUID(cid) .. ";")
            doSendAnimatedText(thingPos, "+DODGE", COLOR_GREEN)
            doSendMagicEffect(thingPos, CONST_ME_FIREWORK_BLUE)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[DODGE] Voc� j� atingiu o n�vel m�ximo de dodge [500/500].")
        doSendMagicEffect(thingPos, CONST_ME_POFF)
    end
    return true
end
