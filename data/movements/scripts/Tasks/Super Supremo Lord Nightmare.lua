function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end
  if not (getPlayerStorageValue(cid, 92027) == "Finished") then
    doPlayerPopupFYI(cid, "Voc� precisa completar a TASK de [ Supremo Lord Nightmare ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
end