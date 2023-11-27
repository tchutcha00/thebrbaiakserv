local e = require('data/funevents/ctf/lib')

if e then
	function onThink()
		if e:eventState() == CTF_STATE_CLOSED then
			return true
		end

		if e:eventState() ~= CTF_STATE_WAITING and not next(e:players()) then
			e:close()
			return true
		end

		if e:eventState() == CTF_STATE_GAME then

			local red, blue = {}, {}
			for _, pid in ipairs(e:players()) do
				if e:withFlag(pid) then
					table.insert(e:playerTeam(pid) == 1 and red or blue, pid)
				end
			end

			if not e:findFlag(1) and not next(blue) then
				e:dropFlag(1)
			end
			if not e:findFlag(2) and not next(red) then
				e:dropFlag(2)
			end


			if os.time() >= e:timeLeft() then
				e:eventState(CTF_STATE_ENDING)

				local broadcast = '[Capture The Flag]: O tempo restante foi esgotado e '
				local winner = e:getTeamByHighestScore() ~= 0 and e:getTeamByHighestScore() or nil

				e:finishCountdown(winner)

				if winner then
					broadcast = broadcast .. 'o ' .. e:getTeamName(winner) .. ' venceu o evento por obter uma pontuação superior à do time adversário.'
				else
					broadcast = broadcast .. 'ambos times obteram a mesma quantidade de pontos. Portanto, o evento está sendo finalizado sem vencedores.'
				end

				broadcastMessage(broadcast, MESSAGE_EVENT_ADVANCE)
			end
		end

		return true
	end

end
