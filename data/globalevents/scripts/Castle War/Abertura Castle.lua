local config =
{
        pos = {x = 115, y = 85, z = 7},
        topos = {x = 2297, y = 1041, z = 6},
        time = 180,
        msg_open = "[CASTLE WAR] O Castle War foi aberto e fechara ás 22:00, CORRAM!", 
        msg_close = "[CASTLE WAR] O Castle War foi fechado e abrira novamente amanhã ás 19:00."
}


local function DelTp()
	local t = getTileItemById(config.pos, 1387)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(config.pos, CONST_ME_POFF)
	end
end

local dias_evento = {
	"Monday", -- Segunda
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday",
	"Sunday" -- Domingo
}

function onTime()
	if (isInArray(dias_evento, os.date("%A"))) then
		doCreateTeleport(1387, config.topos, config.pos)
		doBroadcastMessage(config.msg_open)
		addEvent(function()
			DelTp()
			onTime1()
			onTime2()
			onTime3()
			onTime4()
			onTime5()
			onTime6()
			onTime7()
			doBroadcastMessage(config.msg_close)
		end, config.time * 60 * 1000)
	end
	return true
end

function onTime1()
	local area = {{x = 2276, y = 966, z = 7},{x = 2317, y = 1006, z = 7}}
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime2()
	local area = {{x = 2253, y = 936, z = 8},{x = 2303, y = 976, z = 8}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime3()
	local area = {{x = 2232, y = 884, z = 7},{x = 2312, y = 950, z = 7}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime4()
	local area = {{x = 2235, y = 889, z = 6},{x = 2314, y = 944, z = 6}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime5()
	local area = {{x = 2246, y = 892, z = 5},{x = 2279, y = 920, z = 5}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime6()
	local area = {{x = 2255, y = 892, z = 4},{x = 2279, y = 920, z = 4}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end

function onTime7()
	local area = {{x = 2293, y = 1003, z = 6},{x = 2299, y = 1043, z = 6}} 
	local topos = {x=115, y=80, z=7} 
	for x = area[1].x - 1, area[2].x + 1 do 
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
		end
	end
	return true
end