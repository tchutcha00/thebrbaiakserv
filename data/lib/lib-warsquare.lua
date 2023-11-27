STORAGEVALUE_WARSQUARE_STATUS = 54990210
local GUILDEMBLEM_ALLY = 1
local GUILDEMBLEM_ENEMY = 2
local GUILDEMBLEM_NEUTRAL = 3

function doPlayerSendWarSquares(cid)
	for _, spectatorId in ipairs(getSpectators(getThingPos(cid), 7, 7, true)) do
		if isPlayer(spectatorId) then
			local emblem = getCreatureGuildEmblem(cid, spectatorId)
			if emblem == GUILDEMBLEM_ALLY then
				doSendCreatureSquare(spectatorId, 30, cid)
			elseif emblem == GUILDEMBLEM_ENEMY then
				doSendCreatureSquare(spectatorId, 180, cid)
			elseif emblem == GUILDEMBLEM_NEUTRAL then
				doSendCreatureSquare(spectatorId, 89, cid)
			end
		end
	end
end

function checkWarSquares(cid)
	if not isPlayer(cid) then
		return
	end

	if getPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS) ~= -1 then
		doPlayerSendWarSquares(cid)
		addEvent(checkWarSquares, 750, cid)
	end
end
