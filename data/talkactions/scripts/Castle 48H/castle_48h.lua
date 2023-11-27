function onSay(cid, words, param)
	if not Castle48h.voteEnabled then
		return true
	end

	local guildId = getPlayerGuildId(cid)
	if guildId == 0 then
		doPlayerSendCancel(cid, 'Você precisa ser membro de uma guild para votar.')
		return true
	end

	local IP = getPlayerIp(cid)
	if Castle48h.votes[IP] then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você já votou, aguarde o resultado.')
		return true
	end

	if words == '!castle1' then
		Castle48h.votes[IP] = CASTLE48H_OBJECTIVE_MORETIME
	elseif words == '!castle2' then
		Castle48h.votes[IP] = CASTLE48H_OBJECTIVE_LASTDOMINANT
	end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Votação enviada com sucesso, aguarde o resultado final.')
	return true
end
