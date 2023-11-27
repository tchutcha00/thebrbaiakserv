local config = {
	announceSeconds = {5, 10, 15, 20},
	playerAccess = 0,

	talkType = TALKTYPE_MONSTER_SAY,
	delayToCleanAnnounce = 5 * 60 * 1000,
	delayToCleanAnnounceString = "5 minutes"
}

function cleanAnnounce(Time)
	if Time <= 0 then
		doCleanMap()
		doBroadcastMessage("Clean map completed and the next clean at on 1 hour.")
		return true
	end

	local timeInSeconds = Time / 1000
	if isInArray(config.announceSeconds, timeInSeconds) then
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerAccess(cid) == config.playerAccess then
				doCreatureSay(cid, ("Map clean in %d seconds."):format(timeInSeconds), config.talkType, false, cid)
			end
		end
	end
	Time = Time - 1000
	addEvent(cleanAnnounce, 1 * 1000, Time)
end

function onThink(interval)
	doBroadcastMessage(("Cleaning map in %s."):format(config.delayToCleanAnnounceString))
	cleanAnnounce(config.delayToCleanAnnounce)
	return true
end
