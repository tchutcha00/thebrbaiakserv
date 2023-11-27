function onUse(cid, item, frompos, item2, topos)
	local sto = 712531
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,12385,1)
		doAddContainerItem(bp,9693,1)
		doPlayerAddItemEx(cid,bp)
        doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Kingdom Acesso ], Parabens!", MESSAGE_STATUS_CONSOLE_RED)
        doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Kingdom Acesso!! Parabens guerreiro!")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 