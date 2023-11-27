function onLook(cid, thing, position, lookDistance)
	local tid = thing.uid
	if tid == 0 then
		return true
	end

	if isMonster(tid) and getCreatureName(tid) == 'legenddummy' then
		local itemId = getCreatureOutfit(tid).lookTypeEx
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You see ' .. getItemInfo(itemId).name .. '.\n' .. getItemInfo(itemId).description)
		return false
	end
	return true
end
