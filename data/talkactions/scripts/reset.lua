function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return true
	end
	
	local position = getCreaturePos(cid)
	local tile = getTileInfo(position)
	if (not tile or not tile.protection) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Voc� s� pode usar esse comando em protection zone.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	local resetsCount = ResetSystem:getCount(cid)
	if (resetsCount >= #ResetSystem.Reset) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Voc� j� atingiu o n�vel m�ximo de resets.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	local resetInfo = ResetSystem.Reset[resetsCount + 1]
	if (not resetInfo) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "N�o � possivel resetar.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	if (resetInfo.needed_level > getPlayerLevel(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Voc� precisa ser level " .. resetInfo.needed_level .. " ou maior.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	ResetSystem:execute(cid)
	doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
	return true
end
