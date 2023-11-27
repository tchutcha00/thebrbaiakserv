local function announce(message, times)
	if times == 0 then return true end
	doBroadcastMessage(message)
	addEvent(announce,5*60000,message,times - 1)
end

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

function onTime()
	local players_tp = getPlayersInArea({x=129,y=74,z=7}, {x=129,y=74,z=7})
	if getGlobalStorageValue(722641) == -1 then
		if players_tp then
			for _, v in next, players_tp do
				doTeleportThing(v, getTownTemplePosition(1))
				doPlayerSendTextMessage(v, MESSAGE_STATUS_CONSOLE_BLUE, "Não pode ficar no local onde o TP abriu. Você foi teleportado para o templo.")
			end
		end
		
		doCreateTeleport(1387, {x=129,y=74,z=7}, bomberman.tpPos)
		setGlobalStorageValue(722641, 1)
		setGlobalStorageValue(722642, os.time()+120*60) -- EVITAR BUG COM DTT
		announce("O teleport para as arenas de Bomberman está aberto até as 23:00!", 10)
	else
		local tp = getTileItemById(bomberman.tpPos, 1387)
		if tp and tp.uid > 0 then
			doRemoveItem(tp.uid)
		end
		local players = getPlayersInArea({x = 16120, y = 17045, z = 7}, {x = 16150, y = 17060, z = 7})
		if players then
			for _, pid in next, players do
				doTeleportThing(pid, getTownTemplePosition(1))
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "O tempo de jogo de bomberman acabou.")
			end
		end
		doBroadcastMessage"O tempo para jogar bomberman acabou e volta amanhã!"
	end
    return true
end
