local fromPos, toPos = {x = 210, y = 265, z = 7}, {x = 231, y = 280, z = 7}

function onCastSpell(cid,var) 
    local pos = getThingPos(cid)
    local newPos = {x = math.random(fromPos.x, toPos.x), y = math.random(fromPos.y, toPos.y), z = fromPos.z}
    doTeleportThing(cid, newPos)
    doSendMagicEffect(pos, CONST_ME_POFF)
    doSendAnimatedText(pos, "Puff...", COLOR_WHITE)
    doSendMagicEffect(newPos, CONST_ME_TELEPORT)
    doSendAnimatedText(newPos, "Wuooon", COLOR_WHITE)
    doCreatureSay(cid, "Agora estou aqui!! Ho ho ho...", TALKTYPE_MONSTER_SAY)
    return true
end
