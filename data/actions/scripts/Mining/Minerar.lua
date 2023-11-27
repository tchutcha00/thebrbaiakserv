local config = {
	stone = 11787,
	
	reward = {2157, 1},
	percent = 0.05,

	exhaust = 500
}

if not pickExhaust then pickExhaust = {} end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not pickExhaust[cid] then pickExhaust[cid] = 0 end
	if pickExhaust[cid] > os.mtime() then
		return true
	end

	pickExhaust[cid] = os.mtime() + config.exhaust
	if itemEx and itemEx.itemid == config.stone then
		if math.random() <= config.percent then
			local gold = doCreateItemEx(config.reward[1], config.reward[2])
			if doPlayerAddItemEx(cid, gold) ~= RETURNVALUE_NOERROR then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[Mining]: Capacity ou espaço insuficiente.')
				return true
			end

			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, '[Mining]: Você encontrou 1 pepita de ouro.')
			doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			doSendAnimatedText(toPosition, 'Pick!', math.random(254))
		else
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doSendAnimatedText(toPosition, 'Fail', math.random(254))
		end
	else
		doPlayerSendCancel(cid, '[Mining]: Você não pode usar a pick aqui.')
	end
	return true
end