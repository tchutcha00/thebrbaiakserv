function onUse(cid, item, fromPosition, itemEx, toPosition)
		if (getPlayerStorageValue(cid, 11578) >= os.time()) then
		doPlayerSendCancel(cid, "Aguarde "..(getPlayerStorageValue(cid, 11578) - os.time()).." segundos para usar esse item novamente.")
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
	return true
end

local cfg = {}
cfg.refuel = 42 * 60 * 1000
if(getPlayerStamina(cid) >= cfg.refuel) then
doPlayerSendCancel(cid, "Your stamina is already full.")
else
doPlayerSetStamina(cid, cfg.refuel)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your stamina has been refilled.")
setPlayerStorageValue(cid,11578,os.time()+60)
doRemoveItem(item.uid)
end
return true
end