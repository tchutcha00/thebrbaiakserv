local dailyStorageTime = 220220

function onKill(cid, target, lastHit)
    if(isMonster(target) and isPlayer(cid)) then -- check seguranca do player 
		local m_name = getCreatureName(target)
		local v = dailytasktabble.tasks[string.lower(m_name)]
		if (v) then 
			if ((getPlayerStorageValue(cid, v.storage_start) >= 1) and getPlayerStorageValue(cid, dailyStorageTime) > os.time()) then
				local contagem = getPlayerStorageValue(cid, v.storage)
				if not tonumber(contagem) then return true end
				if contagem > v.count then return true end
				setPlayerStorageValue(cid, v.storage, contagem + 1)
				-- Mais facil do usuario configurar e melhor
				if (contagem == v.count) then 
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string.format("Parabéns! Você finalizou a Daily Task do %s. Vá até o NPC pegar a sua recompensa!", m_name))
				else 
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string.format("[Daily Task] -> %d %s mortos. Total [%d/%d]", contagem, m_name, contagem, v.count))
				end 
			end
		end
	end 
	return true 
end