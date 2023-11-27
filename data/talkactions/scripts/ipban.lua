local defaultDays = 7

function onSay(cid, words, param)
	local player = Player(cid)

	local tmp = string.explode(param, ',')
	if not tmp[1] then
		player:sendCancelMessage('Informe o nome do jogador.')
		return true
	end

	local result = db.getResult("SELECT `id`, `name`, `lastip` FROM `players` WHERE `name` = " .. db.escapeString(tmp[1]))
	if result:getID() == -1 then
		return true
	end

	local playerId = result:getDataInt("id")
	local targetName = result:getDataString("name")
	local targetIp = result:getDataInt("lastip")
	result:free()

	local targetId = getPlayerByName(tmp[1])
	if targetId then
		local target = Player(targetId)
		targetIp = target:getIp()
		target:remove()
	end

	if targetIp == 0 then
		player:sendCancelMessage('Jogador inexistente.')
		return true
	end

	result = db.getResult("SELECT 1 FROM `ip_bans` WHERE `ip` = " .. targetIp)
	if result:getID() ~= -1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetName .. "  is already IP banned.")
		result:free()
		return true
	end

	local days = tonumber(tmp[2] or defaultDays)
	local timeNow = os.time()
	local reason = tmp[3] or ''
	db.query("INSERT INTO `ip_bans` (`ip`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..
			targetIp .. ", " .. db.escapeString(reason) .. ", " .. timeNow .. ", " .. timeNow + (days * 86400) .. ", " .. player:getGuid() .. ")")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetName .. "  has been IP banned.")

	doAddPlayerBanishment(playerId, 3, timeNow + (days * 86400))
	return true
end
