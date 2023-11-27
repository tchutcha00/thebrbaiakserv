local function executeAction(cid, targetName, pos)
	local check = false
	local targetPosition = {}
	for i = 1, 255 do
		pos.stackpos = i
		local getThing = getThingFromPos(pos).uid
		if getThing and getThing > 0 and isContainer(getThing) then
			targetPosition = pos
			check = true
			break
		end
	end

	if not check then
		return true
	end

	local corpse = getThingFromPos(targetPosition)
	if not corpse then
        return true
    end

	if not isPlayer(cid) then
		local master = getCreatureMaster(cid)
		if not master or not isPlayer(master) then
			return true
		end

		cid = master
	end

	if not isPlayer(cid) then
		return true
	end

	local modifier = 1
	local dailyCreatureType = getGlobalStorageValue('dailymonstertype')
	if dailyCreatureType == DAILYMONSTER_LOOT then
		if getGlobalStorageValue('dailymonstername'):lower() == targetName:lower() then
			local percent = getGlobalStorageValue('dailymonsterpercent')
			modifier = modifier + (percent * 0.01)
		end
	end

    createLoot(cid, targetName, corpse, modifier)
end

function onKill(cid, target, lastHit)
	if not isMonster(target) then
        return true
    end

	doCreatureSetDropLoot(target, false)

	local position = getCreaturePosition(target)
	local targetName = getCreatureName(target)
	addEvent(executeAction, 100, cid, targetName, position)
	return true
end