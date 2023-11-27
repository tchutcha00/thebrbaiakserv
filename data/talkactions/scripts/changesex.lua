function onSay(cid, words, param, channel)
if(not checkExhausted(cid, 7384, 3)) then
    return true
end
	if doPlayerRemoveMoney(cid,50000000) then
		doPlayerSetSex(cid,getPlayerSex(cid) == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
		doPlayerSendTextMessage(cid, 25, "Você mudou seu sexo.")
	else
		doPlayerSendCancel(cid, "Você não tem 50kk para mudar de sexo.")
	end

	return true
end
