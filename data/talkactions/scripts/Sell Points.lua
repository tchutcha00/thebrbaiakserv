local nme = "Sell Points"

local getPlayerPoints = function(cid)
	local accid, points = getPlayerAccountId(cid), 0
	local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = '"..accid.."'")
	if query:getID() ~= -1 then
		points = query:getDataInt("premium_points")
		query:free()
	end
	return tonumber(points)
end

local query = db.query or db.executeQuery
		

function onSay(cid, words, param)

	if param == "" then
		return doPlayerSendCancel(cid, "[Sell Points System] "..gTm(cid,nme,1))
	end
	
	if tonumber(param) and tonumber(param) > 0 then
		if getPlayerPoints(cid) >= tonumber(param) then
			local papel = doCreateItemEx(7702)
			doItemSetAttribute(papel, "pontos", tonumber(param))
			doItemSetAttribute(papel, "seller", tonumber(getPlayerAccountId(cid)))
			doItemSetAttribute(papel, "description", "[Sell Points System] Este documento vale "..param.." points para você usar no site.")
			if doPlayerAddItemEx(cid, papel) == RETURNVALUE_NOERROR then
				query("UPDATE `accounts` SET `premium_points` = `premium_points` - '"..tonumber(param).."' WHERE `id` = '"..getPlayerAccountId(cid).."'")
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Sell Points System] "..gTm(cid,nme,2).." "..param.." points "..gTm(cid,nme,3))
				doSendMagicEffect(getThingPos(cid), 28)
			else
				doPlayerSendCancel(cid, "[Sell Points System] "..gTm(cid,nme,4))
			end
		else
			doPlayerSendCancel(cid, "[Sell Points System] "..gTm(cid,nme,5))
		end
	else
		doPlayerSendCancel(cid, "[Sell Points System] "..gTm(cid,nme,6))
	end
	return true
end
