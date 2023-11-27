function onSay(cid, words, param, channel) 
local temple = { x = 113, y = 83, z = 7 }  
        for _, cid in ipairs(getPlayersOnline()) do 
                        doTeleportThing(cid, temple)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Todos foram teleportados para o templo.")
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)                
                end
        return TRUE
end