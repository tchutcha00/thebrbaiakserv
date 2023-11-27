function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
  if getCreatureStorage(cid,722652) == EMPTY_STORAGE then
    doTeleportThing(cid, fromPosition)
    doSendMagicEffect(fromPosition, CONST_ME_POFF)
    doPlayerSendCancel(cid, "Você não possui acesso a essa VIP.")
  else
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bem vindo!")
  end
  return true
end