local config = {
	prot_r = 5, -- Quantos resets o player vai ter protecao?
	msgs = {
		tg = "%s esta com a protecao de reset! Impossivel atacar.", -- Caso um player queira lockar um cara com protecao
		cg = "Voce esta com a protecao de reset! Impossivel atacar.", -- Caso o cara com protecao queira atacar alguem
		lg = "[IMPORTANTE]: Proteção até  5 Resets! Você está protegido ninguém pode te matar e você não pode matar ninguém até o 5 Resets!"
	}
}

function onLogin(cid)
	if (getPlayerResets(cid) <= config.prot_r) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, config.msgs.lg)
	end 
	registerCreatureEvent(cid, "protResetStats")
	registerCreatureEvent(cid, "protResetTarget")
	return true
end

function onStatsChange(cid, attacker, type, combat, value)
	if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) then 
		if (isPlayer(cid) and isPlayer(attacker)) then 
			local rcid, ratk = getPlayerResets(cid), getPlayerResets(attacker)
			if (rcid <= config.prot_r or ratk <= config.prot_r) then 
				return false
			end 
		end 
	end 
	return true
end 

function onCombat(cid, target)
	if (isPlayer(cid) and isPlayer(target)) then
		local rcid, rtgt = getPlayerResets(cid), getPlayerResets(target)
		if (rcid <= config.prot_r) then 
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.msgs.cg)
			return false
		elseif (rtgt <= config.prot_r) then 
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, string.format(config.msgs.tg, getCreatureName(target)))
			return false
		end 
	end
	return true
end
