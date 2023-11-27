function onPrepareDeath(cid)
	if Castle48h:memberInside(cid) then
		Castle48h:memberInside(cid, false)
	end

	if Castle48h:eventState() == CASTLE48H_STATE_OPEN then
		Castle48h.invaders[getPlayerName(cid)] = nil
	end
	return true
end

function onLogin(cid)
	local guildId = getPlayerGuildId(cid)
	if Castle48h:memberInside(cid) and (guildId == 0 or guildId ~= Castle48h.dominant) then
		Castle48h:expulsePlayer(cid)
	end

	registerPlayerEvent(cid, 'Castle48hDeath')
	return true
end

function onThink(cid)
	if Castle48h:eventState() == CASTLE48H_STATE_OPEN then
		if Castle48h.invaders[getPlayerName(cid)] then
			local id = getPlayerGUID(cid)
			if not Castle48h.activePlayers[id] then
				Castle48h.activePlayers[id] = 0
			end
			Castle48h.activePlayers[id] = Castle48h.activePlayers[id] + 1
		end
	end
	return true
end
