function onUse(cid, item, frompos, item2, topos)
   	if item.uid == 12527 then
   		queststatus = getPlayerStorageValue(cid,63744)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Você ganhou uma Mana Rune.")
   			doPlayerAddItem(cid,2276,1)
   			setPlayerStorageValue(cid,63744,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
