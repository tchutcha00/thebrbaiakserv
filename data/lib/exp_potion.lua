local potions = {
	[6542] = {needLevel = 2000, rate = 2.0, duration = 1800},
	[6543] = {needLevel = 3000, rate = 3.0, duration = 1800},
	[6544] = {needLevel = 4000, rate = 4.0, duration = 1800},
	[6545] = {needLevel = 5000, rate = 5.0, duration = 1800},
	[2328] = {needLevel = 6000, rate = 6.0, duration = 1800},
	[6541] = {needLevel = 7000, rate = 7.0, duration = 1800},
	[12599] = {needLevel = 8000, rate = 8.0, duration = 1800},
	[8300] = {needLevel = 10000, rate = 10.0, duration = 1800},
}

if not expPotions then
	expPotions = {playerData = {}}
end

function expPotions:onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemId = item.itemid
	local potion = potions[itemId]
	if not potion then
		return false
	end

	if getPlayerLevel(cid) < potion.needLevel then
		doPlayerSendCancel(cid, ('Você precisa ser level %d+ para usar esta potion.'):format(potion.needLevel))
		return true
	end
	
	local guid = getPlayerGUID(cid)
	local expData = self.playerData[guid][itemId]
	if not expData then
		-- caso alguma nova exp potion seja adicionada às configurações em tempo real
		-- alguns jogadores online que tentarem usar, precisarão relogar.
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'É necessário relogar para atualizar.')
		return true
	end

	local now = os.time()
	if expData.duration > now then
		doCreatureSay(cid, 'Aguarde o bônus atual acabar para usar novamente.', TALKTYPE_ORANGE_1, false, cid)
		return true
	end

	expData.rate = expData.rate + potion.rate
	expData.duration = potion.duration + now

	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ('Agora você tem +%d%% de experiência por %s.'):format(
		potion.rate * 100, string.diff(potion.duration, true)
	))

    doRemoveItem(item.uid, 1)
    return true
end

function expPotions:onLogin(cid)
	local guid = getPlayerGUID(cid)

	self.playerData[guid] = {}
	for itemId in pairs(potions) do
		self.playerData[guid][itemId] = {rate = 0, duration = 0}
	end
	return true
end

function expPotions:getCombo(cid)
	local playerData = self.playerData[getPlayerGUID(cid)]
	local potionsCombo = 1

	if playerData then
		for itemId, expData in pairs(playerData) do
			potionsCombo = potionsCombo + expData.rate
		end
	end
	return potionsCombo
end

function expPotions:onSay(cid, words, param)
	local str = 'Experience Potion Combos:\n'

	local playerData = self.playerData[getPlayerGUID(cid)]
	if playerData then
		for itemId, expData in pairs(playerData) do
			str = str .. ('\n%s - %d%%'):format(getItemInfo(itemId).name, expData.rate * 100)
		end
	end

	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
	return true
end
