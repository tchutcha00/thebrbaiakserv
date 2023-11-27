local creatures = {
	{name = 'Castle Protect', position = {x = 22, y = 118, z = 7}},
	{name = 'Castle Protect', position = {x = 23, y = 118, z = 7}},
	{name = 'Castle Protect', position = {x = 41, y = 118, z = 7}},
	{name = 'Castle Protect', position = {x = 42, y = 118, z = 7}},
	{name = 'Castle Protect', position = {x = 32, y = 104, z = 7}},
	{name = 'Castle Protect', position = {x = 33, y = 104, z = 7}},
	{name = 'Castle Protect', position = {x = 32, y = 100, z = 7}},
	{name = 'Castle Protect', position = {x = 33, y = 98, z = 6}},
	{name = 'Castle Protect', position = {x = 18, y = 117, z = 6}},
	{name = 'Castle Protect', position = {x = 46, y = 117, z = 6}},
	{name = 'Castle Protect', position = {x = 44, y = 114, z = 5}},
	{name = 'Castle Protect', position = {x = 21, y = 115, z = 5}},
	{name = 'Castle Protect', position = {x = 24, y = 116, z = 4}},
	{name = 'Castle Protect', position = {x = 24, y = 117, z = 4}},
	{name = 'Castle Protect', position = {x = 32, y = 116, z = 4}},
	{name = 'Castle Protect', position = {x = 40, y = 116, z = 4}},
	{name = 'Castle Protect', position = {x = 54, y = 92, z = 7}},
	{name = 'Castle Protect', position = {x = 54, y = 93, z = 7}},
	{name = 'Castle Protect', position = {x = 40, y = 117, z = 4}}
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

    lockCastleLever.exhaust = os.time() + 1
    
    if getPlayerGuildId(cid) ~= getGlobalStorageValue(123123) then
        doPlayerSendCancel(cid, 'Só a guild dominante pode usar a alavanca.')
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
                doCreateMonster(monster.name, monster.position)
                doSendMagicEffect(monster.position, CONST_ME_TELEPORT)
            end
        end
    end

    lockCastleLever.status = not lockCastleLever.status
    return true
end