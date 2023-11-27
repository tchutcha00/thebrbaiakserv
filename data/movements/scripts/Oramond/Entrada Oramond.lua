function onStepIn(cid, item, position, fromPosition)

	if item.actionid == 61560 then
		if getCreatureStorage(cid,85742) == 1 then
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 5525, y = 29986, z = 6})
		else
			doPlayerSendCancel(cid, "Você deve fazer a quest de Oramond para entrar aqui.")
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			doTeleportThing(cid, fromPosition)
		end
	end

	return true
end
