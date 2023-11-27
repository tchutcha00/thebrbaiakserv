function onLogout(cid, forceLogout)
	if(getCreatureNoMove(cid)) then
		return false
	end

	if(not hasPlayerClient(cid)) then
		db.executeQuery("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
	end

	doCreatureSetStorage(cid, "save")
	return true
end