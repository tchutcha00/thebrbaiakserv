function onStepIn(cid, item, pos, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local name = getPlayerName(cid)
	local actionId = item.actionid
	if actionId == 10003 then
		Castle48h:memberInside(cid, false)
	elseif actionId == 10004 then
		Castle48h.invaders[name] = nil
		unregisterPlayerEvent(cid, 'Castle48hHealth')
		unregisterPlayerEvent(cid, 'Castle48hMana')
		unregisterPlayerEvent(cid, 'Castle48hThink')
	else
		local guildId = getPlayerGuildId(cid)
		if guildId == 0 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'Voc� n�o � membro de uma guild.')
			return false
		else
			if getPlayerLevel(cid) < Castle48h.minLevel then
				doTeleportThing(cid, fromPosition, true)
				doPlayerSendCancel(cid, 'Voc� precisa ser level ' .. Castle48h.minLevel .. '+ para passar.')
				return false
			end
		end

		if actionId == 10001 then
			if Castle48h:eventState() == CASTLE48H_STATE_CLOSED then
				doTeleportThing(cid, fromPosition, true)
				doPlayerSendCancel(cid, 'O castelo n�o est� aberto para invas�es.')
				return false
			end

			Castle48h.invaders[name] = os.mtime()
			registerPlayerEvent(cid, 'Castle48hHealth')
			registerPlayerEvent(cid, 'Castle48hMana')
			registerPlayerEvent(cid, 'Castle48hThink')
		elseif actionId == 10002 then
			if Castle48h.started then
				doTeleportThing(cid, fromPosition, true)
				doPlayerSendCancel(cid, 'Aguarde o resultado final para saber quem ter� o dom�nio.')
			else				
				if not Castle48h:onVisit(guildId) then
					doTeleportThing(cid, fromPosition, true)
					doPlayerSendCancel(cid, 'Este castelo n�o percente � sua guild.')
					return false
				end
				Castle48h:memberInside(cid, true)
			end
		end
	end

	return true
end
