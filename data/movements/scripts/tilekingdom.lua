function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getCreatureStorage(cid,11139) == EMPTY_STORAGE then
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
		doPlayerSendCancel(cid, "Você precisa completar a Kingdom Quest ou comprar no site para ter acesso a esta área.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bem vindo a Kingdom!")
	end
	return true
end