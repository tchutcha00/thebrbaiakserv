function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local t = string.explode(param, ",")
	local ret = RETURNVALUE_NOERROR
	local pos = getCreaturePosition(cid)

	local id = tonumber(t[1])
	if(not id) then
		errors(false)
		id = getItemIdByName(t[1])
		errors(true)

		if(not id) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item with such name does not exists.")
			return true
		end
	end

	local period = 300
	if(t[2]) then
		period = t[2]
	end

	local item = doCreateItemEx(id, 1)
	if(t[3] and getBooleanFromString(t[3])) then
		if(t[4] and getBooleanFromString(t[4])) then
			pos = getCreatureLookPosition(cid)
		end

		ret = doTileAddItemEx(pos, item)
	else
		ret = doPlayerAddItemEx(cid, item, true)
	end

	if(ret ~= RETURNVALUE_NOERROR) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Couldn't add item: " .. t[1])
		return true
	end

	doDecayItem(item)
	doItemSetPeriod(item, period)
	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
	end
	return true
end
