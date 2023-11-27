function onUse(cid, item, fromPosition, itemEx, toPosition)
	local guildId = getPlayerGuildId(cid)
	if guildId ~= 0 then
		if not Castle48h.started then
			doPlayerSendCancel(cid, 'Aguarde o castelo ser iniciado.')
			return true
		end

		if not Castle48h:onDominate(guildId) then
			doPlayerSendCancel(cid, 'Sua guild já está no poder por enquanto.')
		else
			doSendMagicEffect(toPosition, 7)
		end
	end
	return true
end
