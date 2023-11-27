--[[
    <action actionid="5694" event="script" value="castle_retcreature.lua"/>
]]

local creatures = {
	{name = 'Castle Protect', position = {x = 447, y = 367, z = 6}}
}

-- não precisa editar, é armazenamento cache
if not lockCastleLever then
	lockCastleLever = {status = false, exhaust = 0}
end

function onUse(cid, item)
	if lockCastleLever.exhaust > os.time() then
		doPlayerSendCancel(cid, 'Aguarde ' .. (lockCastleLever.exhaust - os.time()) .. ' segundos para usar novamente.')
		return true
	end

	lockCastleLever.exhaust = os.time() + 5
	
	if getPlayerGuildId(cid) ~= getGlobalStorageValue(123123) then
		doPlayerSendCancel(cid, 'Você não pode usar esta alavanca.')
		return true
	end
	
	for _, monster in ipairs(creatures) do
		local creature = getTopCreature(monster.position).uid
		if lockCastleLever.status then
			if creature > 0 then
				doRemoveCreature(creature)
				doSendMagicEffect(monster.position, CONST_ME_POFF)
			end
		else
			if creature == 0 then
				doCleanTile(monster.position)
				doCreateMonster(monster.name, monster.position)
				doSendMagicEffect(monster.position, CONST_ME_TELEPORT)
			end
		end
	end

	lockCastleLever.status = not lockCastleLever.status
	return true
end