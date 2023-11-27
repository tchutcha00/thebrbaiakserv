Events = {
	
	storage = 722680,
	banStorage = 722681,
	whiteListStorage = 722705,
	exitFromPos = {x = 174, y = 45, z = 7},
	exitToPos = {x = 176, y = 49, z = 7},
	teleportPosition = {x = 173, y = 47, z = 7},
	afk = 'Anti-AFK'

}

function Events:enter(cid, antiAfk)
	antiAfk = antiAfk == nil and true or antiAfk
	doCreatureSetStorage(cid, self.storage, 1)
	if antiAfk then
		registerCreatureEvent(cid, self.afk)
	end
end

function Events:leave(cid)
	doCreatureSetStorage(cid, self.storage, EMPTY_STORAGE)
	unregisterCreatureEvent(cid, self.afk)
end

function Events:ban(cid, period)
	if not period then
		period = 3
	end
	doCreatureSetStorage(cid, self.banStorage, os.time() + (period * 24 * 3600))
end

function Events:isBanished(cid)
	local banTime = getCreatureStorage(cid, self.banStorage)
	return banTime >= os.time() and banTime or false
end

function Events:isInEvent(cid)
	return getCreatureStorage(cid, self.storage) ~= EMPTY_STORAGE
end

function isInEvent(cid)
    return Events:isInEvent(cid)
end

function Events:getRepeatedIps(ip, players)
	if type(players) ~= "table" then
		return false
	end
    for _, pid in next, players do
        if getPlayerIp(pid) == ip and getCreatureStorage(pid, self.whiteListStorage) == EMPTY_STORAGE then
            return true
        end
    end
    return false
end

function Events:removeTeleport(position)
	local tp = getTileItemById(position, 1387)
	if tp.uid > 0 then
		doRemoveItem(tp.uid)
	end
end

function Events:sendTeleportCountdown(position, duration)
	if duration == 0 or getTileItemById(position, 1387).uid == 0 then
		return
	end
	local minute = duration >= 60
	local dateParameter = minute and "%M:%S" or "%S"
	local color = minute and COLOR_WHITE or COLOR_RED
	doSendAnimatedText(position, os.date(dateParameter, duration), color)
	doSendMagicEffect(position, minute and CONST_ME_MAGIC_BLUE or CONST_ME_MAGIC_RED)
	if not minute then
		if duration % 10 == 0 then
			doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
		end
	end
	addEvent(self.sendTeleportCountdown, 1000, self, position, duration - 1)
end
	
function Events:createTeleport(teleportPosition, eventName, duration, actionId)
	teleportPosition = self.teleportPosition
	local player = getTopCreature(teleportPosition)
	if player.uid > 0 then
		self:exit(player.uid)
	end
	doCleanTile(teleportPosition)
	local tp = doCreateItem(1387, 1, teleportPosition)
	doItemSetAttribute(tp, "aid", actionId or 10076)
	if eventName then
		doItemSetAttribute(tp, "description", "Participe do evento "..eventName.."!")
	end
	if duration then
		Events:sendTeleportCountdown(teleportPosition, duration * 60)
	end
end

function Events:exit(cid)
	local position = {x = math.random(self.exitFromPos.x, self.exitToPos.x), y = math.random(self.exitFromPos.y, self.exitToPos.y), z = self.exitFromPos.z}
	doTeleportThing(cid, position)
	doPlayerSetPzLocked(cid, false)
	doSendMagicEffect(position, CONST_ME_TELEPORT)
end

function Events:whiteList(cid)
	local ip = getPlayerIp(cid)
	local players = {}
	for _, pid in next, getPlayersOnline() do
		if getPlayerIp(pid) == ip then
			table.insert(players, pid)
		end
	end
	for _, pid in next, players do
		doCreatureSetStorage(pid, self.whiteListStorage, 1)
	end
	return players
end
