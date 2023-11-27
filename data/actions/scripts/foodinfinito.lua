function onUse(cid, item, frompos, item2, topos)
	local sto = 518438
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,9996,1)
		doAddContainerItem(bp,9971,1000)
		doAddContainerItem(bp,9693,1)
		doPlayerAddItemEx(cid,bp)
        doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Food Infinito ], Parabens!", MESSAGE_STATUS_CONSOLE_RED)
        doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Food Infinito!! Parabens guerreiro!")
	else
		doPlayerSendCancel(cid,"Voce ja fez essa quest!")
	end
	return true
end 