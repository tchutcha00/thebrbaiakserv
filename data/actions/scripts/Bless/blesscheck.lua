local efeito = {27,28, 29,79}

function onUse(cid, item, frompos, item2, topos)
 
        if not getTileInfo(getThingPos(cid)).protection then
        return doPlayerSendCancel(cid, "You can only use this item in protection zone.")
        end
    
	if getPlayerStorageValue(cid, 89210) == 1 then
		doPlayerSendTextMessage(cid,22,"Você já possui Bless Infinita.")
	else
		doPlayerSendTextMessage(cid,22,"Parabéns! Você recebeu BLESS INFINITA, nunca mais precisara comprar bless!. Você sera kikado em 3 segundos!")
		setPlayerStorageValue(cid, 89210, 1)
		doRemoveItem(item.uid, 1)
		addEvent(doRemoveCreature,3000,cid)
		doSendMagicEffect(getThingPos(cid), efeito[math.random(#efeito)])
	end
	return true
end