function onSay(cid, words, param)
    local t = string.explode(string.lower(param), ",")
    local call, name, day = t[1], t[2], t[3]
    local player, keys = getPlayerByName(name), {"add", "remove", "check"}
    if not isInArray(keys, call) or param == '' or name == nil then
    elseif not isPlayer(player) then
	return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'O jogador não está online ou não existe.')
    end
     
    if call == keys[1] then
	doPlayerAddPremiumDays(player, day)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Foram adicionados '.. day ..' dias de vip ao jogador '.. name ..'.')
	doPlayerSendTextMessage(player, MESSAGE_EVENT_ADVANCE, 'Você recebeu '.. day ..' dias de vip de um membro da equipe.')
    elseif call == keys[2] then
        if getPlayerPremiumDays(player) > 0 then
            doPlayerRemovePremiumDays(player, day)
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Foram removidos '.. day ..' dias de vip do jogador '.. name ..'.')
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Esse jogador não possui nenhum dia de vip.')
        end
    elseif call == keys[3] then
        if isPremium(player) then
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'O jogador '.. name ..' tem '.. getPlayerPremiumDays(player) ..' dias de vip.')
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'O jogador '..name ..' não é vip.')
        end
    end
   return true
end