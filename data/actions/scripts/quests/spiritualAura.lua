function onUse(cid, item, frompos, item2, topos)
	if getCreatureStorage(cid,722641) == -1 then
		doCreatureSetStorage(cid,722641,1)
		startSpiritualAura(cid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� recebeu a aura espiritual e agora vai dar 10% mais dodge.")
	else
		doPlayerSendCancel(cid, "Voc� j� tem a aura espiritual!")
	end
	return true
end
