function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 22467) == EMPTY_STORAGE) then
		doCreatureSay(cid, "Voce ganhou magia nova dos deuses, se voce � kina use (master kina), pally (master pally), druid (master druid) e sorc (master sorcerer) !", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid, 64854, 10)
		setPlayerStorageValue(cid, 64855, 10)
		setPlayerStorageValue(cid, 64856, 10)
		setPlayerStorageValue(cid, 64857, 10)
		setPlayerStorageValue(cid, 22467, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
	else
		doPlayerSendTextMessage(cid,22,"Voc� ja possui a nova spell!")
	end
	return true
end