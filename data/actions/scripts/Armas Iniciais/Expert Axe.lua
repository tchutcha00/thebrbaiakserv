function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 52221 then
   		queststatus = getPlayerStorageValue(cid,12219)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Parabéns, você ganhou 1x Expert Axe com duração de 3 horas.")
            setPlayerStorageValue(cid,12219,1)
            local item = doPlayerAddItem(cid,8926,1)
            doItemSetPeriod(item, 10800)
            setItemOwner(cid, item)
         else
            doPlayerSendTextMessage(cid,22,"It is empty.")        
         end
   else
      return 0
      end

      return 1
end
