function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 22468) == EMPTY_STORAGE) then
		doCreatureSay(cid, "Voce ganhou magia nova dos deuses, se voce é kina use (Ultra Kina), pally (Ultra Pally), druid (Ultra Druid) e sorc (Ultra Sorc)!", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid, 64754, 10)
		setPlayerStorageValue(cid, 64755, 10)
		setPlayerStorageValue(cid, 64756, 10)
		setPlayerStorageValue(cid, 64757, 10)
		setPlayerStorageValue(cid, 22468, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
	else
		doPlayerSendTextMessage(cid,22,"Você ja possui a nova spell!")
	end
	return true
end