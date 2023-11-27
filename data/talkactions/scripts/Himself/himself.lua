local defaultPeriod = 31536000 -- tempo padrão para expirar o himself do jogador (em segundos)

local function capitalize(str)
	return (str:gsub("^%l", string.upper))
end

function onSay(cid, words, param)
	local tmp = string.explode(param:lower(), ',')
	
	if not tmp[1] then
		doPlayerSendCancel(cid, 'Informe o nome do personagem.')
		return true
	end
	
	local target = getCreatureByName(tmp[1])
	if not isPlayer(target) then
		doPlayerSendCancel(cid, 'O jogador ' .. capitalize(tmp[1]) .. ' não está online.')
		return true
	end

	if tmp[2] then
		local time = getPlayerStorageValue(target, STORAGEVALUE_HIMSELF)
		if tmp[2] == 'see' then
			local info = capitalize(tmp[1]) .. ' Himself Informations:\n\nIs muted? %s\nWill be unmuted in: %s'
			doPlayerPopupFYI(cid, info:format(time > os.time() and 'Yes' or 'No', time > os.time() and string.diff(time-os.time()) or 'Not Muted'))
			return true
		end

		if tmp[2] == 'remove' then
			playerTalkToHimself(target, false)
			doPlayerSetStorageValue(target, STORAGEVALUE_HIMSELF, 0)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você removeu o himself do jogador ' .. capitalize(tmp[1]) .. '.')
			return true
		end
	end

	local period = tonumber(tmp[2] or defaultPeriod)
	playerTalkToHimself(target, true)
	registerCreatureEvent(target, 'himself')
	
	doPlayerSetStorageValue(target, STORAGEVALUE_HIMSELF,  os.time() + period)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você mutou o jogador ' .. capitalize(tmp[1]) .. ' por ' .. string.diff(period, true) .. '.')
	return true
end