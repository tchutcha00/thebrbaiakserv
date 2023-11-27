function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end
  if not (getPlayerStorageValue(cid, 92024) == "Finished") then
    doPlayerPopupFYI(cid, "Você precisa completar a TASK de [ Super Jimmy Swamp ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
  doTeleportThing(cid, {x = 203, y = 578, z = 7})
end