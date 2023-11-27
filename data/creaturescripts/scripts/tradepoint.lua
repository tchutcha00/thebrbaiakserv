function CompleteTrade(fromplayer, toplayer, points)
	if getPlayerItemCount(toplayer, 7722) >= 1 and getAccountPoints(fromplayer) >= points then
    	doAccountRemovePoints(fromplayer, points)
		doPlayerRemoveItem(toplayer, 7722, 1)
		doPlayerAddPoints(toplayer, points)
		doPlayerSendTextMessage(toplayer, MESSAGE_STATUS_WARNING, "You have received ".. points .." premium points.")
		return true
	end
end

function CollapserOrbs(item)
	return tonumber(string.match(getItemDescriptions(item.uid).special, "You see (%w+) premium points."))
end

function onTradeAccept(cid, target, item, targetItem)
	if isPlayer(cid) and isPlayer(target) then
		if item.itemid == 7722 then
			local points = CollapserOrbs(item)
			addEvent(CompleteTrade, 1, cid, target, points)
		end
		if targetItem.itemid == 7722 then
			local points = CollapserOrbs(targetItem)
			addEvent(CompleteTrade, 1, target, cid, points)
		end
	end
	return true
end 