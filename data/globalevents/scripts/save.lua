local function vitorLindo()
	doBroadcastMessage("O servidor está salvando nossos dados...", MESSAGE_STATUS_CONSOLE_BLUE)
	doSaveServer()
end

local function countDown(time)
	if time == 0 then return end
	doBroadcastMessage("[Save] O servidor vai ser salvo em "..time.." segundos...", MESSAGE_STATUS_CONSOLE_RED)
	addEvent(countDown, 1000, time - 1)
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("[Save] O servidor vai ser salvo em 2 minutos, cuidado pois pode lagar!")
	addEvent(doBroadcastMessage, 60000, "[Save] O servidor vai ser salvo em 1 minuto, cuidado pois pode lagar!")
	addEvent(doBroadcastMessage, 90000, "[Save] O servidor vai ser salvo em 30 segundos, cuidado pois pode lagar!")
	addEvent(vitorLindo, 120000)
	addEvent(countDown, 115000, 5)
	return true
end
