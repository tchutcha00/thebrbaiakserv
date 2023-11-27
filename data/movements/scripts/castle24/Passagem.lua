function onStepIn(cid, item, position, fromPosition)
  storage_guild = getGlobalStorageValue(10293) 


  if getPlayerGuildId(cid) == storage_guild then
    doTeleportThing(cid, {x = 114, y = 532, z = 5})
    return true
    else
      doPlayerSendTextMessage(cid, 22, "[CASTLE WAR] Você não é da guild dominante!")
      doTeleportThing(cid, fromPosition)
      return false
    end
  end