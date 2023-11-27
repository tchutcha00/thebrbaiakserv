local holes = {468, 481, 483, 7932, 8579}
local sand = {231, 9059}

local function closeHole(pos)
	pos.stackpos = 0
	local item = getThingFromPos(pos).uid
	doTransformItem(item,351)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(isInArray(holes, itemEx.itemid)) then
		local newId = itemEx.itemid + 1
		if(itemEx.itemid == 8579) then
			newId = 8585
		end

		doTransformItem(itemEx.uid, newId)
		doDecayItem(itemEx.uid)
	elseif(isInArray(sand, itemEx.itemid)) then
		local rand = math.random(1, 100)
		if(itemEx.actionid  == 100 and rand <= 20) then
			doTransformItem(itemEx.uid, 489)
			doDecayItem(itemEx.uid)
		elseif(rand > 85) then
			doCreateMonster("Scarab", toPosition, false)
		end

		doSendMagicEffect(toPosition, CONST_ME_POFF)
	elseif itemEx.actionid == 15582 then
		doTransformItem(itemEx.uid, 383)
		local pos = toPosition
		addEvent(closeHole,10000,pos)
	end

	return true
end
