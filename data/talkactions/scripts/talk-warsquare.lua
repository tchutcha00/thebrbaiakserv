function onSay(cid, words, param)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	if param == 'on' then
		if getPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS) == -1 then
			setPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS, 1)
			checkWarSquares(cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você ligou os square colors.')
		end
	elseif param == 'off' then
		if getPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS) == 1 then
			setPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS, -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você desligou os square colors.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'utilize on ou off.')
	end
	return true
end
