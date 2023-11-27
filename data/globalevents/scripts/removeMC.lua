local t = {
	kick = false, temple = true, -- kick = false - não kicka o player, temple = false não teleporta o player para o templo
	areas = {
		[1] = {
			{x = 1218, y = 1163, z = 7}, {x = 1234, y = 1178, z = 7}
		},
		[2] = {
			{x = 1, y = 1, z = 7}, {x = 1, y = 1, z = 7}
		},
		[3] = {
			{x = 1, y = 1, z = 6}, {x = 1, y = 1, z = 8}
		}
	}
}

function onThink(interval, lastExecution)
	local total = 0 
	for _, v in pairs(t.areas) do
		total = total + removeAllMcInArea(v[1], v[2], t.kick, t.temple)
	end
	print("Multi Clients removed: " .. total)
	return true
end

function removeAllMcInArea(fromPosition, toPosition, kick, toTemple) -- by dwarfer
    local players, check, freq, remove, removeall = {}, {}, {}, {}, {}
    for _, pid in ipairs(getPlayersOnline()) do
        local f = {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z}
        local t = {x = toPosition.x, y = toPosition.y, z = toPosition.z}
        local min = (fromPosition.z > toPosition.z and toPosition.z or fromPosition.z)
        for index = 0, math.abs(toPosition.z - fromPosition.z) do
            f.z = min + index
            t.z = min + index
            if isInRange(getPlayerPosition(pid), f, t) then
                table.insert(players, pid)
            end
        end    
    end
    if #players > 0 then
        for _, player in pairs(players) do
            table.insert(check, getPlayerIp(player))
        end
    end
    for _, v in pairs(check) do
        freq[v] = (freq[v] or 0) + 1
    end
    for ip, ip_freq in pairs(freq) do 
        if ip_freq > 1 then
           local text = ""
            local mc = getPlayersByIp(ip)
           for i = 1, #mc do
                if isInArray(players, mc[i]) and getPlayerAccess(mc[i]) < 3 then
                    text = text .. "" .. mc[i] .. ","
                end
            end
            remove[ip] = text
        end
    end
    for ip, players in pairs(remove) do
        ret = string.explode(players, ",")
        for i = 1, (#ret-2) do
            removeall[#removeall + 1] = ret[i]
        end
    end
    for _, tid in pairs(removeall) do
        if kick then
            if toTemple == false then
                doRemoveCreature(tid)
            else
                doTeleportThing(tid, getTownTemplePosition(getPlayerTown(tid)))
                doRemoveCreature(tid)
            end
        else
            doTeleportThing(tid, getTownTemplePosition(getPlayerTown(tid)))
        end
    end
    return #removeall
end