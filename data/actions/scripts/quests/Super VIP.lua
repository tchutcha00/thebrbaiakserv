function onUse(cid, item, frompos, item2, topos)
	if getCreatureStorage(cid, 722652) == EMPTY_STORAGE then
		doCreatureSetStorage(cid,722652,1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Agora você tem acesso à Super VIP!")
		doSendMagicEffect(getCreaturePosition(cid), 12)
	else
		doPlayerSendCancel(cid,"Você já completou essa quest!")
	end
	return true
end 
