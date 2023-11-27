local exitPosition = {x = 113, y = 83, z = 7}

function onThink(interval)
	if Castle48h:eventState() ~= CASTLE48H_STATE_OPEN then
		return true
	end

	local saveIp = {}
	for name, time in pairs(Castle48h.invaders) do
		local cid = getCreatureByName(name)
		if cid then
			if not Castle48h:memberInside(cid) then
				local data = saveIp[getPlayerIp(cid)]
				if data then
					local toExit = cid
					if data.time > time then
						toExit = data.player
					end
					doTeleportThing(toExit, exitPosition)
					doSendMagicEffect(exitPosition, CONST_ME_TELEPORT)
					Castle48h:memberInside(toExit, false)
					Castle48h.invaders[getPlayerName(toExit)] = nil
					Castle48h.activePlayers[getPlayerGUID(toExit)] = 0
					doPlayerSendTextMessage(toExit, MESSAGE_STATUS_CONSOLE_RED, 'Castle War anti multi client protection.')
				else
					saveIp[getPlayerIp(cid)] = {time = time, player = cid}
				end
			end
		else
			Castle48h.invaders[name] = nil
		end
	end
	return true
end
