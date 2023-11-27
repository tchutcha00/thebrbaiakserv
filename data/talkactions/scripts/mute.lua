local muted = createConditionObject(CONDITION_MUTED)
	
local function silence(cid,time,help,sto)
	local storage = 722516
	setConditionParam(muted,CONDITION_PARAM_TICKS,(time*1000))
	if help then
		storage = 722517
		setConditionParam(muted, CONDITION_PARAM_SUBID, 4)
	end
	doAddCondition(cid,muted)
	if sto then
		doPlayerSetStorageValue(cid,storage,os.time()+time)
	end
end

function onSay(cid, words, param)
	if param == "" then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Use /helpmute nome, tempo.")
		return true
	end

	local t = string.explode(param, ', ')
	local target = getPlayerByNameWildcard(t[1])

	if not target or (isPlayerGhost(target) and getPlayerGhostAccess(target) > getPlayerGhostAccess(cid)) then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,t[1].." não estã online.")
		return true
	end

	if getPlayerAccess(cid) <= getPlayerAccess(target) or getPlayerFlagValue(target, PLAYERFLAG_CANNOTBEMUTED) then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você não pode mutar este jogador.")
		return true
	end

	if words:sub(2,2) ~= "h" and getPlayerAccess(cid) < 4 then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Este comando só está disponível para GMs, CMs e GODs. Você só pode usar o /helpmute.")
		return true
	end

	if words:sub(2,2) == "h" then
		local time = tonumber(t[2])
		if not time or time < 1 then
			time = 60
		end

		if time > 1000 and getPlayerAccess(cid) < 4 then
			doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você não pode mutar por mais de 1000 segundos.")
			return true
		end

		silence(target,time,true,true)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,t[1].." foi mutado por "..time.." segundos.")

	elseif words:sub(2,2) == "m" then
		local time = tonumber(t[2])
		if not time or time < 1 then
			time = 60
		end
		silence(target,time,false,true)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,t[1].." foi mutado por "..time.." segundos.")

	elseif words:sub(2,2) == "u" then
		doRemoveCondition(target,CONDITION_MUTED)
		doPlayerSetStorageValue(target,722516,-1)
		doPlayerSetStorageValue(target,722517,-1)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,t[1].." foi desmutado.")
	end
	return true
end
