function onStepIn(cid, item, position, fromPosition)
  storage_guild = getGlobalStorageValue(123123) 


  if getPlayerGuildId(cid) == storage_guild then
    doTeleportThing(cid, {x = 446, y = 384, z = 7})
    return true
    else
      doPlayerSendTextMessage(cid, 22, "[King Baiak Castle] Você não é da guild dominante, para dominar siga reto e encontre a alavanca protegida pelos guardas!")
      doTeleportThing(cid, fromPosition)
      return false
    end
  end