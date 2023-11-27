function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	if onlineBonusCache.initalizing then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'O sistema está sendo inicializado, aguarde.')
		return true
	end

	if onlineBonusCache.status == OB_STATUS_OFFLINE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Infelizmente o sistema não está habilitado hoje.')
		return true
	end

	OnlineBonus(cid):showInfo()
	return true
end
