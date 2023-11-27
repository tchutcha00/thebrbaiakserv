function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end
  if not (getPlayerStorageValue(cid, 92038) == "Finished") then
    doPlayerPopupFYI(cid, "Você precisa completar a TASK de [ Super Supremo Balafhar ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
end