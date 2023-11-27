function onDeath(cid, corpse, deathList)
	if not isPlayer(cid) then
		return true
	end

	local list = {}
	for _, pid in ipairs(deathList) do
		if isPlayer(pid) and pid ~= cid then
			list[#list + 1] = ('%s [%d] [%d]'):format(getPlayerName(pid), getPlayerResets(pid), getPlayerLevel(pid))
		end
	end

	if #list > 0 then
		doSendAnimatedText(getThingPos(cid), "DEAD!", 180)
		doSendMagicEffect(getThingPos(cid), 65)

		local message = ('O jogador %s [%d] [%d] foi morto %s: %s.'):format(
			getPlayerName(cid), getPlayerResets(cid), getPlayerLevel(cid), (#list == 1 and 'pelo jogador' or 'pelos jogadores'),
			table.concat(list, ', ')
		)

		for _,pid in pairs(getPlayersOnline()) do
			doPlayerSendChannelMessage(pid, "", message, TALKTYPE_CHANNEL_HIGHLIGHT, 10)
		end
	end
	return true
end
