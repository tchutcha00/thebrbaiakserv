function onThink()
	local day = Zombie.days[tonumber(os.date('%w'))]
	if day then
		if isInArray(day, tostring(os.date('%X')):sub(1, 5)) then
			Zombie:open()
		end
	end

	if (Zombie:eventState() == EVENT_STATE_GAME or Zombie:eventState() == EVENT_STATE_ENDING) and not next(Zombie:players()) then
		Zombie:close()
	end

	if Zombie:eventState() == EVENT_STATE_GAME then
		if zombieLock.timeleft <= os.time() then
			Zombie:eventState(EVENT_STATE_ENDING)
			Zombie:finishCountdown(nil)
			broadcastMessage('[Zombie]: O tempo restante foi esgotado e não houve vencedores.', MESSAGE_EVENT_ADVANCE)
		end
	end
	
	return true
end