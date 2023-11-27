local nme = "aol"

function onSay(cid, words, param)

	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	if doPlayerRemoveMoney(cid, 20000) then
		local bp = doPlayerAddItem(cid, 2173, 1)
		local efeitos = math.random(34, 56)
		doSendMagicEffect(getCreaturePosition(cid), efeitos)
		doCreatureSay(cid, gTm(cid,nme,1), TALKTYPE_ORANGE_1)
	else
		doPlayerSendTextMessage(cid, 22, gTm(cid,nme,2))
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
	return true
end
