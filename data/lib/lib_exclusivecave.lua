--- Lib Cave-Exclusiva 1.0 by WooX --

caveExclusiva = {

	config = {
		rentTime = 3 * 3600,
		buyItemID = 9825,
		ItemID2 = 9826,
		caveStats = true,
		buyMessage = "Você comprou a cave de %s por %s.", -- 1° [%s] = Variavel para nome da cave, 2° [%s] = Variavel para duração da cave
		timeLeftMessageInCave = "Seu tempo na cave de %s acabou e você foi teleportado para o templo.", -- Mensagem quando acabar o tempo e o player estiver dentro da cave
		timeLeftMessage = "Seu tempo na cave de %s acabou.", -- Mensagem quando acabar o tempo e o player estiver fora da cave
		signs = {
			useSigns = true,
			signID = 1811,
			signLook = "Esta cave pertence a %s, estará livre novamente as %s."	-- 1° [%s] = Variavel para nome do player, 2° [%s] = Variavel para horário em que estara livre novamente
		}
	},

	caves = {
		[9851] = { -- cave 1
			gStor = 7330,
			caveName = "Cave 1",
			enterPos = {x = 1403, y = 2487, z = 7},
			signPos = {x = 2330, y = 2336, z = 7}
		},
		[9852] = { -- cave 2
			gStor = 7331,
			caveName = "Cave 2",
			enterPos = {x = 1447, y = 2498, z = 7},
			signPos = {x = 2330, y = 2338, z = 7}
		},
		[9853] = { -- cave 3
			gStor = 7332,
			caveName = "Cave 3",
			enterPos = {x = 1490, y = 2523, z = 7},
			signPos = {x = 2330, y = 2340, z = 7}
		},
		[9854] = { -- cave 4
			gStor = 7333,
			caveName = "Cave 4",
			enterPos = {x = 1533, y = 2558, z = 7},
			signPos = {x = 2330, y = 2342, z = 7}
		},
		[9855] = { -- cave 5
			gStor = 7334,
			caveName = "Cave 5",
			enterPos = {x = 1581, y = 2589, z = 7},
			signPos = {x = 2330, y = 2344, z = 7}
		},
		[9856] = { -- cave 6
			gStor = 7335,
			caveName = "Cave 6",
			enterPos = {x = 1651, y = 2581, z = 7},
			signPos = {x = 2330, y = 2346, z = 7}
		},
		[9857] = { -- cave 7
			gStor = 7336,
			caveName = "Cave 7",
			enterPos = {x = 1705, y = 2591, z = 7},
			signPos = {x = 2339, y = 2336, z = 7}
		},
		[9858] = { -- cave 8
			gStor = 7337,
			caveName = "Cave 8",
			enterPos = {x = 1748, y = 2599, z = 7},
			signPos = {x = 2339, y = 2338, z = 7}
		},
		[9859] = { -- cave 9
			gStor = 7338,
			caveName = "Cave 9",
			enterPos = {x = 1790, y = 2604, z = 7},
			signPos = {x = 2339, y = 2340, z = 7}
		},
		[9860] = { -- cave 10
			gStor = 7339,
			caveName = "Cave 10",
			enterPos = {x = 1371, y = 2583, z = 7},
			signPos = {x = 2339, y = 2342, z = 7}
		},
		[9861] = { -- cave 11
			gStor = 7340,
			caveName = "Cave 11",
			enterPos = {x = 1415, y = 2594, z = 7},
			signPos = {x = 2339, y = 2344, z = 7}
		},
		[9862] = { -- cave 12
			gStor = 7341,
			caveName = "Cave 12",
			enterPos = {x = 1457, y = 2615, z = 7},
			signPos = {x = 2339, y = 2346, z = 7}
		},
		[9863] = { -- cave 13
			gStor = 7342,
			caveName = "Cave 13",
			enterPos = {x = 1501, y = 2647, z = 7},
			signPos = {x = 2330, y = 2336, z = 6}
		},
		[9864] = { -- cave 14
			gStor = 7343,
			caveName = "Cave 14",
			enterPos = {x = 1537, y = 2674, z = 7},
			signPos = {x = 2330, y = 2338, z = 6}
		},
		[9865] = { -- cave 15
			gStor = 7344,
			caveName = "Cave 15",
			enterPos = {x = 1587, y = 2690, z = 7},
			signPos = {x = 2330, y = 2340, z = 6}
		},
		[9866] = { -- cave 16
			gStor = 7345,
			caveName = "Cave 16",
			enterPos = {x = 1638, y = 2703, z = 7},
			signPos = {x = 2330, y = 2342, z = 6}
		},
		[9867] = { -- cave 17
			gStor = 7346,
			caveName = "Cave 17",
			enterPos = {x = 1687, y = 2716, z = 7},
			signPos = {x = 2330, y = 2344, z = 6}
		},
		[9868] = { -- cave 18
			gStor = 7347,
			caveName = "Cave 18",
			enterPos = {x = 1732, y = 2729, z = 7},
			signPos = {x = 2330, y = 2346, z = 6}
		},
		[9869] = { -- cave 19
			gStor = 7348,
			caveName = "Cave 19",
			enterPos = {x = 1775, y = 2743, z = 7},
			signPos = {x = 2339, y = 2336, z = 6}
		},
		[9870] = { -- cave 20
			gStor = 7349,
			caveName = "Cave 20",
			enterPos = {x = 1818, y = 2752, z = 7},
			signPos = {x = 2339, y = 2340, z = 6}
		},
				[9871] = { -- cave 21
			gStor = 7350,
			caveName = "Cave 21",
			enterPos = {x = 1450, y = 2780, z = 7},
			signPos = {x = 2339, y = 2342, z = 6}
	},
				[9872] = { -- cave 22
			gStor = 7351,
			caveName = "Cave 22",
			enterPos = {x = 1493, y = 2789, z = 7},
			signPos = {x = 2339, y = 2344, z = 6}
	},
					[9873] = { -- cave 23
			gStor = 7352,
			caveName = "Cave 23",
			enterPos = {x = 1593, y = 2827, z = 7},
			signPos = {x = 2339, y = 2346, z = 6}
	},
					[9874] = { -- cave 24
			gStor = 7353,
			caveName = "Cave 24",
			enterPos = {x = 1636, y = 2836, z = 7},
			signPos = {x = 2339, y = 2348, z = 6}
	        },
		},

	storages = {
		cave = 35070,
		inCave = 35071,
		time = 35072
	}
}

-- Funções --
caveExclusiva.getCavesID = function()
	local caves = {}
	for k, v in pairs(caveExclusiva.caves) do
		table.insert(caves, k)
	end
	table.sort(caves, function(a,b) return b > a end)
	return caves
end

caveExclusiva.setSign = function(guid, cave, time)
	if caveExclusiva.config.signs.useSigns then
		local sign = getTileItemById(caveExclusiva.caves[cave].signPos, caveExclusiva.config.signs.signID).uid
		doSetItemText(sign, caveExclusiva.config.signs.signLook:format(getPlayerNameByGUID(guid), os.date("%X", os.time() + time)))
	end
end

caveExclusiva.resetSign = function(cave)
	if caveExclusiva.config.signs.useSigns then
		local sign = getTileItemById(caveExclusiva.caves[cave].signPos, caveExclusiva.config.signs.signID).uid
		doSetItemText(sign, "Esta cave está livre!")
	end
end

caveExclusiva.setCaveTo = function(cid, cave)
	setGlobalStorageValue(caveExclusiva.caves[cave].gStor, getPlayerGUID(cid))
	setPlayerStorageValue(cid, caveExclusiva.storages.cave, cave)
	setPlayerStorageValue(cid, caveExclusiva.storages.inCave, 0)
	setPlayerStorageValue(cid, caveExclusiva.storages.time, os.time() + caveExclusiva.config.rentTime)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, caveExclusiva.config.buyMessage:format(caveExclusiva.caves[cave].caveName, getTimeString(caveExclusiva.config.rentTime)))
  
	addEvent(caveExclusiva.doRemoveCave, caveExclusiva.config.rentTime*1000, getPlayerGUID(cid), cave)
	caveExclusiva.setSign(getPlayerGUID(cid), cave, caveExclusiva.config.rentTime)
	return true
end

caveExclusiva.doRemoveCave = function(guid, cave)
	setGlobalStorageValue(caveExclusiva.caves[cave].gStor, 0)
	caveExclusiva.resetSign(cave)
	if isPlayerOnline(getPlayerNameByGUID(guid)) then
		local cid = getPlayerByGUID(guid)
		setPlayerStorageValue(cid, caveExclusiva.storages.cave, 0)
		if getPlayerStorageValue(cid, caveExclusiva.storages.inCave) > 0 then	
			setPlayerStorageValue(cid, caveExclusiva.storages.inCave, 0)
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, caveExclusiva.config.timeLeftMessageInCave:format(caveExclusiva.caves[cave].caveName))
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, caveExclusiva.config.timeLeftMessage:format(caveExclusiva.caves[cave].caveName))
		end
		setPlayerStorageValue(cid, caveExclusiva.storages.time, 0)
	end
end

caveExclusiva.onStartup = function()
	io.write(">> Iniciando o sistema de Cave Exclusiva... ")
	for _, cave in pairs(caveExclusiva.getCavesID()) do
		local ownerGUID = getGlobalStorageValue(caveExclusiva.caves[cave].gStor) > 0 and getGlobalStorageValue(caveExclusiva.caves[cave].gStor) or false
		local timeLeft = ownerGUID and getOfflinePlayerStorage(ownerGUID, caveExclusiva.storages.time) - os.time() or false
		if ownerGUID then
			if timeLeft > 0 then
				addEvent(caveExclusiva.doRemoveCave, timeLeft*1000, ownerGUID, cave)
				caveExclusiva.setSign(ownerGUID, cave, timeLeft)
			else
				setGlobalStorageValue(caveExclusiva.caves[cave].gStor, 0)
				caveExclusiva.resetSign(cave)
			end
		end
	end
	io.write("done.", "\n")
end