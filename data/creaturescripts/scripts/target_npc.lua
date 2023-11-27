local minDist = 4

function onTarget(cid, target)
	if not isPlayer(cid) or not isNpc(target) then
		return true
	end

	if getDistanceBetween(getThingPos(cid), getThingPos(target)) > minDist then
		doPlayerSendCancel(cid, string.format("You're a long way from NPC %s, stay close to talk to him.", getCreatureName(target)))
		return true
	end

	if getPlayerStorageValue(cid, 3333) > os.time() then
		local timeInSeconds = tonumber(getPlayerStorageValue(cid, 3333)) - os.time()
		doPlayerSendCancel(cid, string.format("Please wait %d second%s before retarget.", timeInSeconds, timeInSeconds ~= 1 and 's' or ''))
		return true
	end

	setPlayerStorageValue(cid, 3333, os.time() + 5)
	doCreatureSay(cid, "hi", TALKTYPE_PRIVATE_PN, false, target)
    addEvent(doCreatureSay, 500, cid, "trade", TALKTYPE_PRIVATE_PN, false, target)
	return true
end