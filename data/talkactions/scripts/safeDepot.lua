local nme = "Safe Depot"

local depots = {2589,2590,2591,2592}

local function getDepotInPosition(pos)
	for i = 1, #depots do
		local dp = getTileItemById(pos,depots[i])
		if dp and dp.uid and dp.uid > 0 then
			return true;
		end
	end
	return false
end

local function getNearbyDepot(cid)
	local pos = getCreatureLookPosition(cid)
	if getDepotInPosition(pos) then return pos end
	return false
end

function onSay(cid,words,param,channel)

	if getPlayerStorageValue(cid,890123) >= os.time() then
		doPlayerSendCancel(cid,gTm(cid,nme,1))
		return true;
	end

	doPlayerSetStorageValue(cid,890123,os.time() + 5)

	local dpPos, stacks, itemStack = getNearbyDepot(cid), {}, false
	if dpPos then
		for i = 1,255 do
			dpPos.stackpos = i
			local thing = getThingFromPos(dpPos)
			if thing and thing.uid and thing.uid > 0 and thing.itemid > 0 then
				table.insert(stacks,i)
				if i == 255 then
					local a = stacks[#stacks - 2]
					if a and type(a) == "number" and a ~= 1 then
						itemStack = a
					else
						itemStack = false
					end
				end
			end
		end
		if itemStack then
			dpPos.stackpos = itemStack
			local item = getThingFromPos(dpPos)
			if item and item.uid and item.uid > 0 and item.itemid > 0 and not isInArray(depots,item.itemid) then
				if isContainer(item.uid) then
					--[[local virtualBp = doCreateItemEx(item.itemid)
					local items = getContainerItemsInfo(item.uid)
					for a,b in pairs(items) do
						doAddContainerItem(virtualBp,b.itemid,b.quant)
					end
					if doPlayerAddItemEx(cid,virtualBp,false) then
						doRemoveItem(item.uid)
						doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"You received your item that was on the depot.")
					else
						doRemoveItem(virtualBp)
						doPlayerSendCancel(cid,"You do not have enough room for the item.")
					end]]
					doPlayerSendCancel(cid,gTm(cid,nme,2))
					return true;
				end
				if doPlayerAddItem(cid,item.itemid,item.type,false) then
					doRemoveItem(item.uid)
					doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,gTm(cid,nme,3))
				else
					doPlayerSendCancel(cid,gTm(cid,nme,4))
				end
			else
				doPlayerSendCancel(cid,gTm(cid,nme,5))
			end
		else
			doPlayerSendCancel(cid,gTm(cid,nme,5))
		end
	else
		doPlayerSendCancel(cid,gTm(cid,nme,6))
	end
	return true
end
