function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	if onlineBonusCache.initalizing then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'O sistema est� sendo inicializado, aguarde.')
		return true
	end

	if onlineBonusCache.status == OB_STATUS_OFFLINE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Infelizmente o sistema n�o est� habilitado hoje.')
		return true
	end

	OnlineBonus(cid):showInfo()
	return true
end
