local first = {x = 1818, y = 1790, z = 15}
local second = {x = 1818, y = 1791, z = 15}
local third = {x = 1818, y = 1792, z = 15}
local fourth = {x = 1790, y = 1821, z = 15}
local fifth = {x = 1789, y = 110, z = 15}

function onUse(cid, item, frompos, item2, topos)
	
	if item.actionid == 61562 then
		local stone = getTileItemById(first, 1304)
		if stone and stone.uid and stone.uid > 0 then
			doRemoveItem(stone.uid)
		else
			doCreateItem(1304,1,first)
		end

	elseif item.actionid == 61563 then
		local stone2 = getTileItemById(second, 1304)
		local stone3 = getTileItemById(third, 1304)
		if stone2 and stone2.uid and stone2.uid > 0 and stone3 and stone3.uid and stone3.uid > 0 then
			doRemoveItem(stone2.uid)
			doRemoveItem(stone3.uid)
		else
			doCreateItem(1304,1,second)
			doCreateItem(1304,1,third)
		end
	
	elseif item.actionid == 61564 then
		local stone = getTileItemById(fourth, 1304)
		if stone and stone.uid and stone.uid > 0 then
			doRemoveItem(stone.uid)
		else
			doCreateItem(1304,1,fourth)
		end

	elseif item.actionid == 61565 then
		local tile = getThingFromPos(fifth)
		doTransformItem(tile.uid, tile.itemid == 100 and 9067 or 100)
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você escuta algo se movendo próximo a você.")
	if isInArray({1945,1946},item.itemid) then
		doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
	end

	return true
end

