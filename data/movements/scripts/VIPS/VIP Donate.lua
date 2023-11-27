function onStepIn(cid, item, position, fromPosition)

  if not isPremium(cid) then
    doTeleportThing(cid, fromPosition)
    doPlayerSendCancel(cid, "Desculpe, apenas jogadores VIP podem acessar esta área!")
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
  else
    doPlayerSendTextMessage(cid, 25, "Bem vindo! Você tem "..getPlayerPremiumDays(cid).." dia(s) de VIP Account.")
    doSendMagicEffect(getPlayerPosition(cid), 12)
  end
  return true
end