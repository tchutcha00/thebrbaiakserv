function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end
  if not (getPlayerStorageValue(cid, 92017) == "Finished") then
    doPlayerPopupFYI(cid, "Voc� precisa completar a TASK de [ Archangel ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
end