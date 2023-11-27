function onSay(cid, words, param, channel)

local t = string.explode(param, ",")
local target = getCreatureByName(t[1])
local points = tonumber(t[2])

if(param == '') then
	return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
end

if (target ~= nil) and isPlayer(target) and not isPlayerGhost(target) then
	if (points ~= nil) and (type(points) == 'number') and (points>0) then
		if (getAccountPoints(cid) >= points) then
			doTradeOrbs(cid, target, points)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não tem pontos suficientes...")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
	end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
end

return true
end