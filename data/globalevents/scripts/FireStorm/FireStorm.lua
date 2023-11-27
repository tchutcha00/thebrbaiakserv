local cf = {
	teleportPosition = {x = 122, y = 69, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 160, y = 443, z = 7}, -- Where the teleport will take you 
	from = {x=129,y=431,z=7}, -- left top corner of event room
	to = {x=174,y=452,z=7} -- right bottom corner of event room
}

function onTime ()
	doItemSetAttribute(doCreateTeleport(1387, cf.teleportToPosition, cf.teleportPosition), "aid", 1747)
	doBroadcastMessage("FireStorm comeca em 3 minutos! O teleport será fechado quando o evento começar!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(17, 0)
	addEvent(startEventF, 3 * 60 * 1000)
	return true
end

function startEventF ()
	doRemoveItem(getTileItemById(cf.teleportPosition, 1387).uid, 1)
	if getGlobalStorageValue(17) > 0 then
		addEvent(doRepeatCheckFireStorm, 5 * 1000)
		doBroadcastMessage("Boa sorte no evento FireStorm! O teleport fechou!", MESSAGE_STATUS_WARNING)
	else
		doBroadcastMessage('FireStorm Event hasn\'t started beacuse there were not enough players.')
	end
end

y, x = 1, 1

function doRepeatCheckFireStorm ()
	if getGlobalStorageValue(17) > 0 then
		local xTable, yTable, playerTable = {}, {}, {}
		
		for x = cf.from.x, cf.to.x do
			for y = cf.from.y, cf.to.y do
				table.insert(xTable, x)
				table.insert(yTable, y)
				
				local n, i = getTileInfo({x=x, y=y, z=cf.to.z}).creatures, 1
				if n ~= 0 then
					local v = getThingfromPos({x=x, y=y, z=cf.to.z, stackpos=i}).uid
					while v ~= 0 do
						if isPlayer(v) then
							table.insert(playerTable, v)
							if n == #playerTable then
								break
							end
						end
						i = i + 1
						v = getThingfromPos({x=x, y=y, z=cf.to.z, stackpos=i}).uid
					end
				end
			end
		end
		
		if #playerTable == 1 then
			doCreatureAddHealth(playerTable[1], getCreatureMaxHealth(playerTable[1]) - getCreatureHealth(playerTable[1]))
			doCreatureAddMana(playerTable[1], getCreatureMaxMana(playerTable[1]) - getCreatureMana(playerTable[1]))
			doTeleportThing(playerTable[1], getTownTemplePosition(getPlayerTown(playerTable[1])), true)
			doItemSetAttribute(doPlayerAddItem(playerTable[1], 7371), "name", "trophy " .. getCreatureName(playerTable[1]) .. "! Congratulations! Winner a fire event")
			doPlayerAddItem(playerTable[1],9971,50)
			doPlayerAddItem(playerTable[1],6527,25)
			doBroadcastMessage('FireStorm Event terminou. O vencedor é ' .. getCreatureName(playerTable[1]) .. '. Parabéns, Ganhou 50KK E 5 EVENT COINS.')
			setGlobalStorageValue(17, 0)
			
			x, y = 1, 1
		elseif #playerTable > 1 then
			for a = 1, y do
				local pos = {x=xTable[math.random(#xTable)], y=yTable[math.random(#yTable)], z=7}
				for _, player in ipairs(playerTable) do
					local pPos = getThingPos(player)
					if pPos.x == pos.x and pPos.y == pos.y and pPos.z == pos.z then
						doCreatureAddHealth(player, - getCreatureMaxHealth(player))
					end
				end
				doSendDistanceShoot({x = pos.x - math.random(4, 6), y = pos.y - 5, z = pos.z}, pos, CONST_ANI_FIRE)
				addEvent(doSendMagicEffect, 150, pos, CONST_ME_HITBYFIRE)
				addEvent(doSendMagicEffect, 150, pos, CONST_ME_FIREAREA)
				math.random(100,1000)
			end
			if x == 5 * y then
				y = y + 1
			end
			
			x = x + 1
		else
			doBroadcastMessage('No one have won in Fire Storm Event.')
			setGlobalStorageValue(17, 0)
			x, y = 1, 1
		end
		
		addEvent(doRepeatCheckFireStorm, 1000)
	end
end