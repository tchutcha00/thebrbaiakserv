function onSay(cid, words, param)
	local player = Player(cid)
	param = param:lower()
	if param == '' then
		return true
	end

	local tmp = string.explode(param, ',')
	if tmp[1] == 'info' then
		local states = {
    		[EVENT_STATE_CLOSED] = 'Fechado',
        	[EVENT_STATE_WAITING] = 'Esperando Participantes',
        	[EVENT_STATE_GAME] = 'Em Batalha',
        	[EVENT_STATE_ENDING] = 'Finalizando'
    	}

		local str = 'Zombie Informa��es:\n\nEstado: (%s)\nTempo Restante: %s\nParticipantes: %d'
		local time = zombieLock.timeleft - os.time()
		player:sendTextMessage(MESSAGE_INFO_DESCR, str:format(
				states[Zombie:eventState()],
				string.diff((Zombie:eventState() == EVENT_STATE_GAME and (time >= 0 and time or 0) or 0), true),
				#Zombie:players()
			)
		)
		return true
	end

	if player:getAccess() > 2 then
		if tmp[1] == 'open' then
			if not Zombie:open() then
				player:sendCancelMessage('O zombie ou outro evento j� est� aberto.')
			end

			return true
		end

		if tmp[1] == 'close' then
			if tmp[2] ~= 'force' then
				if Zombie:eventState() == EVENT_STATE_ENDING then
					player:sendCancelMessage('Zombie encontra-se sendo finalizado.')
					return true
				end
			end

			if not Zombie:close(true) then
				player:sendCancelMessage('Zombie j� est� fechado.')
			else
				Zombie:broadcastMessage('O evento foi fechado de forma for�ada pelo administrador, desculpe a inconveni�ncia.')
			end

			return true
		end

		if tmp[1] == 'forcestart' then
			if Zombie:eventState() ~= EVENT_STATE_WAITING then
				player:sendCancelMessage('o zombie n�o est� em fase de inicializa��o.')
				return true
			end

			Zombie:startgame()
			return true
		end

		if tmp[1] == 'kickall' then
			if tmp[2] ~= 'force' then
					if Zombie:eventState() == EVENT_STATE_ENDING then
					player:sendCancelMessage('Zombie encontra-se sendo finalizado.')
					return true
				end
			end

			local all = Zombie:players()
			if #all == 0 then
				player:sendCancelMessage('N�o h� ningu�m participando do Zombie.')
				return true
			end

			for _, tmpPlayer in ipairs(all) do
				Zombie:onLeave(tmpPlayer)
			end

			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Todos os participantes do Zombie foram removidos do evento.')
			return true
		end

		if tmp[1] == 'finish' then
			if Zombie:eventState() ~= EVENT_STATE_GAME then
				player:sendCancelMessage('O Zombie n�o est� em batalha.')
				return true
			end

			zombieLock.timeleft = 0
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Voc� zerou o tempo do evento, o mesmo ser� finalizado em 60 segundos estimados.')
			return true
		end

		if isInArray({'kick', 'ban', 'unban'}, tmp[1]) then
			local target = getPlayerByName(tmp[2])

			if not tmp[2] then
				player:sendCancelMessage('Informe o nome do personagem.')
				return true
			else
				if not target then
					player:sendCancelMessage('Personagem inexistente ou off-line.')
					return true
				end
			end

			target = Player(target)
			if tmp[1] == 'kick' then
				if not Zombie:isParticipant(target) then
					player:sendCancelMessage('Este personagem n�o est� participando do Zombie.')
					return true
				end

				Zombie:onLeave(target)
				player:sendTextMessage(MESSAGE_INFO_DESCR, tmp[2] .. ' foi removido do Zombie.')
				return true
			end

			if isInArray({'ban', 'unban'}, tmp[1]) then
				if tmp[1] == 'ban' then
					if Zombie:ban(target) > os.time() then
						player:sendCancelMessage('Este personagem j� est� banido.')
						return true
					end

					Zombie:onLeave(target)
					Zombie:ban(target, not tonumber(tmp[3]) and 1 or tonumber(tmp[3]))
				else
					if Zombie:ban(target) <= os.time() then
						player:sendCancelMessage('Este personagem j� est� desbanido.')
						return true
					end

					Zombie:ban(target, 0)
				end

				player:sendTextMessage(MESSAGE_INFO_DESCR, tmp[2] .. ' foi ' .. (tmp[1] == 'ban' and 'banido' or 'desbanido') .. ' do Zombie.')
				return true
			end
		end
	end
end
