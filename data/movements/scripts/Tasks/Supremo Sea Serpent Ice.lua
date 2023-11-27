function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end
  if not (getPlayerStorageValue(cid, 92041) == "Finished") then
    doPlayerPopupFYI(cid, "Você precisa completar a TASK de [ Supremo Sea Serpent Ice ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
end