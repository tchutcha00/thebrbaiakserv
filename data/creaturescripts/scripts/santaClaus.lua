local config = {
	delay = 300, -- tempo entre uma wave de fogos e outra
	vezes = 3, -- numero de waves
	minfogos = 5, -- minimo de fogos por wave
	maxfogos = 7 -- maximo de fogos por wave.
}

local function isWalkable(cid, pos)
    if getTileThingByPos(pos).itemid == nil then
        return false
    end
    if getTopCreature(pos).uid > 0 then
        local closest = getClosestFreeTile(cid, pos)
        return type(closest) == "table" and doComparePositions(closest, pos)
    end
    return true
end

local function finale(pos, msg)
	local effectIni = 28
	for i = -3, 3 do
		for j = -3, 3 do
			local rangex, rangey = math.abs(i), math.abs(j)
			local kdist = rangex+rangey
			local position = {x = pos.x + i, y = pos.y + j, z = pos.z}
			local l = effectIni - 1 + kdist
			if l > (effectIni + 2) then
				l = 255
			end
			if isWalkable(position, false, true, true) then
				doSendMagicEffect(position, l)
			end
		end
	end
	return true
end

local function newYear(pos, delay, time, min, max)
	local n = time or 2
	local fogos = math.random(min, max)
	for i = 1, fogos do
		local position = {x = pos.x + math.random(-7,7), y = pos.y + math.random(-5,5), z = pos.z}
		if isWalkable(position, false, true, true) then
			doSendMagicEffect(position, math.random(28,30))
		end
	end
	if n > 1 then
		addEvent(newYear, delay, pos, delay, (n-1), min, max)
	end
	return true
end

function onDeath(cid, corpse, killer)
	local pos = getThingPos(cid)
	newYear(pos, config.delay, config.vezes, config.minfogos, config.maxfogos)
	addEvent(finale, config.delay * config.vezes, pos, param)
	doCreatureSay(cid, "Ho ho ho feliz natal!", TALKTYPE_MONSTER_SAY)
	local players = getSpectators(pos, 10, 10, false)
	for _, pid in next, players do
		if isPlayer(pid) then
			doPlayerAddItem(pid, 6507)
			doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Você recebeu uma Christmas Surprise Bag, parabéns!!")
			doSendMagicEffect(getThingPos(pid), 29)
		elseif isMonster(pid) then
			doSendMagicEffect(getThingPos(pid), CONST_ME_POFF)
			doRemoveCreature(pid)
		end
	end
	return true
end
