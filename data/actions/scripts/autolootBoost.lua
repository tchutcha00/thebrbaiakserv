function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,722381) >= os.time() then
		doPlayerSendCancel(cid,"Voc� j� est� com o BOOST ativado!")
		return true
	end
    if doRemoveItem(item.uid) then
    	doPlayerSetStorageValue(cid,722381,os.time() + 3600 * 24)
    	doSendMagicEffect(getThingPos(cid),49)
    	doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Voc� ativou o Auto Loot BOOST por mais 24 horas. Durante esse tempo os itens coletados ser�o vendidos automaticamente e o dinheiro ser� depositado no seu banco.")
    end
    return true
end
