function onUse(cid, item, frompos, item2, topos)
  if not (getPlayerStorageValue(cid, 92050) == "Finished") then
    doPlayerPopupFYI(cid, "Você precisa completar a TASK de [ Suprema Hydra ] para entrar!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    doTeleportThing(cid, {x = 115, y = 80, z = 7})
    return true
  end
end