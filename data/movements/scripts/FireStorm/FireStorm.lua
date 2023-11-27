FireStorm = {
	ips = {},
}

function onStepIn(cid, item, position, fromPosition)
	local ip = getPlayerIp(cid)
	if FireStorm.ips[ip] and tonumber(FireStorm.ips[ip]) and tonumber(FireStorm.ips[ip]) >= os.time() then
		doPlayerSendCancel(cid,"Só é permitido um jogador por IP.")
		doTeleportThing(cid,fromPosition)
		doSendMagicEffect(position,CONST_ME_POFF)
		return true
	end

	if getPlayerAccess(cid) < 4 then
		FireStorm.ips[ip] = os.time() + 400
		setGlobalStorageValue(17, getGlobalStorageValue(17)+1)
		doRemoveCondition(cid, CONDITION_POISON)
		doRemoveCondition(cid, CONDITION_FIRE)
		doPlayerPopupFYI(cid, "-BR-\nVocê precisa desviar dos fogos o máximo que puder para vencer o evento.\n\n-ENG-\nTo win and get a Rewards, to stay as long as possible in the arena.")
	end
	return true
end