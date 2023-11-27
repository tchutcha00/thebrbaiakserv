local vocations = {3,4,7,8,11,12} 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

	if isInArray(vocations,getPlayerVocation(cid)) then
		doTeleportThing(cid,position)
	else
		doTeleportThing(cid,lastPosition)
                doCreatureSay(cid, "Somente Kina e Pally!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getPlayerPosition(cid),6)
	end
	return true
end