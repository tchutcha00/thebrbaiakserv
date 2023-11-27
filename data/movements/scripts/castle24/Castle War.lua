function onStepIn(cid, item, position, fromPosition)
	if getPlayerLevel(cid) < 1000 then
		doTeleportThing(cid,fromPosition)
		doPlayerSendCancel(cid,"Somente level 1000+")
		return true
	end
	if getPlayerGuildId(cid) > 0 then
		if getPlayerStorageValue(cid,722361) < os.time() then
			doPlayerSetStorageValue(cid,722361,os.time() + 20)
			doBroadcastMessage("[Castle War] O jogador "..getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." est� invadindo o castelo! Aviso aos donos atuais.",21)
		end
		return true 
	else
		doPlayerSendCancel(cid, "Voc� n�o possui guild.")
		doTeleportThing(cid, fromPosition)
		return false
	end
end
