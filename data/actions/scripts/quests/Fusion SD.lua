function onUse(cid, item, frompos, item2, topos)
	local sto = 712594
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,2263,1)
		doAddContainerItem(bp,2157,100)
		doPlayerAddItemEx(cid,bp)
        doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Fusion SD ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
        doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Fusion SD!! Parabéns guerreiro!")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 