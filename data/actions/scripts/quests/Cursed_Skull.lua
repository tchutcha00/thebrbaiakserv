function onUse(cid, item, frompos, item2, topos)
	local sto = 722424
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,12738,1)
		doPlayerAddItemEx(cid,bp)
        doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Cursed Skull ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
        doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Cursed Skull!! Parabéns guerreiro!")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 