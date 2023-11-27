local price = 3000000000

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == caveExclusiva.config.buyItemID then
		if getPlayerStorageValue(cid, caveExclusiva.storages.cave) > 0 then
			local caveName = caveExclusiva.caves[getPlayerStorageValue(cid, caveExclusiva.storages.cave)].caveName
			local timeLeft = getPlayerStorageValue(cid, caveExclusiva.storages.time) - os.time()
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já é dono da cave de ".. caveName ..", aguarde ".. getTimeString(timeLeft) .." para comprar uma cave novamente.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		elseif getGlobalStorageValue(caveExclusiva.caves[itemEx.aid].gStor) > 0 then
			local ownerGUID = getGlobalStorageValue(caveExclusiva.caves[itemEx.aid].gStor)
			local ownerTimeLeft = nil
			if isPlayerOnline(getPlayerNameByGUID(ownerGUID)) then
				ownerTimeLeft = getPlayerStorageValue(getPlayerByGUID(ownerGUID), caveExclusiva.storages.time) - os.time()
			else
				ownerTimeLeft = getOfflinePlayerStorage(ownerGUID, caveExclusiva.storages.time) - os.time()
			end
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Esta cave já pertence ao player ".. getPlayerNameByGUID(ownerGUID) ..", restam ".. getTimeString(ownerTimeLeft) .." para a cave estar livre novamente.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		else
			if doPlayerRemoveMoney(cid, price) then
				caveExclusiva.setCaveTo(cid, itemEx.aid)
				doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_BLUE)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você não possui dinheiro suficiente para comprar esta cave.")
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
			end
		end
	end
	if itemEx.itemid == caveExclusiva.config.ItemID2 then
	if getPlayerStorageValue(cid, caveExclusiva.storages.cave) > 0 then
			local caveName = caveExclusiva.caves[getPlayerStorageValue(cid, caveExclusiva.storages.cave)].caveName
			local timeLeft = getPlayerStorageValue(cid, caveExclusiva.storages.time) - os.time()
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já é dono da cave de ".. caveName ..", aguarde ".. getTimeString(timeLeft) .." para comprar uma cave novamente.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		elseif getGlobalStorageValue(caveExclusiva.caves[itemEx.aid].gStor) > 0 then
			local ownerGUID = getGlobalStorageValue(caveExclusiva.caves[itemEx.aid].gStor)
			local ownerTimeLeft = nil
			if isPlayerOnline(getPlayerNameByGUID(ownerGUID)) then
				ownerTimeLeft = getPlayerStorageValue(getPlayerByGUID(ownerGUID), caveExclusiva.storages.time) - os.time()
			else
				ownerTimeLeft = getOfflinePlayerStorage(ownerGUID, caveExclusiva.storages.time) - os.time()
			end
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Esta cave já pertence ao player ".. getPlayerNameByGUID(ownerGUID) ..", restam ".. getTimeString(ownerTimeLeft) .." para a cave estar livre novamente.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		else
			if doPlayerRemoveMoney(cid, price) then
				caveExclusiva.setCaveTo(cid, itemEx.aid)
				doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_BLUE)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você não possui dinheiro suficiente para comprar esta cave.")
				doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
			end
		end
	end
	return true
end