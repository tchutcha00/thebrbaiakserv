local config =
{
	pos = {x = 99, y = 78, z = 7},
	topos = {x = 10207, y = 9158, z = 10},
	time = 60,
	msg_open = "[EVENTO] O Teleport para o BOSS Gaz'Haragoth foi aberto a esquerda do templo, fechara em 1 hora!", 
}


local function DelTp()
	local t = getTileItemById(config.pos, 1387)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(config.pos, CONST_ME_POFF)
	end
end

local dias_evento = {
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
    "Friday",
	"Saturday",
	"Sunday"
}

function onTime()
	if (isInArray(dias_evento, os.date("%A"))) then
		doCreateTeleport(1387, config.topos, config.pos)
		doBroadcastMessage(config.msg_open)
		doCreateMonster("Gaz'Haragoth", {x = 10222, y = 9159, z = 11})
		addEvent(DelTp, config.time * 60 * 1000)
	end

    return true
end