local resets = 10

function onStepIn(cid, item, position, fromPosition)
  if not isPlayer(cid) then
    return true
  end

  if not (getPlayerStorageValue(cid, 92043) == "Finished") then
    doPlayerPopupFYI(cid, "Você precisa completar a TASK de [ Super Frost Spatial ] para passar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, fromPosition)
    return true
  end
end