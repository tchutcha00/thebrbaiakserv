function onStepIn(cid, item, position, fromPosition)
        if getPlayerStorageValue(cid,27432) == 1 then
           return true
        else
            doPlayerSendCancel(cid, "Você deve ter completado a quest da Boost Attack 2 para entrar.")
            doSendMagicEffect(fromPosition, CONST_ME_POFF)
            doTeleportThing(cid, fromPosition)
        end
return true
end