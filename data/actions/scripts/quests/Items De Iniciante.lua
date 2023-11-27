function onUse(cid, item, frompos, item2, topos)
	local sto = 11556
	if getPlayerStorageValue(cid,sto) == -1 then
		doPlayerSetStorageValue(cid,sto,1)
		local bp = doCreateItemEx(5926)
		doAddContainerItem(bp,11296,1)
		doAddContainerItem(bp,11295,1)
		doAddContainerItem(bp,11298,1)
		doAddContainerItem(bp,11297,1)
		doAddContainerItem(bp,12733,1)
		doPlayerAddItemEx(cid,bp)
		doPlayerSendTextMessage(cid,25,"Você ganhou o set completo dentro de uma backpack")
	else
		doPlayerSendCancel(cid,"It is empty.")
	end
	return true
end 