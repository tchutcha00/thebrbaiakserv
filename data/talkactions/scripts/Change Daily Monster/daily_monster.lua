function onSay(cid, words, param)
	dailyMonster:onStartup()
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'O monstro e tipo de boost foi trocado.')
	return true
end