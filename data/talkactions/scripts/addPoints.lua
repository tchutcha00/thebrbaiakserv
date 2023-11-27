function onSay(cid, words, param)

	local t = string.explode(param, ",")
	
	if param == '' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Missing params.")
		return true
	end  
	
	local player, balance, pid = getCreatureByName(t[1]), t[2], getPlayerByNameWildcard(t[1])  
	
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then   
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "That players doesnt exist or is offline.")  
		return true  
	end
	
	if t[2] == null then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Missing ammount of points.")
		return true
	end 
	
	local accountName = getPlayerAccount(player)
	local accountPoints = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `name` = '" .. accountName .. "' LIMIT 1;")
	local points = tonumber(accountPoints:getDataInt("premium_points"))
	local name = getPlayerName(cid)
	
	if(words == "/addpoints") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You added "..balance.." premium points to "..t[1].." account.")
		doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, "You got "..balance.." premium points from "..name..".")  
		points = (points+balance)
		db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "' LIMIT 1;")
		db.query("UPDATE `accounts` SET `backup_points` = `backup_points` + " .. balance .. " WHERE `name`='" .. accountName .. "' LIMIT 1;")
	elseif (words == "/removepoints") then
		points = (points-balance)
		if points < 0 then
			doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, ""..name.." removed all your premium points.")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You removed all "..t[1].." account premium points.")
			db.query("UPDATE `accounts` SET `premium_points` = '0' WHERE `name`='" .. accountName .. "' LIMIT 1;")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You removed "..balance.." premium points to "..t[1].." account.")
			db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "' LIMIT 1;")	
			doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, ""..name.." removed "..balance.." premium points from your account.") 
		end
	end
	
	return true
end