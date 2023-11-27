function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end
	doBroadcastMessage(""..getCreatureName(cid)..": " .. param .. "", MESSAGE_STATUS_CONSOLE_RED)
	return true
end
