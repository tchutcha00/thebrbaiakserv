function onThink(cid, interval)
	local time = getPlayerStorageValue(cid, STORAGEVALUE_HIMSELF)

	if time <= os.time() then
		playerTalkToHimself(cid, false)
		doPlayerSetStorageValue(cid, STORAGEVALUE_HIMSELF, 0)
		unregisterCreatureEvent(cid, 'himself')
	end
	
	return true
end

function onLogin(cid)
	local time = getPlayerStorageValue(cid, STORAGEVALUE_HIMSELF)

	if time > os.time() then
		playerTalkToHimself(cid, true)
		registerCreatureEvent(cid, 'himself')
	end

	return true
end