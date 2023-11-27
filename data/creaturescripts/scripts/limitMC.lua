local maxMC = 5

function onLogin(cid)
	local ip = getPlayerIp(cid)
	local count = 0
	for a,b in next,getPlayersOnline() do
		if getPlayerIp(b) == ip then
			count = count + 1
		end
	end
	if count >= maxMC then
		doPlayerPopupFYI(cid,"Máximo 4 MCs")
		addEvent(doRemoveCreature,1000,cid)
	end
  return true
end
