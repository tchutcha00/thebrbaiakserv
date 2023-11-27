function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 32433) == EMPTY_STORAGE) then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Você aprendeu a magia conjure 3x! Use a spell (conjure 3x) para conjurar Fusion Potion 3x!")
		doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Conjure 3X ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
		setPlayerStorageValue(cid, 64859, 10)
		setPlayerStorageValue(cid, 32433, 1)
		doSendMagicEffect(getCreaturePosition(cid), 12)
	else
		doCreatureSay(cid, "Você já aprendeu essa spell!", TALKTYPE_ORANGE_1)
	end
	return true
end