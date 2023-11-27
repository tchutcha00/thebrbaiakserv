local function filtrateString(str)
    if type(str) ~= "string" then
        return false
    end
    local first, last = 0, 0
    local second, final = 0, #str
    for i = 1, #str do
        if string.byte(str:sub(i,i)) == string.byte('a') then
            first = i + 2
            for t = first, #str do
                if string.byte(str:sub(t,t)) == string.byte(' ') then
                    last = t - 1
                    break
                end
            end
        end
        if string.byte(str:sub(i,i)) == string.byte('b') then
            second = i + 2
        end
    end
    return {str:sub(first, last), str:sub(second, final)}
end

local positions = {
	[1] = {{x = 1572, y = 2537, z = 7}, {x = 1602, y = 2573, z = 7}},
	[2] = {{x = 1639, y = 2535, z = 7}, {x = 1673, y = 2562, z = 7}},
	[3] = {{x = 1700, y = 2542, z = 7}, {x = 1727, y = 2571, z = 7}},
	[4] = {{x = 1452, y = 2566, z = 7}, {x = 1480, y = 2602, z = 7}},
	[5] = {{x = 1410, y = 2545, z = 7}, {x = 1432, y = 2578, z = 7}},
	[6] = {{x = 1366, y = 2534, z = 7}, {x = 1391, y = 2564, z = 7}},
	[7] = {{x = 1398, y = 2438, z = 7}, {x = 1423, y = 2468, z = 7}},
	[8] = { {x = 1442, y = 2449, z = 7}, {x = 1464, y = 2482, z = 7}},
	[9] = {{x = 1485, y = 2474, z = 7}, {x = 1507, y = 2506, z = 7}},
	[10] = {{x = 1528, y = 2509, z = 7}, {x = 1550, y = 2541, z = 7}},
	[11] = {{x = 1532, y = 2625, z = 7}, {x = 1557, y = 2655, z = 7}},
	[12] = {{x = 1582, y = 2641, z = 7}, {x = 1607, y = 2671, z = 7}},
	[13] = {{x = 1633, y = 2654, z = 7}, {x = 1658, y = 2684, z = 7}},
	[14] = {{x = 1682, y = 2667, z = 7}, {x = 1707, y = 2697, z = 7}},
	[15] = {{x = 1727, y = 2680, z = 7}, {x = 1752, y = 2710, z = 7}},
	[16] = {{x = 1496, y = 2598, z = 7}, {x = 1518, y = 2630, z = 7}},
	[17] = {{x = 1770, y = 2694, z = 7}, {x = 1792, y = 2627, z = 7}},
	[18] = {{x = 1813, y = 2703, z = 7}, {x = 1835, y = 2735, z = 7}},
	[19] = {{x = 1743, y = 2550, z = 7}, {x = 1765, y = 2582, z = 7}},
	[20] = {{x = 1785, y = 2555, z = 7}, {x = 1807, y = 2587, z = 7}}
}

function onThink(interval, lastExecution)
	for i = 1, #positions do	
		local players = getPlayersInArea(positions[i][1], positions[i][2])
		
		if players then
			for _, pid in pairs(players) do
				if getPlayerAccountId(pid) ~= tonumber(filtrateString(getGlobalStorageValue(722341+i))[1]) or getPlayerAccountId(pid) == tonumber(filtrateString(getGlobalStorageValue(722341+i))[1]) and tonumber(filtrateString(getGlobalStorageValue(722341+i))[2]) <= os.time() then
					doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
					doPlayerPopupFYI(pid, "Seu tempo como dono da Cave ".. i .." expirou. Você foi levado até seu templo.")
				end
			end
		end
	end    

return true
end