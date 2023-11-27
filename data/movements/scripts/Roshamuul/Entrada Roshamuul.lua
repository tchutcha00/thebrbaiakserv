function onStepIn(cid, item, position, fromPosition)

	if item.actionid == 61760 then
		if getCreatureStorage(cid,79432) == 1 then
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 10198, y = 9140, z = 5})
		else
			doPlayerSendCancel(cid, "Você deve fazer a quest de Roshamuul para entrar aqui.")
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			doTeleportThing(cid, fromPosition)
		end
	end

	return true
end
