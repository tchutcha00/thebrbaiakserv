local function getRepeatedIp(ip)
	local players = getPlayersInArea({x = 209, y = 264, z = 7}, {x = 233, y = 282, z = 7})
	if players and #players > 0 then
		for _, pid in next, players do
			if getPlayerIp(pid) == ip then
				return true
			end
		end
	end
	return false
end

function onStepIn(cid, item, position, fromPosition)

	if not getRepeatedIp(getPlayerIp(cid)) then
		doTeleportThing(cid, {x = 223, y = 267, z = 7})
		doSendMagicEffect({x = 223, y = 267, z = 7}, CONST_ME_TELEPORT)
	else
		doTeleportThing(cid, fromPosition)
		doCreatureSay(cid, "Apenas 1 por IP.", TALKTYPE_MONSTER_SAY)
	end

	return true
end
