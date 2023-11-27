local food =
{	
	[9996] = {60, "Hmmmmm Delicia caraaaaaaaa!!!."}	
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(food[item.itemid] ~= nil) then
		if(getPlayerFood(cid) + food[item.itemid][1]) >= 400 then
			doPlayerSendCancel(cid, "VAI FICAR GORDO DESSE JEITO FDP!!!")
		else
			doPlayerFeed(cid, food[item.itemid][1] * 4)
			doCreatureSay(cid, food[item.itemid][2], TALKTYPE_ORANGE_1)			
		end
		return TRUE
	end
	return FALSE
end