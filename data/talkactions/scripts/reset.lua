function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return true
	end
	
	local position = getCreaturePos(cid)
	local tile = getTileInfo(position)
	if (not tile or not tile.protection) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Você só pode usar esse comando em protection zone.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	local resetsCount = ResetSystem:getCount(cid)
	if (resetsCount >= #ResetSystem.Reset) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Você já atingiu o nível máximo de resets.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	local resetInfo = ResetSystem.Reset[resetsCount + 1]
	if (not resetInfo) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Não é possivel resetar.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	if (resetInfo.needed_level > getPlayerLevel(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Você precisa ser level " .. resetInfo.needed_level .. " ou maior.")
		doSendMagicEffect(position, CONST_ME_POFF)
		return true
	end

	ResetSystem:execute(cid)
	doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
	return true
end
