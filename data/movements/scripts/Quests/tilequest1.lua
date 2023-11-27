	local vocations = {1,2,5,6,9,10} 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

	if isInArray(vocations,getPlayerVocation(cid)) then
		doTeleportThing(cid,position)
	else
		doTeleportThing(cid,lastPosition)
        doCreatureSay(cid, "Somente Mages!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getPlayerPosition(cid),6)
	end
	return true
end