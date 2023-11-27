function onUse(cid, item, frompos, item2, topos)
   
	local sto = 11557
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,12606,1)
		doAddContainerItem(bp,12603,1)
		doAddContainerItem(bp,12604,1)
		doAddContainerItem(bp,12608,1)
		doAddContainerItem(bp,2641,1)
		doPlayerAddItemEx(cid,bp)
		doPlayerSendTextMessage(cid,25,"Você ganhou o set completo dentro de uma backpack")
		doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Revolution SET ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 