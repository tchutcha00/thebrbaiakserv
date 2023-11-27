local storageKeyHouses = "321326"

function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 7384, 3)) then
    return true
	end 
  
	local playerGuid = getPlayerGUID(cid)

	local house = getHouseByPlayerGUID(playerGuid)
	if not house then
		doPlayerSendCancel(cid, "Only the house owner can use this command.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return true
	end

	local getStorage = getCreatureStorage(cid, storageKeyHouses)
	if getStorage == 1 then
		doCreatureSetStorage(cid, storageKeyHouses, 0)
		updateHouseProtection(playerGuid, false)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A Proteção de Itens da sua casa foi removida.")
	else
		doCreatureSetStorage(cid, storageKeyHouses, 1)
		updateHouseProtection(playerGuid, true)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A Proteção de Itens da sua casa foi ativada.")
	end
	
	return true
end