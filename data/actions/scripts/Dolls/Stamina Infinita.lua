local cfg = {}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 11578) >= os.time()) then
		doPlayerSendCancel(cid, "Aguarde "..(getPlayerStorageValue(cid, 11578) - os.time()).." segundos para usar esse item novamente.")
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
	return true
end

  cfg.refuel = 42 * 60 * 1000
  if(getPlayerStamina(cid) >= cfg.refuel) then
    doPlayerSendCancel(cid, "Chega de comer bolo rapaz!")
  else
    doPlayerSetStamina(cid, cfg.refuel)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua stamina foi regenerada!")
    setPlayerStorageValue(cid,11578,os.time()+60)
  end
  return true
end