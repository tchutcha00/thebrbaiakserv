local e = require('data/funevents/ctf/lib')

if e then
	function onSay(cid, words, param)
		if(not checkExhausted(cid, 666, 5)) then
		return true
	end

		param = param:lower()
		if param == '' then
			return true
		end

		if isInArray({'join', 'leave'}, param) then

			if not getTileInfo(getThingPos(cid)).protection then
				return doPlayerSendCancel(cid, 'É necessário estar em protection zone.')
			end

			return param == 'join' and e:onJoin(cid) or (param == 'leave' and e:onLeave(cid))
		end

		local tmp = string.explode(param, ',')

		if getPlayerAccess(cid) > 2 then
			if tmp[1] == 'open' then
				if not e:open() then
					return doPlayerSendCancel(cid, 'Capture The Flag já está aberto.')
				end

				if tonumber(tmp[2]) then
					e.timeleft = tonumber(tmp[2])
				end

				return true
			end

			if tmp[1] == 'close' then
				if tmp[2] ~= 'force' then
					if e:eventState() == CTF_STATE_ENDING then
						return doPlayerSendCancel(cid, 'Capture The Flag encontra-se sendo finalizado.')
					end
				end

				if not e:close() then
					return doPlayerSendCancel(cid, 'Capture The Flag já está fechado.')
				else
					e:removeTp()
					doBroadcastMessage('[Capture The Flag]: O evento foi fechado de forma forçada pelo admininstrador, desculpe a inconveniência.')
				end

				return true
			end

			if tmp[1] == 'restart' then
				if not e:restartGame() then
					return doPlayerSendCancel(cid, 'O Capture The Flag não está em batalha.')
				end

				e:sendMessage('O evento foi reiniciado pelo Admininstrador.', MESSAGE_INFO_DESCR)
				return true
			end

			if tmp[1] == 'switch' then
				if not e:switchTeams() then
					return doPlayerSendCancel(cid, 'O Capture The Flag não está em batalha.')
				end

				e:sendMessage('O Admininstrador trocou as equipes.', MESSAGE_INFO_DESCR)
				return true
			end

			if tmp[1] == 'info' then
				local state = 'Fechado'
				if e:eventState() == CTF_STATE_WAITING then state = 'Esperando Participantes'
				elseif e:eventState() == CTF_STATE_GAME then state = 'Em Batalha'
				elseif e:eventState() == CTF_STATE_ENDING then state = 'Finalizando'
				end

				local str = 'Capture The Flag Informações:\n\nEstado: (%s)\nTempo Restante: %s\nParticipantes: %d\nRed: [%d] versus [%d] :Blue'
				local time = e:timeLeft() - os.time()
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str:format(
					state,
					string.diff((e:eventState() == CTF_STATE_GAME and (time >= 0 and time or 0) or 0), true),
					#e:players(),
					e:eventState() == CTF_STATE_GAME and e:teamScore(1) or 0,
					e:eventState() == CTF_STATE_GAME and e:teamScore(2) or 0))
			end

			if tmp[1] == 'forcestart' then
				if e:eventState() ~= CTF_STATE_WAITING then
					return doPlayerSendCancel(cid, 'o Capture The Flag não está em fase de inicialização.')
				end

				e:startgame()
				return true
			end

			if tmp[1] == 'kickall' then
				if tmp[2] ~= 'force' then
						if e:eventState() == CTF_STATE_ENDING then
						return doPlayerSendCancel(cid, 'Capture The Flag encontra-se sendo finalizado.')
					end
				end

				local all = e:players()

				if #all == 0 then
					return doPlayerSendCancel(cid, 'Não há ninguém participando do Capture The Flag.')
				end

				for _, pid in ipairs(all) do
					e:onLeave(pid)
				end

				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Todos os participantes do Capture The Flag foram removidos do evento.')
			end

			if tmp[1] == 'finish' then
				if e:eventState() ~= CTF_STATE_GAME then
					return doPlayerSendCancel(cid, 'O Capture The Flag não está em batalha.')
				end

				e:timeLeft(os.time())
				e:sendMessage('O tempo restante foi zerado pelo Admininstrador.', MESSAGE_INFO_DESCR)
				return true
			end

			if isInArray({'put', 'kick', 'ban', 'unban', 'auth', 'unauth'}, tmp[1]) then
				local player = getCreatureByName(tmp[2])

				if not tmp[2] then
					return doPlayerSendCancel(cid, 'Informe o nome do personagem.')
				else
					if not isPlayer(player) then
						return doPlayerSendCancel(cid, 'Personagem inexistente ou off-line.')
					end
				end

				if tmp[1] == 'put' then
					if e:eventState() ~= CTF_STATE_GAME then
						return doPlayerSendCancel(cid, 'O Capture The Flag não está em batalha.')
					end

					if e:playerState(player) == 1 then
						return doPlayerSendCancel(cid, 'Este personagem já é um participante do Capture The Flag.')
					end

					local team

					if tmp[3] then

						if tmp[3] == 'red' then team = 1
						elseif tmp[3] == 'blue' then team = 2
						else
							return doPlayerSendCancel(cid, 'Você informou um time inexistente. Por favor, informe red ou blue.')
						end
					else
						team = #e:getPlayersByTeam(1) > #e:getPlayersByTeam(2) and 2 or 1
					end

					registerCreatureEvent(player, 'CTFCombat')
					registerCreatureEvent(player, 'CTFDeath')

					e:regen(player)
					e:playerState(player, 1)

					e:joinPlayer(player, team)
					return true
				end

				if tmp[1] == 'kick' then
					if e:playerState(player) ~= 1 then
						return doPlayerSendCancel(cid, 'Este personagem não está participando do Capture The Flag.')
					end

					e:onLeave(player)
					return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tmp[2] .. ' foi removido do Capture The Flag.')
				end

				if isInArray({'ban', 'unban'}, tmp[1]) then
					if tmp[1] == 'ban' then
						if e:ban(player) > os.time() then
							return doPlayerSendCancel(cid, 'Este personagem já está banido.')
						end

						e:onLeave(player)
						e:ban(player, not tonumber(tmp[3]) and 1 or tonumber(tmp[3]))
						e:banPopup(player)
					else
						if e:ban(player) <= os.time() then
							return doPlayerSendCancel(cid, 'Este personagem já está desbanido.')
						end

						e:ban(player, 0)
					end

					return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tmp[2] .. ' foi ' .. (tmp[1] == 'ban' and 'banido' or 'desbanido') .. ' do Capture The Flag.')
				end

				if isInArray({'auth', 'unauth'}, tmp[1]) then
					e:auth(player, tmp[1] == 'auth' and true or false)

					return doPlayerSendCancel(cid, tmp[2] .. ' foi ' .. (tmp[1] == 'auth' and 'autorizado' or 'desautorizado') .. ' para o modo depuração.')
				end
			end
		end

		return true
	end

end
