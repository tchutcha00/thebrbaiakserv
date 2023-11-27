function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  if doPlayerRemoveMoney(cid, 20) == TRUE then
    local bp = doPlayerAddItem(cid, 11238, 1)
    doSendMagicEffect(getCreaturePosition(cid),13)
    doCreatureSay(cid, "Voce comprou uma BP", TALKTYPE_ORANGE_1)
  else
    doCreatureSay(cid, "Voce nao tem dinheiro suficiente", TALKTYPE_ORANGE_1)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
  end
  return true
end