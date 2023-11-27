function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x = 129, y = 74, z = 7, stackpos = 1}), "aid", 2137)
	countDownTeleport({x = 129, y = 74, z = 7}, 180)
	doBroadcastMessage("o evento Desert WAR se iniciara em 3 minutos! o teleport sera fechando quando ele ser iniciado!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 3 * 60 * 1000)
	return true
end

function startDesert()
	doRemoveItem(getTileItemById({x = 129, y = 74, z = 7}, 1387).uid, 1)
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("boa sorte as pessoas que estao no desert war! o teleport foi fechado!", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("o evento desert war nao foi iniciado por falta de pessoas.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end